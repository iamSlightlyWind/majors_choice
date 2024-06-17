package control.view.search;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.List;
import packages.RAM;

public class FilterRAMsServlet extends HttpServlet {

    Database db = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String latency_raw = request.getParameter("latency");
        String generation = request.getParameter("generation");
        String socket = request.getParameter("socket");
        String speed_raw = request.getParameter("speed");
        String capacity_raw = request.getParameter("capacity");

        double fromP = (from_raw == null || from_raw.isEmpty()) ? 0 : Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty()) ? 0 : Double.parseDouble(to_raw);
        int latency = (latency_raw == null || latency_raw.isEmpty()) ? 0 : Integer.parseInt(latency_raw);
        int capacity = (capacity_raw == null || capacity_raw.isEmpty()) ? 0 : Integer.parseInt(capacity_raw);
        int speed = (speed_raw == null || speed_raw.isEmpty()) ? 0 : Integer.parseInt(speed_raw);

        List<RAM> rams = db.getRAMs("");

        if (generation != null) {
            getRAMsByGeneration(rams, generation);
        }
        if (latency != 0) {
            getRAMsByLatency(rams, latency);
        }
        if (capacity != 0) {
            getRAMsByCapacity(rams, capacity);
        }
        if (speed != 0) {
            getRAMsBySpeed(rams, speed);
        }
        getRAMsByPrice(rams, fromP, toP);

        request.setAttribute("rams", rams);
        request.getRequestDispatcher("/view/rams.jsp").forward(request, response);
    }

    public void getRAMsByGeneration(List<RAM> rams, String generation) {
        Iterator<RAM> iterator = rams.iterator();

        while (iterator.hasNext()) {
            RAM ram = iterator.next();
            if (!ram.generation.toLowerCase().contains(generation)) {
                iterator.remove();
            }
        }
    }

    public void getRAMsBySpeed(List<RAM> rams, int speed) {
        Iterator<RAM> iterator = rams.iterator();

        while (iterator.hasNext()) {
            RAM ram = iterator.next();
            if (ram.speed != speed) {
                iterator.remove();
            }
        }
    }

    public void getRAMsByCapacity(List<RAM> rams, int capacity) {
        Iterator<RAM> iterator = rams.iterator();

        while (iterator.hasNext()) {
            RAM ram = iterator.next();
            if (ram.capacity != capacity) {
                iterator.remove();
            }
        }
    }

    public void getRAMsByLatency(List<RAM> rams, int latency) {
        Iterator<RAM> iterator = rams.iterator();

        while (iterator.hasNext()) {
            RAM ram = iterator.next();
            if (ram.latency != latency) {
                iterator.remove();
            }
        }
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
