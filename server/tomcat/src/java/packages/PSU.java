package packages;

import java.util.ArrayList;
import database.Database;
import packages.wrap.Product;

public class PSU extends Product {

    public int wattage;
    public String efficiency;
    public String image;

    public PSU(PSU p) {
        super(p.id, p.sellingPrice, p.costPrice, p.description);
        this.name = p.name;
        this.wattage = p.wattage;
        this.efficiency = p.efficiency;
        this.image = p.image;
    }

    public PSU(int wattage, String efficiency, String image, String name, int id, double sellingPrice, double costPrice,
            String description) {
        super(name, id, sellingPrice, costPrice, description);
        this.wattage = wattage;
        this.efficiency = efficiency;
        this.image = image;
    }

    public PSU(int id, double sellingPrice, double costPrice, String description, String name, int wattage,
            String efficiency) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.wattage = wattage;
        this.efficiency = efficiency;
    }

    public PSU(int wattage, String efficiency, String image, String name, int id, double sellingPrice, double costPrice,
            String description, int quantity) {
        super(name, id, sellingPrice, costPrice, description, quantity);
        this.wattage = wattage;
        this.efficiency = efficiency;
        this.image = image;
    }

    public PSU(int id) {
        super(id);
        ArrayList<PSU> psus = Database.getPSUs("");

        for (PSU psu : psus) {
            if (psu.id == id) {
                this.sellingPrice = psu.sellingPrice;
                this.costPrice = psu.costPrice;
                this.description = psu.description;
                this.name = psu.name;
                this.wattage = psu.wattage;
                this.efficiency = psu.efficiency;
                this.quantity = psu.quantity;
                return;
            }
        }
    }

    public int getWattage() {
        return wattage;
    }

    public void setWattage(int wattage) {
        this.wattage = wattage;
    }

    public String getEfficiency() {
        return efficiency;
    }

    public void setEfficiency(String efficiency) {
        this.efficiency = efficiency;
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