class Leap {

    boolean isLeapYear(int year) {
        int divLeap = year % 4;
        int divEven = year % 100;
        int divTake = year % 400;

        if (divLeap == 0) {

            if (divEven == 0) {
                return divTake == 0;
            }
            
            return true;
        }

        return false;
    }

}
