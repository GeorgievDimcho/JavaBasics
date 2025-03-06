public class MixedAr {
    public static void main(String[] args) {
        System.out.printf("%f%n", 1. + 3 / 4);
        System.out.printf("%f%n", 1+ 3. / 4);
        System.out.printf("%f%n", 1 + 3 / 4.);
        System.out.printf("%f%n", 1 + (double) 3 / 4);
        System.out.printf("%d%n", (int) (1 + 3. / 4));
        System.out.println("Hello " + 2 + " ," + "a%n\naa" + "  " + 34);
    }
}
