package packages;

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
}
