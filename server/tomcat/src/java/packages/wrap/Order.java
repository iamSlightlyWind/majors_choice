package packages.wrap;

import java.util.ArrayList;

public class Order {
    public ArrayList<Product> cart = new ArrayList<Product>();
    public ArrayList<ProductCount> quantities = new ArrayList<ProductCount>();
    public String userName;
}