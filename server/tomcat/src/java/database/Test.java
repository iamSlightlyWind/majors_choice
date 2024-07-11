package database;

import jakarta.servlet.http.HttpServlet;
/* import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; */
import main.Report;

public class Test extends HttpServlet {
    Database database = new Database();

    /* protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    } */

    public static void main(String[] args) {
        Report.fetchReportData(null, null);
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