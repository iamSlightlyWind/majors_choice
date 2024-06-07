/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAOCPU;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Vector;
import packages.CPU;
import org.apache.commons.fileupload2.core.DiskFileItemFactory;
import org.apache.commons.fileupload2.core.FileItem;
import org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletFileUpload;
import java.io.File;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.activation.DataHandler;
import jakarta.activation.DataSource;
/**
 *
 * @author PC
 */
public class CPUController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        DAOCPU dao = new DAOCPU();
        String service = request.getParameter("service");
        if (service == null) {
            service = "listAll";
        }
        if (service.equals("listAll")) {
            //call mode
            Vector<CPU> vector;
            vector = dao.getAll("select * from cpus");
            request.setAttribute("data", vector);
            request.setAttribute("titlePage", "CPUManage");
            request.setAttribute("titleTable", "List of CPU");
            //select view
            RequestDispatcher dispath = request.getRequestDispatcher("/jsp/CPUManage.jsp");
            dispath.forward(request, response);
        }
        if (service.equals("insertCPU")) {
//            int id = Integer.parseInt(request.getParameter("id"));
//            String name = request.getParameter("name");
//            String generation = request.getParameter("generation");
//            String socket = request.getParameter("socket");
//            int cores = Integer.parseInt(request.getParameter("cores"));
//            int threads = Integer.parseInt(request.getParameter("threads"));
//            int baseClock = Integer.parseInt(request.getParameter("baseClock"));
//            int boostClock = Integer.parseInt(request.getParameter("boostClock"));
//            int tdp = Integer.parseInt(request.getParameter("tdp"));
//            CPU c = new CPU(id, baseClock, boostClock, generation, name, generation, socket, cores, threads, baseClock, boostClock, tdp);
            CPU c = new CPU();
            try {
                String fileName = "";
                String folder = getServletContext().getRealPath("/assets/images");
                folder = folder.replace("build\\web", "web");// folder store images
                System.out.println("1233");
                System.out.println(folder);
                System.out.println(request.getContextPath());
                File file; // create file to upload
                int maxFileSize = 5000 * 1024;
                int maxMemSize = 5000 * 1024;
                String contentType = request.getContentType(); // get contentType
                System.out.println("contentType: " + contentType.indexOf(contentType));
                if (contentType.indexOf(contentType) >= 0) {
                    DiskFileItemFactory factory = DiskFileItemFactory.builder()
                            .setBufferSize(maxMemSize).
                            setPath(folder)
                            .get();

                    JakartaServletFileUpload upload = new JakartaServletFileUpload(factory);
                    List<FileItem> files = upload.parseRequest(request);
                    upload.setFileSizeMax(maxFileSize);
                    for (FileItem fileItem : files) {
                        System.out.println("fileItem:" + fileItem.getName());
                        if (fileItem.isFormField()) {
                            System.out.println("hello filename: " + fileItem.getFieldName());
                            System.out.println(fileItem.getString());
                            String s = fileItem.getString();
                            String fieldName = fileItem.getFieldName();
                            if (fieldName.equals("id")) {
                                c.setId(Integer.parseInt(s));
                            } else if (fieldName.equals("name")) {
                                c.setName(s);
                            } else if (fieldName.equals("generation")) {
                                c.setGeneration(s);
                            } else if (fieldName.equals("socket")) {
                                c.setSocket(s);
                            } else if (fieldName.equals("cores")) {
                                c.setCores(Integer.parseInt(s));
                            } else if (fieldName.equals("threads")) {
                                c.setThreads(Integer.parseInt(s));
                            } else if (fieldName.equals("baseClock")) {
                                c.setBaseClock(Integer.parseInt(s));
                            } else if (fieldName.equals("boostClock")) {
                                c.setBoostClock(Integer.parseInt(s));
                            } else if (fieldName.equals("tdp")) {
                                c.setTdp(Integer.parseInt(s));
                            }
                        } else {
                            int Id = c.getId();
                            System.out.println(fileItem.getFieldName());
                            int indexExtension = fileItem.getName().lastIndexOf(".");
                            fileName = Id + fileItem.getName().substring(indexExtension);
                            System.out.println(fileName);
                            deleteOldFile(Id + "", folder); // delete old image
                            String path = folder + "\\" + fileName;
                            file = new File(path);
                            fileItem.write(file.toPath());
                            System.out.println(path);
                            c.setImages(fileName);
                        }
                    }
                }
            } catch (IOException e) {
            }
            dao.insertCPU(c);
            response.sendRedirect("cpu");

        }

        if (service.equals(
                "update")) {
            //check submit
            String submit = request.getParameter("submit");
            if (submit == null) {
                //get id
                int id = Integer.parseInt(request.getParameter("id"));
                //get Product(update)
                Vector<CPU> vector = dao.getAll("select * from cpus where id=" + id);
                //send vector to update form
                request.setAttribute("vector", vector);
                RequestDispatcher dispath = request.getRequestDispatcher("/jsp/updateCPU.jsp");
                //run (show)
                dispath.forward(request, response);
            } else {
                int id = Integer.parseInt((String) request.getParameter("id"));
                String name = request.getParameter("name");
                String generation = request.getParameter("generation");
                String socket = request.getParameter("socket");
                int cores = Integer.parseInt(request.getParameter("cores"));
                int threads = Integer.parseInt(request.getParameter("threads"));
                int baseClock = Integer.parseInt(request.getParameter("baseClock"));
                int boostClock = Integer.parseInt(request.getParameter("boostClock"));
                int tdp = Integer.parseInt(request.getParameter("tdp"));
                CPU c = new CPU(id, baseClock, boostClock, generation, name, generation, socket, cores, threads, baseClock, boostClock, tdp);
                dao.updateCPU(c);
                response.sendRedirect("cpu");
            }
        }

        if (service.equals(
                "delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.removeCPU(id);
            response.sendRedirect("cpu");
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

    public void uploadImage(CPU c, HttpServletRequest request) {
        int Id = c.getId();
        DAOCPU daoUser = new DAOCPU();
        try {
            String fileName = "";
            String folder = getServletContext().getRealPath("assets/images");
            folder = folder.replace("build\\web", "web");// folder store images
            System.out.println("1233");
            System.out.println(folder);
            System.out.println(request.getContextPath());
            File file; // create file to upload
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            String contentType = request.getContentType(); // get contentType
            System.out.println("contentType: " + contentType.indexOf(contentType));
            if (contentType.indexOf(contentType) >= 0) {
                DiskFileItemFactory factory = DiskFileItemFactory.builder()
                        .setBufferSize(maxMemSize).
                        setPath(folder)
                        .get();

                JakartaServletFileUpload upload = new JakartaServletFileUpload(factory);
                upload.setFileSizeMax(maxFileSize);

                List<FileItem> files = upload.parseRequest(request);

                for (FileItem fileItem : files) {
                    System.out.println("fileItem:" + fileItem.getName());
                    if (!fileItem.isFormField()) {
                        System.out.println(fileItem.getFieldName());
                        int indexExtension = fileItem.getName().lastIndexOf(".");
                        fileName = Id + fileItem.getName().substring(indexExtension);
                        System.out.println(fileName);
                        deleteOldFile(Id + "", folder); // delete old image
                        String path = folder + "\\" + fileName;
                        file = new File(path);
                        fileItem.write(file.toPath());
                        System.out.println(path);
                    }
                }
                System.out.println("fileName");
                c.setImages(fileName);
            }
        } catch (IOException e) {
        }
    }

    private void deleteOldFile(String name, String directory) {
        File f = new File(directory);
        if (f.isDirectory()) {
            for (File file : f.listFiles()) {
                if (file.getName().substring(0, file.getName().lastIndexOf(".")).equals(name)) {
                    if (file.delete()) {
                        System.out.println("Delete old file successfully");
                    } else {
                        System.out.println("Can't delete");
                    }
                    break;
                }
            }
        }
    }
}
