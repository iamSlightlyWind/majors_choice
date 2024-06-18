package control.view.search;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import packages.Motherboard;

public class FilterMotherBoard extends HttpServlet {

    Database db = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("nameSearch") == null ? "" : request.getParameter("nameSearch");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String ramType[] = request.getParameterValues("ramType");
        String wifi[] = request.getParameterValues("wifi");
        String socket[] = request.getParameterValues("socket");
        String formFactor[] = request.getParameterValues("formFactor");

        double fromP = (from_raw == null || from_raw.isEmpty()) ? 0 : Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty()) ? 0 : Double.parseDouble(to_raw);
        
        List<Motherboard> list = db.getMotherboards(name);
        List<Motherboard> list1 = getMotherBoardBySocket(list, socket);
        List<Motherboard> list2 = getMotherboardsByFormFactors(list1, formFactor);
        List<Motherboard> list3 = getMotherboardsByRamTypes(list2, ramType);
        List<Motherboard> mobos = getMotherboardsByWifi(list3, wifi);
        getMotherBoardsByPrice(mobos, fromP, toP);
        
        request.setAttribute("searchName", name);
        request.setAttribute("from", from_raw);
        request.setAttribute("to", to_raw);
        request.setAttribute("ramTypes", ramType);
        request.setAttribute("wifi", wifi);
        request.setAttribute("sockets", socket);
        request.setAttribute("formFactors", formFactor);
        request.setAttribute("mobos", mobos);
        request.getRequestDispatcher("/view/mobos.jsp").forward(request, response);

    }

    public List<Motherboard> getMotherBoardBySocket(List<Motherboard> mobos, String[] sockets) {
        List<Motherboard> list = new ArrayList<>();
        if(sockets == null || sockets.length ==0){
            return mobos;
        }
        for (Motherboard mobo : mobos) {
            for (String socket : sockets) {
                if(mobo.socket.toLowerCase().contains(socket.toLowerCase())){
                    list.add(mobo);
                }
            }
        }
        
        return list;
    }
    
    public List<Motherboard> getMotherboardsByRamTypes(List<Motherboard> mobos, String[] ramTypes) {
        List<Motherboard> list = new ArrayList<>();
        if(ramTypes == null || ramTypes.length ==0){
            return mobos;
        }
        for (Motherboard mobo : mobos) {
            for (String ramType : ramTypes) {
                if(mobo.ramType.toLowerCase().contains(ramType.toLowerCase())){
                    list.add(mobo);
                }
            }
        }
        return list;
    }
    
    public List<Motherboard> getMotherboardsByFormFactors(List<Motherboard> mobos, String[] formFactors) {
        List<Motherboard> list = new ArrayList<>();
        if(formFactors == null || formFactors.length ==0){
            return mobos;
        }
        for (Motherboard mobo : mobos) {
            for (String formFactor : formFactors) {
                if(mobo.formFactor.toLowerCase().contains(formFactor.toLowerCase())){
                    list.add(mobo);
                }
            }
        }
        return list;
    }
    
    public List<Motherboard> getMotherboardsByWifi(List<Motherboard> mobos, String[] wifis) {
        List<Motherboard> list = new ArrayList<>();
        if(wifis == null || wifis.length ==0){
            return mobos;
        }
        for (Motherboard mobo : mobos) {
            for (String wifi : wifis) {
                if(wifi.contains(String.valueOf(mobo.wifi))){
                    list.add(mobo);
                }
            }
        }
        return list;
    }
    
    public void getMotherBoardsByPrice(List<Motherboard> mobos, double from, double to) {
        if (from == 0 && to == 0) {
            return;
        }

        Iterator<Motherboard> iterator = mobos.iterator();

        while (iterator.hasNext()) {
            Motherboard mobo = iterator.next();

            if ((from != 0 && mobo.sellingPrice < from) || (to != 0 && mobo.sellingPrice > to)) {
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
