package control.favor;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import main.User;
import packages.CPU;
import packages.Case;
import packages.Favor;
import packages.GPU;
import packages.Motherboard;
import packages.PSU;
import packages.RAM;
import packages.SSD;

public class ViewListFavorServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        listFavorProducts(request, response);
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
    
    public static void listFavorProducts(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("userObject");
        user.retrieveData((String) request.getSession().getAttribute("table"));
        
        List<Favor> favors = Database.getFavors(Integer.parseInt(user.id));
        
        List<CPU> cpus = new ArrayList<>();
        List<GPU> gpus = new ArrayList<>();
        List<RAM> rams = new ArrayList<>();
        List<Motherboard> motherboards = new ArrayList<>();
        List<SSD> ssds = new ArrayList<>();
        List<PSU> psus = new ArrayList<>();
        List<Case> cases = new ArrayList<>();  
        
        for (Favor favor : favors) {
            CPU cpu1 = new CPU(favor.productID);            
            if(cpu1.name != null){
                cpus.add(cpu1);
            }
            
            GPU gpu1 = new GPU(favor.productID);           
            if(gpu1.name != null){
                gpus.add(gpu1);
            }
            
            Motherboard mobo1 = new Motherboard(favor.productID);
            if(mobo1.name != null){
                motherboards.add(mobo1);
            }

            SSD ssd1 = new SSD(favor.productID);           
            if(ssd1.name != null){
                ssds.add(ssd1);
            }

            PSU psu1 = new PSU(favor.productID);           
            if(psu1.name != null){
                psus.add(psu1);
            }
            
            RAM ram1 = new RAM(favor.productID);           
            if(ram1.name != null){
                rams.add(ram1);
            }
            
            Case case1 = new Case(favor.productID);           
            if(case1.name != null){
                cases.add(case1);
            }
        }
        
        request.setAttribute("user", user);
        request.setAttribute("Bcpus", cpus);
        request.setAttribute("Bgpus", gpus);
        request.setAttribute("Brams", rams);
        request.setAttribute("Bmobos", motherboards);
        request.setAttribute("Bssds", ssds);
        request.setAttribute("Bpsus", psus);
        request.setAttribute("Bcases", cases);
        request.getRequestDispatcher("/view/listFavor.jsp").forward(request, response);
    }
}
