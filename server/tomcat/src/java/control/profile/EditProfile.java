package control.profile;

import jakarta.servlet.RequestDispatcher;
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String dob = request.getParameter("dateOfBirth");
        String possition = request.getParameter("possition");
        
        boolean emailFormat = isValidEmail(email);
        User user = new User(username, password, fullname, email, phone, address, dob);
        
        if (request.getParameter("active") != null) {
            user.active = Integer.parseInt(request.getParameter("active"));
        }
        user.id = request.getParameter("id");
        user.dateJoined = request.getParameter("dateJoined");
        
        if (emailFormat) {
            String tableName = (String) request.getSession().getAttribute("table");
            if(possition!=null){
                tableName = possition;
            }
            int result = user.updateInformation(tableName, true);
            request.setAttribute("user", user);
            request.setAttribute("possition", possition);
            switch (result) {
                case 1:
                    if(possition == null){
                        request.setAttribute("status", "Update Successful!");
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    } else {
                        request.setAttribute("table", "staff");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/manage/profile");
                        dispatcher.forward(request, response);
                    }
                    break;
                case -1:
                    request.setAttribute("status", "Update Failed! Email had existed.");
                    request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                    break;
                case -2:
                    request.setAttribute("status", "Update Failed! Phone had existed.");
                    request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                    break;
                default:
                    request.setAttribute("status", "Update Failed!");
                    request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                    break;
            }
        } else {
            request.setAttribute("possition", possition);
            request.setAttribute("user", user);
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
         User user = new User();

        String id = request.getParameter("id");
        String action = request.getParameter("action");
        String actor = request.getParameter("actor");

        switch (actor) {
            case "users":
                if (action.equals("delete")) {
                    user.deleteUser(actor, id);
                    request.setAttribute("table", "user");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/manage/profile");
                    dispatcher.forward(request, response);
                } else if (action.equals("update")) {
                    user.id = id;
                    user.retrieveData2("user");
                    request.setAttribute("user", user);
                    request.setAttribute("possition", "user");
                    request.getRequestDispatcher("/manage/profile/user.jsp").forward(request, response);
                }
                break;
            case "staffs":
                if (action.equals("delete")) {
                    user.deleteUser(actor, id);
                    request.setAttribute("table", "staff");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/manage/profile");
                    dispatcher.forward(request, response);
                } else if (action.equals("update")) {
                    user.id = id;
                    user.retrieveData2("staff");
                    request.setAttribute("user", user);
                    request.setAttribute("possition", "staff");
                    request.getRequestDispatcher("editprofile.jsp").forward(request, response);
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
