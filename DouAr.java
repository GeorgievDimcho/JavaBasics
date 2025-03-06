public class DouAr {
    public static void main(String[] args) {
        //System.out.printf("%d / %d = %d\n", 19,0,19/0);
        System.out.printf("%+f\n", Double.POSITIVE_INFINITY * 42);
        System.out.printf("%+f\n", Double.NEGATIVE_INFINITY * Double.NaN);
        System.out.printf("%f / %f = %f\n", 19f, 0.0, 0. / 0.);
    
    }
    
}
