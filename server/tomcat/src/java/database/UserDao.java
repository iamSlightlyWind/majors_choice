package database;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import main.User;

public class UserDao extends Database {

    // Register procedure
    public int register(String username, String password, String fullname, String email, String phoneNumber, String address, String dateOfBirth) {
        int result = 0;
        try {
            String sql = "{call register(?, ?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, fullname);
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

    // Login procedure
    public int login(String username, String password) {
        int result = 0;
        try {
            String sql = "{call login(?, ?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
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
    
//    public static void main(String[] args) {
//        User user = new User();
//        user.username = "john_doe";
//        user.password = "password123";
//        user.fullName = "John Doe";
//        user.address = "123 Main St";
//        user.email = "john.doe@example.com";
//        user.phoneNumber = "123-456-7890";
//        user.sex = 1;
//        user.birthDate = LocalDate.of(1990, 1, 1);
//        user.joinDate = LocalDate.now();
//        String formattedBirthDate = user.formatedDate(user.birthDate);
//        UserDao ud = new UserDao();
//        int result = ud.register(user.username, user.password, user.fullName, user.email, user.phoneNumber, user.address, formattedBirthDate);
//        System.out.println(result);
//    }

}
