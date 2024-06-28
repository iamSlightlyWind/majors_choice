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
        ArrayList<CPU> cpus = Database.getCPUs("");
        ArrayList<GPU> gpus = Database.getGPUs("");
        ArrayList<RAM> rams = Database.getRAMs("");
        ArrayList<Motherboard> motherboards = Database.getMotherboards("");
        ArrayList<SSD> ssds = Database.getSSDs("");
        ArrayList<PSU> psus = Database.getPSUs("");

        request.setAttribute("username", ((User) request.getSession().getAttribute("userObject")).fullName);
        request.setAttribute("cpus", cpus);
        request.setAttribute("gpus", gpus);
        request.setAttribute("rams", rams);
        request.setAttribute("motherboards", motherboards);
        request.setAttribute("ssds", ssds);
        request.setAttribute("psus", psus);
        request.getRequestDispatcher("test/products.jsp").forward(request, response);
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

    public static void main(String[] args) {
    }
}