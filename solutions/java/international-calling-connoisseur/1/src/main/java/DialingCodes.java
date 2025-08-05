import java.util.Map;
import java.util.HashMap;

public class DialingCodes {
    private Map<Integer, String> dict =  new HashMap<Integer, String>();

    public Map<Integer, String> getCodes() {
       return dict;
    }

    public void setDialingCode(Integer code, String country) {
        dict.put(code, country);
    }

    public String getCountry(Integer code) {
        return dict.get(code);
    }

    public void addNewDialingCode(Integer code, String country) {

        if (!dict.containsKey(code) && !dict.containsValue(country)) setDialingCode(code, country);
    }

    public Integer findDialingCode(String country) {
        for (Map.Entry<Integer, String> d: dict.entrySet()) {
            String val = d.getValue();

            if (val.equals(country)) return d.getKey();
        }

        return null;
    }

    public void updateCountryDialingCode(Integer code, String country) {
        int key = findDialingCode(country);

        dict.remove(key);

        setDialingCode(code, country);
    }
}
