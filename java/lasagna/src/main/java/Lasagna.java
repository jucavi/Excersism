public class Lasagna {
    final int TIME_IN_OVEN = 40;
    final int TIME_PER_LAYER = 2;

    // TODO: define the 'expectedMinutesInOven()' method
    public int expectedMinutesInOven() {
        return TIME_IN_OVEN;
    }

    // TODO: define the 'remainingMinutesInOven()' method
    public int remainingMinutesInOven(int minutesInOven) {
        return expectedMinutesInOven() - minutesInOven;
    }

    // TODO: define the 'preparationTimeInMinutes()' method
    public  int preparationTimeInMinutes(int numLayers) {
        return numLayers *  TIME_PER_LAYER;
    }

    // TODO: define the 'totalTimeInMinutes()' method
    public int totalTimeInMinutes(int numLayers, int timeInOven) {
        return preparationTimeInMinutes(numLayers) + timeInOven;
    }
}
