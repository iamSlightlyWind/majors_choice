package control.profile;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import main.User;

public class EditProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        User user = (User) request.getSession().getAttribute("userObject");

        boolean emailFormat = isValidEmail(request.getParameter("email"));
        if (emailFormat) {
            user.username = request.getParameter("username");
            user.password = request.getParameter("password");
            user.fullName = request.getParameter("fullname");
            user.email = request.getParameter("email");
            user.phoneNumber = request.getParameter("phoneNumber");
            user.address = request.getParameter("address");
            user.dateOfBirth = request.getParameter("dateOfBirth");

            int result = user.updateInformation();
            request.setAttribute("user", user);
            switch (result) {
                case 1:
                    response.sendRedirect("/profile?action=view");
                    break;
                case -1:
                    request.setAttribute("status", "Update Failed! Email had existed.");
                    request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                    break;
                case -2:
                    request.setAttribute("status", "Update Failed! Phone had existed.");
                    request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                    break;
            }
        } else {
            request.setAttribute("user", user.fullName);
            request.setAttribute("status", "Update Failed!Email format wrong!");
            request.getRequestDispatcher("editprofile.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String action = request.getParameter("action");

        User user = new User();

        if (action.equals("delete")) {
            user.username = request.getParameter("user");
            user.retrieveData("user");
            user.active = -1;
            user.updateInformation();
            response.sendRedirect("/manage/profile?actor=user");
        } else if (action.equals("update")) {
            user.username = request.getParameter("user");
            user.retrieveData("user");
            request.setAttribute("user", user);
            request.setAttribute("possition", "user");
            request.getRequestDispatcher("/manage/profile/user.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
