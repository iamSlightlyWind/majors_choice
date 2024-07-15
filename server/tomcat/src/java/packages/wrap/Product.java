package packages.wrap;

public class Product {
    public String name;
    public int id;
    public double sellingPrice;
    public double costPrice;
    public String description;
    public int quantity;
    public double rateStar;
    public int rateSize;

    public Product(int id, double sellingPrice, double costPrice, String description) {
        this.id = id;
        this.sellingPrice = sellingPrice;
        this.costPrice = costPrice;
        this.description = description;
    }

    public Product(int id, String name, double sellingPrice, double costPrice) {
        this.id = id;
        this.sellingPrice = sellingPrice;
        this.costPrice = costPrice;
        this.name = name;
    }

    public Product(String name, int id, double sellingPrice, double costPrice, String description) {
        this.name = name;
        this.id = id;
        this.sellingPrice = sellingPrice;
        this.costPrice = costPrice;
        this.description = description;
    }

    public Product(String name, int id, double sellingPrice, double costPrice, String description, int quantity) {
        this.name = name;
        this.id = id;
        this.sellingPrice = sellingPrice;
        this.costPrice = costPrice;
        this.description = description;
        this.quantity = quantity;
    }

    public Product(String name, int id, double sellingPrice, double costPrice, String description, int quantity, double rateStar, int RateSize) {
        this.name = name;
        this.id = id;
        this.sellingPrice = sellingPrice;
        this.costPrice = costPrice;
        this.description = description;
        this.quantity = quantity;
        this.rateStar = rateStar;
        this.rateSize = RateSize;
    }
    

    public Product(int id) {
        this.id = id;
    }

    public void getProduct() {
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

    @Override
    public String toString() {
        if (name == null) {
            return id + "";
        }
        return id + " " + name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getRateStar() {
        return rateStar;
    }

    public void setRateStar(double rateStar) {
        this.rateStar = rateStar;
    }

    public int getRateSize() {
        return rateSize;
    }

    public void setRateSize(int RateSize) {
        this.rateSize = RateSize;
    }
    
}