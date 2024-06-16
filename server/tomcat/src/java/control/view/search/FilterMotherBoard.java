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
import packages.Motherboard;

/**
 *
 * @author thang
 */
public class FilterMotherBoard extends HttpServlet {

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
        String ramType = request.getParameter("ramType");
        String wifi_raw = request.getParameter("wifi");
        String socket = request.getParameter("socket");
        String formFactor = request.getParameter("formFactor");

        double fromP = (from_raw == null || from_raw.isEmpty()) ? 0 : Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty()) ? 0 : Double.parseDouble(to_raw);
        int wifi = (wifi_raw == null || wifi_raw.isEmpty()) ? -1 : Integer.parseInt(wifi_raw);
        List<Motherboard> mobos = db.getMotherboards("");

        if (socket != null) {
            getMotherBoardBySocket(mobos, socket);
        }

        if (ramType != null) {
            getMotherBoardByRam(mobos, ramType);
        }
        if (wifi != -1) {
            getMotherBoardByWifi(mobos, wifi);
        }

        if (formFactor != null) {
            getMotherBoardByFormFactor(mobos, formFactor);
        }

        getMotherBoardsByPrice(mobos, fromP, toP);

        request.setAttribute("mobos", mobos);
        request.getRequestDispatcher("/view/mobos.jsp").forward(request, response);

    }

    public void getMotherBoardBySocket(List<Motherboard> mobos, String socket) {
        Iterator<Motherboard> iterator = mobos.iterator();

        while (iterator.hasNext()) {
            Motherboard mobo = iterator.next();
            if (!mobo.socket.toLowerCase().contains(socket)) {
                iterator.remove();
            }
        }
    }

    public void getMotherBoardByFormFactor(List<Motherboard> mobos, String formFactor) {
        Iterator<Motherboard> iterator = mobos.iterator();

        while (iterator.hasNext()) {
            Motherboard mobo = iterator.next();
            if (!mobo.formFactor.toLowerCase().contains(formFactor)) {
                iterator.remove();
            }
        }
    }

    public void getMotherBoardByRam(List<Motherboard> mobos, String ram) {
        Iterator<Motherboard> iterator = mobos.iterator();

        while (iterator.hasNext()) {
            Motherboard mobo = iterator.next();
            if (!mobo.ramType.toLowerCase().contains(ram)) {
                iterator.remove();
            }
        }
    }

    public void getMotherBoardByWifi(List<Motherboard> mobos, int wifi) {
        Iterator<Motherboard> iterator = mobos.iterator();

        while (iterator.hasNext()) {
            Motherboard mobo = iterator.next();
            if (mobo.wifi != wifi) {
                iterator.remove();
            }
        }
    }

    public void getMotherBoardsByPrice(List<Motherboard> mobos, double from, double to) {
        if (from == 0 && to == 0) {
            return;
        }

        Iterator<Motherboard> iterator = mobos.iterator();

        while (iterator.hasNext()) {
            Motherboard mobo = iterator.next();

            if ((from != 0 && mobo.sellingPrice < from) || (to != 0 && mobo.sellingPrice > to)) {
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
