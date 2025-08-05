public class LogLine {

    private String log = "";
    
    public LogLine(String logLine) {
        this.log = logLine;
    }

    public LogLevel getLogLevel() {
       String getType = this.log.substring(1, 4);
        System.out.println(getType);

        switch(getType) {
            case "TRC":
                return LogLevel.TRACE;
            case "DBG":
                return LogLevel.DEBUG;
            case "INF":
                return LogLevel.INFO;
            case "WRN":
                return LogLevel.WARNING;
            case "ERR":
                return LogLevel.ERROR;
            case "FTL":
                return LogLevel.FATAL;
            default:
                return LogLevel.UNKNOWN;
        }
    }

    public String getOutputForShortLog() {
        String msg = this.log.substring(7);
        
        return this.getLogLevel().getLevel() + ":" + msg;
    }
}
