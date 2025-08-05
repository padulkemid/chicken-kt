class ReverseString {

    String reverse(String inputString) {
        StringBuilder res = new StringBuilder();
        String[] chunk = inputString.split("");

        for (int i = inputString.length() - 1 ; i >= 0; i--) {
            res.append(chunk[i]);
        }

        return res.toString();
    }
  
}
