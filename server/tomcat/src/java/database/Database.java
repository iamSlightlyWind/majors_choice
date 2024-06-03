package database;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Database {
    public Connection connection;

    public Database() {
        try {
            String username = "sa";
            String password = System.getenv("SQLPASSWORD") != null ? System.getenv("SQLPASSWORD") : "123";
            String database = "major";

            String url = "jdbc:sqlserver://localhost:1433;databaseName=" + database;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String selectAll(String table) {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from " + table);
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            StringBuilder result = new StringBuilder();
            while (resultSet.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    result.append(metaData.getColumnName(i)).append(": ").append(resultSet.getString(i)).append("\n");
                }
                result.append("\n");
            }
            return result.toString();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean forceActivate(String username) {
        try {
            String sql = "{call forceActivate(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, username);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();
            return statement.getInt(2) == 1;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean userExists(String email) { // check if email exists, use exclusively for google login/register
        try {
            String sql = "{call userExists(?, ?)}";
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, email);
            statement.registerOutParameter(2, Types.INTEGER);

            statement.execute();
            return statement.getInt(2) == 1;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}