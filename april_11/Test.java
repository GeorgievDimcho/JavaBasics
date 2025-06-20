package april_11;

import java.io.File;
import java.nio.file.Path;

public class Test {
    public static void main(String[] args) {
        File f = new File("upload/test.txt");
        System.out.println("file name: " + f.getName());
        System.out.println("file abspath: " + f.getAbsolutePath());
        

        // String correctPath = path.replace('/', '\\');
        System.out.println("Correctpath: " + f.getAbsolutePath().toString().replace('/', '\\'));

    }
}
