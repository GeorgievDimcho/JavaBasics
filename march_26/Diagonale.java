import java.util.Scanner;

public class Diagonale {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int length;
        do {
            System.out.print("Enter length: ");
            length = scanner.nextInt();
            if (length<1) {
                System.out.println("Input not allowed");
            }
        } while(length<1);
        

        scanner.close();
    }
}
