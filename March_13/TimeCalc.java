import java.util.Scanner;

public class TimeCalc {
    public static void main(String[] args) {
        System.out.printf("Max int %d \n", Integer.MAX_VALUE);
        System.out.printf("Max long %d \n", Long.MAX_VALUE);
        Scanner scanner = new Scanner(System.in);
        long input = scanner.nextLong();
        //stunden-24*days, minuten-60*(stunden), secunden-60*minuten)
        long ms = input % 1000;
        // 56584343 % 10 = 3
        long secunden = input / 1000;
        long minuten = secunden / 60;
        long stunden = minuten / 60;
        long days = stunden / 24;
        //long sec = (input / 1000) % 60;
        // System.out.printf("%d ms are exactly:\ndays: %d\nhours:%d\nminutes: %d \n
        // seconds: %d \n ms: %d\n", input,);
        System.out.println("secundne: " + secunden);
        System.out.printf("%d ms are exactly:\ndays: %d\nhours:%d\nminutes:%d\nsecunds:%d\nms:%d\n", input, days, stunden-24*days, minuten-60*(stunden), secunden-60*minuten, ms);

        scanner.close();
    }
}
