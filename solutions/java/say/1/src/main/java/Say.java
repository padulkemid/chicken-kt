    public class Say {

    private static final String[] LESS_THAN_20 = {
            "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
            "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
    };

    private static final String[] TENS = {
            "", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"
    };

    private static final String[] THOUSANDS = {
            "", "thousand", "million", "billion"
    };

    public String say(long number) {
        if (number < 0 || number > 999_999_999_999L) {
            throw new IllegalArgumentException("Input must be between 0 and 999,999,999,999.");
        }
        if (number == 0) {
            return "zero";
        }

        // Use StringBuilder for efficient string construction.
        StringBuilder result = new StringBuilder();
        int thousandsIndex = 0;

        while (number > 0) {
            long chunk = number % 1000;
            if (chunk > 0) {
                // Convert the 3-digit chunk to words
                String chunkAsWords = convertChunk((int) chunk);
                // Get the appropriate scale word (thousand, million, etc.)
                String scaleWord = THOUSANDS[thousandsIndex];
                
                // Form the current part (e.g., "one hundred twenty-three thousand")
                String currentPart = scaleWord.isEmpty() ? chunkAsWords : chunkAsWords + " " + scaleWord;

                // Prepend the new part to the result
                if (result.length() > 0) {
                    result.insert(0, " "); // Add a space between parts
                }
                result.insert(0, currentPart);
            }
            number /= 1000;
            thousandsIndex++;
        }

        return result.toString();
    }

    private String convertChunk(int number) {
        StringBuilder chunkBuilder = new StringBuilder();

        // Handle hundreds place
        if (number >= 100) {
            chunkBuilder.append(LESS_THAN_20[number / 100]);
            chunkBuilder.append(" hundred");
            number %= 100;
        }

        // Handle tens and ones place
        if (number > 0) {
            // Add a space if a "hundred" part already exists
            if (chunkBuilder.length() > 0) {
                chunkBuilder.append(" ");
            }

            if (number < 20) {
                chunkBuilder.append(LESS_THAN_20[number]);
            } else {
                chunkBuilder.append(TENS[number / 10]);
                int onesPart = number % 10;
                if (onesPart > 0) {
                    chunkBuilder.append("-").append(LESS_THAN_20[onesPart]);
                }
            }
        }
        
        return chunkBuilder.toString();
    }
}

