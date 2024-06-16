package packages.wrap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import main.User;

public class Order {
    public ArrayList<Product> products = new ArrayList<Product>();
    public String status;
    public int id;
    public String date;
    public ArrayList<ProductCount> quantities = new ArrayList<ProductCount>();
    
    // For managing orders
    public User user;

    public User getUser() {
        return user;
    }
    ////////////Do Not Use

    public String toString() {
        return "Order ID: " + id + "\nStatus: " + status + "\nDate: " + date;
    }

    public ArrayList<ProductCount> getQuantities() {
        return quantities;
    }

    public void updateQuantity() {
        HashMap<Integer, ProductCount> productCountMap = new HashMap<>();
        for (Product product : products) {
            ProductCount productCount = productCountMap.get(product.id);
            if (productCount == null) {
                productCount = new ProductCount(product.id, 0, product.name, product.sellingPrice);
                productCountMap.put(product.id, productCount);
            }
            productCount.count += 1;
        }
        quantities.clear();
        quantities.addAll(productCountMap.values());
    }

    public String getCartTotal() {
        double total = 0;
        for (ProductCount productCount : quantities) {
            total += productCount.count * productCount.pricePer;
        }
        return String.format(Locale.US, "%,.2f", total);
    }

    public int getId() {
        return id;
    }

    public String getStatus() {
        return status;
    }

    public Order(int id, String status) {
        this.id = id;
        this.status = status;
    }
}