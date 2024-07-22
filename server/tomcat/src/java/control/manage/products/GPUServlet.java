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
import packages.GPU;

@MultipartConfig
public class GPUServlet extends HttpServlet {

    @SuppressWarnings("unused")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("listAll")) {
            ArrayList<GPU> gpus = Database.getGPUs("");
            request.setAttribute("gpus", gpus);
            request.setAttribute("titlePage", "Danh sách GPU");
            request.setAttribute("titleTable", "Danh sách GPU");
            request.setAttribute("status", (String) request.getParameter("status"));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/GPUManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertGPU")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                int vram = Integer.parseInt(request.getParameter("vram"));
                int baseClock = Integer.parseInt(request.getParameter("baseClock"));
                int boostClock = Integer.parseInt(request.getParameter("boostClock"));
                int tdp = Integer.parseInt(request.getParameter("tdp"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                int result = Database.addProductGPU(sellingPrice, costPrice, name,
                        generation, vram, baseClock, boostClock, tdp, null, quantity);
                if (result != -1) {
                    int productId = Database.getMaxProductId();
                    String image = Database.handleFileUpload(request, "image", String.valueOf(productId));
                    int result1 = Database.addProductGPU(sellingPrice, costPrice, name, generation, vram, baseClock,
                            boostClock, tdp, image, quantity);
                    response.sendRedirect("gpus?service=listAll&status=1");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi thêm GPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertGPU.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertGPU.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int id = Integer.parseInt(request.getParameter("id"));
                GPU gpu = new GPU(id);
                if (gpu != null) {
                    request.setAttribute("gpu", gpu);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateGPU.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy GPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateGPU.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                int vram = Integer.parseInt(request.getParameter("vram"));
                int baseClock = Integer.parseInt(request.getParameter("baseClock"));
                int boostClock = Integer.parseInt(request.getParameter("boostClock"));
                int tdp = Integer.parseInt(request.getParameter("tdp"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String image = Database.handleFileUpload(request, "image", Integer.toString(id));
                int result = Database.updateProductGPU(id, sellingPrice, costPrice, name, generation, vram, baseClock,
                        boostClock, tdp, image, quantity);
                if (result == 1) {
                    response.sendRedirect("gpus?service=listAll&status=10");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật GPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateGPU.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Database.setQuantity(id);
            response.sendRedirect("gpus?status=110");
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
                    Cell vramCell = row.getCell(2);
                    Cell baseClockCell = row.getCell(3);
                    Cell boostClockCell = row.getCell(4);
                    Cell tdpCell = row.getCell(5);
                    Cell quantityCell = row.getCell(6);
                    Cell costPriceCell = row.getCell(7);
                    Cell sellingPriceCell = row.getCell(8);

                    String name = nameCell.getStringCellValue();
                    String generation = generationCell.getStringCellValue();
                    int vram = (int) vramCell.getNumericCellValue();
                    int baseClock = (int) baseClockCell.getNumericCellValue();
                    int boostClock = (int) boostClockCell.getNumericCellValue();
                    int tdp = (int) tdpCell.getNumericCellValue();
                    int quantity = (int) quantityCell.getNumericCellValue();
                    double costPrice = costPriceCell.getNumericCellValue();
                    double sellingPrice = sellingPriceCell.getNumericCellValue();

                    int result = Database.addProductGPU(sellingPrice, costPrice, name, generation, vram, baseClock, boostClock, tdp, null, quantity);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            workbook.close();
            response.sendRedirect(request.getContextPath() + "/gpus?service=listAll&status=111");
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
