package control.profile;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;

public class EditProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String role = (String) request.getSession().getAttribute("table");
        User user = (User) request.getSession().getAttribute("userObject");
        
        int result = -1;
        
        user.username = request.getParameter("username");
        user.password = request.getParameter("password");
        user.fullName = request.getParameter("fullname");
        
        if (role.equals("user")) {
            user.email = request.getParameter("email");
            user.phoneNumber = request.getParameter("phoneNumber");
            user.address = request.getParameter("address");
            user.dateOfBirth = request.getParameter("dateOfBirth");
            result = user.updateInformation();
        } else if (role.equals("staff")) {
            result = user.updateStaff();
        }    
        request.setAttribute("user", user);
        switch (result) {
            case 1:
                response.sendRedirect("/profile?status=1");
                break;
            case -1:
                request.setAttribute("status", "Update Failed!");
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                break;
            case -2:
                request.setAttribute("status", "Update Failed! Phone had existed.");
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (((String) request.getParameter("actor")).equals("staffs")) {
            doStaff(request, response, request.getParameter("action"));
        } else {
            doUser(request, response, request.getParameter("action"));
        }
    }

    public void doUser(HttpServletRequest request, HttpServletResponse response, String action)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User user = new User();

        if (action.equals("delete")) {
            user.username = request.getParameter("user");
            user.retrieveData("user");
            user.active = -1;
            user.updateInformation();
            response.sendRedirect("/manage/profile?actor=user&status=7");
        } else if (action.equals("update")) {
            user.username = request.getParameter("user");
            user.retrieveData("user");
            request.setAttribute("user", user);
            request.setAttribute("possition", "user");
            request.getRequestDispatcher("/manage/userForm.jsp").forward(request, response);
        }
    }

    public void doStaff(HttpServletRequest request, HttpServletResponse response, String action)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User staff = new User();

        if (action.equals("delete")) {
            staff.username = request.getParameter("user");
            staff.retrieveData("staff");
            staff.active = -1;
            staff.updateStaff();
            response.sendRedirect("/manage/profile?actor=staff&status=7");
        } else if (action.equals("update")) {
            staff.username = request.getParameter("user");
            staff.retrieveData("staff");
            request.setAttribute("staff", staff);
            request.setAttribute("submitAction", "Update");
            request.getRequestDispatcher("/manage/staffForm.jsp").forward(request, response);
        } else if (action.equals("Add")) {
            request.setAttribute("staff", new User());
            request.setAttribute("submitAction", "Add");
            request.getRequestDispatcher("/manage/staffForm.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}