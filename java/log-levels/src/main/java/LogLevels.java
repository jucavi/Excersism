import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LogLevels {
    final private static String PATTERN = "^\\[([A-Z]+)]:(\\s*.+\\s*)";

    private static Matcher parseLogLine(String logLine) {
        Pattern p = Pattern.compile(PATTERN);

        return p.matcher(logLine);
    }

    public static String message(String logLine) {
        try {
            Matcher m = parseLogLine(logLine);

            if (m.matches()) {
                return m.group(2).strip();
            }
        } catch (NullPointerException e) {
            e.getMessage();
        }
        return "";
    }

    public static String logLevel(String logLine) {

        try {
            Matcher m = parseLogLine(logLine);

            if (m.matches()) {
                return m.group(1).toLowerCase();
            }
        } catch (NullPointerException e) {
            e.getMessage();
        }

        return "";
    }

    public static String reformat(String logLine) {

        return String.format("%s (%s)", message(logLine), logLevel(logLine));
    }
}
