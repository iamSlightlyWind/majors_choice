package database;

import jakarta.servlet.http.HttpServlet;
/* import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; */
import main.Report;

public class Test extends HttpServlet {
    Database database = new Database();

    public static void main(String[] args) {
        String date1 = null;
        String date2 = null;
        Report.fetchReportData(date1, date2);
        System.out.println(Report.PercentageCompletedOrders);
        System.out.println(Report.TotalExpense);
        System.out.println(Report.TotalRevenue);
        System.out.println(Report.Profit);
        System.out.println(Report.ProfitPercentage);
        System.out.println(Report.PercentageUsersWithCompletedOrders);
        System.out.println(Report.AverageOrderValue);
        System.out.println(Report.completedOrders);
        System.out.println(Report.cashPercentage);
        System.out.println(Report.cardPercentage);
    }
}