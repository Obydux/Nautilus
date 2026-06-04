<div align="center">
  <h1>Nautilus</h1>
  <h3>Fork of Purpur with optimizations from Pufferfish and Pluto.</h3>
</div>

<div align="center">
  <a href="https://discord.gg/sQ6VmWDzN3" class="badge-link" target="_blank" rel="noopener noreferrer">
    <img src="https://img.shields.io/discord/1383468620566237234" alt="Discord" onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
  </a>
        
  <a href="https://ci.obydux.win/job/Nautilus/job/26.1.2/" class="badge-link" target="_blank" rel="noopener noreferrer">
    <img src="https://img.shields.io/jenkins/build?jobUrl=https://ci.obydux.win/job/Nautilus/job/26.1.2/" alt="Jenkins Build" onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
  </a>
        
  <a href="https://github.com/sponsors/Obydux" class="badge-link" target="_blank" rel="noopener noreferrer">
    <img src="https://img.shields.io/github/sponsors/Obydux" alt="GitHub Sponsors" onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
  </a>
</div>

## Features

Nautilus is a drop-in replacement for [Paper](https://papermc.io), [Purpur](https://purpurmc.org), [Pufferfish](https://github.com/Yive/Tetraodontidae) and [Pluto](https://github.com/Yive/Pluto) Minecraft server softwares offering features, optimizations and APIs present in mentioned softwares.

You can see a list of changes coming from Pufferfish [here](https://github.com/Yive/Tetraodontidae?tab=readme-ov-file#Features) and from Pluto [here](https://github.com/Yive/Pluto/?tab=readme-ov-file#Features).
Pufferfish's changes are coming from Yive's version of the software which has been actively maintained since 1.21.4, unlike the official Pufferfish.

## Downloads
You can download the latest JAR file [here](https://ci.obydux.win/job/Nautilus/).

## API
You can find the javadocs [here](https://repo.obydux.win/javadoc/snapshots/win/obydux/nautilus/nautilus-api/26.1.2-R0.1-SNAPSHOT).

Maven:
```xml
<repositories>
    <repository>
        <id>obydux-repo</id>
        <url>https://repo.obydux.win/snapshots</url>
    </repository>
</repositories>

<dependencies>
    <dependency>
        <groupId>win.obydux.nautilus</groupId>
        <artifactId>nautilus-api</artifactId>
        <version>26.1.2-R0.1-SNAPSHOT</version>
        <scope>provided</scope>
    </dependency>
</dependencies>
```
Gradle:
```groovy
repositories {
    maven {
        url = 'https://repo.obydux.win/snapshots'
    }
}

dependencies {
    compileOnly 'win.obydux.nautilus:nautilus-api:26.1.2-R0.1-SNAPSHOT'
}
```

## Building

```bash
./gradlew applyAllPatches
./gradlew createPaperclipJar
```
