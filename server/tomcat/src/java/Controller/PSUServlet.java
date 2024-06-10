/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import database.Database;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import packages.PSU;

/**
 *
 * @author PC
 */
public class PSUServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }
        Database db = new Database();

        if (service.equals("listAll")) {
            ArrayList<PSU> psus = db.getPSUs("{call getPSU()}");
            request.setAttribute("psus", psus);
            request.setAttribute("titlePage", "Danh sách PSU");
            request.setAttribute("titleTable", "Danh sách PSU");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/PSUManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertPSU")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                int wattage = Integer.parseInt(request.getParameter("wattage"));
                String efficiency = request.getParameter("efficiency");
                String image = request.getParameter("image");

                int result = db.addProductPSU(sellingPrice, costPrice, name, wattage, efficiency, image);

                if (result != -1) {
                    response.sendRedirect("psus?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi thêm PSU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertPSU.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertPSU.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            // Kiểm tra xem có submit form hay chưa
            String submit = request.getParameter("submit");
            if (submit == null) {
                // Lấy id từ request
                int id = Integer.parseInt(request.getParameter("id"));
                // Lấy thông tin PSU theo id để update
                ArrayList<PSU> psus = db.getPSUs("select * from psus join products on psus.id= products.id where psus.id = " + id);
                if (!psus.isEmpty()) {
                    PSU psu = psus.get(0);
                    request.setAttribute("psus", psu);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updatePSU.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy PSU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updatePSU.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                int wattage = Integer.parseInt(request.getParameter("wattage"));
                String efficiency = request.getParameter("efficiency");
                String image = request.getParameter("image");

                int result = db.updateProductPSU(id, sellingPrice, costPrice, name, wattage, efficiency, image);
                if (result == 1) {
                    response.sendRedirect("psus?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật PSU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updatePSU.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            db.removePSU(id);
            response.sendRedirect("psus");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
