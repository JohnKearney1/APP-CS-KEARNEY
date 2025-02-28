/*
 * John Kearney
 * CS 3667-101 
 * 02/28/2025
 * Dr. Nazia Sharmin
 */

public class DriveNoWay implements DriveBehavior {
    public void drive() {
        System.out.println("I can't drive!");
    }
    public void honk() {
        System.out.println("Honk honk!");
    }
}
