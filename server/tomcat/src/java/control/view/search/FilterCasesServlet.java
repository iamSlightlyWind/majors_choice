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
import packages.Case;

/**
 *
 * @author thang
 */
public class FilterCasesServlet extends HttpServlet {
   
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
        String name = (request.getParameter("nameSearch") == null) ? "" : request.getParameter("nameSearch");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String[] formFactors = request.getParameterValues("formFactors");
        String[] colors = request.getParameterValues("colors");
        
        double fromP = (from_raw == null || from_raw.isEmpty()) ? 0 : Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty()) ? 0 : Double.parseDouble(to_raw);
        
        List<Case> list = Database.getCases(name);
        List<Case> list1 = getCasesByColor(list, colors);
        List<Case> cases = getCasesByFormFactor(list1, formFactors);
        
        getCasesByPrice(cases, fromP, toP);
        
        request.setAttribute("searchName", name);
        request.setAttribute("from", from_raw);
        request.setAttribute("to", to_raw);
        request.setAttribute("colors", colors);
        request.setAttribute("formFactors", formFactors);
        request.setAttribute("cases", cases);
        request.getRequestDispatcher("/view/cases.jsp").forward(request, response);
    } 
    
    public List<Case> getCasesByFormFactor(List<Case> case1s, String[] formFactors) {
        List<Case> list = new ArrayList<>();
        if (formFactors == null || formFactors.length == 0) {
            return case1s;
        }
        for (Case case1 : case1s) {
            for (String geString : formFactors) {
                if(geString.equals("MidTower")){
                    geString = "Mid Tower";
                }
                if(geString.equals("MiniITX")){
                    geString = "Mini ITX";
                }
                if (case1.formFactor.toLowerCase().contains(geString.toLowerCase())) {
                    list.add(case1);
                }
            }
        }
        return list;
    }
    
     public List<Case> getCasesByColor(List<Case> case1s, String[] colors) {
        List<Case> list = new ArrayList<>();
        if (colors == null || colors.length == 0) {
            return case1s;
        }
        for (Case case1 : case1s) {
            for (String geString : colors) {
                if (case1.color.toLowerCase().contains(geString.toLowerCase())) {
                    list.add(case1);
                }
            }
        }
        return list;
    }
        
     public void getCasesByPrice(List<Case> case1s, double from, double to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<Case> iterator = case1s.iterator();
        while (iterator.hasNext()) {
            Case case1 = iterator.next();

            if ((from != 0 && case1.sellingPrice < from) || (to != 0 && case1.sellingPrice > to)) {
                iterator.remove();
            }
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
