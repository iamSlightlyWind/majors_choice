package control;

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
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = new User();

        user.username = request.getParameter("user");
        user.password = request.getParameter("pass");
        int result = user.login();
        
        HttpSession session = request.getSession();
        //check the existing account or enter wrong input
        if (result == 1) {
            processRequest(request, response);
        } else if(result == 0){
            String erorrLogin = "Username or Password wrong. Please enter again!";
            request.setAttribute("erorr1", erorrLogin);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            session.setAttribute("userName", user.username);
            session.setAttribute("password", user.password);
            request.getRequestDispatcher("VerifyEmail.jsp").forward(request, response);
        }
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
