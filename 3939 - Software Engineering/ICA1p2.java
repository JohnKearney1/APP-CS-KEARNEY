/*
    CS 3930-101 - In Class Activity 1, Part 2
    @Author: John Kearney
    @Description: This program creates 20 teams that are either sitting on a tree, bench, horse, or not sitting at all.
    @Due: 2/24/25 - Dr. Nazia Sharmin
 */ 

abstract class Team {

    public void sleep () {
        System.out.println("Sleeping...");
    }

    public void stand() {
        System.out.println("Standing...");
    }
}

interface Sitting {
    public void sit();
}


class TreeTeam extends Team implements Sitting {

    @Override
    public void sit() {
        System.out.println("Sitting on a tree...");
    }
}

class BenchTeam extends Team implements Sitting {

    @Override
    public void sit() {
        System.out.println("Sitting on a bench...");
    }
}

class HorseTeam extends Team implements Sitting {

    @Override
    public void sit() {
        System.out.println("Sitting on a horse...");
    }
}

class NoSitTeam extends Team implements Sitting {

    public void sit() {
        System.out.println("Not sitting...");
    }
}


// Create 20 individual teams with the following breakdown:
// 10 teams should be sitting on a tree
// 1 team should be sitting on a bench
// 5 teams should be sitting on a horse
// and 4 teams should not be sitting

// Not all teams have to use all of their methods. Just what is needed above
// Also, print a number next to each team (1-20) to show which team is which

public class ICA1p2 {

    public static void main(String[] args) {
        Sitting[] teams = new Sitting[20];

        for (int i = 0; i < 10; i++) {
            teams[i] = new TreeTeam();
        }

        teams[10] = new BenchTeam();

        for (int i = 11; i < 16; i++) {
            teams[i] = new HorseTeam();
        }

        for (int i = 16; i < 20; i++) {
            teams[i] = new NoSitTeam();
        }

        for (int i = 0; i < 20; i++) {
            System.out.print("Team " + (i + 1) + ": ");
            teams[i].sit();
        }

    }
}
