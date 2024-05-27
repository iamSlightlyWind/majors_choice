package database;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;

public class Test extends HttpServlet {
    Database database = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        System.out.println("third validation: " + newUser.validate("DfjgR")); // wont work since the user is already validated
    }
}