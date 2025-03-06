public class LifeOfPi {
    public static void main(String[] args) {
        double PI = 3.14159265359;
        System.out.printf("%f\n", PI); // default formating
        System.out.printf("%12f\n", PI); // • 12 characters wide
        System.out.printf("%12.2f\n", PI); // 12 char , 2 digits
        System.out.printf("%10.0f\n", PI); // 12 char , 2 digits
        System.out.printf("%015f\n", PI); // 12 char , 2 digits
        System.out.printf("%13.11f\n", PI); // 12 char , 2 digits
        System.out.printf("%+015f\n", PI); // 12 char , 2 digits
    }
}
