/*
 * John Kearney
 * CS 3667-101 
 * 02/28/2025
 * Dr. Nazia Sharmin
 */

public class Bicycle extends Vehicle {
    public Bicycle() {
        setDriveBehavior(new DriveSlow());
        setHonkBehavior(new MuteHonk());
    }
}
