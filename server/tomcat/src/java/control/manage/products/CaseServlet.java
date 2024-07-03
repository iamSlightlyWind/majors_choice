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
import packages.Case;

@MultipartConfig
public class CaseServlet extends HttpServlet {

    @SuppressWarnings("unused")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("listAll")) {
            ArrayList<Case> cases = Database.getCases("");
            request.setAttribute("cases", cases);
            request.setAttribute("titlePage", "Danh sách Case");
            request.setAttribute("titleTable", "Danh sách Case");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/CaseManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertCase")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String formFactor = request.getParameter("formFactor");
                String color = request.getParameter("color");
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                int result = Database.addProductCase(sellingPrice, costPrice, name, formFactor, color, null, quantity);
                if (result != -1) {
                    int productId = Database.getMaxProductId();
                    String image = Database.handleFileUpload(request, "image", String.valueOf(productId));
                    int result1 = Database.addProductCase(sellingPrice, costPrice, name, formFactor, color, image, quantity);
                    response.sendRedirect("cases?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi thêm Case");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertCase.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertCase.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int id = Integer.parseInt(request.getParameter("id"));
                Case caseItem = new Case(id);
                if (caseItem != null) {
                    request.setAttribute("caseItem", caseItem);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateCase.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy Case");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateCase.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String formFactor = request.getParameter("formFactor");
                String color = request.getParameter("color");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String image = Database.handleFileUpload(request, "image", Integer.toString(id));

                int result = Database.updateProductCase(id, sellingPrice, costPrice, name, formFactor, color, image, quantity);

                if (result == 1) {
                    response.sendRedirect("cases?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật Case");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateCase.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Database.setQuantity(id);
            response.sendRedirect("cases");
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
