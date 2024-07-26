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
            ArrayList<Motherboard> motherboards;
            String searchName = request.getParameter("searchName");
            if (searchName != null) {
                motherboards = Database.getMotherboards(searchName);
            } else {
                motherboards = Database.getMotherboards("");
            }
            request.setAttribute("motherboards", motherboards);
            request.setAttribute("searchName", searchName);
            request.setAttribute("titlePage", "Danh sách Motherboard");
            request.setAttribute("titleTable", "Danh sách Motherboard");
            request.setAttribute("status", (String) request.getParameter("status"));
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
                int result1 = Database.addProductMotherboard(sellingPrice, costPrice, name, socket, chipset, igpu,
                        formFactor, ramType, maxRamSpeed, maxRamCapacity, ramSlots, wifi, null, quantity);

                if (result1 == 1) {
                    int productId = Database.getMaxProductId();
                    String image = Database.handleFileUpload(request, "image", String.valueOf(productId));

                    int result = Database.addProductMotherboard(sellingPrice, costPrice, name, socket, chipset, igpu,
                            formFactor, ramType, maxRamSpeed, maxRamCapacity, ramSlots, wifi, image, quantity);
                    response.sendRedirect("motherboards?service=listAll&status=1");
                } else {
                   response.sendRedirect("motherboards?service=listAll&status=12");
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
                    response.sendRedirect("motherboards?service=listAll&status=10");
                } else {
                    response.sendRedirect("motherboards?service=listAll&status=11");
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Database.setQuantity(id);
            response.sendRedirect("motherboards?status=110");
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
                    Cell socketCell = row.getCell(1);
                    Cell chipsetCell = row.getCell(2);
                    Cell igpuCell = row.getCell(3);
                    Cell formFactorCell = row.getCell(4);
                    Cell ramTypeCell = row.getCell(5);
                    Cell maxRamSpeedCell = row.getCell(6);
                    Cell maxRamCapacityCell = row.getCell(7);
                    Cell ramSlotsCell = row.getCell(8);
                    Cell wifiCell = row.getCell(9);
                    Cell quantityCell = row.getCell(10);
                    Cell costPriceCell = row.getCell(11);
                    Cell sellingPriceCell = row.getCell(12);

                    String name = nameCell.getStringCellValue();
                    String socket = socketCell.getStringCellValue();
                    String chipset = chipsetCell.getStringCellValue();
                    int igpu = (int) igpuCell.getNumericCellValue();
                    String formFactor = formFactorCell.getStringCellValue();
                    String ramType = ramTypeCell.getStringCellValue();
                    int maxRamSpeed = (int) maxRamSpeedCell.getNumericCellValue();
                    int maxRamCapacity = (int) maxRamCapacityCell.getNumericCellValue();
                    int ramSlots = (int) ramSlotsCell.getNumericCellValue();
                    int wifi = (int) wifiCell.getNumericCellValue();
                    int quantity = (int) quantityCell.getNumericCellValue();
                    double costPrice = costPriceCell.getNumericCellValue();
                    double sellingPrice = sellingPriceCell.getNumericCellValue();

                    int result = Database.addProductMotherboard(sellingPrice, costPrice, name, socket, chipset, igpu, formFactor, ramType, maxRamSpeed, maxRamCapacity, ramSlots, wifi, null, quantity);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            workbook.close();
            response.sendRedirect(request.getContextPath() + "/motherboards?service=listAll&status=111");
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
