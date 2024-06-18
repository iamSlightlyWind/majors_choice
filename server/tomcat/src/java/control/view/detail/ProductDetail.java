/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control.view.detail;

import database.Database;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import packages.CPU;
import packages.GPU;
import packages.Motherboard;
import packages.PSU;
import packages.RAM;
import packages.SSD;

/**
 *
 * @author thang
 */
public class ProductDetail extends HttpServlet {
   
    Database db = new Database();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String category = request.getParameter("category");
        String id_raw = request.getParameter("id");
        int id = 0;
        
        if(id_raw!=null){
            id = Integer.parseInt(id_raw);
        }
        switch(category){
            case "cpu":
                CPU cpu = new CPU(id);
                request.setAttribute("product", cpu);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            case "gpu":
                GPU gpu = new GPU(id);
                request.setAttribute("product", gpu);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            case "mobo":
                Motherboard mobo = new Motherboard(id);
                request.setAttribute("product", mobo);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            case "psu":
                PSU psu = new PSU(id);
                request.setAttribute("product", psu);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            case "ram":
                RAM ram = new RAM(id);
                request.setAttribute("product", ram);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            case "ssd":
                SSD ssd = new SSD(id);
                request.setAttribute("product", ssd);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            default:
                break;
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
