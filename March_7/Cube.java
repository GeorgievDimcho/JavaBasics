package March_7;

import java.util.Scanner;

public class Cube {

    public static void main(String[] args) {
        System.out.print("Lenght of a side: ");
        Scanner scanner_variable = new Scanner(System.in);
        int side = scanner_variable.nextInt();
        System.out.printf("Surface area : %d\n", side*side*6);
        int volume = side*side*side;
        System.out.printf("Volume: %d\n" , volume);
        scanner_variable.close();
    }
} 