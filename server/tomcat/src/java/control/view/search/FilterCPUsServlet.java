package control.view.search;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.List;
import packages.CPU;

public class FilterCPUsServlet extends HttpServlet {
    Database db = new Database();
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");  
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");     
        String brand = request.getParameter("brand");
        String generation = request.getParameter("generation");
        String socket = request.getParameter("socket");
        String fromCore_raw = request.getParameter("fromCores");
        String toCore_raw = request.getParameter("toCores");
        String fromTDP_raw = request.getParameter("fromTDP");
        String toTDP_raw = request.getParameter("toTDP");
        
        double fromP = (from_raw == null || from_raw.isEmpty())? 0: Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty())? 0: Double.parseDouble(to_raw);
        int fromCore = (fromCore_raw == null || fromCore_raw.isEmpty())? 0: Integer.parseInt(fromCore_raw);
        int toCore = (toCore_raw == null || toCore_raw.isEmpty())? 0: Integer.parseInt(toCore_raw);
        int fromTDP = (fromTDP_raw == null || fromTDP_raw.isEmpty())? 0: Integer.parseInt(fromTDP_raw);
        int toCTDP = (toTDP_raw == null || toTDP_raw.isEmpty())? 0: Integer.parseInt(toTDP_raw);
        
        List<CPU> cpus = db.getCPUs(brand);
        
        if(generation !=null ){
            getCPUsByGeneration(cpus, generation);
        }
        
        if(fromP !=0 && toP !=0){
            getCPUsByPrice(cpus, fromP, toP);
        }
        
        if(socket !=null){
            getCPUsBySocket(cpus, socket);
        }
        
        if(fromCore != 0&& toCore !=0){
            getCPUsByCore(cpus, fromCore, toCore);
        }
        
        if(toCTDP !=0&& fromTDP !=0){
            getCPUsByTDP(cpus, fromTDP, toCTDP);
        }
        
        request.setAttribute("cpus", cpus);
        request.getRequestDispatcher("/view/cpus.jsp").forward(request, response);
    } 
    
    public void getCPUsByGeneration(List<CPU> cpus, String generation){
        Iterator<CPU> iterator = cpus.iterator();
        
        while(iterator.hasNext()){
            CPU cpu = iterator.next();
            if(!cpu.generation.toLowerCase().contains(generation)){
                iterator.remove();
            }
        }
    }
    
    public void getCPUsBySocket(List<CPU> cpus, String socket){
        Iterator<CPU> iterator = cpus.iterator();
        
        while(iterator.hasNext()){
            CPU cpu = iterator.next();
            if(!cpu.socket.toLowerCase().contains(socket)){
                iterator.remove();
            }
        }
    }
    
    public void getCPUsByCore(List<CPU> cpus, int from, int to){
        if (from == 0 && to == 0) {
            return;
        }

        Iterator<CPU> iterator = cpus.iterator();

        while (iterator.hasNext()) {
            CPU cpu = iterator.next();

            if ((from != 0 && cpu.cores < from) || (to != 0 && cpu.cores > to)) {
                iterator.remove();
            }
        }
    }
    
    public void getCPUsByTDP(List<CPU> cpus, int from, int to){
        if (from == 0 && to == 0) {
            return;
        }

        Iterator<CPU> iterator = cpus.iterator();

        while (iterator.hasNext()) {
            CPU cpu = iterator.next();

            if ((from != 0 && cpu.tdp < from) || (to != 0 && cpu.tdp > to)) {
                iterator.remove();
            }
        }
    }
    
    public void getCPUsByPrice(List<CPU> cpus, double from, double to) {
        if (from == 0 && to == 0) {
            return;
        }

        Iterator<CPU> iterator = cpus.iterator();

        while (iterator.hasNext()) {
            CPU cpu = iterator.next();

            if ((from != 0 && cpu.sellingPrice < from) || (to != 0 && cpu.sellingPrice > to)) {
                iterator.remove();
            }
        }
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
