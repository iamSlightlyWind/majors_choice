package packages;

public class Motherboard extends Product {

    public String socket;
    public String chipset;
    public String formFactor;
    public String ramType;
    public int maxRamSpeed;
    public int ramSlots;
    public int wifi;
    public String image;

    public Motherboard(String socket, String chipset, String formFactor, String ramType, int maxRamSpeed, int ramSlots, int wifi, String image, String name, int id, double sellingPrice, double costPrice, String description) {
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

  
    public String getSocket() {
        return socket;
    }

    public void setSocket(String socket) {
        this.socket = socket;
    }

    public String getChipset() {
        return chipset;
    }

    public void setChipset(String chipset) {
        this.chipset = chipset;
    }

    public String getFormFactor() {
        return formFactor;
    }

    public void setFormFactor(String formFactor) {
        this.formFactor = formFactor;
    }

    public String getRamType() {
        return ramType;
    }

    public void setRamType(String ramType) {
        this.ramType = ramType;
    }

    public int getMaxRamSpeed() {
        return maxRamSpeed;
    }

    public void setMaxRamSpeed(int maxRamSpeed) {
        this.maxRamSpeed = maxRamSpeed;
    }

    public int getRamSlots() {
        return ramSlots;
    }

    public void setRamSlots(int ramSlots) {
        this.ramSlots = ramSlots;
    }

    public int getWifi() {
        return wifi;
    }

    public void setWifi(int wifi) {
        this.wifi = wifi;
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
