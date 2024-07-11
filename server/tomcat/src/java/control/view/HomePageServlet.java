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
import packages.Case;
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
        List<Case> cases = Database.getCases("");              
        
        Collections.shuffle(cpus);
        Collections.shuffle(gpus);
        Collections.shuffle(rams);
        Collections.shuffle(motherboards);
        Collections.shuffle(ssds);
        Collections.shuffle(psus);
        Collections.shuffle(cases);

        getBestSeller(request, response);
        
        request.setAttribute("cpus", cpus);
        request.setAttribute("gpus", gpus);
        request.setAttribute("rams", rams);
        request.setAttribute("mobos", motherboards);
        request.setAttribute("ssds", ssds);
        request.setAttribute("psus", psus);
        request.setAttribute("cases", cases);
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
        List<Case> cases = Database.getCases(name);

        
        if (name != null && !name.isEmpty()) {
            request.setAttribute("searchName", name);
        }
        request.setAttribute("cpus", cpus);
        request.setAttribute("gpus", gpus);
        request.setAttribute("rams", rams);
        request.setAttribute("mobos", motherboards);
        request.setAttribute("ssds", ssds);
        request.setAttribute("psus", psus);
        request.setAttribute("cases", cases);
        request.getRequestDispatcher("/view/homeSearch.jsp").forward(request, response);
    }
    
    protected static void getBestSeller (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        
        List<CPU> cpus = new ArrayList<>();
        List<GPU> gpus = new ArrayList<>();
        List<RAM> rams = new ArrayList<>();
        List<Motherboard> motherboards = new ArrayList<>();
        List<SSD> ssds = new ArrayList<>();
        List<PSU> psus = new ArrayList<>();
        List<Case> cases = new ArrayList<>();  
        
        List<Product> products = Database.getMostPopularProducts();
        
        for (Product product : products) {
            CPU cpu1 = new CPU(product.id);
            
            if(cpu1.name != null){
                cpus.add(cpu1);
            }
            
            GPU gpu1 = new GPU(product.id);
            
            if(gpu1.name != null){
                gpus.add(gpu1);
            }
            
            Motherboard mobo1 = new Motherboard(product.id);

            if(mobo1.name != null){
                motherboards.add(mobo1);
            }

            SSD ssd1 = new SSD(product.id);
            
            if(ssd1.name != null){
                ssds.add(ssd1);
            }

            PSU psu1 = new PSU(product.id);
            
            if(psu1.name != null){
                psus.add(psu1);
            }
            
            RAM ram1 = new RAM(product.id);
            
            if(ram1.name != null){
                rams.add(ram1);
            }
            
            Case case1 = new Case(product.id);
            
            if(case1.name != null){
                cases.add(case1);
            }
            
        }
        
        request.setAttribute("Bcpus", cpus);
        request.setAttribute("Bgpus", gpus);
        request.setAttribute("Brams", rams);
        request.setAttribute("Bmobos", motherboards);
        request.setAttribute("Bssds", ssds);
        request.setAttribute("Bpsus", psus);
        request.setAttribute("Bcases", cases);
    }
}
