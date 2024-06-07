package packages;

public class GPU extends Product {
    
    public String generation;
    public int vram;
    public int baseClock;
    public int boostClock;
    public int tdp;

    public GPU(String generation, int vram, int baseClock, int boostClock, int tdp, int id, double sellingPrice, double costPrice, String description) {
        super(id, sellingPrice, costPrice, description);
        this.generation = generation;
        this.vram = vram;
        this.baseClock = baseClock;
        this.boostClock = boostClock;
        this.tdp = tdp;
    }


}
