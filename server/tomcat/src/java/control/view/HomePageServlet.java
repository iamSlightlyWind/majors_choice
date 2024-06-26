package control.view;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import packages.CPU;
import packages.GPU;
import packages.Motherboard;
import packages.PSU;
import packages.RAM;
import packages.SSD;
import packages.wrap.Product;

public class HomePageServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<CPU> cpus = Database.getCPUs("");
        List<GPU> gpus = Database.getGPUs("");
        List<RAM> rams = Database.getRAMs("");
        List<Motherboard> motherboards = Database.getMotherboards("");
        List<SSD> ssds = Database.getSSDs("");
        List<PSU> psus = Database.getPSUs("");

        Collections.shuffle(cpus);
        Collections.shuffle(gpus);
        Collections.shuffle(rams);
        Collections.shuffle(motherboards);
        Collections.shuffle(ssds);
        Collections.shuffle(psus);

        request.setAttribute("cpus", cpus);
        request.setAttribute("gpus", gpus);
        request.setAttribute("rams", rams);
        request.setAttribute("mobos", motherboards);
        request.setAttribute("ssds", ssds);
        request.setAttribute("psus", psus);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("searchName") == null ? "" : request.getParameter("searchName");

        List<CPU> cpus = Database.getCPUs(name);
        List<GPU> gpus = Database.getGPUs(name);
        List<RAM> rams = Database.getRAMs(name);
        List<Motherboard> motherboards = Database.getMotherboards(name);
        List<SSD> ssds = Database.getSSDs(name);
        List<PSU> psus = Database.getPSUs(name);

        List<Product> list = new ArrayList<>();
        list.addAll(cpus);
        list.addAll(gpus);
        list.addAll(rams);
        list.addAll(motherboards);
        list.addAll(ssds);
        list.addAll(psus);
        if (name != null && !name.isEmpty()) {
            request.setAttribute("searchName", name);
        }
        request.setAttribute("products", list);
        request.getRequestDispatcher("/view/homeSearch.jsp").forward(request, response);
    }
}
