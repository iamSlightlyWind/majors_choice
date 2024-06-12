package control.auth;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import main.User;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("userName");
        String password = request.getParameter("password");
        String repass = request.getParameter("repass");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String dateOfBirth = request.getParameter("dateOfBirth");

        String error = checkInfo(email, phoneNumber, password, repass);
        int result = 0;
        User user = new User(username, password, fullName, email, phoneNumber, address, dateOfBirth);

        if (error.equals("")) {
            String tableName = request.getParameter("actor");
            result = user.register(false, tableName);
//            switch (result) {
//                case 1:
//                    if(tableName!=null){
//                        response.sendRedirect("manageraccount");
//                    } else {
//                        request.setAttribute("loginStatus", "Succesfully Registered. You can now Login.");
//                        request.getRequestDispatcher("/login.jsp").forward(request, response);
//                    }
//                    break;
//                    
//                case -1:
//                    error = "Username already exists.";
//                    break;
//                    
//                case -2:
//                    error = "Email already exists.";
//                    break;
//
//                case -3:
//                    error = "Phone number already exists.";
//                    break;
//                default:
//                    error = "Register Failed.";
//                    break;
//            }
//            request.setAttribute("registerStatus", error);
//            request.getRequestDispatcher("/register.jsp").forward(request, response);
            if (result == 1) {
                if (tableName != null) {
                    request.setAttribute("table", "user");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/manage/profile");
                    dispatcher.forward(request, response);
                    return; // Ensure no further processing
                } else {
                    request.setAttribute("loginStatus", "Successfully Registered. You can now Login.");
                    request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
                    return; // Ensure no further processing
                }
            } else {
                switch (result) {
                    case -1:
                        error = "Username already exists.";
                        break;
                    case -2:
                        error = "Email already exists.";
                        break;
                    case -3:
                        error = "Phone number already exists.";
                        break;
                    default:
                        error = "Register Failed.";
                        break;
                }
                request.setAttribute("registerStatus", error);
                request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("registerStatus", error);
            request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
        }
        response.setContentType("text/html;charset=UTF-8");
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);

        return matcher.matches();
    }

    public boolean isValidPhoneNumber(String phoneNumber) {
        /*
         * String phoneRegex = "^\\d{3}-\\d{3}-\\d{3,6}$";
         * Pattern pattern = Pattern.compile(phoneRegex);
         * Matcher matcher = pattern.matcher(phoneNumber);
         * 
         * return matcher.matches();
         */

        return true;
    }

    public boolean isValidPasswordMatches(String password, String repass) {
        return password.equals(repass);
    }

    public String checkInfo(String emailAddress, String phoneNumber, String password, String repass) {
        if (!isValidEmail(emailAddress)) {
            return "Wrong email format.";
        }
        if (!isValidPhoneNumber(phoneNumber)) {
            return "Wrong phone number format.";
        }
        if (!isValidPasswordMatches(password, repass)) {
            return "Passwords don't match.";
        }
        return "";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String actor = request.getParameter("actor");
        request.setAttribute("actor", actor);
        request.getRequestDispatcher("/auth/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
