package packages.wrap;

import java.util.Locale;

public class ProductCount {
    public int count;
    public int id;
    public String name;
    public double pricePer;
    public String totalPrice;

    public String toString() {
        return "Product ID: " + id + "\nProduct Name: " + name + "\nPrice Per: " + pricePer + "\nCount: " + count
                + "\nTotal Price: " + totalPrice;
    }

    public ProductCount(int id, int count, String name, double pricePer) {
        this.id = id;
        this.count = count;
        this.name = name;
        this.pricePer = pricePer;
    }

    public String getTotalPrice() {
        totalPrice = String.format(Locale.US, "%,.2f", pricePer * count);
        return totalPrice;
    }

    public String getPricePer() {
        return String.format(Locale.US, "%,.2f", pricePer);
    }

    public String getCount() {
        return count + "";
    }

    public String getId() {
        return id + "";
    }

    public String getName() {
        return name;
    }
}