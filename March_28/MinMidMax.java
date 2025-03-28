//package March_28;

import java.util.Scanner;

class MinMidMax {
    public static void main(String[] args) {
        int a = 0, b = 0, c = 0;
        // Scanner scanner = new Scanner(System.in);
        System.out.printf("args[0]: %s, args[1]: %s, args[2]: %s\n", args[0], args[1], args[2]);
        /*
         * a = scanner.nextInt();
         * b = scanner.nextInt();
         * c = scanner.nextInt();
         */
        a = Integer.parseInt(args[0]);
        b = Integer.parseInt(args[1]);
        c = Integer.parseInt(args[2]);
        minMidMax(a, b, c);
        // scanner.close();
    }

    static void minMidMax(int a, int b, int c) {
        if (a < b && a < c) { // a is kleinste
            // a != b != c
            if (b < c) {
                System.out.printf("%d < %d < %d\n", a, b, c);
                System.out.println("a < b < c");
            } else if (c < b) {
                System.out.printf("%d < %d < %d\n", a, c, b);
                System.out.println("a < c < b");
            } else {
                // a != b = c
                // a < b = c
                System.out.printf("%d < %d = %d\n", a, b, c);
                System.out.println("a < b = c");
            }
        } else if (b < a && b < c) { // b is kleinste
            if (a < c) {
                System.out.printf("%d < %d < %d\n", b, a, c);
                System.out.println("b < a < c");
            } else if (c < a) {
                System.out.printf("%d < %d < %d\n", b, c, a);
                System.out.println("b < c < a");
            } else {
                System.out.printf("%d < %d = %d\n", b, a, c);
                System.out.println("b < a = c");
            }
        } else if (c < a && c < b) { // c ist kleinste
            if (b < a) {
                System.out.printf("%d < %d < %d\n", c, b, a);
                System.out.println("c < b < a");
            } else if (a < b) {
                System.out.printf("%d < %d < %d\n", c, a, b);
                System.out.println("c < a < b");
            } else {
                System.out.printf("%d < %d = %d\n", c, a, b);
                System.out.println("c < a = b");
            }
            // logik für gleich
        } else if (a == b && b != c) { // true && false = false
            // a = b != c
            System.out.printf("%d = %d < %d\n", a, b, c);
            System.out.println("a = b < c");
        } else if (b == c && b != a) {
            // b = c < a
            System.out.printf("%d = %d < %d\n", b, c, a);
            System.out.println("b = c < a");
        } else if (a == c && a != b) {
            // b = c < a
            System.out.printf("%d = %d < %d\n", a, c, b);
            System.out.println("a = c < b");
        } else {
            // a = b = c
            System.out.printf("%d = %d = %d\n", a, b, c);
            System.out.println("a = b = c");
        }
    }
}