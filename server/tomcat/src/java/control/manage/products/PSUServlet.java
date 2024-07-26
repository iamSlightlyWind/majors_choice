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
            ArrayList<PSU> psus;
            String searchName = request.getParameter("searchName");
            if (searchName != null) {
                psus = Database.getPSUs(searchName);
            } else {
                psus = Database.getPSUs("");
            }
            request.setAttribute("psus", psus);
            request.setAttribute("searchName", searchName);
            request.setAttribute("titlePage", "Danh sách PSU");
            request.setAttribute("titleTable", "Danh sách PSU");
            request.setAttribute("status", (String) request.getParameter("status"));
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

                int result1 = Database.addProductPSU(sellingPrice, costPrice, name, wattage, efficiency, null, quantity);

                if (result1 == 1) {
                    int productId = Database.getMaxProductId();
                    String image = Database.handleFileUpload(request, "image", String.valueOf(productId));
                    int result = Database.addProductPSU(sellingPrice, costPrice, name, wattage, efficiency, image,
                            quantity);
                    response.sendRedirect("psus?service=listAll&status=1");
                } else {
                    response.sendRedirect("psus?service=listAll&status=12");
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
                    response.sendRedirect("psus?service=listAll&status=10");
                } else {
                    response.sendRedirect("psus?service=listAll&status=11");
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Database.setQuantity(id);
            response.sendRedirect("psus?status=110");
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
                    Cell wattageCell = row.getCell(1);
                    Cell efficiencyCell = row.getCell(2);
                    Cell quantityCell = row.getCell(3);
                    Cell costPriceCell = row.getCell(4);
                    Cell sellingPriceCell = row.getCell(5);

                    String name = nameCell.getStringCellValue();
                    int wattage = (int) wattageCell.getNumericCellValue();
                    String efficiency = efficiencyCell.getStringCellValue();
                    int quantity = (int) quantityCell.getNumericCellValue();
                    double costPrice = costPriceCell.getNumericCellValue();
                    double sellingPrice = sellingPriceCell.getNumericCellValue();

                    int result = Database.addProductPSU(sellingPrice, costPrice, name, wattage, efficiency, null, quantity);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            workbook.close();
            response.sendRedirect(request.getContextPath() + "/psus?service=listAll&status=111");
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
