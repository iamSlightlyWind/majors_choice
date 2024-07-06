package control.view;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import packages.Case;

public class CasesServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        List<Case> cases = Database.getCases("");
        
        request.setAttribute("cases", cases);
        request.getRequestDispatcher("/view/cases.jsp").forward(request, response);
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String searchName = request.getParameter("searchName");
        
        List<Case> cases = Database.getCases(searchName);
        request.setAttribute("searchName", searchName);
        request.setAttribute("cases", cases);
        request.getRequestDispatcher("/view/cases.jsp").forward(request, response);
    }
}
