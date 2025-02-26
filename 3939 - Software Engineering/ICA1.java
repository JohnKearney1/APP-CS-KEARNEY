// superclass: Duck
abstract class Duck {
    public void quack() {
        System.out.println("Quacking...");
    }

    public void swim() {
        System.out.println("Swimming...");
    }

    // abstract method
    public abstract void display();

}

// Flyable Interface: Represents flying behavior
interface Flyable {
    public void fly();
}

// MallardDuck implements Flyable and defines the fly method
class MallardDuck extends Duck implements Flyable {

    @Override
    public void display() {
        System.out.println("Displaying Mallard Duck");
    }

    @Override
    public void fly() {
        System.out.println("I'm flying with wings!");
    }
}

// RedheadDuck implements Flyable and defines the fly method
class RedheadDuck extends Duck implements Flyable {

    @Override
    public void display() {
        System.out.println("Displaying Redhead Duck");
    }

    @Override
    public void fly() {
        System.out.println("I'm flying with wings!");
    }
}


// A new Grayduck subclass also implements Flyable and defines the fly method
class Grayduck extends Duck implements Flyable {

    @Override
    public void display() {
        System.out.println("Displaying Gray Duck");
    }

    @Override
    public void fly() {
        System.out.println("I'm flying with wings!");
    }
}


// Main class to test the implementation
public class ICA1 {
    public static void main(String[] args) {
        Duck mallardDuck = new MallardDuck();
        mallardDuck.display();
        mallardDuck.quack();
        mallardDuck.swim();
        ((Flyable) mallardDuck).fly();

        Duck redheadDuck = new RedheadDuck();
        redheadDuck.display();
        redheadDuck.quack();
        redheadDuck.swim();
        ((Flyable) redheadDuck).fly();

        Duck grayDuck = new Grayduck();
        grayDuck.display();
        grayDuck.quack();
        grayDuck.swim();
        ((Flyable) grayDuck).fly();
    }
}


