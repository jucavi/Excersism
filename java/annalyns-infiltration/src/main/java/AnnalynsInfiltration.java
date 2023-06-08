class AnnalynsInfiltration {
    public static boolean canFastAttack(boolean knightIsAwake) {
        // Knight should be sleeping
        return !knightIsAwake;
    }

    public static boolean canSpy(boolean knightIsAwake, boolean archerIsAwake, boolean prisonerIsAwake) {
        // Anyone should be awake
        return knightIsAwake || archerIsAwake || prisonerIsAwake;
    }

    public static boolean canSignalPrisoner(boolean archerIsAwake, boolean prisonerIsAwake) {
        // Prisoner should be awake and archer should be sleeping
        return prisonerIsAwake && !archerIsAwake;
    }

    public static boolean canFreePrisoner(boolean knightIsAwake, boolean archerIsAwake, boolean prisonerIsAwake, boolean petDogIsPresent) {
        // Pet dog should be present and archer should be sleeping
        boolean oneWayRescue = petDogIsPresent && !archerIsAwake;
        // Or
        // Prisoner should be awake, knight and archer should be sleeping
        boolean twoWayRescue = prisonerIsAwake && (!archerIsAwake && !knightIsAwake);

        return oneWayRescue || twoWayRescue;
    }
}
