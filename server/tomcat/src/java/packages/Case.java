package packages;

import database.Database;
import java.util.ArrayList;
import packages.wrap.Product;

public class Case extends Product {

    public String type;
    public String formFactor;
    public String color;
    public String image;

    public Case(Case c) {
        super(c.id, c.sellingPrice, c.costPrice, c.description);
        this.name = c.name;
        this.type = c.type;
        this.formFactor = c.formFactor;
        this.color = c.color;
    }

    public Case(int id, double sellingPrice, double costPrice, String description, String name, String type,
            String formFactor, String color) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.type = type;
        this.formFactor = formFactor;
        this.color = color;
    }

    public Case(String name, String type, String formFactor, String color, int id, double sellingPrice,
            double costPrice, String description) {
        super(id, sellingPrice, costPrice, description);
        this.name = name;
        this.type = type;
        this.formFactor = formFactor;
        this.color = color;
    }

    public Case(String type, String formFactor, String color, String image, String name, int id,
            double sellingPrice, double costPrice, String description, int quantity) {
        super(name, id, sellingPrice, costPrice, description, quantity);
        this.type = type;
        this.formFactor = formFactor;
        this.color = color;
        this.image = image;
    }

    public Case(int id) {
        super(id);
        ArrayList<Case> cases = Database.getCases("");

        for (Case caseItem : cases) {
            if (caseItem.getId() == id) {
                this.sellingPrice = caseItem.getSellingPrice();
                this.costPrice = caseItem.getCostPrice();
                this.description = caseItem.getDescription();
                this.name = caseItem.getName();
                this.formFactor = caseItem.getFormFactor();
                this.color = caseItem.getColor();
                this.quantity = caseItem.getQuantity();
                return;
            }
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getFormFactor() {
        return formFactor;
    }

    public void setFormFactor(String formFactor) {
        this.formFactor = formFactor;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
