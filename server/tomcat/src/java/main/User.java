package main;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Random;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import database.Database;

public class User {

    public String username, password;
    public String fullName, email, phoneNumber, address;
    public String dateOfBirth;
    private String confirmCode;

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
        List<String> listConfirmCode = ListConfirmCode();

        int leftLimit = 97;
        int rightLimit = 122;
        Random random = new Random();

        String generatedString = "";
        do {
            generatedString = random.ints(leftLimit, rightLimit + 1)
                    .limit(length)
                    .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                    .toString();
        } while (listConfirmCode.contains(generatedString));

        return generatedString;
    }

    public boolean validate(String confirmCode) {
        try {
            String sql = "{call validate(?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, username);
            statement.setString(2, confirmCode);
            statement.registerOutParameter(3, Types.INTEGER);

            statement.execute();
            return statement.getInt(3) == 1;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
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

    public int register() {
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

        return result;
    }

    public List<String> ListConfirmCode() {
        List<String> list = new ArrayList<>();

        try {
            String sql = "SELECT [confirmCode]\n"
                    + "  FROM [dbo].[users]";
            PreparedStatement statement = db.connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String code = resultSet.getString("confirmCode");
                list.add(code);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public String getConfirmCode() {
        return confirmCode;
    }

}
