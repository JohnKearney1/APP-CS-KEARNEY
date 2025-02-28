/*
 * John Kearney
 * CS 3667-101 
 * 02/28/2025
 * Dr. Nazia Sharmin
 */

public class Truck extends Vehicle {
    public Truck() {
        setDriveBehavior(new DriveSlow());
        setHonkBehavior(new LoudHonk());
    }
    
}
