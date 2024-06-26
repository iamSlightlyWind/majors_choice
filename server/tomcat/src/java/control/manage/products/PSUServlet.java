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
import packages.PSU;

@MultipartConfig
public class PSUServlet extends HttpServlet {

    @SuppressWarnings("unused")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("listAll")) {
            ArrayList<PSU> psus = Database.getPSUs("");
            request.setAttribute("psus", psus);
            request.setAttribute("titlePage", "Danh sách PSU");
            request.setAttribute("titleTable", "Danh sách PSU");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/PSUManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertPSU")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                int wattage = Integer.parseInt(request.getParameter("wattage"));
                String efficiency = request.getParameter("efficiency");
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                int result = Database.addProductPSU(sellingPrice, costPrice, name, wattage, efficiency, null, quantity);

                if (result != -1) {
                    int productId = Database.getMaxProductId();
                    String image = Database.handleFileUpload(request, "image", String.valueOf(productId));
                    int result1 = Database.addProductPSU(sellingPrice, costPrice, name, wattage, efficiency, image,
                            quantity);
                    response.sendRedirect("psus?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi thêm PSU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertPSU.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertPSU.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int id = Integer.parseInt(request.getParameter("id"));
                PSU psu = new PSU(id);
                if (psu != null) {
                    request.setAttribute("psu", psu);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updatePSU.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy CPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updatePSU.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                int wattage = Integer.parseInt(request.getParameter("wattage"));
                String efficiency = request.getParameter("efficiency");
                String image = Database.handleFileUpload(request, "image", Integer.toString(id));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                int result = Database.updateProductPSU(id, sellingPrice, costPrice, name, wattage, efficiency, image,
                        quantity);
                if (result == 1) {
                    response.sendRedirect("psus?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật PSU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updatePSU.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Database.setQuantity(id);
            response.sendRedirect("psus");
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
