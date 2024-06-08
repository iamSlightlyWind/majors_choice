package control.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;

public class ResetPasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        User user = new User();
        user.email = request.getParameter("email");
        int result = user.resetPassword();

        switch (result) {
            case 0:
                request.setAttribute("recoveryStatus", "Email is not registered.");
                request.getRequestDispatcher("recovery.jsp").forward(request, response);
                break;
            case 1:
                request.setAttribute("loginStatus", "A new, unactivated password has been sent to your email address.");
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
}
