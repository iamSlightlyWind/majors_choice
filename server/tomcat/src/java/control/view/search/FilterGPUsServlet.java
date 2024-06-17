package control.view.search;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.List;
import packages.GPU;

public class FilterGPUsServlet extends HttpServlet {

    Database db = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String brand = request.getParameter("brand");
        String generation = request.getParameter("generation");
        String fromVRAM_raw = request.getParameter("fromVRAM");
        String toVRAM_raw = request.getParameter("toVRAM");
        String fromTDP_raw = request.getParameter("fromTDP");
        String toTDP_raw = request.getParameter("toTDP");

        double fromP = (from_raw == null || from_raw.isEmpty()) ? 0 : Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty()) ? 0 : Double.parseDouble(to_raw);
        int fromVRAM = (fromVRAM_raw == null || fromVRAM_raw.isEmpty()) ? 0 : Integer.parseInt(fromVRAM_raw);
        int toVRAM = (toVRAM_raw == null || toVRAM_raw.isEmpty()) ? 0 : Integer.parseInt(toVRAM_raw);
        int fromTDP = (fromTDP_raw == null || fromTDP_raw.isEmpty()) ? 0 : Integer.parseInt(fromTDP_raw);
        int toCTDP = (toTDP_raw == null || toTDP_raw.isEmpty()) ? 0 : Integer.parseInt(toTDP_raw);

        List<GPU> gpus = db.getGPUs(brand);

        if (generation != null) {
            getGPUsByGeneration(gpus, generation);
        }

        getGPUsByPrice(gpus, fromP, toP);

        getGPUsByVRAM(gpus, fromVRAM, toVRAM);

        getGPUsByTDP(gpus, fromTDP, toCTDP);

        request.setAttribute("gpus", gpus);
        request.getRequestDispatcher("/view/gpus.jsp").forward(request, response);
    }

    public void getGPUsByGeneration(List<GPU> gpus, String generation) {
        Iterator<GPU> iterator = gpus.iterator();

        while (iterator.hasNext()) {
            GPU gpu = iterator.next();
            if (!gpu.generation.toLowerCase().contains(generation)) {
                iterator.remove();
            }
        }
    }

    public void getGPUsByVRAM(List<GPU> gpus, int from, int to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<GPU> iterator = gpus.iterator();
        while (iterator.hasNext()) {
            GPU gpu = iterator.next();

            if ((from != 0 && gpu.vram < from) || (to != 0 && gpu.vram > to)) {
                iterator.remove();
            }
        }
    }

    public void getGPUsByTDP(List<GPU> gpus, int from, int to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<GPU> iterator = gpus.iterator();
        while (iterator.hasNext()) {
            GPU gpu = iterator.next();
            if ((from != 0 && gpu.tdp < from) || (to != 0 && gpu.tdp > to)) {
                iterator.remove();
            }
        }
    }

    public void getGPUsByPrice(List<GPU> gpus, double from, double to) {
        if (from == 0 && to == 0) {
            return;
        }
        Iterator<GPU> iterator = gpus.iterator();
        while (iterator.hasNext()) {
            GPU gpu = iterator.next();
            if ((from != 0 && gpu.sellingPrice < from) || (to != 0 && gpu.sellingPrice > to)) {
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
