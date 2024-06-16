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
import packages.PSU;

/**
 *
 * @author thang
 */
public class FilterPSUsServlet extends HttpServlet {

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
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String efficiency = request.getParameter("efficiency");
        String fromWattage_raw = request.getParameter("fromWattage");
        String toWattage_raw = request.getParameter("toWattage");

        double fromP = (from_raw == null || from_raw.isEmpty()) ? 0 : Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty()) ? 0 : Double.parseDouble(to_raw);
        int fromWattage = (fromWattage_raw == null || fromWattage_raw.isEmpty()) ? 0 : Integer.parseInt(fromWattage_raw);
        int toWattage = (toWattage_raw == null || toWattage_raw.isEmpty()) ? 0 : Integer.parseInt(toWattage_raw);

        List<PSU> psus = db.getPSUs("");

        if (efficiency != null) {
            getPSUsByEfficiency(psus, efficiency);
        }

        getPSUsByPrice(psus, fromP, toP);

        getPSUsByWattage(psus, fromWattage, toWattage);

        request.setAttribute("psus", psus);
        request.getRequestDispatcher("/view/psus.jsp").forward(request, response);
    }

    public void getPSUsByEfficiency(List<PSU> psus, String efficiency) {
        Iterator<PSU> iterator = psus.iterator();

        while (iterator.hasNext()) {
            PSU psu = iterator.next();
            if (!psu.efficiency.toLowerCase().contains(efficiency)) {
                iterator.remove();
            }
        }
    }

    public void getPSUsByWattage(List<PSU> psus, int from, int to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<PSU> iterator = psus.iterator();
        while (iterator.hasNext()) {
            PSU psu = iterator.next();
            if ((from != 0 && psu.wattage < from) || (to != 0 && psu.wattage > to)) {
                iterator.remove();
            }
        }
    }

    public void getPSUsByPrice(List<PSU> psus, double from, double to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<PSU> iterator = psus.iterator();
        while (iterator.hasNext()) {
            PSU psu = iterator.next();
            if ((from != 0 && psu.sellingPrice < from) || (to != 0 && psu.sellingPrice > to)) {
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
