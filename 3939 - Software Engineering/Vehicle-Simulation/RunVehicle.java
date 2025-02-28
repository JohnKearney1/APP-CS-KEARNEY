/*
 * John Kearney
 * CS 3667-101 
 * 02/28/2025
 * Dr. Nazia Sharmin
 */

public class RunVehicle {
    public static void main(String[] args) {

        // Create a new SportsCar object
        Vehicle vehicle = new SportsCar();

        // execute the default drive and honk behaviors
        vehicle.performDrive();
        vehicle.performHonk();

        // Change the drive and honk behaviors programmatically
        System.out.println("Changing driving and honking behavior...");
        vehicle.setDriveBehavior(new DriveSlow());
        vehicle.setHonkBehavior(new MuteHonk());

        // execute the updated drive and honk behaviors
        vehicle.performDrive();
        vehicle.performHonk();
    }
}