package control.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.Email;
import main.User;

public class ActivateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        User user = (User) request.getSession().getAttribute("tempUserObject");
        int result = user.activate(code);

        switch (result) {
            case 0:
                request.getSession().setAttribute("userObject", user);
                request.setAttribute("user", ((User) request.getSession().getAttribute("userObject")).username);
                request.setAttribute("activateStatus", "Activation code is incorrect.");
                request.getRequestDispatcher("/auth/activate.jsp").forward(request, response);
                break;
            case 1:
                Email mail = new Email();
                user.retrieveData("user");
                mail.sendGreet(user.email, user.username);
                request.getSession().setAttribute("userObject", user);
                request.getSession().setAttribute("table", "user");
                response.sendRedirect("/");
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
