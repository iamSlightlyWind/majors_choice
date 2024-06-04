package packages;

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
}