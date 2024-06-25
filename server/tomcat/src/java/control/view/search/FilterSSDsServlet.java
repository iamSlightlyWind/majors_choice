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
import packages.SSD;

public class FilterSSDsServlet extends HttpServlet {

    Database db = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = (request.getParameter("nameSearch") == null) ? "" : request.getParameter("nameSearch");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String interfaces[] = request.getParameterValues("interfaces");
        String cache[] = request.getParameterValues("cache");
        String fromCapacity_raw = request.getParameter("fromCapacity");
        String toCapacity_raw = request.getParameter("toCapacity");

        double fromP = (from_raw == null || from_raw.isEmpty()) ? 0 : Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty()) ? 0 : Double.parseDouble(to_raw);
        int fromCapacity = (fromCapacity_raw == null || fromCapacity_raw.isEmpty()) ? 0 : Integer.parseInt(fromCapacity_raw);
        int toCapacity = (toCapacity_raw == null || toCapacity_raw.isEmpty()) ? 0 : Integer.parseInt(toCapacity_raw);

        List<SSD> list = db.getSSDs(name);
        List<SSD> list1 = getSSDByCache(list, cache);
        List<SSD> ssds = getSSDByInterface(list1, interfaces);
        
        getSSDsByPrice(ssds, fromP, toP);
        getSSDsByCapacity(ssds, fromCapacity, toCapacity);

        request.setAttribute("searchName", name);
        request.setAttribute("from", from_raw);
        request.setAttribute("to", to_raw);
        request.setAttribute("interfaces", interfaces);
        request.setAttribute("caches", cache);
        request.setAttribute("fromCapacity", fromCapacity_raw);
        request.setAttribute("toCapacity", toCapacity_raw);
        request.setAttribute("ssds", ssds);
        request.getRequestDispatcher("/view/ssds.jsp").forward(request, response);

    }

    public List<SSD> getSSDByInterface(List<SSD> ssds, String[] interfaces) {
        List<SSD> list = new ArrayList<>();
        if(interfaces == null || interfaces.length ==0){
            return ssds;
        }
        for (SSD ssd : ssds) {
            for (String aInterface : interfaces) {   
                if(aInterface.equals("PCIe3")){
                    aInterface = "PCIe 3.0";
                }
                if(aInterface.equals("PCIe4")){
                    aInterface = "PCIe 4.0";
                }
                if(aInterface.equals("SATA25")){
                    aInterface = "SATA 2.5";
                }
                if(ssd.connectionInterface.toLowerCase().contains(aInterface.toLowerCase())){
                    list.add(ssd);
                }
            }
        }
        return list;
    }
    
    public List<SSD> getSSDByCache(List<SSD> ssds, String[] cache) {
        List<SSD> list = new ArrayList<>();
        if(cache == null || cache.length ==0){
            return ssds;
        }
        for (SSD ssd : ssds) {
            for (String ca : cache) {
                if(ca.equals("0") && ssd.cache == 0){
                    list.add(ssd);
                }else if( ca.equals("1") && ssd.cache !=0){
                    list.add(ssd);
                }
            }
        }
        return list;
    }

    public void getSSDsByPrice(List<SSD> ssds, double from, double to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<SSD> iterator = ssds.iterator();
        while (iterator.hasNext()) {
            SSD ssd = iterator.next();
            if ((from != 0 && ssd.sellingPrice < from) || (to != 0 && ssd.sellingPrice > to)) {
                iterator.remove();
            }
        }
    }

    public void getSSDsByCapacity(List<SSD> ssds, double from, double to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<SSD> iterator = ssds.iterator();
        while (iterator.hasNext()) {
            SSD ssd = iterator.next();
            if ((from != 0 && ssd.capacity < from) || (to != 0 && ssd.capacity > to)) {
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
