package database;

// This class is used to test the Database class. It contains a main method so do what you will.

public class Test {
    public static void main(String[] args) {
        Database database = new Database();
        System.out.println(database.selectAll("userDetails"));
    }
}