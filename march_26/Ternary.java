public class Ternary {
    public static void main(String[] args) {
        boolean condition = true && false;
        boolean condition2 = true || false;
        // (condition) ? (fall1) : (fall2)
        // condition ? (condition2 ? fall3 : fall3) : fall2
    }
    // a?b:(c?d:(e?f:g)) right associative
    // (a?b:c)?d:e?f:g
    /*
     * if (someboolean) {
     * return new someinstanceofsomething();
     * } else {
     * if (someotherboolean) {
     * return new otherinstance();
     * } else {
     * return new thirdinstance()
     * }
     * }
     */
}
