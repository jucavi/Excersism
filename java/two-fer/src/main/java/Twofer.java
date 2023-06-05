public class Twofer {
    final String format = "One for %s, one for me.";
    public String twofer(String name) {
        if (name == null) {
            name = "you";
        }
        return String.format(format, name);
    }
}
