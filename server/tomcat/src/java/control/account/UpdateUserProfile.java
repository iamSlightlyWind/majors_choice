package control.account;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import database.Database;
import main.User;

public class UpdateUserProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (((String) request.getParameter("actor")).equals("staffs")) {
            doStaff(request, response, request.getParameter("action"));
        } else {
            doUser(request, response, request.getParameter("action"));
        }
    }

    private void doStaff(HttpServletRequest request, HttpServletResponse response, String action)
            throws ServletException, IOException {
        if (action.equals("Update")) {
            User staff = new User();
            staff.id = request.getParameter("id");
            staff.fullName = request.getParameter("fullname");
            staff.username = request.getParameter("username");
            staff.password = request.getParameter("password");
            staff.active = Integer.parseInt(request.getParameter("active"));

            switch (staff.updateStaff()) {
                case 1:
                    request.setAttribute("status", "Update Staff Success!");
                    request.getRequestDispatcher("/manage/profile?actor=staff").forward(request, response);
                    break;
                case -1:
                    request.setAttribute("status", "Update Staff Failed! Username already exist.");
                    request.getRequestDispatcher("/manage/profile?actor=staff").forward(request, response);
                    break;
            }

        } else if (action.equals("Add")) {
            Database db = new Database();
            User staff = new User();
            staff.fullName = request.getParameter("fullname");
            staff.username = request.getParameter("username");
            staff.password = request.getParameter("password");
            //staff.active = Integer.parseInt(request.getParameter("active"));

            switch (db.addStaff(staff)) {
                case 1:
                    request.setAttribute("status", "Add Staff Success!");
                    request.getRequestDispatcher("/manage/profile?actor=staff").forward(request, response);
                    break;
                case -1:
                    request.setAttribute("status", "Add Staff Failed! Username already exist.");
                    request.getRequestDispatcher("/manage/profile?actor=staff").forward(request, response);
                    break;
            }
        }
    }

    private void doUser(HttpServletRequest request, HttpServletResponse response, String action)
            throws ServletException, IOException {
        User user = new User();
        if (request.getParameter("active") != null) {
            user.active = Integer.parseInt(request.getParameter("active"));
        }
        user.username = request.getParameter("username");
        user.fullName = request.getParameter("fullname");
        user.email = request.getParameter("email");
        user.phoneNumber = request.getParameter("phoneNumber");
        user.address = request.getParameter("address");
        user.dateOfBirth = request.getParameter("dateOfBirth");
        String actor = request.getParameter("actor");

        int result = user.updateInformation();
        request.setAttribute("user", user);
        request.setAttribute("possition", actor);
        switch (result) {
            case 1:
                request.setAttribute("table", "user");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/manage/profile?actor=user");
                dispatcher.forward(request, response);
                break;
                
            case -2:
                request.setAttribute("status", "Update Failed! Phone had existed.");
                request.getRequestDispatcher("/manage/profile?actor=user").forward(request, response);
                break;
                
            default:
                request.setAttribute("status", "Update Failed!");
                request.getRequestDispatcher("/manage/profile?actor=user").forward(request, response);
                break;
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
