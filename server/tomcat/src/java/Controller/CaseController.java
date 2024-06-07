/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOCase;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import packages.Case;

/**
 *
 * @author PC
 */
public class CaseController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        DAOCase dao = new DAOCase();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }
        if (service.equals("listAll")) {
            //call mode
            Vector<Case> vector;
            vector = dao.getAll("select * from cases");
            request.setAttribute("data", vector);
            request.setAttribute("titlePage", "CaseManage");
            request.setAttribute("titleTable", "List of Case");
            //select view
            RequestDispatcher dispath = request.getRequestDispatcher("/jsp/CaseManage.jsp");
            dispath.forward(request, response);
        }
        if (service.equals("insertCase")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            String formFactor = request.getParameter("formFactor");
            String color = request.getParameter("color");
            Case c = new Case(name, type, formFactor, color, id, id, id, service);
            if (dao.insertCase(c) == 0) {
                response.sendRedirect("/jsp/insertCase.jsp");
            } else {
                response.sendRedirect("cases");
            }
        }
        if (service.equals("update")) {
            //check submit
            String submit = request.getParameter("submit");
            if (submit == null) {
                //get id
                int id = Integer.parseInt(request.getParameter("id"));
                //get Product(update)
                Vector<Case> vector = dao.getAll("select * from cases where id=" + id);
                //send vector to update form
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/updateCase.jsp");
                //run (show)
                dispath.forward(request, response);
            } else {
                int id = Integer.parseInt((String) request.getParameter("id"));
                String name = request.getParameter("name");
                String type = request.getParameter("type");
                String formFactor = request.getParameter("formFactor");
                String color = request.getParameter("color");
                Case c = new Case(name, type, formFactor, color, id, id, id, service);
                dao.updateCase(c);
                response.sendRedirect("cases");
            }
        }
        if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.removeCase(id);
            response.sendRedirect("cases");
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
