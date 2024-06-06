package control.profile;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import main.User;

public class Profile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("Loading profile page");
        HttpSession sesion = request.getSession();
        User user = new User();

        String username = (String) sesion.getAttribute("username");

        //User user1 = user.getUserDetailsByUsername(username);
        User user1 = new User("davitscott", "password", "John Doe", "john@example.com", "123456789", "123 Street, City", "2000-01-01");

        
        request.setAttribute("user", user1);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.getRequestDispatcher("editprofile.jsp").forward(request, response);
    }
}
