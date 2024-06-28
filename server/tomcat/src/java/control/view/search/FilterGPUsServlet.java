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
import packages.GPU;

public class FilterGPUsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = (request.getParameter("nameSearch") == null) ? "" : request.getParameter("nameSearch");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String brand[] = request.getParameterValues("brand");
        String generation[] = request.getParameterValues("generation");
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

        List<GPU> list = Database.getGPUs(name);
        List<GPU> list1 = getGPUsByBrand(list, brand);
        List<GPU> gpus = getGPUsByGeneration(list1, generation);

        getGPUsByPrice(gpus, fromP, toP);
        getGPUsByVRAM(gpus, fromVRAM, toVRAM);
        getGPUsByTDP(gpus, fromTDP, toCTDP);

        request.setAttribute("searchName", name);
        request.setAttribute("from", from_raw);
        request.setAttribute("to", to_raw);
        request.setAttribute("fromVRAM", fromVRAM_raw);
        request.setAttribute("toVRAM", toVRAM_raw);
        request.setAttribute("fromTDP", fromTDP_raw);
        request.setAttribute("toTDP", toTDP_raw);
        request.setAttribute("generations", generation);
        request.setAttribute("brands", brand);
        request.setAttribute("gpus", gpus);
        request.getRequestDispatcher("/view/gpus.jsp").forward(request, response);
    }

    public List<GPU> getGPUsByGeneration(List<GPU> gpus, String[] generations) {
        List<GPU> list = new ArrayList<>();
        if (generations == null || generations.length == 0) {
            return gpus;
        }
        for (GPU gpu : gpus) {
            for (String generation : generations) {
                if (generation.equals("adalovelace")) {
                    generation = "ada lovelace";
                }
                if (gpu.generation.toLowerCase().contains(generation.toLowerCase())) {
                    list.add(gpu);
                }
            }
        }
        return list;
    }

    public List<GPU> getGPUsByBrand(List<GPU> gpus, String[] brands) {
        List<GPU> list = new ArrayList<>();
        if (brands == null || brands.length == 0) {
            return gpus;
        }
        for (GPU gpu : gpus) {
            for (String brand : brands) {
                if (gpu.name.toLowerCase().contains(brand.toLowerCase())) {
                    list.add(gpu);
                }
            }
        }
        return list;
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
