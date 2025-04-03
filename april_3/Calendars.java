import java.util.Scanner;

public class Calendars {

    /**** D O N T T O U C H T H I S ***/

    private static Scanner sc = new Scanner(System.in);
    private static final int SET_DATE = 0;
    private static final int IS_LEAP = 1;
    private static final int DAYS_IN_MONTH = 2;
    private static final int CHECK_DATE = 3;

    private static final int YMD_2_W = 7;
    private static final int DAY_NUMBER = 8;
    private static final int WEEK_NUMBER = 9;
    // private static final int COMPARE = 10;

    // private static final int DAY_NAME = 13;
    // private static final int PRINT_DAY = 14;
    // private static final int DAY_SHORT_NAME = 15;
    // private static final int PRINT_DAY_SHORT = 16;
    // private static final int PRINT_MONTH = 17;
    // private static final int PRINT_MONTH_SHORT = 18;
    // private static final int PRINT_DATE = 19;
    private static final int PRINT_STATISTICS = 20;

    private static final int PRINT_CALENDAR_HIGHLIGHT = 21;
    private static final int PRINT_CALENDAR = 22;

    private static final int EXIT = 666;

    public static boolean isLeap(int year) {
        if ((year % 4 == 0 && year % 100 == 0) || year % 400 == 0) {
            return true;
        } else {
            return false;
        }
    }

    public static int daysInMonth(int year, int month) {
        // 1,3,5,7(juli),8,10,12
        int[] days = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
        // index 0 , 1, 2, 3, 4
        if (month == 2 && isLeap(year)) { // if februar und gleichzeitig schaltjahr
            return 29;
        }
        if (month >= 1 && month <= 12) {
            return days[month - 1];
        } else {
            return -1;
        }
    }

    private static boolean checkDate(int year) {
        if (year < 1582 || year > 2199) {
            return false;
        } else {
            return true;
        }
    }

    public static boolean checkDate(int year, int month) { // 1582 , 9
        boolean isYearValid = checkDate(year); // true
        if (month >= 1 && month <= 12 && isYearValid) {
            if (year == 1582) {
                if (month >= 10) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    public static boolean checkDate(int year, int month, int day) { // 15. 6. 1582
        boolean isMonthAndYearValid = checkDate(year, month);
        if (day >= 1 && day <= daysInMonth(year, month) && isMonthAndYearValid) {
            if (year == 1582) {
                if (day >= 16) {
                    return true;
                } else {
                    return false;
                }
            }
            return true;
        } else {
            return false;
        }
    }

    private static int ymd2w(year, month, day) {
        
    }

    public static void main(String[] args) {

        sc = new Scanner(System.in);
        int day = 1, month = 1, year = 1970;

        while (true) {

            int op;
            System.out.printf("current date: %02d.%02d.%04d\n", day, month, year);

            System.out.printf("enter option: ");
            op = sc.nextInt();

            switch (op) {
                case SET_DATE:
                    System.out.printf("day: ");
                    day = sc.nextInt();
                    System.out.printf("month: ");
                    month = sc.nextInt();
                    System.out.printf("year: ");
                    year = sc.nextInt();
                    break;

                /*------------------------- BASICS ----------------------*/
                case IS_LEAP:
                    System.out.printf("\nisLeap(year): %b\n", isLeap(year));
                    break;

                case DAYS_IN_MONTH:
                    System.out.printf("\ndaysInMonth(year, month): %d\n", daysInMonth(year, month));
                    break;

                case CHECK_DATE:
                    System.out.printf("\ncheckDate1(year): %b\n", checkDate(year));
                    System.out.printf("checkDate2(year, month): %b\n", checkDate(year, month));
                    System.out.printf("checkDate3(year, month, day): %b\n", checkDate(year,
                            month, day));
                    break;

                /*------------------------- CALCULATIONS ----------------------*/
                case YMD_2_W: {
                    System.out.printf("\nymd2w(year, month, day): %d\n", ymd2w(year, month, day));
                    break;
                }
                // case DAY_NUMBER:
                // System.out.printf("\ndayNumber(year, month, day): %d\n", dayNumber(year,
                // month, day));
                // break;

                // case WEEK_NUMBER:
                // System.out.printf("\nweekNumber(year, month, day): %d\n", weekNumber(year,
                // month, day));
                // break;

                // /*------------------------- OUTPUT ----------------------*/
                // case PRINT_STATISTICS:
                // System.out.printf("\nprintStatistics: ");
                // printStatistics(year, month, day);
                // break;

                // /*------------------------- APPLICATIONS ----------------------*/
                // case PRINT_CALENDAR_HIGHLIGHT:
                // System.out.printf("\nprintCalendar(year, month, day, 1): \n");
                // printCalendar(year, month, day, true);
                // break;

                // case PRINT_CALENDAR:
                // System.out.printf("\nprintCalendar(year, month, day, 0): \n");
                // printCalendar(year, month, day, false);
                // break;

                case EXIT:
                    System.out.printf("closing.\n");
                    sc.close();
                    return;

                default:
                    // Do nothing
            }
            System.out.printf("\n");
        }
    }
}