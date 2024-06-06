package control.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import main.User;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = new User();

        user.username = request.getParameter("user");
        user.password = request.getParameter("pass");
        int result = user.login();
        
        if (result == 1) {
            session.setAttribute("username", user.username);
            request.setAttribute("loginStatus", "Logged in successfully");
            //request.getRequestDispatcher("profile").forward(request, response);
            response.sendRedirect("profile");
        } else if (result == -1) {
            session.setAttribute("username", user.username);
            request.setAttribute("user", user.username);
            request.getRequestDispatcher("activate.jsp").forward(request, response);
        } else {
            String error = "Login failed!";
            request.setAttribute("loginStatus", error);
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
