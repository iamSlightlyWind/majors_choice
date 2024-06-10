/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import database.Database;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import packages.CPU;

/**
 *
 * @author PC
 */
public class CPUServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }
        Database db = new Database();

        if (service.equals("listAll")) {
            ArrayList<CPU> cpus = db.getCPUs("{call getCPU()}");
            request.setAttribute("cpus", cpus);
            request.setAttribute("titlePage", "Danh sách CPU");
            request.setAttribute("titleTable", "Danh sách CPU");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/CPUManage.jsp");
            dispatcher.forward(request, response);
        } else if (service.equals("insertCPU")) {
            try {
                double sellingPrice = Double.parseDouble(request.getParameter("sellingPrice"));
                double costPrice = Double.parseDouble(request.getParameter("costPrice"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                String socket = request.getParameter("socket");
                int cores = Integer.parseInt(request.getParameter("cores"));
                int threads = Integer.parseInt(request.getParameter("threads"));
                int baseClock = Integer.parseInt(request.getParameter("baseClock"));
                int boostClock = Integer.parseInt(request.getParameter("boostClock"));
                int tdp = Integer.parseInt(request.getParameter("tdp"));
                String image = request.getParameter("image");

                int result = db.addProductCPU(sellingPrice, costPrice, name, generation, socket, cores, threads, baseClock, boostClock, tdp, image);
                if (result != -1) {
                    response.sendRedirect("cpus?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi thêm CPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertCPU.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException ex) {
                ex.printStackTrace();
                request.setAttribute("errorMessage", "Lỗi khi chuyển đổi kiểu dữ liệu");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/insertCPU.jsp");
                dispatcher.forward(request, response);
            }
        } else if (service.equals("update")) {
            // Kiểm tra xem có submit form hay chưa
            String submit = request.getParameter("submit");
            if (submit == null) {
                // Lấy id từ request
                int id = Integer.parseInt(request.getParameter("id"));
                // Lấy thông tin CPU theo id để update
                ArrayList<CPU> cpus = db.getCPUs("select * from cpus join products on cpus.id= products.id where cpus.id = " + id);
                if (!cpus.isEmpty()) {
                    CPU cpu = cpus.get(0);
                    request.setAttribute("cpus", cpu);
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
                String socket = request.getParameter("socket");
                int cores = Integer.parseInt(request.getParameter("cores"));
                int threads = Integer.parseInt(request.getParameter("threads"));
                int baseClock = Integer.parseInt(request.getParameter("baseClock"));
                int boostClock = Integer.parseInt(request.getParameter("boostClock"));
                int tdp = Integer.parseInt(request.getParameter("tdp"));
                String image = request.getParameter("image");

                int result = db.updateProductCPU(id, sellingPrice, costPrice, name, generation, socket, cores, threads, baseClock, boostClock, tdp, image);

                if (result == 1) {
                    response.sendRedirect("cpus?service=listAll");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi cập nhật CPU");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/updateCPU.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } else if (service.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            db.removeCPU(id);
            response.sendRedirect("cpus");
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

//    public void uploadImage(CPU c, HttpServletRequest request) {
//        int Id = c.getId();
//        DAOCPU daoUser = new DAOCPU();
//        try {
//            String fileName = "";
//            String folder = getServletContext().getRealPath("assets/images");
//            folder = folder.replace("build\\web", "web");// folder store images
//            System.out.println("1233");
//            System.out.println(folder);
//            System.out.println(request.getContextPath());
//            File file; // create file to upload
//            int maxFileSize = 5000 * 1024;
//            int maxMemSize = 5000 * 1024;
//            String contentType = request.getContentType(); // get contentType
//            System.out.println("contentType: " + contentType.indexOf(contentType));
//            if (contentType.indexOf(contentType) >= 0) {
//                DiskFileItemFactory factory = DiskFileItemFactory.builder()
//                        .setBufferSize(maxMemSize).
//                        setPath(folder)
//                        .get();
//
//                JakartaServletFileUpload upload = new JakartaServletFileUpload(factory);
//                upload.setFileSizeMax(maxFileSize);
//
//                List<FileItem> files = upload.parseRequest(request);
//
//                for (FileItem fileItem : files) {
//                    System.out.println("fileItem:" + fileItem.getName());
//                    if (!fileItem.isFormField()) {
//                        System.out.println(fileItem.getFieldName());
//                        int indexExtension = fileItem.getName().lastIndexOf(".");
//                        fileName = Id + fileItem.getName().substring(indexExtension);
//                        System.out.println(fileName);
//                        deleteOldFile(Id + "", folder); // delete old image
//                        String path = folder + "\\" + fileName;
//                        file = new File(path);
//                        fileItem.write(file.toPath());
//                        System.out.println(path);
//                    }
//                }
//                System.out.println("fileName");
//                c.setImages(fileName);
//            }
//        } catch (IOException e) {
//        }
//    }
//
//    private void deleteOldFile(String name, String directory) {
//        File f = new File(directory);
//        if (f.isDirectory()) {
//            for (File file : f.listFiles()) {
//                if (file.getName().substring(0, file.getName().lastIndexOf(".")).equals(name)) {
//                    if (file.delete()) {
//                        System.out.println("Delete old file successfully");
//                    } else {
//                        System.out.println("Can't delete");
//                    }
//                    break;
//                }
//            }
//        }
//    }
}
