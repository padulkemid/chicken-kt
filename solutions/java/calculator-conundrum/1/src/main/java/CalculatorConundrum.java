import java.util.List;
import java.lang.Math;
import java.lang.IllegalArgumentException;

class CalculatorConundrum {
    private static final List<String> OPERATIONS = List.of("+", "*", "/");

    public void errorHandling(String operation, int operand) {
       if (operation == null) {
            throw new IllegalArgumentException("Operation cannot be null");
        }

        if (operation.length() == 0) {
            throw new IllegalArgumentException("Operation cannot be empty");
        }

        if (!OPERATIONS.contains(operation)) {
            throw new IllegalOperationException("Operation '" + operation + "' does not exist");
        }

        
    }
    
    public String calculate(int operand1, int operand2, String operation) {
        errorHandling(operation, operand2);

        
   int result = 0;
        try {
         
        switch(operation) {
            case "*":
                result = operand1 * operand2;
                break;
            case "+":
                result = operand1 + operand2;
                break;
            case "/":
                result = operand1 / operand2;
                break;
        }

            
        } catch (ArithmeticException e) {
            if (operation == "/" && operand2 == 0) {
            throw new IllegalOperationException("Division by zero is not allowed", e);
        } 
        }

         return operand1 + " " + operation + " " + operand2 + " = " + result;
    }
}
