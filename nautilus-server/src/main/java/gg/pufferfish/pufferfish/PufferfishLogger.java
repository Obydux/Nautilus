package gg.pufferfish.pufferfish;

import org.bukkit.Bukkit;

import java.util.logging.Level;
import java.util.logging.Logger;

public class PufferfishLogger extends Logger {
    public static final PufferfishLogger LOGGER = new PufferfishLogger();

    private PufferfishLogger() {
        super("Pufferfish", null);

        setParent(Bukkit.getLogger());
        setLevel(Level.ALL);
    }
}
