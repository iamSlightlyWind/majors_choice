package packages;

import java.util.ArrayList;
import database.Database;
import packages.wrap.Product;

public class RAM extends Product {

    public String generation;
    public int capacity;
    public int speed;
    public int latency;

    public RAM(int id, double sellingPrice, double costPrice, String description, String name, String generation,
            int capacity, int speed, int latency) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.generation = generation;
        this.capacity = capacity;
        this.speed = speed;
        this.latency = latency;
    }

    public RAM(int id) {
        super(id);
        Database db = new Database();
        ArrayList<RAM> rams = db.getRAMs();

        for (RAM ram : rams) {
            if (ram.id == id) {
                this.sellingPrice = ram.sellingPrice;
                this.costPrice = ram.costPrice;
                this.description = ram.description;
                this.name = ram.name;
                this.generation = ram.generation;
                this.capacity = ram.capacity;
                this.speed = ram.speed;
                this.latency = ram.latency;
                return;
            }
        }
    }
}