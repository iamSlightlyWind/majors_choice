package main;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Random;
import database.Database;
import packages.wrap.Cart;
import packages.wrap.Order;

public class User {
    public String id;
    public String username, password;
    public String fullName, email, phoneNumber, address;
    public String dateOfBirth;
    public String confirmCode;

    public Cart cart;
    public ArrayList<Order> orders = new ArrayList<Order>();
    public Database db = new Database();

    public String toString() {
        return "User: " + username + "\n" + "Password: " + password + "\n" + "Full Name: " + fullName + "\n" + "Email: "
                + email + "\n" + "Phone Number: " + phoneNumber + "\n" + "Address: " + address + "\n"
                + "Date of Birth: " + dateOfBirth + "\n" + "Confirm Code: " + confirmCode;
    }

    public void retrieveData() {
        try {
            String sql = "select * from users join userdetails on users.id = userdetails.id WHERE users.username = ?";
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setString(1, username);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                id = rs.getString("id");
                fullName = rs.getString("fullName");
                email = rs.getString("email");
                phoneNumber = rs.getString("phoneNumber");
                address = rs.getString("address");
                dateOfBirth = rs.getString("dateOfBirth");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void getOrders(){
        orders = db.getOrders(Integer.parseInt(this.id));
    }

    public User() {
    }

    public User(String user, String pass) {
        this.username = user;
        this.password = pass;
    }

    public User(String user, String pass, String name, String email, String phone, String address, String dob) {
        this.username = user;
        this.password = pass;
        this.fullName = name;
        this.email = email;
        this.phoneNumber = phone;
        this.address = address;
        this.dateOfBirth = dob;
        this.confirmCode = randomString(6);
    }

    private String randomString(int length) {
        int leftLimit = 97;
        int rightLimit = 122;
        Random random = new Random();

        String generatedString = random.ints(leftLimit, rightLimit + 1)
                .limit(length)
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();

        return generatedString;
    }

    public int resetPassword() {
        int result = 0;
        String newPassword = randomString(8);

        try {
            String sql = "{call resetPassword(?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, email);
            statement.setString(2, newPassword);
            statement.registerOutParameter(3, Types.INTEGER);

            statement.execute();
            result = statement.getInt(3);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        if (result == 1) {
            Email mail = new Email();
            mail.sendRecoveryPassword(email, newPassword);
        }

        return result;
    }

    public int activate(String confirmCode) {
        try {
            String sql = "{call activate(?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, username);
            statement.setString(2, confirmCode);
            statement.registerOutParameter(3, Types.INTEGER);

            statement.execute();
            return statement.getInt(3);
        } catch (SQLException ex) {
            System.out.println(ex);
            return 0;
        }
    }

    public int login() {
        int result = 0;

        try {
            String sql = "{call login(?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.registerOutParameter(3, Types.INTEGER);

            statement.execute();
            result = statement.getInt(3);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return result;
    }

    public int register(boolean isUserGoogle) {
        int result = 0;

        try {
            String sql = "{call register(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, fullName);
            statement.setString(4, email);
            statement.setString(5, phoneNumber);
            statement.setString(6, address);
            statement.setString(7, dateOfBirth);
            statement.setString(8, confirmCode);
            statement.registerOutParameter(9, Types.INTEGER);

            statement.execute();

            result = statement.getInt(9);

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        if (result == 1 && !isUserGoogle) {
            Email mail = new Email();
            mail.sendConfirmCode(email, confirmCode);
        }

        return result;
    }

    public int updateInformation() {

        int result = 0;

        try {
            String sql = "{call updateUserInformation(?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, fullName);
            statement.setString(4, email);
            statement.setString(5, phoneNumber);
            statement.setString(6, address);
            statement.setString(7, dateOfBirth);
            statement.registerOutParameter(8, Types.INTEGER);

            statement.execute();
            result = statement.getInt(8);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return result;
    }
}