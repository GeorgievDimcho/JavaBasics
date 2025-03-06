import java.util.Scanner;

public class ScannerTest {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.printf("Please einter integer: "); // prompt for input
        int time = sc.nextInt(); // read an integer value
        System.out.printf("time = %d\n", time); // print it again
        sc.close();
    }

}
