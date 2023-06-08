class ReverseString {

    String reverse(String inputString) {
        if (inputString.isEmpty()) return inputString;

        return reverse(inputString.substring(1)) + inputString.charAt(0);
    }
}
