import java.util.Scanner;

class EANCheck {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        long ean = scanner.nextLong();
        // = 9783890111049l;
        int sumEven = 0, sumOdd = 0;
        int checkNum = (int) (ean % 10);
        // ean = 002490100070l;
        ean = ean / 10;

        // filter check number: ean / 10
        // ean = 978389011104
        // even: ean / (10*10)*10...(10mal)
        // ean % 10 -> 4 -> even
        // ean / 10 = 97838901110 % 10 -> 0 odd
        // ean / 10 = 9783890111 % 10 -> 1 even
        for (int i = 12; i >= 1; i--) {
            if (i % 2 == 0) // even
            {
                sumEven = sumEven + (int) (ean % 10);
            } else // odd
            {
                sumOdd = sumOdd + (int) (ean % 10);
            }
            ean = ean / 10;
        }
        System.out.printf("sumEven: %d, sumOdd: %d\n", sumEven, sumOdd);
        int ourCheckSum = 9 - (((sumEven * 3 + sumOdd) - 1) % 10);
        System.out.println("our checksum: " + ourCheckSum);
        if (ourCheckSum == checkNum) {
            System.out.println("valid");
        } else {
            System.out.println("invalid");
        }
        scanner.close();
    }

}