package control.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;

public class ActivateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                String code = request.getParameter("code");
        User user = (User) request.getSession().getAttribute("userObject");
        int result = user.activate(code);

        switch (result) {
            case 0:
                request.setAttribute("user", ((User) request.getSession().getAttribute("user")).username);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
