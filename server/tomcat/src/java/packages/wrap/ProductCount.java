package packages.wrap;

import java.util.Locale;
import database.Database;

public class ProductCount {
    public int count;
    public int id;
    public String name;
    public double pricePer;
    public String totalPrice;
    public String error = "";
    public Database db = new Database();

    public String toString() {
        return "Product ID: " + id + "\nProduct Name: " + name + "\nPrice Per: " + pricePer + "\nCount: " + count
                + "\nTotal Price: " + totalPrice;
    }

    public void check() {
        int stock = 0;

        try{
            stock = db.productStock(id);
        } catch (Exception e) {
            error = "Product not found";
            return;
        }

        if (stock == -1) {
            error = "Product no longer for sale";
            return;
        } else if (count > db.productStock(id)) {
            error = "Not enough stock";
        }
    }

    public String getError() {
        check();
        return error;
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