package packages.wrap;

import java.util.ArrayList;
import java.util.HashMap;

public class Order {
    public ArrayList<Product> products = new ArrayList<Product>();
    public String status;
    public int id;
    public String date;
    public ArrayList<ProductCount> quantities = new ArrayList<ProductCount>();

    public ArrayList<ProductCount> getQuantities() {
        return quantities;
    }

    public void updateQuantity() {
        HashMap<Integer, ProductCount> productCountMap = new HashMap<>();
        for (Product product : products) {
            ProductCount productCount = productCountMap.get(product.id);
            if (productCount == null) {
                productCount = new ProductCount(product.id, 0, product.name);
                productCountMap.put(product.id, productCount);
            }
            productCount.count += 1;
        }
        quantities.clear();
        quantities.addAll(productCountMap.values());
    }

    public int getId() {
        return id;
    }

    public String getStatus() {
        return status;
    }

    public String toString() {
        return "Order: " + id + "\n";
    }

    public Order(int id, String status) {
        this.id = id;
        this.status = status;
    }
}