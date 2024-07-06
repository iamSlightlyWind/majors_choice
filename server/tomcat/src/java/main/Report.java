package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import database.Database;

public class Report {

    public static double PercentageCompletedOrders = 0;
    public static double TotalExpense = 0;
    public static double TotalRevenue = 0;
    public static double Profit = 0;
    public static double ProfitPercentage = 0;
    public static double PercentageUsersWithCompletedOrders = 0;
    public static double AverageOrderValue = 0;
    static Connection connection;

    static {
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

    public static void fetchReportData(String date1, String date2) {
        try {
            String sql = "{call GetOrderStatistics(?, ?)}";
            var statement = connection.prepareCall(sql);
            statement.setString(1, date1);
            statement.setString(2, date2);
            boolean hasResultSet = statement.execute();

            if (hasResultSet) {
                ResultSet rs = statement.getResultSet();
                if (rs.next()) {
                    PercentageCompletedOrders = rs.getDouble("PercentageCompletedOrders");
                    TotalExpense = rs.getDouble("TotalExpense");
                    TotalRevenue = rs.getDouble("TotalRevenue");
                    Profit = rs.getDouble("Profit");
                    ProfitPercentage = rs.getDouble("ProfitPercentage");
                    PercentageUsersWithCompletedOrders = rs.getDouble("PercentageUsersWithCompletedOrders");
                    AverageOrderValue = rs.getDouble("AverageOrderValue");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}