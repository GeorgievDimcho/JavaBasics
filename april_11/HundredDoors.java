package april_11;

import java.util.Scanner;

public class HundredDoors {
    // private static boolean[] person(boolean[] doors, int num) {
    //     // Die erste Person öffnet alle Türen
    //     for (int i = 0; i < doors.length; i += num) {
    //         doors[i] = !doors[i];
    //     }
    //     return doors;
    // }

    private static void printDoors(boolean[] doors) {
        for (int i = 0; i < doors.length; i++) {
            if (doors[i])
                // System.out.print((i + 1) + " ");
                System.out.print((i+1) + " ");
        }
    }

    public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in)) {
            int numberDoors = scanner.nextInt();
            boolean[] doors = new boolean[numberDoors];

            // Zu Beginn sind alle Türen geschlossen -> default von boolean -> false
            // sehen dass die personen das gleiche machen
            for (int i = 1; i <= numberDoors; i++) {
                for (int j = i-1; j < doors.length; j += i) {
                    doors[j] = !doors[j];
                }
                // return doors;
                // doors = person(doors, i +1);
            }
            printDoors(doors);
            // 100 doesn't get printed :)
        }
    }
}
