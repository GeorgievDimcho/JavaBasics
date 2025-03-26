package March_20;

public class DAtum {
    public static void main(String[] args) {
        int input = 14001582;
        int year = input % 10000;
        int month = input % 1000000 / 10000;
        int day = input / 1000000;
        if (year >= 1582) {
            if ((month >= 1 && month <= 12) && (day >= 1 && day <= 31)) {
                if (year == 1582 && (month >= 10) && day >= 15) {
                    System.out.println("ja");
                } else {
                    System.out.println("error");
                }
            } else {
                System.out.println("2222");
            }
        } else {
            System.out.println("error");
        }
    }
}
