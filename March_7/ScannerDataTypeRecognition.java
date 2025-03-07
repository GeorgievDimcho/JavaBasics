package March_7;

import java.util.Scanner;

public class ScannerDataTypeRecognition {
    public static void main(String[] args) {
        String input;
        Scanner scanner = new Scanner(System.in);
        input = scanner.next();
        try {
            int num = Integer.parseInt(input);
            System.out.println("You entered a int");
        } catch (NumberFormatException ex) {
            try {
                double dou = Double.parseDouble(input);
                System.out.println("You entered a double");
            } catch (Exception e) {
                System.out.println("You entered a string");
            }
        }
    }
}
