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
import packages.RAM;

@MultipartConfig
public class RAMServlet extends HttpServlet {

    @SuppressWarnings("unused")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("listAll")) {
            ArrayList<RAM> rams = Database.getRAMs("");
            request.setAttribute("rams", rams);
            request.setAttribute("titlePage", "Danh sách RAM");
            request.setAttribute("titleTable", "Danh sách RAM");
            request.setAttribute("status", (String) request.getParameter("status"));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/RAMManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertRAM")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                int capacity = Integer.parseInt(request.getParameter("capacity"));
                int speed = Integer.parseInt(request.getParameter("speed"));
                int latency = Integer.parseInt(request.getParameter("latency"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int result = Database.addProductRAM(sellingPrice, costPrice, name, generation, capacity, speed, latency,
                        null, quantity);

                if (result != -1) {
                    int productId = Database.getMaxProductId();
                    String image = Database.handleFileUpload(request, "image", String.valueOf(productId));
                    int result1 = Database.addProductRAM(sellingPrice, costPrice, name, generation, capacity, speed,
                            latency, image, quantity);
                    response.sendRedirect("rams?service=listAll&status=1");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi thêm RAM");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertRAM.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertRAM.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int id = Integer.parseInt(request.getParameter("id"));
                RAM ram = new RAM(id);
                if (ram != null) {
                    request.setAttribute("ram", ram);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateRAM.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy RAM");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateRAM.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                int capacity = Integer.parseInt(request.getParameter("capacity"));
                int speed = Integer.parseInt(request.getParameter("speed"));
                int latency = Integer.parseInt(request.getParameter("latency"));
                String image = Database.handleFileUpload(request, "image", Integer.toString(id));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                int result = Database.updateProductRAM(id, sellingPrice, costPrice, name, generation, capacity, speed,
                        latency, image, quantity);
                if (result == 1) {
                    response.sendRedirect("rams?service=listAll&status=10");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật RAM");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateRAM.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Database.removeRAM(id);
            response.sendRedirect("rams?status=110");
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
                    Cell generationCell = row.getCell(1);
                    Cell capacityCell = row.getCell(2);
                    Cell speedCell = row.getCell(3);
                    Cell latencyCell = row.getCell(4);
                    Cell quantityCell = row.getCell(5);
                    Cell costPriceCell = row.getCell(6);
                    Cell sellingPriceCell = row.getCell(7);

                    String name = nameCell.getStringCellValue();
                    String generation = generationCell.getStringCellValue();
                    int capacity = (int) capacityCell.getNumericCellValue();
                    int speed = (int) speedCell.getNumericCellValue();
                    int latency = (int) latencyCell.getNumericCellValue();
                    int quantity = (int) quantityCell.getNumericCellValue();
                    double costPrice = costPriceCell.getNumericCellValue();
                    double sellingPrice = sellingPriceCell.getNumericCellValue();

                    int result = Database.addProductRAM(sellingPrice, costPrice, name, generation, capacity, speed, latency, null, quantity);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            workbook.close();
            response.sendRedirect(request.getContextPath() + "/rams?service=listAll&status=111");
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
