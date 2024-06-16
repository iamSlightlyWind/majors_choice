package packages;

import java.util.ArrayList;
import database.Database;
import packages.wrap.Product;

public class GPU extends Product {

    public String generation;
    public int vram;
    public int baseClock;
    public int boostClock;
    public int tdp;

    public GPU(int id, double sellingPrice, double costPrice, String description, String name, String generation,
            int vram, int baseClock, int boostClock, int tdp) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.generation = generation;
        this.vram = vram;
        this.baseClock = baseClock;
        this.boostClock = boostClock;
        this.tdp = tdp;
    }

    public GPU(int id) {
        super(id);
        Database db = new Database();
        ArrayList<GPU> gpus = db.getGPUs("");

        for (GPU gpu : gpus) {
            if (gpu.id == id) {
                this.sellingPrice = gpu.sellingPrice;
                this.costPrice = gpu.costPrice;
                this.description = gpu.description;
                this.name = gpu.name;
                this.generation = gpu.generation;
                this.vram = gpu.vram;
                this.baseClock = gpu.baseClock;
                this.boostClock = gpu.boostClock;
                this.tdp = gpu.tdp;
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
