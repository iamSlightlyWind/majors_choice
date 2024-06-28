package control.view;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import packages.Motherboard;

public class MotherBoardsServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<Motherboard> mobos = Database.getMotherboards("");

        request.setAttribute("mobos", mobos);
        request.getRequestDispatcher("/view/mobos.jsp").forward(request, response);
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

        List<Motherboard> mobos = Database.getMotherboards(searchName);

        request.setAttribute("searchName", searchName);
        request.setAttribute("mobos", mobos);
        request.getRequestDispatcher("/view/mobos.jsp").forward(request, response);
    }
}
