package control.view;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import packages.SSD;

public class SSDsServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Database db = new Database();
        
        List<SSD> ssds = db.getSSDs("");
        
        request.setAttribute("ssds", ssds);
        request.getRequestDispatcher("/view/ssds.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Database db = new Database();
        String searchName = request.getParameter("searchName");
        
        List<SSD> ssds = db.getSSDs(searchName);
        
        request.setAttribute("searchName", searchName);
        request.setAttribute("ssds", ssds);
        request.getRequestDispatcher("/view/ssds.jsp").forward(request, response);
    }
}
