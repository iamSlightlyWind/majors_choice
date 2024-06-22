package packages.wrap;

public class OrderInfo {
    public String fullName;
    public String phoneNumber;
    public String address;

    public OrderInfo(String fullName, String phoneNumber, String address) {
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public OrderInfo() {
    }

    public String getFullName() {
        return fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getAddress() {
        return address;
    }
}