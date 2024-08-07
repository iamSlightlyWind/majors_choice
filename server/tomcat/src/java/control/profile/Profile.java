package control.profile;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;

public class Profile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User user = (User) request.getSession().getAttribute("userObject");

        if (user == null) {
            response.sendRedirect("/auth/login.jsp");
            return;
        } else if (((String) request.getSession().getAttribute("table")).equals("staff")) {
            request.getSession().invalidate();
            request.setAttribute("loginStatus", "Logged out");
            request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
            return;
        }
        user.retrieveData((String) request.getSession().getAttribute("table"));

        request.setAttribute("user", user);
        request.getRequestDispatcher("editprofile.jsp").forward(request, response);
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
