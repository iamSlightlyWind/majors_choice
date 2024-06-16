package packages;

import java.util.ArrayList;
import database.Database;
import packages.wrap.Product;

public class SSD extends Product {

    public String connectionInterface;
    public int capacity;
    public int cache;

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

    public String getName() {
        return name;
    }

    public double getSellingPrice() {
        return sellingPrice;
    }
    
}