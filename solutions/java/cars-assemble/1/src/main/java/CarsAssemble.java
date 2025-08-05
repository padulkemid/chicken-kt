public class CarsAssemble {
    private static final int PRODUCED_CARS_EACH_HOUR = 221;
    private static final double LOWEST_SUCCESS_RATE = 0.77;
    private static final double LOW_SUCCESS_RATE = 0.80;
    private static final double HIGH_SUCCESS_RATE = 0.90;
    private static final int MINS = 60;

    private double calcRate(int calc, double rate) {
        return calc * rate;
    }

    public double productionRatePerHour(int speed) {   
        int calculation = speed * PRODUCED_CARS_EACH_HOUR;

        if (speed == 10) return calcRate(calculation, LOWEST_SUCCESS_RATE);
        if (speed == 9) return calcRate(calculation, LOW_SUCCESS_RATE);
        if (speed > 4 && speed < 9) return calcRate(calculation, HIGH_SUCCESS_RATE);

        return calculation;
    }

    public int workingItemsPerMinute(int speed) {
        return (int) productionRatePerHour(speed) / MINS;
    }
}
