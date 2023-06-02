public class Lasagna {

    // TODO: define the 'expectedMinutesInOven()' method
    public int expectedMinutesInOven() {
        return 40;
    }

    // TODO: define the 'remainingMinutesInOven()' method
    public int remainingMinutesInOven(int minutesInOven) {
        return expectedMinutesInOven() - minutesInOven;
    }

    // TODO: define the 'preparationTimeInMinutes()' method
    public  int preparationTimeInMinutes(int numLayers) {
        int timePerLayer = 2;
        return numLayers *  timePerLayer;
    }

    // TODO: define the 'totalTimeInMinutes()' method
    public int totalTimeInMinutes(int numLayers, int timeInOven) {
        return preparationTimeInMinutes(numLayers) + timeInOven;
    }
}
