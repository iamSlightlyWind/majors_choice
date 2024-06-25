package control.view;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import packages.CPU;
import packages.GPU;
import packages.Motherboard;
import packages.PSU;
import packages.RAM;
import packages.SSD;

public class HomePageServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Database db = new Database();       
        String name = request.getParameter("searchName") == null ? "" : request.getParameter("searchName");
        
        List<CPU> cpus = db.getCPUs(name);
        List<GPU> gpus = db.getGPUs(name);
        List<RAM> rams = db.getRAMs(name);
        List<Motherboard> motherboards = db.getMotherboards(name);
        List<SSD> ssds = db.getSSDs(name);
        List<PSU> psus = db.getPSUs(name);
        
        if(name != null && !name.isEmpty()){
            request.setAttribute("searchName", name);
        }
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
        processRequest(request, response);
        request.getRequestDispatcher("/view/homeSearch.jsp").forward(request, response);
    }
}
