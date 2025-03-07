package March_7;

import java.util.Scanner;

public class DateFormatConverter {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("enter date (yyyymmdd)");
        int input=0;
        try {
            input = scanner.nextInt();
            int MIN
        }
        catch(Exception exception) {
            System.out.println("There was an error.");
        }
         //20200610
        int day=0, month=0, year=0;
        year=input/10000;
        month=input%10000/100;
        day=input%100;
        if(year < 1582 && month < 10 && day < 16 ) {
            // TODO continue statements
        }
        if( dateIsValid)
        System.out.printf("%02d.%02d.%04d", day,month,year);
        else 
        System.out.println("invalid date");
        scanner.close();
    }
}
