package control.report;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.Report;

public class ReportServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String start = null;
        String end = null;

        Report.fetchReportData(start, end);

        request.setAttribute("PercentageCompletedOrders", Report.PercentageCompletedOrders);
        request.setAttribute("TotalExpense", Report.TotalExpense);
        request.setAttribute("TotalRevenue", Report.TotalRevenue);
        request.setAttribute("Profit", Report.Profit);
        request.setAttribute("ProfitPercentage", Report.ProfitPercentage);
        request.setAttribute("PercentageUsersWithCompletedOrders", Report.PercentageUsersWithCompletedOrders);
        request.setAttribute("AverageOrderValue", Report.AverageOrderValue);
        request.setAttribute("completedOrders", Report.completedOrders);
        request.setAttribute("cashPercentage", Report.cashPercentage);
        request.setAttribute("cardPercentage", Report.cardPercentage);

        request.getRequestDispatcher("/report/report.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");

        Report.fetchReportData(start, end);

        request.setAttribute("PercentageCompletedOrders", Report.PercentageCompletedOrders);
        request.setAttribute("TotalExpense", Report.TotalExpense);
        request.setAttribute("TotalRevenue", Report.TotalRevenue);
        request.setAttribute("Profit", Report.Profit);
        request.setAttribute("ProfitPercentage", Report.ProfitPercentage);
        request.setAttribute("PercentageUsersWithCompletedOrders", Report.PercentageUsersWithCompletedOrders);
        request.setAttribute("AverageOrderValue", Report.AverageOrderValue);
        request.setAttribute("completedOrders", Report.completedOrders);
        request.setAttribute("cashPercentage", Report.cashPercentage);
        request.setAttribute("cardPercentage", Report.cardPercentage);

        request.setAttribute("startDate", start);
        request.setAttribute("endDate", end);
        request.getRequestDispatcher("/report/report.jsp").forward(request, response);
    }
}
