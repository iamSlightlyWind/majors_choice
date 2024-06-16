package control.view;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import packages.RAM;

public class RAMsServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Database db = new Database();
        
        List<RAM> rams = db.getRAMs("");
        
        request.setAttribute("rams", rams);
        request.getRequestDispatcher("/view/rams.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Database db = new Database();
        String searchName = request.getParameter("searchName");
        
        List<RAM> rams = db.getRAMs(searchName);
        
        request.setAttribute("searchName", searchName);
        request.setAttribute("rams", rams);
        request.getRequestDispatcher("/view/rams.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
