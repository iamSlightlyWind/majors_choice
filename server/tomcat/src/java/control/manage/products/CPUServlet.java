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
import packages.CPU;

@MultipartConfig
public class CPUServlet extends HttpServlet {

    @SuppressWarnings("unused")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }
        if (service.equals("listAll")) {
            ArrayList<CPU> cpus;
            String searchName = request.getParameter("searchName");
            if (searchName != null) {
                cpus = Database.getCPUs(searchName);
            } else {
                cpus = Database.getCPUs("");
            }
            request.setAttribute("cpus", cpus);
            request.setAttribute("searchName", searchName);
            request.setAttribute("path", request.getServletContext().getRealPath(""));
            request.setAttribute("titlePage", "Danh sách CPU");
            request.setAttribute("titleTable", "Danh sách CPU");
            request.setAttribute("status", request.getParameter("status"));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/CPUManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertCPU")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                String ipgu = request.getParameter("igpu");
                String socket = request.getParameter("socket");
                int cores = Integer.parseInt(request.getParameter("cores"));
                int threads = Integer.parseInt(request.getParameter("threads"));
                int baseClock = Integer.parseInt(request.getParameter("baseClock"));
                int boostClock = Integer.parseInt(request.getParameter("boostClock"));
                int tdp = Integer.parseInt(request.getParameter("tdp"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int productId = Database.getMaxProductId();
                String image = Database.handleFileUpload(request, "image", String.valueOf(productId));
                int result = Database.addProductCPU(sellingPrice, costPrice, name, generation,
                        ipgu, socket, cores, threads, baseClock, boostClock, tdp, image, quantity);
                if (result == 1) {
                    response.sendRedirect("cpus?service=listAll&status=1");
                } else {
                    response.sendRedirect("cpus?service=listAll&status=12");
                } 
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertCPU.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            String submit = request.getParameter("submit");
            if (submit == null) {
                int id = Integer.parseInt(request.getParameter("id"));
                CPU cpu = new CPU(id);
                if (cpu != null) {
                    request.setAttribute("cpu", cpu);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateCPU.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy CPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateCPU.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                String igpu = request.getParameter("igpu");
                String socket = request.getParameter("socket");
                int cores = Integer.parseInt(request.getParameter("cores"));
                int threads = Integer.parseInt(request.getParameter("threads"));
                int baseClock = Integer.parseInt(request.getParameter("baseClock"));
                int boostClock = Integer.parseInt(request.getParameter("boostClock"));
                int tdp = Integer.parseInt(request.getParameter("tdp"));
                String image = Database.handleFileUpload(request, "image", Integer.toString(id));
                int quantity = Integer.parseInt(request.getParameter("quantity"));

                int result = Database.updateProductCPU(id, sellingPrice, costPrice, name, generation,
                        igpu, socket, cores, threads, baseClock, boostClock, tdp, image, quantity);

                if (result == 1) {
                    response.sendRedirect("cpus?service=listAll&status=10");
                } else {
                    response.sendRedirect("cpus?service=listAll&status=11");
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Database.setQuantity(id);
            response.sendRedirect("cpus?status=110");
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
                    Cell igpuCell = row.getCell(2);
                    Cell socketCell = row.getCell(3);
                    Cell coresCell = row.getCell(4);
                    Cell threadsCell = row.getCell(5);
                    Cell baseClockCell = row.getCell(6);
                    Cell boostClockCell = row.getCell(7);
                    Cell tdpCell = row.getCell(8);
                    Cell quantityCell = row.getCell(9);
                    Cell costPriceCell = row.getCell(10);
                    Cell sellingPriceCell = row.getCell(11);
                    String name = nameCell.getStringCellValue();
                    String generation = generationCell.getStringCellValue();
                    String igpu = (igpuCell != null) ? igpuCell.getStringCellValue() : "";
                    String socket = socketCell.getStringCellValue();
                    int cores = (int) coresCell.getNumericCellValue();
                    int threads = (int) threadsCell.getNumericCellValue();
                    int baseClock = (int) baseClockCell.getNumericCellValue();
                    int boostClock = (int) boostClockCell.getNumericCellValue();
                    int tdp = (int) tdpCell.getNumericCellValue();
                    int quantity = (int) quantityCell.getNumericCellValue();
                    double costPrice = costPriceCell.getNumericCellValue();
                    double sellingPrice = sellingPriceCell.getNumericCellValue();
                    Database.addProductCPU(sellingPrice, costPrice, name, generation, igpu, socket,
                            cores, threads, baseClock, boostClock, tdp, null, quantity);
                    int result = Database.addProductCPU(sellingPrice, costPrice, name,
                            generation, igpu, socket, cores, threads, baseClock, boostClock, tdp, null, quantity);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            workbook.close();
            response.sendRedirect(request.getContextPath() + "/cpus?service=listAll&status=111");
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
