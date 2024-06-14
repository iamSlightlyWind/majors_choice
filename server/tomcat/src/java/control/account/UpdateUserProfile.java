package control.account;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import main.User;

public class UpdateUserProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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

        boolean emailFormat = isValidEmail(user.email);

        if (emailFormat) {
            int result = user.updateInformation();
            request.setAttribute("user", user);
            request.setAttribute("possition", actor);
            switch (result) {
                case 1:
                    request.setAttribute("table", "user");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/manage/profile?actor=user");
                    dispatcher.forward(request, response);
                    break;
                case -1:
                    request.setAttribute("status", "Update Failed! Email had existed.");
                    request.getRequestDispatcher("/manage/profile?actor=user.jsp").forward(request, response);
                    break;
                case -2:
                    request.setAttribute("status", "Update Failed! Phone had existed.");
                    request.getRequestDispatcher("/manage/profile?actor=user.jsp").forward(request, response);
                    break;
            }
        } else {
            request.setAttribute("user", user);
            request.setAttribute("possition", actor);
            request.setAttribute("status", "Update Failed!Error Email Format");
            request.getRequestDispatcher("/manage/profile?actor=user.jsp").forward(request, response);
        }

    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);

        return matcher.matches();
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
