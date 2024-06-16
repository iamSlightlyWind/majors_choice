package Controller;

import database.Database;
import jakarta.servlet.RequestDispatcher;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import packages.CPU;

@MultipartConfig
public class CPUServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }
        Database db = new Database();

        if (service.equals("listAll")) {
            System.out.println(">> List all CPUs");
            ArrayList<CPU> cpus = db.getCPUs("{call getCPU()}");
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
                String socket = request.getParameter("socket");
                int cores = Integer.parseInt(request.getParameter("cores"));
                int threads = Integer.parseInt(request.getParameter("threads"));
                int baseClock = Integer.parseInt(request.getParameter("baseClock"));
                int boostClock = Integer.parseInt(request.getParameter("boostClock"));
                int tdp = Integer.parseInt(request.getParameter("tdp"));
                int result = db.addProductCPU(sellingPrice, costPrice, name, generation, socket, cores, threads, baseClock, boostClock, tdp, null);
                if (result != -1) {
                    int productId = db.getMaxProductId();
                    String image = handleFileUpload(request, "image", String.valueOf(productId));
                    System.out.println("<< Image " + image);

                    int result1 = db.addProductCPU(sellingPrice, costPrice, name, generation, socket, cores, threads, baseClock, boostClock, tdp, image);
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
            // Kiểm tra xem có submit form hay chưa
            String submit = request.getParameter("submit");
            if (submit == null) {
                // Lấy id từ request
                int id = Integer.parseInt(request.getParameter("id"));
                // Lấy thông tin CPU theo id để update
                ArrayList<CPU> cpus = db
                        .getCPUs("select * from cpus join products on cpus.id= products.id where cpus.id = " + id);
                if (!cpus.isEmpty()) {
                    CPU cpu = cpus.get(0);
                    request.setAttribute("cpus", cpu);
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
                String socket = request.getParameter("socket");
                int cores = Integer.parseInt(request.getParameter("cores"));
                int threads = Integer.parseInt(request.getParameter("threads"));
                int baseClock = Integer.parseInt(request.getParameter("baseClock"));
                int boostClock = Integer.parseInt(request.getParameter("boostClock"));
                int tdp = Integer.parseInt(request.getParameter("tdp"));
                String image = handleFileUpload(request, "image", Integer.toString(id));

                System.out.println(">> Image: " + image);

                int result = db.updateProductCPU(id, sellingPrice, costPrice, name, generation, socket, cores, threads,
                        baseClock, boostClock, tdp, image);

                if (result == 1) {
                    response.sendRedirect("cpus?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật CPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateCPU.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            db.removeCPU(id);
            response.sendRedirect("cpus");
        }
    }

    private String handleFileUpload(HttpServletRequest request, String inputName, String productID) {
        try {
            Part filePart = request.getPart(inputName);
            String fileName = productID + ".png";

            String uploadPath = request.getServletContext().getRealPath("");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            filePart.write(uploadPath + File.separator + fileName);
            return uploadPath + File.separator + fileName;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
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
