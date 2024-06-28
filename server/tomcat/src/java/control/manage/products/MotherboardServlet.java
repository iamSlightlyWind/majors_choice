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
import packages.Motherboard;

@MultipartConfig
public class MotherboardServlet extends HttpServlet {

    @SuppressWarnings("unused")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("listAll")) {
            ArrayList<Motherboard> motherboards = Database.getMotherboards("");
            request.setAttribute("motherboards", motherboards);
            request.setAttribute("titlePage", "Danh sách Motherboard");
            request.setAttribute("titleTable", "Danh sách Motherboard");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/MotherboardManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertMotherboard")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String socket = request.getParameter("socket");
                String chipset = request.getParameter("chipset");
                int igpu = Integer.parseInt(request.getParameter("igpu"));
                String formFactor = request.getParameter("formFactor");
                String ramType = request.getParameter("ramType");
                int maxRamSpeed = Integer.parseInt(request.getParameter("maxRamSpeed"));
                int maxRamCapacity = Integer.parseInt(request.getParameter("maxRamCapacity"));
                int ramSlots = Integer.parseInt(request.getParameter("ramSlots"));
                int wifi = Integer.parseInt(request.getParameter("wifi"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int result = Database.addProductMotherboard(sellingPrice, costPrice, name, socket, chipset, igpu,
                        formFactor, ramType, maxRamSpeed, maxRamCapacity, ramSlots, wifi, null, quantity);

                if (result != -1) {
                    int productId = Database.getMaxProductId();
                    String image = Database.handleFileUpload(request, "image", String.valueOf(productId));

                    int result1 = Database.addProductMotherboard(sellingPrice, costPrice, name, socket, chipset, igpu,
                            formFactor, ramType, maxRamSpeed, maxRamCapacity, ramSlots, wifi, image, quantity);
                    response.sendRedirect("motherboards?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi thêm Motherboard");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertMotherboard.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertMotherboard.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int id = Integer.parseInt(request.getParameter("id"));
                Motherboard motherboard = new Motherboard(id);
                if (motherboard != null) {
                    request.setAttribute("motherboard", motherboard);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateMotherboard.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy CPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateMotherboard.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String socket = request.getParameter("socket");
                String chipset = request.getParameter("chipset");
                int igpu = Integer.parseInt(request.getParameter("igpu"));
                String formFactor = request.getParameter("formFactor");
                String ramType = request.getParameter("ramType");
                int maxRamSpeed = Integer.parseInt(request.getParameter("maxRamSpeed"));
                int maxRamCapacity = Integer.parseInt(request.getParameter("maxRamCapacity"));
                int ramSlots = Integer.parseInt(request.getParameter("ramSlots"));
                int wifi = Integer.parseInt(request.getParameter("wifi"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String image = Database.handleFileUpload(request, "image", Integer.toString(id));

                int result = Database.updateProductMotherboard(id, sellingPrice, costPrice, name, socket, chipset, igpu,
                        formFactor, ramType, maxRamSpeed, maxRamCapacity, ramSlots, wifi, image, quantity);
                if (result == 1) {
                    response.sendRedirect("motherboards?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật GPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateMotherboard.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Database.removeMotherboard(id);
            response.sendRedirect("motherboards");
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
