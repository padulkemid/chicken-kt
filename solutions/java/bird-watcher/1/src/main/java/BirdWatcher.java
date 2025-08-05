
class BirdWatcher {
    private final int[] birdsPerDay;

    public BirdWatcher(int[] birdsPerDay) {
        this.birdsPerDay = birdsPerDay.clone();
    }

    public static final int[] getLastWeek() {
        int[] lastWeek = {0, 2, 5, 3, 7, 8, 4};
        return lastWeek;
    }

    public int getToday() {
       return birdsPerDay[birdsPerDay.length - 1];
    }

    public void incrementTodaysCount() {
        birdsPerDay[birdsPerDay.length - 1] += 1;
    }

    public boolean hasDayWithoutBirds() {
       for(int b: birdsPerDay) {
           if (b == 0) return true;
       }

        return false;
    }

    public int getCountForFirstDays(int numberOfDays) {
        numberOfDays = numberOfDays > 7 ? 7: numberOfDays;
        
        int sum = 0;
        for (int i = 0; i < numberOfDays; i++) {
            sum += birdsPerDay[i];
        }

        return sum;
    }

    public int getBusyDays() {
        int busyDays = 0;

        for (int i = 0; i < birdsPerDay.length - 1; i++) {
            if (birdsPerDay[i] >= 5) {
                busyDays += 1;
            }
        }

        return busyDays;
    }
}
