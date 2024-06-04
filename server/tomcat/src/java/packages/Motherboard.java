package packages;

import packages.wrap.Package;

public class Motherboard extends Package {
    public String name;
    public String socket;
    public String chipset;
    public String formFactor;
    public String ramType;
    public int maxRamSpeed;
    public int ramSlots;
    public int wifi;

    public Motherboard(int id, double sellingPrice, double costPrice, String description, String name, String socket,
            String chipset, String formFactor, String ramType, int maxRamSpeed, int ramSlots, int wifi) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.socket = socket;
        this.chipset = chipset;
        this.formFactor = formFactor;
        this.ramType = ramType;
        this.maxRamSpeed = maxRamSpeed;
        this.ramSlots = ramSlots;
        this.wifi = wifi;
    }
}
