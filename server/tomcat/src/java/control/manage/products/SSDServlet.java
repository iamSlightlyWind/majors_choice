package control.manage.products;

import database.Database;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.ArrayList;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
            request.setAttribute("status", (String) request.getParameter("status"));
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
                    response.sendRedirect("ssds?service=listAll&status=1");
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
                    response.sendRedirect("ssds?service=listAll&status=10");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật SSD");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateSSD.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Database.setQuantity(id);
            response.sendRedirect("ssds?status=110");
        } else if (service.equals("importExcel")) {
            Part excelFilePart = request.getPart("excel");
            InputStream fileContent = excelFilePart.getInputStream();
            Workbook workbook = new XSSFWorkbook(fileContent);
            Sheet sheet = workbook.getSheetAt(0);

            try {
                for (Row row : sheet) {
                    if (row.getRowNum() == 0) {
                        continue;
                    }

                    Cell nameCell = row.getCell(0);
                    Cell connectionInterfaceCell = row.getCell(1);
                    Cell capacityCell = row.getCell(2);
                    Cell cacheCell = row.getCell(3);
                    Cell quantityCell = row.getCell(4);
                    Cell costPriceCell = row.getCell(5);
                    Cell sellingPriceCell = row.getCell(6);

                    String name = nameCell.getStringCellValue();
                    String connectionInterface = connectionInterfaceCell.getStringCellValue();
                    int capacity = (int) capacityCell.getNumericCellValue();
                    int cache = (int) cacheCell.getNumericCellValue();
                    int quantity = (int) quantityCell.getNumericCellValue();
                    double costPrice = costPriceCell.getNumericCellValue();
                    double sellingPrice = sellingPriceCell.getNumericCellValue();

                    int result = Database.addProductSSD(sellingPrice, costPrice, name, connectionInterface, capacity, cache, null, quantity);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            workbook.close();
            response.sendRedirect(request.getContextPath() + "/ssds?service=listAll&status=111");
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
