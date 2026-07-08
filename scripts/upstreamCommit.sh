#!/usr/bin/env bash

# requires curl & jq

# upstreamCommit --purpur HASH --pluto HASH
# flag: --purpur HASH - (Optional) the commit hash to use for comparing commits between purpur (PurpurMC/Purpur/compare/HASH...HEAD)
# flag: --pluto HASH - the commit hash to use for comparing commits between pluto (Yive/Pluto/compare/HASH...ver/{mcVersion})

function getCommits() {
    curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$1"/compare/"$2"..."$3" | jq -r '.commits[] | "'"$1"'@\(.sha[:8]) \(.commit.message | split("\r\n")[0] | split("\n")[0])" | sub("\\[ci( |-)skip]"; "[ci/skip]")'
}

(
set -e
PS1="$"

purpurHash=$(git diff gradle.properties | awk '/^-purpurCommit =/{print $NF}')
plutoHash=""
mcVersion=$(awk -F' = ' '/^mcVersion =/{print $2}' gradle.properties)

TEMP=$(getopt --long purpur:,pluto: -o "" -- "$@")
eval set -- "$TEMP"
while true; do
    case "$1" in
        --purpur)
            purpurHash="$2"
            shift 2
            ;;
        --pluto)
            plutoHash="$2"
            shift 2
            ;;
        *)
            break
            ;;
    esac
done

purpur=""
pluto=""
updated=""
logsuffix=""

# Purpur updates
if [ -n "$purpurHash" ]; then
    newHash=$(git diff gradle.properties | awk '/^+purpurCommit =/{print $NF}')
    purpur=$(getCommits "PurpurMC/Purpur" "$purpurHash" $(echo $newHash | grep . -q && echo $newHash || echo "HEAD"))

    # Updates found
    if [ -n "$purpur" ]; then
        updated="Purpur"
        logsuffix="$logsuffix\n\nPurpur Changes:\n$purpur"
    fi
fi

# Pluto updates
if [ -n "$plutoHash" ]; then
    plutoBranch=$(echo $mcVersion | grep . -q && echo "ver/$mcVersion" || echo "HEAD")
    pluto=$(getCommits "Yive/Pluto" "$plutoHash" "$plutoBranch")

    # Updates found
    if [ -n "$pluto" ]; then
        updated="Pluto"
        logsuffix="$logsuffix\n\nPluto Changes:\n$pluto"
    fi
fi

# Both have updates
if [ -n "$purpur" ] && [ -n "$pluto" ]; then
    updated="Purpur & Pluto"
fi

disclaimer="Upstream has released updates that appear to apply and compile correctly"
log="${UP_LOG_PREFIX}Updated Upstream ($updated)\n\n${disclaimer}${logsuffix}"

git add gradle.properties

echo -e "$log" | git commit -F -

) || exit 1