package packages;

import packages.wrap.Package;

public class SSD extends Package {
    public String name;
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
}