public class Lasagna {
    private static final int EXPECTED_OVEN_COOKING = 40;
    private static final int PREPARATION_PER_LAYER = 2;
    
    public int expectedMinutesInOven() {
        return EXPECTED_OVEN_COOKING;
    }

    public int remainingMinutesInOven(int min) {
        return this.expectedMinutesInOven() - min;
    }

    public int preparationTimeInMinutes(int min) {
        return min * PREPARATION_PER_LAYER;
    }

    public int totalTimeInMinutes(int layer, int min) {
        return this.preparationTimeInMinutes(layer) + min;
    }
}
