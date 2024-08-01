package packages;

public class Favor {
    public int userID;
    public int productID;

    public Favor() {
    }

    public Favor(int userID, int productID) {
        this.userID = userID;
        this.productID = productID;
    }  
    
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }
    
    
}
