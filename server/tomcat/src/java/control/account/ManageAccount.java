package control.account;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import database.Database;
import main.User;

public class ManageAccount extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Database db = new Database();

        String actor = request.getParameter("actor");
        String table = (String) request.getAttribute("table");

        if ((actor != null && actor.equals("user")) || (table != null && table.equals("user"))) {
            ArrayList<User> users = db.getUserDetails("users");
            request.setAttribute("users", users);
            request.getRequestDispatcher("/manage/userList.jsp").forward(request, response);
        } else if ((actor != null && actor.equals("staff")) || (table != null && table.equals("staff"))) {
            ArrayList<User> staffs = db.getUserDetails("staffs");
            request.setAttribute("status", request.getParameter("status"));
            request.setAttribute("staffs", staffs);
            request.getRequestDispatcher("/manage/staffList.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
