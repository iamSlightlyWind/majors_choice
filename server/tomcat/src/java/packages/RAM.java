package packages;

import java.util.ArrayList;
import database.Database;
import packages.wrap.Product;

public class RAM extends Product {

    public String generation;
    public int capacity;
    public int speed;
    public int latency;
    public String image;

    public RAM(RAM r) {
        super(r.id, r.sellingPrice, r.costPrice, r.description);
        this.name = r.name;
        this.generation = r.generation;
        this.capacity = r.capacity;
        this.speed = r.speed;
        this.latency = r.latency;
        this.image = r.image;
    }

    public boolean compare(RAM r) {
        return this.name.equals(r.name) && this.generation.equals(r.generation) && this.capacity == r.capacity
                && this.speed == r.speed && this.latency == r.latency;
    }

    public RAM(int id, double sellingPrice, double costPrice, String description, String name, String generation,
            int capacity, int speed, int latency) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.generation = generation;
        this.capacity = capacity;
        this.speed = speed;
        this.latency = latency;
    }

    public RAM(String generation, int capacity, int speed, int latency, String image, String name, int id,
            double sellingPrice, double costPrice, String description) {
        super(name, id, sellingPrice, costPrice, description);
        this.generation = generation;
        this.capacity = capacity;
        this.speed = speed;
        this.latency = latency;
        this.image = image;
    }

    public RAM(String generation, int capacity, int speed, int latency, String image, String name, int id,
            double sellingPrice, double costPrice, String description, int quantity) {
        super(name, id, sellingPrice, costPrice, description, quantity);
        this.generation = generation;
        this.capacity = capacity;
        this.speed = speed;
        this.latency = latency;
        this.image = image;
    }

    public RAM(int id) {
        super(id);
        ArrayList<RAM> rams = Database.getRAMs("");

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
                this.quantity = ram.quantity;
                return;
            }
        }
    }

    public String getGeneration() {
        return generation;
    }

    public void setGeneration(String generation) {
        this.generation = generation;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public int getLatency() {
        return latency;
    }

    public void setLatency(int latency) {
        this.latency = latency;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public double getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(double costPrice) {
        this.costPrice = costPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}