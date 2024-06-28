package control.manage.products;

import database.Database;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import packages.CPU;

@MultipartConfig
public class CPUServlet extends HttpServlet {

    @SuppressWarnings("unused")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("listAll")) {
            ArrayList<CPU> cpus = Database.getCPUs("");
            request.setAttribute("cpus", cpus);
            request.setAttribute("path", request.getServletContext().getRealPath(""));
            request.setAttribute("titlePage", "Danh sách CPU");
            request.setAttribute("titleTable", "Danh sách CPU");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/CPUManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertCPU")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                String ipgu = request.getParameter("igpu");
                String socket = request.getParameter("socket");
                int cores = Integer.parseInt(request.getParameter("cores"));
                int threads = Integer.parseInt(request.getParameter("threads"));
                int baseClock = Integer.parseInt(request.getParameter("baseClock"));
                int boostClock = Integer.parseInt(request.getParameter("boostClock"));
                int tdp = Integer.parseInt(request.getParameter("tdp"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int result = Database.addProductCPU(sellingPrice, costPrice, name, generation,
                        ipgu, socket, cores, threads, baseClock, boostClock, tdp, null, quantity);
                if (result != -1) {
                    int productId = Database.getMaxProductId();
                    String image = Database.handleFileUpload(request, "image", String.valueOf(productId));
                    int result1 = Database.addProductCPU(sellingPrice, costPrice, name, generation,
                            ipgu, socket, cores, threads, baseClock, boostClock, tdp, image, quantity);
                    response.sendRedirect("cpus?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi thêm CPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertCPU.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertCPU.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int id = Integer.parseInt(request.getParameter("id"));
                CPU cpu = new CPU(id);
                if (cpu != null) {
                    request.setAttribute("cpu", cpu);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateCPU.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy CPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateCPU.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                String igpu = request.getParameter("igpu");
                String socket = request.getParameter("socket");
                int cores = Integer.parseInt(request.getParameter("cores"));
                int threads = Integer.parseInt(request.getParameter("threads"));
                int baseClock = Integer.parseInt(request.getParameter("baseClock"));
                int boostClock = Integer.parseInt(request.getParameter("boostClock"));
                int tdp = Integer.parseInt(request.getParameter("tdp"));
                String image = Database.handleFileUpload(request, "image", Integer.toString(id));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                int result = Database.updateProductCPU(id, sellingPrice, costPrice, name, generation,
                        igpu, socket, cores, threads, baseClock, boostClock, tdp, image, quantity);

                if (result == 1) {
                    response.sendRedirect("cpus?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "  Lỗi khi cập nhật CPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateCPU.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Database.removeCPU(id);
            response.sendRedirect("cpus");
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
