import java.util.Random;
import java.util.Scanner;

public class conditions {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int input;
        Random random = new Random();
        int toGuess = random.nextInt(5);
        do {
            input = scanner.nextInt();
            if (input == toGuess) {
                System.out.println("you guessed the number");
            } else {
                if (input > toGuess) {
                    System.out.println("lower");
                } else {
                    System.out.println("higher");
                }
            }
        } while (input != toGuess); // GOTO 11

        // while () {
        //     // BoDY

        // }
        Random random2 = new Random();
        System.out.println("the do while loop is over");
         System.out.println(random2.nextInt(5));
        scanner.close();
    }
}
