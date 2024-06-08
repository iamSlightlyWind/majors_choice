package packages;

import java.util.ArrayList;
import database.Database;
import packages.wrap.Product;

public class PSU extends Product {

    public int wattage;
    public String efficiency;

    public PSU(int id, double sellingPrice, double costPrice, String description, String name, int wattage,
            String efficiency) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.wattage = wattage;
        this.efficiency = efficiency;
    }

    public PSU(int id) {
        super(id);
        Database db = new Database();
        ArrayList<PSU> psus = db.getPSUs();

        for (PSU psu : psus) {
            if (psu.id == id) {
                this.sellingPrice = psu.sellingPrice;
                this.costPrice = psu.costPrice;
                this.description = psu.description;
                this.name = psu.name;
                this.wattage = psu.wattage;
                this.efficiency = psu.efficiency;
                return;
            }
        }
    }
}