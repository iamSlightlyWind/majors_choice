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
import packages.RAM;

public class FilterRAMsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("nameSearch") == null ? "" : request.getParameter("nameSearch");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String latency[] = request.getParameterValues("latency");
        String generation[] = request.getParameterValues("generation");
        String speed[] = request.getParameterValues("speed");
        String capacity[] = request.getParameterValues("capacity");

        double fromP = (from_raw == null || from_raw.isEmpty()) ? 0 : Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty()) ? 0 : Double.parseDouble(to_raw);

        List<RAM> list = Database.getRAMs(name);
        List<RAM> list1 = getRAMsBySpeed(list, speed);
        List<RAM> list2 = getRAMsByCapacity(list1, capacity);
        List<RAM> list3 = getRAMsByGeneration(list2, generation);
        List<RAM> rams = getRAMsByLatency(list3, latency);

        getRAMsByPrice(rams, fromP, toP);

        request.setAttribute("searchName", name);
        request.setAttribute("from", from_raw);
        request.setAttribute("to", to_raw);
        request.setAttribute("latess", latency);
        request.setAttribute("generations", generation);
        request.setAttribute("speeds", speed);
        request.setAttribute("capacitys", capacity);

        request.setAttribute("rams", rams);
        request.getRequestDispatcher("/view/rams.jsp").forward(request, response);
    }

    public List<RAM> getRAMsByGeneration(List<RAM> rams, String[] generations) {
        List<RAM> list = new ArrayList<>();
        if (generations == null || generations.length == 0) {
            return rams;
        }
        for (RAM ram : rams) {
            for (String generation : generations) {
                if (ram.generation.toLowerCase().contains(generation.toLowerCase())) {
                    list.add(ram);
                }
            }
        }
        return list;
    }

    public List<RAM> getRAMsByLatency(List<RAM> rams, String[] latencys) {
        List<RAM> list = new ArrayList<>();
        if (latencys == null || latencys.length == 0) {
            return rams;
        }
        for (RAM ram : rams) {
            for (String latency : latencys) {
                if (latency.contains(String.valueOf(ram.latency))) {
                    list.add(ram);
                }
            }
        }
        return list;
    }

    public List<RAM> getRAMsBySpeed(List<RAM> rams, String[] speeds) {
        List<RAM> list = new ArrayList<>();
        if (speeds == null || speeds.length == 0) {
            return rams;
        }
        for (RAM ram : rams) {
            for (String speed : speeds) {
                if (speed.contains(String.valueOf(ram.speed))) {
                    list.add(ram);
                }
            }
        }
        return list;
    }

    public List<RAM> getRAMsByCapacity(List<RAM> rams, String[] capacitys) {
        List<RAM> list = new ArrayList<>();
        if (capacitys == null || capacitys.length == 0) {
            return rams;
        }
        for (RAM ram : rams) {
            for (String caString : capacitys) {
                if (caString.contains(String.valueOf(ram.capacity))) {
                    list.add(ram);
                }
            }
        }
        return list;
    }

    public void getRAMsByPrice(List<RAM> rams, double from, double to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<RAM> iterator = rams.iterator();
        while (iterator.hasNext()) {
            RAM ram = iterator.next();
            if ((from != 0 && ram.sellingPrice < from) || (to != 0 && ram.sellingPrice > to)) {
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
