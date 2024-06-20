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
    public String image;

    public GPU(String generation, int vram, int baseClock, int boostClock, int tdp, String image, String name, int id, double sellingPrice, double costPrice, String description) {
        super(name, id, sellingPrice, costPrice, description);
        this.generation = generation;
        this.vram = vram;
        this.baseClock = baseClock;
        this.boostClock = boostClock;
        this.tdp = tdp;
        this.image = image;
    }

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

    public String getGeneration() {
        return generation;
    }

    public void setGeneration(String generation) {
        this.generation = generation;
    }

    public int getVram() {
        return vram;
    }

    public void setVram(int vram) {
        this.vram = vram;
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