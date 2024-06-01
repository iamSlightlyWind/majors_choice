package main;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Random;

import database.Database;
import helper.jbcrypt.BCrypt;

public class User {
    public String username, password;
    public String fullName, email, phoneNumber, address;
    public String dateOfBirth;
    public String confirmCode;

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
        String possibleCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";
        Random random = new Random();
        StringBuilder generatedString = new StringBuilder(length);
    
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(possibleCharacters.length());
            generatedString.append(possibleCharacters.charAt(randomIndex));
        }
    
        while (db.checkDuplicateConfirmCode(generatedString.toString())) {
            generatedString.setLength(0);
            for (int i = 0; i < length; i++) {
                int randomIndex = random.nextInt(possibleCharacters.length());
                generatedString.append(possibleCharacters.charAt(randomIndex));
            }
        }
    
        return generatedString.toString();
    }

    public int resetPassword() {
        int result = 0;
        String newPassword = randomString(8);
        String hashedPass = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        try {
            String sql = "{call resetPassword(?, ?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, email);
            statement.setString(2, hashedPass);
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
            String sql = "{call login(?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, username);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();
            result = statement.getInt(2);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return result;
    }

    public String toString() {
        return "User: " + username + " " + password + " " + fullName + " " + email + " " + phoneNumber + " " + address
                + " " + dateOfBirth;
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

        if (result == 1) {
            Email mail = new Email();
            mail.sendConfirmCode(email, confirmCode);
        }

        return result;
    }
    
        public String getPasswordByUsername(String username) {
        String password = null;

        try {
            String sql = "{call GetPasswordByUsername(?, ?)}";
            CallableStatement statement = db.connection.prepareCall(sql);
            statement.setString(1, username);
            statement.registerOutParameter(2, Types.VARCHAR);

            statement.execute();
            password = statement.getString(2);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return password;
    }
}