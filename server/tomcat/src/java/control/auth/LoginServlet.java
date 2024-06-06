package control.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User user = new User(request.getParameter("user"), request.getParameter("pass"));

        switch (user.login()) {
            case 1:
                user.retrieveData();
                request.getSession().setAttribute("userObject", user);
                request.setAttribute("loginStatus", "Logged in successfully");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
            case -1:
                request.getSession().setAttribute("userObject", user);
                request.setAttribute("user", user.username);
                request.getRequestDispatcher("activate.jsp").forward(request, response);
                break;
            default:
                String error = "Login failed!";
                request.setAttribute("loginStatus", error);
                request.getRequestDispatcher("login.jsp").forward(request, response);
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
