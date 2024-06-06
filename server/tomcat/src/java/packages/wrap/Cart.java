package packages.wrap;

import java.util.ArrayList;
import java.util.HashMap;
import packages.*;

class Cart {
    public ArrayList<Product> products = new ArrayList<Product>();
    public ArrayList<ProductCount> quantities = new ArrayList<ProductCount>();
    public String userName;

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

    public void remove(int id, boolean removeOne) {
        System.out.println(removeOne);
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).id == id) {
                products.remove(i);
                i--;
                if (removeOne) {
                    break;
                }
            }
        }

        updateQuantity();
    }

    public Cart(String userName) {
        this.userName = userName;
    }

    public void addProduct(String type, int id) {
        Product newProduct = null;

        switch (type) {
            case "cpu":
                newProduct = new CPU(id);
                break;
            case "gpu":
                newProduct = new GPU(id);
                break;
            case "ram":
                newProduct = new RAM(id);
                break;
            case "psu":
                newProduct = new PSU(id);
                break;
            case "ssd":
                newProduct = new SSD(id);
                break;
            case "motherboard":
                newProduct = new Motherboard(id);
                break;
        }
        products.add(newProduct);
        updateQuantity();
    }

    @Override
    public String toString() {
        int maxId = quantities.stream().mapToInt(pc -> pc.id).max().orElse(0);
        boolean[] printed = new boolean[maxId + 1];
        StringBuilder sb = new StringBuilder();

        for (ProductCount productCount : quantities) {
            if (!printed[productCount.id]) {
                printed[productCount.id] = true;
                for (Product product : products) {
                    if (product.id == productCount.id) {
                        sb.append(productCount.count).append(" x ").append(product.name).append("<br>");
                        break;
                    }
                }
            }
        }

        return sb.toString();
    }
}