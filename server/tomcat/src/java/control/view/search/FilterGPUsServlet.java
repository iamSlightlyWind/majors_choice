/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.view.search;

import database.Database;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import packages.GPU;

/**
 *
 * @author thang
 */
public class FilterGPUsServlet extends HttpServlet {

    Database db = new Database();

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
        response.setContentType("text/html;charset=UTF-8");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String brand = request.getParameter("brand");
        String generation = request.getParameter("generation");
        String fromVRAM_raw = request.getParameter("fromVRAM");
        String toVRAM_raw = request.getParameter("toVRAM");
        String fromTDP_raw = request.getParameter("fromTDP");
        String toTDP_raw = request.getParameter("toTDP");

        double fromP = (from_raw == null || from_raw.isEmpty()) ? 0 : Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty()) ? 0 : Double.parseDouble(to_raw);
        int fromVRAM = (fromVRAM_raw == null || fromVRAM_raw.isEmpty()) ? 0 : Integer.parseInt(fromVRAM_raw);
        int toVRAM = (toVRAM_raw == null || toVRAM_raw.isEmpty()) ? 0 : Integer.parseInt(toVRAM_raw);
        int fromTDP = (fromTDP_raw == null || fromTDP_raw.isEmpty()) ? 0 : Integer.parseInt(fromTDP_raw);
        int toCTDP = (toTDP_raw == null || toTDP_raw.isEmpty()) ? 0 : Integer.parseInt(toTDP_raw);

        List<GPU> gpus = db.getGPUs(brand);

        if (generation != null) {
            getGPUsByGeneration(gpus, generation);
        }

        getGPUsByPrice(gpus, fromP, toP);

        getGPUsByVRAM(gpus, fromVRAM, toVRAM);

        getGPUsByTDP(gpus, fromTDP, toCTDP);

        request.setAttribute("gpus", gpus);
        request.getRequestDispatcher("/view/gpus.jsp").forward(request, response);
    }

    public void getGPUsByGeneration(List<GPU> gpus, String generation) {
        Iterator<GPU> iterator = gpus.iterator();

        while (iterator.hasNext()) {
            GPU gpu = iterator.next();
            if (!gpu.generation.toLowerCase().contains(generation)) {
                iterator.remove();
            }
        }
    }

    public void getGPUsByVRAM(List<GPU> gpus, int from, int to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<GPU> iterator = gpus.iterator();
        while (iterator.hasNext()) {
            GPU gpu = iterator.next();

            if ((from != 0 && gpu.vram < from) || (to != 0 && gpu.vram > to)) {
                iterator.remove();
            }
        }
    }

    public void getGPUsByTDP(List<GPU> gpus, int from, int to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<GPU> iterator = gpus.iterator();
        while (iterator.hasNext()) {
            GPU gpu = iterator.next();
            if ((from != 0 && gpu.tdp < from) || (to != 0 && gpu.tdp > to)) {
                iterator.remove();
            }
        }
    }

    public void getGPUsByPrice(List<GPU> gpus, double from, double to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<GPU> iterator = gpus.iterator();
        while (iterator.hasNext()) {
            GPU gpu = iterator.next();
            if ((from != 0 && gpu.sellingPrice < from) || (to != 0 && gpu.sellingPrice > to)) {
                iterator.remove();
            }
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