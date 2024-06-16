package control.view;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import packages.GPU;

public class GPUsServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Database db = new Database();
        
        List<GPU> gpus = db.getGPUs("");
        
        request.setAttribute("gpus", gpus);
        request.getRequestDispatcher("/view/gpus.jsp").forward(request, response);
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
        
        List<GPU> gpus = db.getGPUs(searchName);
        
        request.setAttribute("searchName", searchName);
        request.setAttribute("gpus", gpus);
        request.getRequestDispatcher("/view/gpus.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
