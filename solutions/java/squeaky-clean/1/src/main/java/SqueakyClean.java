class SqueakyClean {
    private static final char KEBAB_IDENTIFIER = '-';
    private static final String WHITESPACE_REPLACEMENT = "_";

    private static void digitAppend(char chara, StringBuilder res) {
        switch(chara){
            case '4':
                res.append("a");
                break;
            case '3':
                res.append("e");
                break;
            case '0':
                res.append("o");
                break;
            case '1':
                res.append("l");
                break;
            case '7':
                res.append("t");
                break;
            default:
                break;
        }
    }
    
    static String clean(String identifier) {
        char[] arr = identifier.toCharArray();
        StringBuilder result = new StringBuilder();

        for (int i = 0; i < arr.length; i++) {
            if (Character.isWhitespace(arr[i])) {
                result.append(WHITESPACE_REPLACEMENT);
            } else if(arr[i] == KEBAB_IDENTIFIER) {
                result.append(Character.toUpperCase(arr[i+1]));
                i++;
            } else if(Character.isDigit(arr[i])) {
                digitAppend(arr[i], result);
            } else if(Character.isLetter(arr[i])) {
                result.append(arr[i]);
            }
        }

        return result.toString();
    } 
}
