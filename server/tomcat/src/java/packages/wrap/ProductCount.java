package packages.wrap;

public class ProductCount {
    public int count;
    public int id;
    public String name;

    public ProductCount(int id, int count, String name) {
        this.id = id;
        this.count = count;
        this.name = name;
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