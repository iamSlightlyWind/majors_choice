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

    public CPU(int id) {
        super(id);
        Database db = new Database();
        ArrayList<CPU> cpus = db.getCPUs();

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
}