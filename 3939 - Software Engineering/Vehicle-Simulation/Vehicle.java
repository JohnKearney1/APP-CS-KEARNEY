/*
 * John Kearney
 * CS 3667-101 
 * 02/28/2025
 * Dr. Nazia Sharmin
 * Desc: Vehicle.java - Create a vehicle class that includes DriveBehavior and HonkBehavior
 */

public class Vehicle {
    private DriveBehavior driveBehavior;
    private HonkBehavior honkBehavior;

    public void performDrive() {
        driveBehavior.drive();
    }

    public void performHonk() {
        honkBehavior.honk();
    }

    public void setDriveBehavior(DriveBehavior driveBehavior) {
        this.driveBehavior = driveBehavior;
    }

    public void setHonkBehavior(HonkBehavior honkBehavior) {
        this.honkBehavior = honkBehavior;
    }
}