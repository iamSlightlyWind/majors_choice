package packages;

import packages.wrap.Product;

public class Case extends Product {

    public String type;
    public String formFactor;
    public String color;

    public Case(int id, double sellingPrice, double costPrice, String description, String name, String type, String formFactor, String color) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.type = type;
        this.formFactor = formFactor;
        this.color = color;
    }
}