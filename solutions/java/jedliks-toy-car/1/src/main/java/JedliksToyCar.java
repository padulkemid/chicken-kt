public class JedliksToyCar {
    private int distance = 0;
    private int battery = 100;
    
    public static JedliksToyCar buy() {
        return new JedliksToyCar();
    }

    public String distanceDisplay() {
        return "Driven " + distance + " meters";
    }

    public String batteryDisplay() {
        if (battery > 0) return "Battery at " + battery + "%";
        return "Battery empty";
    }

    public void drive() {
        if (battery > 0) {
            battery -= 1;
            distance += 20;
        }
    }
}
