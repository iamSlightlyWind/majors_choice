package packages;

import java.util.ArrayList;
import database.Database;
import packages.wrap.Product;

public class Motherboard extends Product {

    public String socket;
    public String chipset;
    public int igpu;
    public String formFactor;
    public String ramType;
    public int maxRamSpeed;
    public int maxRamCapacity;
    public int ramSlots;
    public int wifi;
    public String image;

    public Motherboard(Motherboard m) {
        super(m.id, m.sellingPrice, m.costPrice, m.description);
        this.name = m.name;
        this.socket = m.socket;
        this.chipset = m.chipset;
        this.formFactor = m.formFactor;
        this.ramType = m.ramType;
        this.maxRamSpeed = m.maxRamSpeed;
        this.ramSlots = m.ramSlots;
        this.wifi = m.wifi;
        this.image = m.image;
    }

    public Motherboard(String socket, String chipset, String formFactor, String ramType, int maxRamSpeed, int ramSlots,
            int wifi, String image, String name, int id, double sellingPrice, double costPrice, String description) {
        super(name, id, sellingPrice, costPrice, description);
        this.socket = socket;
        this.chipset = chipset;
        this.formFactor = formFactor;
        this.ramType = ramType;
        this.maxRamSpeed = maxRamSpeed;
        this.ramSlots = ramSlots;
        this.wifi = wifi;
        this.image = image;
    }

    public Motherboard(String socket, String chipset, String formFactor, String ramType, int maxRamSpeed, int ramSlots,
            int wifi, String image, String name, int id, double sellingPrice, double costPrice, String description,
            int quantity) {
        super(name, id, sellingPrice, costPrice, description, quantity);
        this.socket = socket;
        this.chipset = chipset;
        this.formFactor = formFactor;
        this.ramType = ramType;
        this.maxRamSpeed = maxRamSpeed;
        this.ramSlots = ramSlots;
        this.wifi = wifi;
        this.image = image;
    }

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

    public Motherboard(String socket, String chipset, int igpu, String formFactor, String ramType, int maxRamSpeed,
            int maxRamCapacity, int ramSlots, int wifi, String image, String name, int id, double sellingPrice,
            double costPrice, String description, int quantity) {
        super(name, id, sellingPrice, costPrice, description, quantity);
        this.socket = socket;
        this.chipset = chipset;
        this.igpu = igpu;
        this.formFactor = formFactor;
        this.ramType = ramType;
        this.maxRamSpeed = maxRamSpeed;
        this.maxRamCapacity = maxRamCapacity;
        this.ramSlots = ramSlots;
        this.wifi = wifi;
        this.image = image;
    }

    public Motherboard(int id) {
        super(id);
        ArrayList<Motherboard> motherboards = Database.getMotherboards("");

        for (Motherboard motherboard : motherboards) {
            if (motherboard.id == id) {
                this.sellingPrice = motherboard.sellingPrice;
                this.costPrice = motherboard.costPrice;
                this.description = motherboard.description;
                this.name = motherboard.name;
                this.socket = motherboard.socket;
                this.chipset = motherboard.chipset;
                this.igpu = motherboard.igpu;
                this.formFactor = motherboard.formFactor;
                this.ramType = motherboard.ramType;
                this.maxRamSpeed = motherboard.maxRamSpeed;
                this.maxRamCapacity = motherboard.maxRamCapacity;
                this.ramSlots = motherboard.ramSlots;
                this.wifi = motherboard.wifi;
                this.quantity = motherboard.quantity;
                return;
            }
        }
    }

    public void setSocket(String socket) {
        this.socket = socket;
    }

    public void setChipset(String chipset) {
        this.chipset = chipset;
    }

    public void setFormFactor(String formFactor) {
        this.formFactor = formFactor;
    }

    public void setRamType(String ramType) {
        this.ramType = ramType;
    }

    public int getIgpu() {
        return igpu;
    }

    public int getMaxRamCapacity() {
        return maxRamCapacity;
    }

    public void setMaxRamSpeed(int maxRamSpeed) {
        this.maxRamSpeed = maxRamSpeed;
    }

    public void setRamSlots(int ramSlots) {
        this.ramSlots = ramSlots;
    }

    public void setWifi(int wifi) {
        this.wifi = wifi;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public void setCostPrice(double costPrice) {
        this.costPrice = costPrice;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSocket() {
        return socket;
    }

    public String getChipset() {
        return chipset;
    }

    public String getFormFactor() {
        return formFactor;
    }

    public String getRamType() {
        return ramType;
    }

    public int getMaxRamSpeed() {
        return maxRamSpeed;
    }

    public int getRamSlots() {
        return ramSlots;
    }

    public int getWifi() {
        return wifi;
    }

    public String getImage() {
        return image;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public double getSellingPrice() {
        return sellingPrice;
    }

    public double getCostPrice() {
        return costPrice;
    }

    public String getDescription() {
        return description;
    }
}