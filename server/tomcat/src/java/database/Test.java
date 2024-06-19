package database;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Test extends HttpServlet {
    Database database = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

    public static void main(String[] args) throws SQLException {
        Database db = new Database();
        String sqlGetMaxId = "SELECT MAX(id) AS max_id FROM Products";
        Statement statement = db.connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sqlGetMaxId);
        int productId = 0;
        if (resultSet.next()) {
            productId = resultSet.getInt("max_id") + 1;
        }

        System.out.println(productId);
    }
}