package packages.wrap;

public class Product {
    public String name;
    public int id;
    public double sellingPrice;
    public double costPrice;
    public String description;

    public Product(int id, double sellingPrice, double costPrice, String description) {
        this.id = id;
        this.sellingPrice = sellingPrice;
        this.costPrice = costPrice;
        this.description = description;
    }

    public void getProduct() {
    }

    @Override
    public String toString(){
        return this.name;
    }
}