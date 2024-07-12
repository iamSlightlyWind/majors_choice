/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control.report;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.Report;

/**
 *
 * @author thang
 */
public class ReportServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
