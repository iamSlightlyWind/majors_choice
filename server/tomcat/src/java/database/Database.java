package database;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Database {
    public Connection connection;
    
    public Database(){
        try {
            String username = "sa";
            String password = System.getenv("SQLPASSWORD") != null ? System.getenv("SQLPASSWORD") : "123";
            String database = "major";

            String url = "jdbc:sqlserver://host.docker.internal:1433;databaseName=" + database;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // The following function is meant for testing, to be used with class Test of the same package.
    // For more example of how to use this class, check out: https://github.com/iamSlightlyWind/WebDevelop/blob/main/Final/src/java/SQL/DBContext.java
    public String selectAll(String table){
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from " + table);
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            StringBuilder result = new StringBuilder();
            while(resultSet.next()){
                for(int i = 1; i <= columnCount; i++){
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
}