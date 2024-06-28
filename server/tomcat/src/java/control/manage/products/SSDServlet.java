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
import packages.SSD;

@MultipartConfig
public class SSDServlet extends HttpServlet {

    @SuppressWarnings("unused")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }
        if (service.equals("listAll")) {
            ArrayList<SSD> ssds = Database.getSSDs("");
            request.setAttribute("ssds", ssds);
            request.setAttribute("titlePage", "Danh sách SSD");
            request.setAttribute("titleTable", "Danh sách SSD");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/SSDManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertSSD")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String connectionInterface = request.getParameter("interface");
                int capacity = Integer.parseInt(request.getParameter("capacity"));
                int cache = Integer.parseInt(request.getParameter("cache"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int result = Database.addProductSSD(sellingPrice, costPrice, name, connectionInterface, capacity, cache,
                        null, quantity);

                if (result != -1) {
                    int productId = Database.getMaxProductId();
                    String image = Database.handleFileUpload(request, "image", String.valueOf(productId));
                    int result1 = Database.addProductSSD(sellingPrice, costPrice, name, connectionInterface, capacity,
                            cache, image, quantity);
                    response.sendRedirect("ssds?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi thêm SSD");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertSSD.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertSSD.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int id = Integer.parseInt(request.getParameter("id"));
                SSD ssd = new SSD(id);
                if (ssd != null) {
                    request.setAttribute("ssd", ssd);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateSSD.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy SSD");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateSSD.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String connectionInterface = request.getParameter("interface");
                int capacity = Integer.parseInt(request.getParameter("capacity"));
                int cache = Integer.parseInt(request.getParameter("cache"));
                String image = Database.handleFileUpload(request, "image", Integer.toString(id));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                int result = Database.updateProductSSD(id, sellingPrice, costPrice, name, connectionInterface, capacity,
                        cache, image, quantity);
                if (result == 1) {
                    response.sendRedirect("ssds?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật SSD");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateSSD.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Database.removeSSD(id);
            response.sendRedirect("ssds");
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
