package control.account;

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
                    response.sendRedirect("/manage/profile?actor=staff&status=1");
                    break;
                case -1:
                    response.sendRedirect("/manage/profile?actor=staff&status=0");
                    break;
            }

        } else if (action.equals("Add")) {
            User staff = new User();
            staff.fullName = request.getParameter("fullname");
            staff.username = request.getParameter("username");
            staff.password = request.getParameter("password");

            switch (Database.addStaff(staff)) {
                case 1:
                    response.sendRedirect("/manage/profile?actor=staff&status=11");
                    break;
                case -1:
                    response.sendRedirect("/manage/profile?actor=staff&status=10");
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
                response.sendRedirect("/manage/profile?actor=user&status=1");
                break;

            case -2:
                response.sendRedirect("/manage/profile?actor=user&status=11");
                break;

            default:
                response.sendRedirect("/manage/profile?actor=user&status=12");
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
}