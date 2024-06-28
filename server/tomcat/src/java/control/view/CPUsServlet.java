package control.view;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import packages.CPU;

public class CPUsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<CPU> cpus = Database.getCPUs("");

        request.setAttribute("cpus", cpus);
        request.getRequestDispatcher("/view/cpus.jsp").forward(request, response);
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

        List<CPU> cpus = Database.getCPUs(searchName);
        request.setAttribute("cpus", cpus);
        request.setAttribute("searchName", searchName);
        request.getRequestDispatcher("/view/cpus.jsp").forward(request, response);
    }
}
