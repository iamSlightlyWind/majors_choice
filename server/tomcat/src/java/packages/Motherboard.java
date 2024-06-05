package packages;

import java.util.ArrayList;
import database.Database;
import packages.wrap.Product;

public class Motherboard extends Product {

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

    public Motherboard(int id) {
        super(id);
        Database db = new Database();
        ArrayList<Motherboard> motherboards = db.getMotherboards();

        for (Motherboard motherboard : motherboards) {
            if (motherboard.id == id) {
                this.sellingPrice = motherboard.sellingPrice;
                this.costPrice = motherboard.costPrice;
                this.description = motherboard.description;
                this.name = motherboard.name;
                this.socket = motherboard.socket;
                this.chipset = motherboard.chipset;
                this.formFactor = motherboard.formFactor;
                this.ramType = motherboard.ramType;
                this.maxRamSpeed = motherboard.maxRamSpeed;
                this.ramSlots = motherboard.ramSlots;
                this.wifi = motherboard.wifi;
                return;
            }
        }
    }
}
