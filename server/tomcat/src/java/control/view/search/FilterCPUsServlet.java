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
import packages.CPU;

public class FilterCPUsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = (request.getParameter("nameSearch") == null) ? "" : request.getParameter("nameSearch");
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String[] brands = request.getParameterValues("brand");
        String[] generations = request.getParameterValues("generation");
        String[] sockets = request.getParameterValues("socket");
        String fromCore_raw = request.getParameter("fromCores");
        String toCore_raw = request.getParameter("toCores");
        String fromTDP_raw = request.getParameter("fromTDP");
        String toTDP_raw = request.getParameter("toTDP");

        double fromP = (from_raw == null || from_raw.isEmpty()) ? 0 : Double.parseDouble(from_raw);
        double toP = (to_raw == null || to_raw.isEmpty()) ? 0 : Double.parseDouble(to_raw);
        int fromCore = (fromCore_raw == null || fromCore_raw.isEmpty()) ? 0 : Integer.parseInt(fromCore_raw);
        int toCore = (toCore_raw == null || toCore_raw.isEmpty()) ? 0 : Integer.parseInt(toCore_raw);
        int fromTDP = (fromTDP_raw == null || fromTDP_raw.isEmpty()) ? 0 : Integer.parseInt(fromTDP_raw);
        int toCTDP = (toTDP_raw == null || toTDP_raw.isEmpty()) ? 0 : Integer.parseInt(toTDP_raw);

        List<CPU> list = Database.getCPUs(name);
        List<CPU> list1 = getCPUsByGeneration(list, generations);
        List<CPU> list2 = getCPUsBySocket(list1, sockets);
        List<CPU> cpus = getCPUsByBrand(list2, brands);

        getCPUsByCore(cpus, fromCore, toCore);
        getCPUsByTDP(cpus, fromTDP, toCTDP);
        getCPUsByPrice(cpus, fromP, toP);

        request.setAttribute("searchName", name);
        request.setAttribute("from", from_raw);
        request.setAttribute("to", to_raw);
        request.setAttribute("fromCore", fromCore_raw);
        request.setAttribute("toCore", toCore_raw);
        request.setAttribute("fromTDP", fromTDP_raw);
        request.setAttribute("toTDP", toTDP_raw);
        request.setAttribute("brands", brands);
        request.setAttribute("generations", generations);
        request.setAttribute("sockets", sockets);
        request.setAttribute("cpus", cpus);
        request.getRequestDispatcher("/view/cpus.jsp").forward(request, response);
    }

    public List<CPU> getCPUsByGeneration(List<CPU> cpus, String[] generations) {
        List<CPU> list = new ArrayList<>();
        if (generations == null || generations.length == 0) {
            return cpus;
        }
        for (CPU cpu : cpus) {
            for (String geString : generations) {
                if (geString.equals("raptorlake")) {
                    geString = "raptor lake";
                }
                if (cpu.generation.toLowerCase().contains(geString.toLowerCase())) {
                    list.add(cpu);
                }
            }
        }
        return list;
    }

    public List<CPU> getCPUsBySocket(List<CPU> cpus, String[] sockets) {
        List<CPU> list = new ArrayList<>();
        if (sockets == null || sockets.length == 0) {
            return cpus;
        }
        for (CPU cpu : cpus) {
            for (String socket : sockets) {

                if (socket.equals("lga1700")) {
                    socket = "lga 1700";
                }
                if (cpu.socket.toLowerCase().contains(socket.toLowerCase())) {
                    list.add(cpu);
                }
            }
        }
        return list;
    }

    public List<CPU> getCPUsByBrand(List<CPU> cpus, String[] brands) {
        List<CPU> list = new ArrayList<>();
        if (brands == null || brands.length == 0) {
            return cpus;
        }
        for (CPU cpu : cpus) {
            for (String brand : brands) {
                if (cpu.name.toLowerCase().contains(brand.toLowerCase())) {
                    list.add(cpu);
                }
            }
        }
        return list;
    }

    public void getCPUsByCore(List<CPU> cpus, int from, int to) {
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

    public void getCPUsByTDP(List<CPU> cpus, int from, int to) {
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
