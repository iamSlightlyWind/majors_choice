package control;

import helper.jbcrypt.BCrypt;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import main.User;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = new User();
        String hashedPass = null;
        int result = 0;
        
        user.username = request.getParameter("user");
        user.password = request.getParameter("pass");
        
        if(!user.username.isEmpty()){
            hashedPass = user.getPasswordByUsername(user.username);
        }
        if(hashedPass!=null){
            if(BCrypt.checkpw(user.password, hashedPass)){
                result = user.login();
            }
        }
        
        if (result == 1) {
            session.setAttribute("username", user.username);
            request.setAttribute("loginStatus", "Logged in successfully");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (result == -1) {
            session.setAttribute("username", user.username);
            request.setAttribute("user", user.username);
            request.getRequestDispatcher("activate.jsp").forward(request, response);
        } else {
            String error = "Login failed!";
            request.setAttribute("loginStatus", error);
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
