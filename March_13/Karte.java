//package March_13;

import java.util.Scanner;

public class Karte {

    public static void main(String[] args) {
        System.out.println("enter an interger: ");
        Scanner scanner = new Scanner(System.in);
        int input = scanner.nextInt();
        System.out.printf("%-5d /\\ %5d\n", input, input);
        System.out.printf("%-+5d /\\ %+5d", input, input);
        
        scanner.close();
    }

}