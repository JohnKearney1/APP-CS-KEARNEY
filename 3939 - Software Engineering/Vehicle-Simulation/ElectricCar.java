/*
 * John Kearney
 * CS 3667-101 
 * 02/28/2025
 * Dr. Nazia Sharmin
 */

public class ElectricCar extends Vehicle {
    public ElectricCar() {
        setDriveBehavior(new DriveFast());
        setHonkBehavior(new MuteHonk());
    }
}
