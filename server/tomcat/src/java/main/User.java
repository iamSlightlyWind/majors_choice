package main;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Random;

import database.Database;
import java.sql.ResultSet;
import java.util.Vector;

public class User {
    public String username, password;
    public String fullName, email, phoneNumber, address;
    public String dateOfBirth;
    public String confirmCode;
    public int active;
    public int id;

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
    Database db = new Database();

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

    public String toString() {
        return "User: " + username + " " + password + " " + fullName + " " + email + " " + phoneNumber + " " + address
                + " " + dateOfBirth;
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

    public int updateInformation(String tableName) {
        int result = 0;

        System.out.println("username: " + username);
        System.out.println("password: " + password);
        System.out.println("fullName: " + fullName);
        System.out.println("email: " + email);
        System.out.println("phoneNumber: " + phoneNumber);
        System.out.println("address: " + address);
        System.out.println("dateOfBirth: " + dateOfBirth);

        try {
            String sql = "{call updateUserInformation(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, tableName);
            statement.setString(2, username);
            statement.setString(3, password);
            statement.setString(4, fullName);
            statement.setString(5, email);
            statement.setString(6, phoneNumber);
            statement.setString(7, address);
            statement.setString(8, dateOfBirth);
            statement.registerOutParameter(9, Types.INTEGER);

            statement.execute();
            result = statement.getInt(9);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return result;
    }

    public User getUserDetailsByUsername(String username, String table) {
        User user = null;
        try {
            String sql = "{call GetUserDetailsByUsername(?,?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, username);
            statement.setString(2, table);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                user = new User();
                user.username = rs.getString("username");
                user.password = rs.getString("password");
                user.fullName = rs.getString("name");
                user.email = rs.getString("email");
                user.phoneNumber = rs.getString("phone");
                user.address = rs.getString("address");
                user.dateOfBirth = rs.getString("dob");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        System.out.println(user);
        return user;
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
    
    public Vector<User> getUserDetails(String tableName) {
        Vector<User> users = new Vector<>();
        try {
            String sql = "{call GetUserDetails(?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, tableName);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.id = rs.getInt("id");
                user.username = rs.getString("username");
                user.password = rs.getString("password");
                user.active = rs.getInt("active");
                users.add(user);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return users;
    }
    
}
