package March_28;

public class Min_v3 {
    public static void main(String[] args) {

        NamedInt a = new NamedInt("a", 3);
        NamedInt b = new NamedInt("b", 2);
        NamedInt c = new NamedInt("c", 1);

        // 3 item Bubble Sort;
        if (!NamedInt.isSorted(a, b))
            NamedInt.swap(a, b);
        // or the same as a "class method"(?)

        NamedInt.swapIfUnsorted(a, b);
        NamedInt.swapIfUnsorted(b, c);
        NamedInt.swapIfUnsorted(a, b);

        System.out.format("%d <= %d <= %d\n", a.value, b.value, c.value);
        System.out.format("%s <= %s <= %s\n", a.name, b.name, c.name);

    }

}

class NamedInt {

    public String name;
    public int value;

    public NamedInt(String n, int v) {
        this.name = n;
        this.value = v;
    }

    public static boolean isSorted(NamedInt ni1, NamedInt ni2) {
        return (ni1.value <= ni2.value) ? true : false; // zur klarheit
    }

    public static void swap(NamedInt ni1, NamedInt ni2) {
        NamedInt tmp = new NamedInt(ni1.name, ni1.value);
        ni1.name = ni2.name;
        ni1.value = ni2.value;
        ni2.name = tmp.name;
        ni2.value = tmp.value;
    }

    public static void swapIfUnsorted(NamedInt ni1, NamedInt ni2) {
        if (!NamedInt.isSorted(ni1, ni2))
            NamedInt.swap(ni1, ni2);
    }

}
