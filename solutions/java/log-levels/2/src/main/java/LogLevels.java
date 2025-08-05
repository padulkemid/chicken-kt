public class LogLevels {
    public static String message(String logLine) {
        String[] splitted = logLine.split(":");

        return splitted[1].trim();
    }

    public static String logLevel(String logLine) {
        int closingBracket = logLine.indexOf("]");

        return logLine.substring(1, closingBracket).trim().toLowerCase();
    }

    public static String reformat(String logLine) {
        String msg = message(logLine);
        String level = logLevel(logLine);

        return msg + " (" + level + ")";
    }
}
