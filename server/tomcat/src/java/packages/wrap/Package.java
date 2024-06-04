package packages.wrap;

public class Package {
    public int id;
    public double sellingPrice;
    public double costPrice;
    public String description;

    public Package(int id, double sellingPrice, double costPrice, String description) {
        this.id = id;
        this.sellingPrice = sellingPrice;
        this.costPrice = costPrice;
        this.description = description;
    }

    public void getProduct() {

    }
}