package database;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.Email;
import main.User;

public class Test extends HttpServlet {
    Database database = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //request.setAttribute("output", database.runCommand(request.getParameter("command")));
        //response.setContentType("text/html;charset=UTF-8");
        Email mail = new Email();
        String address = request.getParameter("address");
        String title = request.getParameter("title");
        mail.sendEmail(address, title);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/email.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        // Write the content of the system out to the response
        response.getWriter().println(database.selectAll("users"));
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

    public static void main(String[] args) {
        User newUser = new User("emilyjohnson", "password456");
        System.out.println("first validation: " + newUser.validate("AsdbD"));
        System.out.println("second validation: " + newUser.validate("DfjgR"));
        System.out.println("third validation: " + newUser.validate("DfjgR"));
    }
}