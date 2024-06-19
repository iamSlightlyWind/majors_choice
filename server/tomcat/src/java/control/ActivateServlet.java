package control;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import main.User;

public class ActivateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        User user = new User((String) session.getAttribute("username"), "");
        int result = user.activate(code);

        switch (result) {
            case 0:
                request.setAttribute("user", session.getAttribute("username"));
                request.setAttribute("activateStatus", "Activation code is incorrect.");
                request.getRequestDispatcher("activate.jsp").forward(request, response);
                break;
            case 1:
                request.setAttribute("loginStatus", "Logged in successfully");
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
