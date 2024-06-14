package main;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Random;
import database.Database;
import packages.wrap.*;

public class User {
    public String id;
    public String username, password;
    public String fullName, email, phoneNumber, address;
    public String dateOfBirth, dateJoined;
    public String confirmCode;
    public int active;
    public Cart cart;
    public ArrayList<Order> orders = new ArrayList<Order>();
    public Database db = new Database();

    public String getFullName() {
        return this.fullName;
    }

    public String getEmail() {
        return this.email;
    }

    public String getPhoneNumber() {
        return this.phoneNumber;
    }

    public String getAddress() {
        return this.address;
    }

    public String getDateOfBirth() {
        return this.dateOfBirth;
    }

    public String getUsername() {
        return this.username;
    }

    public String getPassword() {
        return password;
    }

    public String toString() {
        return "Username: " + username + "\nPassword: " + password + "\nFull Name: " + fullName + "\nEmail: " + email
                + "\nPhone Number: " + phoneNumber + "\nAddress: " + address + "\nDate of Birth: " + dateOfBirth
                + "\nActive: " + active + "\nID: " + id + "\nDate Joined: " + dateJoined;
    }

    public void retrieveData(String table) {
        if (table.equals("staff")) {
            try {
                String sql = "select * from staffs where username = ?";
                PreparedStatement statement = db.connection.prepareStatement(sql);
                statement.setString(1, username);

                ResultSet rs = statement.executeQuery();

                while (rs.next()) {
                    id = rs.getString("id");
                    fullName = rs.getString("fullName");
                    username = rs.getString("username");
                    password = rs.getString("password");
                    active = rs.getInt("active");
                }
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        } else
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
                    dateJoined = rs.getString("dateJoined");
                    active = rs.getInt("active");
                }
            } catch (SQLException ex) {
                System.out.println(ex);
            }
    }

    public void getOrders() {
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

    public int register(boolean isUserGoogle, String tableName) {
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

            result = statement.getInt(10);

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        if (result == 1 && !isUserGoogle) {
            Email mail = new Email();
            mail.sendConfirmCode(email, confirmCode);
        }

        return result;
    }

    public int updateStaff() {
        return db.updateStaff(this);
    }

    public int updateInformation() {
        int result = 0;

        try {
            String sql = "{call updateUserInformation(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, fullName);
            statement.setString(4, email);
            statement.setString(5, phoneNumber);
            statement.setString(6, address);
            statement.setString(7, dateOfBirth);
            statement.setInt(8, active);
            statement.registerOutParameter(9, Types.INTEGER);

            statement.execute();
            result = statement.getInt(9);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return result;
    }

    public int loginEmployee() {
        int result = -1;
        try {
            String sql = "{call loginEmployee(?, ?, ?)}";
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

    public User(String username, String password, int active, String id, String dateJoined) {
        this.username = username;
        this.password = password;
        this.active = active;
        this.id = id;
        this.dateJoined = dateJoined;
    }

    public int getActive() {
        return active;
    }

    public String getId() {
        return id;
    }

    public String getDateJoined() {
        return dateJoined;
    }
}
