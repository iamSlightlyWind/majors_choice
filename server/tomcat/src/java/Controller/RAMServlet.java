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
import packages.RAM;

/**
 *
 * @author PC
 */
@MultipartConfig
public class RAMServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            ArrayList<RAM> rams = db.getRAMs("{call getRAM()}");
            request.setAttribute("rams", rams);
            request.setAttribute("titlePage", "Danh sách RAM");
            request.setAttribute("titleTable", "Danh sách RAM");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/RAMManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertRAM")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                int capacity = Integer.parseInt(request.getParameter("capacity"));
                int speed = Integer.parseInt(request.getParameter("speed"));
                int latency = Integer.parseInt(request.getParameter("latency"));
                int result = db.addProductRAM(sellingPrice, costPrice, name, generation, capacity, speed, latency, null);

                if (result != -1) {
                    int productId = db.getMaxProductId();
                    String image = handleFileUpload(request, "image", String.valueOf(productId));
                    int result1 = db.addProductRAM(sellingPrice, costPrice, name, generation, capacity, speed, latency, image);
                    response.sendRedirect("rams?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi thêm RAM");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertRAM.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertRAM.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            // Kiểm tra xem có submit form hay chưa
            String submit = request.getParameter("submit");
            if (submit == null) {
                // Lấy id từ request
                int id = Integer.parseInt(request.getParameter("id"));
                // Lấy thông tin RAM theo id để update
                ArrayList<RAM> rams = db.getRAMs("select * from rams join products on rams.id= products.id where rams.id = " + id);
                if (!rams.isEmpty()) {
                    RAM ram = rams.get(0);
                    request.setAttribute("rams", ram);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateRAM.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy RAM");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateRAM.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                int capacity = Integer.parseInt(request.getParameter("capacity"));
                int speed = Integer.parseInt(request.getParameter("speed"));
                int latency = Integer.parseInt(request.getParameter("latency"));
                String image = handleFileUpload(request, "image", Integer.toString(id));

                int result = db.updateProductRAM(id, sellingPrice, costPrice, name, generation, capacity, speed, latency, image);
                if (result == 1) {
                    response.sendRedirect("rams?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật RAM");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateRAM.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            db.removeRAM(id);
            response.sendRedirect("rams");
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
        processRequest(request, response);
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
