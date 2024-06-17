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

public class HomePageServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Database db = new Database();       
        List<CPU> cpus = getRandomFive(db.getCPUs(""));
        List<GPU> gpus = getRandomFive(db.getGPUs(""));
        List<RAM> rams = getRandomFive(db.getRAMs(""));
        List<Motherboard> motherboards = getRandomFive(db.getMotherboards(""));
        List<SSD> ssds = getRandomFive(db.getSSDs(""));
        List<PSU> psus = getRandomFive(db.getPSUs(""));
                            
        request.setAttribute("cpus", cpus);  
        request.setAttribute("gpus", gpus); 
        request.setAttribute("rams", rams); 
        request.setAttribute("mobos", motherboards); 
        request.setAttribute("ssds", ssds); 
        request.setAttribute("psus", psus); 
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } 
    
    public <T> List<T> getRandomFive(List<T> inputList) {
        List<T> copyList = new ArrayList<>(inputList);

        Collections.shuffle(copyList);
       
        return copyList.subList(0, 5);
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
}
