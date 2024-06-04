package database;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;
import packages.*;

public class Test extends HttpServlet {
    Database database = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        System.out.println("got here");

        Database db = new Database();

        ArrayList<CPU> cpus = db.getCPUs();
        ArrayList<GPU> gpus = db.getGPUs();
        ArrayList<RAM> rams = db.getRAMs();
        ArrayList<Motherboard> motherboards = db.getMotherboards();
        ArrayList<SSD> ssds = db.getSSDs();
        ArrayList<PSU> psus = db.getPSUs();

        System.out.println(cpus);

        request.setAttribute("cpus", cpus);
        request.setAttribute("gpus", gpus);
        request.setAttribute("rams", rams);
        request.setAttribute("motherboards", motherboards);
        request.setAttribute("ssds", ssds);
        request.setAttribute("psus", psus);
        request.getRequestDispatcher("test/products.jsp").forward(request, response);


        //response.getWriter().println(database.selectAll("users"));
        //response.getWriter().println(database.selectAll("userDetails"));
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
        User user = new User("emilyjohnson", "password456");
        user.activate("DfjgR");
    }
}