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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import packages.Motherboard;

/**
 *
 * @author PC
 */
@MultipartConfig
public class MotherboardServlet extends HttpServlet {

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
            ArrayList<Motherboard> motherboards = db.getMotherboards("{call getMotherboard()}");
            request.setAttribute("motherboards", motherboards);
            request.setAttribute("titlePage", "Danh sách Motherboard");
            request.setAttribute("titleTable", "Danh sách Motherboard");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/MotherboardManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertMotherboard")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String socket = request.getParameter("socket");
                String chipset = request.getParameter("chipset");
                String formFactor = request.getParameter("formFactor");
                String ramType = request.getParameter("ramType");
                int maxRamSpeed = Integer.parseInt(request.getParameter("maxRamSpeed"));
                int ramSlots = Integer.parseInt(request.getParameter("ramSlots"));
                int wifi = Integer.parseInt(request.getParameter("wifi"));
                int result = db.addProductMotherboard(sellingPrice, costPrice, name, socket, chipset, formFactor, ramType, maxRamSpeed, ramSlots, wifi, null);

                if (result != -1) {
                    int productId = db.getMaxProductId();
                    String image = handleFileUpload(request, "image", String.valueOf(productId));
                    System.out.println("<< Image " + image);
                    
                    int result1 = db.addProductMotherboard(sellingPrice, costPrice, name, socket, chipset, formFactor, ramType, maxRamSpeed, ramSlots, wifi, image);
                    response.sendRedirect("motherboards?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi thêm Motherboard");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertMotherboard.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertMotherboard.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            // Kiểm tra xem có submit form hay chưa
            String submit = request.getParameter("submit");
            if (submit == null) {
                // Lấy id từ request
                int id = Integer.parseInt(request.getParameter("id"));
                // Lấy thông tin CPU theo id để update
                ArrayList<Motherboard> motherboards = db.getMotherboards("select * from motherboards join products on motherboards.id= products.id where motherboards.id = " + id);
                if (!motherboards.isEmpty()) {
                    Motherboard motherboard = motherboards.get(0);
                    request.setAttribute("motherboards", motherboard);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateMotherboard.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy Motherboard");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateMotherboard.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String socket = request.getParameter("socket");
                String chipset = request.getParameter("chipset");
                String formFactor = request.getParameter("formFactor");
                String ramType = request.getParameter("ramType");
                int maxRamSpeed = Integer.parseInt(request.getParameter("maxRamSpeed"));
                int ramSlots = Integer.parseInt(request.getParameter("ramSlots"));
                int wifi = Integer.parseInt(request.getParameter("wifi"));
                String image = handleFileUpload(request, "image", Integer.toString(id));
                System.out.println("<< Image " + image);

                int result = db.updateProductMotherboard(id, sellingPrice, costPrice, name, socket, chipset, formFactor, ramType, maxRamSpeed, ramSlots, wifi, image);
                if (result == 1) {
                    response.sendRedirect("motherboards?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật GPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateMotherboard.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            db.removeMotherboard(id);
            response.sendRedirect("motherboards");
        }

    }
        private String handleFileUpload(HttpServletRequest request, String inputName, String productID) {
        try {
            Part filePart = request.getPart(inputName);
            String fileName = productID + ".png";

            String uploadPath = request.getServletContext().getRealPath("");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            filePart.write(uploadPath + File.separator + fileName);
            return uploadPath + File.separator + fileName;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
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
