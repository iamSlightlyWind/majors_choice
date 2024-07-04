package packages.wrap;

public class OrderInfo {
    public String fullName;
    public String phoneNumber;
    public String address;
    public String payment;

    public OrderInfo(String fullName, String phoneNumber, String address) {
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public void addPayment(String payment) {
        if (payment == null) {
            this.payment = "Cash";
        } else {
            this.payment = "VNPAY#" + payment;
        }
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

    public String getPayment() {
        return payment;
    }
}