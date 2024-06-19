package packages;

import java.util.ArrayList;
import database.Database;
import packages.wrap.Product;

public class SSD extends Product {

    public String connectionInterface;
    public int capacity;
    public int cache;

    public SSD(String connectionInterface, int capacity, int cache, String image, String name, int id, double sellingPrice, double costPrice, String description) {
        super(name, id, sellingPrice, costPrice, description);
        this.connectionInterface = connectionInterface;
        this.capacity = capacity;
        this.cache = cache;
    }

    public SSD(int id, double sellingPrice, double costPrice, String description, String name, String connectionInterface, int capacity, int cache) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.connectionInterface = connectionInterface;
        this.capacity = capacity;
        this.cache = cache;
    }

    public SSD(int id) {
        super(id);
        Database db = new Database();
        ArrayList<SSD> ssds = db.getSSDs("");

        for (SSD ssd : ssds) {
            if (ssd.id == id) {
                this.sellingPrice = ssd.sellingPrice;
                this.costPrice = ssd.costPrice;
                this.description = ssd.description;
                this.name = ssd.name;
                this.connectionInterface = ssd.connectionInterface;
                this.capacity = ssd.capacity;
                this.cache = ssd.cache;
                return;
            }
        }
    }

    public String getConnectionInterface() {
        return connectionInterface;
    }

    public void setConnectionInterface(String connectionInterface) {
        this.connectionInterface = connectionInterface;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getCache() {
        return cache;
    }

    public void setCache(int cache) {
        this.cache = cache;
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
