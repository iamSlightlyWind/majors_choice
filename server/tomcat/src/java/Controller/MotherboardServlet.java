package Controller;

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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }
        Database db = new Database();

        if (service.equals("listAll")) {
            ArrayList<Motherboard> motherboards = db.getMotherboards("{call getMotherboard()}");
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
                String formFactor = request.getParameter("formFactor");
                String ramType = request.getParameter("ramType");
                int maxRamSpeed = Integer.parseInt(request.getParameter("maxRamSpeed"));
                int ramSlots = Integer.parseInt(request.getParameter("ramSlots"));
                int wifi = Integer.parseInt(request.getParameter("wifi"));
                int result = db.addProductMotherboard(sellingPrice, costPrice, name, socket, chipset, formFactor, ramType, maxRamSpeed, ramSlots, wifi, null);

                if (result != -1) {
                    int productId = db.getMaxProductId();
                    String image = db.handleFileUpload(request, "image", String.valueOf(productId));
                    System.out.println("<< Image " + image);

                    int result1 = db.addProductMotherboard(sellingPrice, costPrice, name, socket, chipset, formFactor, ramType, maxRamSpeed, ramSlots, wifi, image);
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
                ArrayList<Motherboard> motherboards = db.getMotherboards("select * from motherboards join products on motherboards.id= products.id where motherboards.id = " + id);
                if (!motherboards.isEmpty()) {
                    Motherboard motherboard = motherboards.get(0);
                    request.setAttribute("motherboards", motherboard);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateMotherboard.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy Motherboard");
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
                String formFactor = request.getParameter("formFactor");
                String ramType = request.getParameter("ramType");
                int maxRamSpeed = Integer.parseInt(request.getParameter("maxRamSpeed"));
                int ramSlots = Integer.parseInt(request.getParameter("ramSlots"));
                int wifi = Integer.parseInt(request.getParameter("wifi"));
                String image = db.handleFileUpload(request, "image", Integer.toString(id));
                System.out.println("<< Image " + image);

                int result = db.updateProductMotherboard(id, sellingPrice, costPrice, name, socket, chipset, formFactor, ramType, maxRamSpeed, ramSlots, wifi, image);
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
            db.removeMotherboard(id);
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
