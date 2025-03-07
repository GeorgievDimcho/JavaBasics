package March_7;

import java.util.Scanner;

public class Cube_Double {

    public static void main(String[] args) {
        System.out.print("Lenght of a side: ");
        Scanner scanner_variable = new Scanner(System.in);
        double side = scanner_variable.nextDouble();
        System.out.printf("Surface area : %.2f\n", side*side*6);
        double volume = side*side*side;
        System.out.printf("Volume: %.2f\n" , volume);
        scanner_variable.close();
    }
} 