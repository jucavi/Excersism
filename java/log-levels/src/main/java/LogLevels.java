import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LogLevels {
    final private static String PATTERN = "^\\[(?<level>[A-Z]+)]:\\s*(?<message>.+)\\s*";
    final private static Pattern pattern = Pattern.compile(PATTERN);

    private static Matcher parseLogLine(String logLine) {
        Matcher m = pattern.matcher(logLine);
        m.find();
        return m;
    }

    public static String message(String logLine) {
        return parseLogLine(logLine).group("message").strip();
    }

    public static String logLevel(String logLine) {
        return parseLogLine(logLine).group("level").toLowerCase();
    }

    public static String reformat(String logLine) {
        return String.format("%s (%s)", message(logLine), logLevel(logLine));
    }
}
