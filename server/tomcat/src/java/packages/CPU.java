package packages;

import java.util.ArrayList;
import database.Database;
import packages.wrap.Product;

public class CPU extends Product {

    public String generation;
    public String socket;
    public int cores;
    public int threads;
    public int baseClock;
    public int boostClock;
    public int tdp;
    public String image;
    public String igpu;

    public CPU(CPU c) {
        super(c.id, c.sellingPrice, c.costPrice, c.description);
        this.name = c.name;
        this.generation = c.generation;
        this.socket = c.socket;
        this.cores = c.cores;
        this.threads = c.threads;
        this.baseClock = c.baseClock;
        this.boostClock = c.boostClock;
        this.tdp = c.tdp;
        this.image = c.image;
    }

    public CPU(String generation, String socket, int cores, int threads, int baseClock, int boostClock, int tdp, String image, String name, int id, double sellingPrice, double costPrice, String description) {
        super(name, id, sellingPrice, costPrice, description);
        this.generation = generation;
        this.socket = socket;
        this.cores = cores;
        this.threads = threads;
        this.baseClock = baseClock;
        this.boostClock = boostClock;
        this.tdp = tdp;
        this.image = image;
    }

    public CPU(String generation, String socket, int cores, int threads, int baseClock, int boostClock, int tdp, String image, String igpu, String name, int id, double sellingPrice, double costPrice, String description) {
        super(name, id, sellingPrice, costPrice, description);
        this.generation = generation;
        this.socket = socket;
        this.cores = cores;
        this.threads = threads;
        this.baseClock = baseClock;
        this.boostClock = boostClock;
        this.tdp = tdp;
        this.image = image;
        this.igpu = igpu;
    }

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

    public CPU(String generation, String socket, int cores, int threads, int baseClock, int boostClock, int tdp, String image, String igpu, String name, int id, double sellingPrice, double costPrice, String description, int quantity) {
        super(name, id, sellingPrice, costPrice, description, quantity);
        this.generation = generation;
        this.socket = socket;
        this.cores = cores;
        this.threads = threads;
        this.baseClock = baseClock;
        this.boostClock = boostClock;
        this.tdp = tdp;
        this.image = image;
        this.igpu = igpu;
    }
    

    public CPU(int id) {
        super(id);
        Database db = new Database();
        ArrayList<CPU> cpus = db.getCPUs("");

        for (CPU cpu : cpus) {
            if (cpu.id == id) {
                this.sellingPrice = cpu.sellingPrice;
                this.costPrice = cpu.costPrice;
                this.description = cpu.description;
                this.name = cpu.name;
                this.generation = cpu.generation;
                this.socket = cpu.socket;
                this.cores = cpu.cores;
                this.threads = cpu.threads;
                this.baseClock = cpu.baseClock;
                this.boostClock = cpu.boostClock;
                this.tdp = cpu.tdp;
                return;
            }
        }
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getGeneration() {
        return generation;
    }

    public void setGeneration(String generation) {
        this.generation = generation;
    }

    public String getSocket() {
        return socket;
    }

    public void setSocket(String socket) {
        this.socket = socket;
    }

    public int getCores() {
        return cores;
    }

    public void setCores(int cores) {
        this.cores = cores;
    }

    public int getThreads() {
        return threads;
    }

    public void setThreads(int threads) {
        this.threads = threads;
    }

    public int getBaseClock() {
        return baseClock;
    }

    public void setBaseClock(int baseClock) {
        this.baseClock = baseClock;
    }

    public int getBoostClock() {
        return boostClock;
    }

    public void setBoostClock(int boostClock) {
        this.boostClock = boostClock;
    }

    public int getTdp() {
        return tdp;
    }

    public void setTdp(int tdp) {
        this.tdp = tdp;
    }

    public String getName() {
        return name;
    }

    public double getSellingPrice() {
        return sellingPrice;
    }

    public int getId() {
        return id;
    }

    public String getIgpu() {
        return igpu;
    }

    public void setIgpu(String igpu) {
        this.igpu = igpu;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getCostPrice() {
        return costPrice;
    }
}
