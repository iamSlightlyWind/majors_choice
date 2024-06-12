package main;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Random;
import database.Database;
import java.util.List;
import packages.wrap.*;
import java.util.Vector;

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
        return "User: " + username + "\n" + "Password: " + password + "\n" + "Full Name: " + fullName + "\n" + "Email: "
                + email + "\n" + "Phone Number: " + phoneNumber + "\n" + "Address: " + address + "\n"
                + "Date of Birth: " + dateOfBirth + "\n" + "Confirm Code: " + confirmCode;
    }

    public void retrieveData(String role) {
        System.out.println(this);
        
        if(role.equals("manager")){
            role = "staff";
        }
        try {
            String sql = "select * from ^s join ^details on ^s.id = ^details.id WHERE ^s.username = ?";
            sql = sql.replace("^", role);
            System.out.println(">>> SQL: " + sql);
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
            String sql = "{call register(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, tableName);
            statement.setString(2, username);
            statement.setString(3, password);
            statement.setString(4, fullName);
            statement.setString(5, email);
            statement.setString(6, phoneNumber);
            statement.setString(7, address);
            statement.setString(8, dateOfBirth);
            statement.setString(9, confirmCode);
            statement.registerOutParameter(10, Types.INTEGER);

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

    public int updateInformation(String tableName, boolean status) {
        int result = 0;

        if (tableName.equals("staff")) {
            tableName = "staffs";
        } else if (tableName.equals("user")) {
            tableName = "users";
        }

        try {
            String sql = "{call updateUserInformation(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, tableName);
            statement.setString(2, username);
            if (status) {
                statement.setString(3, password);
            } else {
                statement.setNull(3, Types.VARCHAR);
            }
            statement.setString(4, fullName);
            statement.setString(5, email);
            statement.setString(6, phoneNumber);
            statement.setString(7, address);
            statement.setString(8, dateOfBirth);
            statement.setInt(9, active);
            statement.registerOutParameter(10, Types.INTEGER);

            statement.execute();
            result = statement.getInt(10);
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

     public List<User> getUserDetails(String tableName) {
        List<User> users = new ArrayList<>();
        try {
            String sql = "{call GetUserDetails(?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, tableName);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User user = new User(rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("active"),
                        rs.getString("id"),
                        rs.getString("dateJoined"));
                users.add(user);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return users;
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
    
    public void deleteUser(String tableName, String id) {
        String deleteDetailsSQL = "";
        String deleteUserSQL = "";

        switch (tableName) {
            case "users":
                deleteDetailsSQL = "DELETE FROM userDetails WHERE id = ?";
                deleteUserSQL = "DELETE FROM users WHERE id = ?";
                break;
            case "staffs":
                deleteDetailsSQL = "DELETE FROM staffDetails WHERE id = ?";
                deleteUserSQL = "DELETE FROM staffs WHERE id = ?";
                break;
        }

        try{
            db.connection.setAutoCommit(false); // Start transaction

            try (PreparedStatement deleteDetailsStmt = db.connection.prepareStatement(deleteDetailsSQL);
                 PreparedStatement deleteUserStmt = db.connection.prepareStatement(deleteUserSQL)) {

                deleteDetailsStmt.setString(1, id);
                deleteUserStmt.setString(1, id);

                deleteDetailsStmt.executeUpdate();
                deleteUserStmt.executeUpdate();

                db.connection.commit();
            } catch (SQLException ex) {
                db.connection.rollback();
                throw ex;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void retrieveData2(String role) {
        try {
            String sql = "select * from ^s join ^details on ^s.id = ^details.id WHERE ^s.id = ?";
            sql = sql.replace("^", role);
            System.out.println(">>> SQL: " + sql);
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setString(1, id);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                id = rs.getString("id");
                fullName = rs.getString("fullName");
                email = rs.getString("email");
                phoneNumber = rs.getString("phoneNumber");
                address = rs.getString("address");
                dateOfBirth = rs.getString("dateOfBirth");
                username = rs.getString("username");
                password = rs.getString("password");
                active = rs.getInt("active");
                dateJoined = rs.getString("dateJoined");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    } 

}
