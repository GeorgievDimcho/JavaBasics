public class Rhombus {
    public static void main(String[] args) {
        int a = 111, b = 222, c = 333, d = 444;
        float e = -1.1f;
        int i = 0;
        int counter = 0;
        while (counter < 24) {
            System.out.print(i);
            i++;
            counter++;
            if (i == 10) {
                i = 0;
            }
        }
        System.out.println("");
        int spacing_rechts = 12;
        boolean changeDirection = false;
        // int spacing_links = 0;
        int spacing_middle = 1;
        String rechst = "%" + spacing_rechts + "s";
        String middle = "";
        String links = "%s";
        String finalFormat = rechst + links;
        for (int j = 0; j < 6; j++) {
            rechst = "%" + spacing_rechts + "s";
            middle = "%" + spacing_middle + "s";
            links = "%s";
            finalFormat = rechst + middle + links;
            if (!changeDirection) {
                System.out.printf(finalFormat, "/", "\\", "");
                spacing_rechts--;
                spacing_middle = spacing_middle + 2;

            } else {
                System.out.printf(finalFormat, "\\", "/", "");
                spacing_rechts++;
                spacing_middle = spacing_middle - 2;

            }
            System.out.println("");
            if (j == 2) {
                spacing_middle=spacing_middle-2;
                spacing_rechts++;
                changeDirection = true;
            }
        }
        // System.out.printf("%12s%s", "/", "\\");
    }
}
