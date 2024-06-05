package packages;

import packages.wrap.Package;

public class PSU extends Package {
    public String name;
    public int wattage;
    public String efficiency;

    public PSU(int id, double sellingPrice, double costPrice, String description, String name, int wattage,
            String efficiency) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.wattage = wattage;
        this.efficiency = efficiency;
    }
}