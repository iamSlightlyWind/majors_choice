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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String dob = request.getParameter("dateOfBirth");

        User user = new User(username, password, fullname, email, phone, address, dob);
        int result = user.updateInformation();
        switch (result) {
            case 1:
                request.setAttribute("status", "Update Successful!");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
                break;
            case -1:
                request.setAttribute("status", "Update Failed! Email had existed.");
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                break;
            case -2:
                request.setAttribute("status", "Update Failed! Phone had existed.");
                request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("status", "Update Failed!");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
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
