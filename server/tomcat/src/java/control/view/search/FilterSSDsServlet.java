package control.view.search;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.List;
import packages.SSD;

public class FilterSSDsServlet extends HttpServlet {

    Database db = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String interfaces = request.getParameter("interfaces");
        String cache_raw = request.getParameter("cache");
        String fromCapacity_raw = request.getParameter("fromCapacity");
        String toCapacity_raw = request.getParameter("toCapacity");

        double fromP = (from_raw == null || from_raw.isEmpty()) ? 0 : Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty()) ? 0 : Double.parseDouble(to_raw);
        int cache = (cache_raw == null || cache_raw.isEmpty()) ? 0 : Integer.parseInt(cache_raw);
        int fromCapacity = (fromCapacity_raw == null || fromCapacity_raw.isEmpty()) ? 0 : Integer.parseInt(fromCapacity_raw);
        int toCapacity = (toCapacity_raw == null || toCapacity_raw.isEmpty()) ? 0 : Integer.parseInt(toCapacity_raw);

        List<SSD> ssds = db.getSSDs("");

        if (interfaces != null) {
            getSSDByInterface(ssds, interfaces);
        }

        getSSDByCache(ssds, cache);

        getSSDsByPrice(ssds, fromP, toP);

        getSSDsByCapacity(ssds, fromCapacity, toCapacity);

        request.setAttribute("ssds", ssds);
        request.getRequestDispatcher("/view/ssds.jsp").forward(request, response);

    }

    public void getSSDByInterface(List<SSD> ssds, String interfaces) {
        Iterator<SSD> iterator = ssds.iterator();

        while (iterator.hasNext()) {
            SSD ssd = iterator.next();
            if (!ssd.connectionInterface.toLowerCase().contains(interfaces)) {
                iterator.remove();
            }
        }
    }

    public void getSSDByCache(List<SSD> ssds, int cache) {
        Iterator<SSD> iterator = ssds.iterator();
        if (cache == 0) {
            while (iterator.hasNext()) {
                SSD ssd = iterator.next();
                if (ssd.cache != 0) {
                    iterator.remove();
                }
            }
        } else {
            while (iterator.hasNext()) {
                SSD ssd = iterator.next();
                if (ssd.cache == 0) {
                    iterator.remove();
                }
            }
        }
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
