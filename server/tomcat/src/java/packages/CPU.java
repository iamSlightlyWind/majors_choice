package packages;

import packages.wrap.Product;

public class CPU extends Product {
    
    public String generation;
    public String socket;
    public int cores;
    public int threads;
    public int baseClock;
    public int boostClock;
    public int tdp;

    public CPU(int id, double sellingPrice, double costPrice, String description, String name, String generation,
            String socket, int cores, int threads, int baseClock, int boostClock, int tdp) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.generation = generation;
        this.socket = socket;
        this.cores = cores;
        this.threads = threads;
        this.baseClock = baseClock;
        this.boostClock = boostClock;
        this.tdp = tdp;
    }
    
    public void getInformation() {
        
    }
}