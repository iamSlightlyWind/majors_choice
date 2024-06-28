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

        String actor = request.getParameter("actor");
        String table = (String) request.getAttribute("table");

        if ((actor != null && actor.equals("user")) || (table != null && table.equals("user"))) {
            ArrayList<User> users = Database.getUserDetails("users");
            String status = request.getParameter("status") == null ? "" : request.getParameter("status");
            switch (status) {
                case "7":
                    status = "Delete Success!";
                    break;
                case "1":
                    status = "Update Success!";
                    break;
                case "11":
                    status = "Update Failed! Phone had existed.";
                    break;
                case "12":
                    status = "Update Failed!";
                    break;
                default:
                    status = "";
                    break;
            }
            if (status != null && !status.isEmpty()) {
                request.setAttribute("status", status);
            }
            request.setAttribute("users", users);
            request.getRequestDispatcher("/manage/userList.jsp").forward(request, response);
        } else if ((actor != null && actor.equals("staff")) || (table != null && table.equals("staff"))) {
            ArrayList<User> staffs = Database.getUserDetails("staffs");
            String status = request.getParameter("status") == null ? "" : request.getParameter("status");
            switch (status) {
                case "1":
                    status = "Update Staff Success!";
                    break;
                case "0":
                    status = "Update Staff Failed! Username already exist.";
                    break;
                case "11":
                    status = "Add Staff Success!";
                    break;
                case "10":
                    status = "Add Staff Failed! Username already exist.";
                    break;
                case "7":
                    status = "Delete success!";
                    break;
                default:
                    status = "";
                    break;
            }
            if (status != null && !status.isEmpty()) {
                request.setAttribute("status", status);
            }
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