package control;

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
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("user");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String dateOfBirth = request.getParameter("dateOfBirth");

        String error = checkInfo(email, phone, pass, repass);
        int result = 0;

        if (!error.isEmpty()) {
            User user = new User(username, pass, name, email, phone, address, dateOfBirth);
            result = user.register();
        }

        switch (result) {
            case 1:
                break;

            case -1:
                error = "Username already exists.";

            case -2:
                error = "Email already exists.";

            case -3:
                error = "Phone number already exists.";
        }

        if (result == 1) {
            request.setAttribute("success", "Succesfully Registered. You can now Login.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        } else {
            request.setAttribute("error", error);
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);

        return matcher.matches();
    }

    public boolean isValidPhoneNumber(String phoneNumber) {
        String phoneRegex = "^\\d{3}-\\d{3}-\\d{3,6}$";
        Pattern pattern = Pattern.compile(phoneRegex);
        Matcher matcher = pattern.matcher(phoneNumber);

        return matcher.matches();
    }

    public boolean isValidPasswordMatches(String password, String repass){
        return password.equals(repass);
    }

    public String checkInfo(String emailAddress, String phoneNumber, String password, String repass){
        if(!isValidEmail(emailAddress)){
            return "Wrong email format.";
        }
        if(!isValidPhoneNumber(phoneNumber)){
            return "Wrong phone number format.";
        }
        if(!isValidPasswordMatches(password, repass)){
            return "Passwords don't match.";
        }
        return "";
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
