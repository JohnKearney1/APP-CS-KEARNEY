/*
 * John Kearney
 * CS 3667-101 
 * 02/28/2025
 * Dr. Nazia Sharmin
 */

public class SportsCar extends Vehicle {
    public SportsCar() {
        setDriveBehavior(new DriveFast());
        setHonkBehavior(new LoudHonk());
    }
}

