/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import database.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import main.User;

/**
 *
 * @author thang
 */
public class RegisterServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String dateOfBirth = request.getParameter("dateOfBirth");

        //Status to check error
        boolean status = true;

        //errors can have
        String errorPass = "";
        String errorExistEmail = "";
        String errorExistPhone = "";
        String errorExistUser = "";
        String errorFormEmail = "";
        String errorFormPhone = "";

        //check password vs repeatpassword 
        if (!pass.equals(repass)) {
            errorPass += "Repeat password don't merge password.";
            status = false;
        }
        //check email, username, phone had existed
        UserDao ud = new UserDao();
        int result = ud.register(name, pass, name, email, phone, address, dateOfBirth);
        if (result == -1) {
            errorExistUser += "User had existed in the system.";
            status = false;
        } else if (result == -2) {
            errorExistEmail += "Email had existed in the system.";
            status = false;
        } else if (result == -3) {
            errorExistPhone += "Phone Number had existed in the system.";
            status = false;
        }
        //check form email, form phone
        if (result != -2 && !isValidEmail(email)) {
            errorFormEmail += "Don't correct form email! You have to check again.";
            status = false;
        }
        if (result != -3 && !isValidPhoneNumber(phone)) {
            errorFormPhone += "Don't correct form phone! You have to check again.";
            status = false;
        }       
        
        if(status){
            request.setAttribute("success", "You had created successful. You can Login.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }else{
            request.setAttribute("errorP", errorPass);
            request.setAttribute("errorU", errorExistUser);
            if(errorExistEmail.trim().isEmpty()){
                request.setAttribute("errorFE", errorFormEmail);
            }else{
                request.setAttribute("errorEE", errorExistEmail);
            }
            if(errorExistPhone.trim().isEmpty()){
                request.setAttribute("errorFP", errorFormPhone);
            }else{
                request.setAttribute("errorEP", errorExistPhone);
            }
            User u1 = new User(user, pass, name, email, phone, address, dateOfBirth);
            request.setAttribute("u1", u1);
            request.setAttribute("reP", repass);
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
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

    // Phương thức kiểm tra địa chỉ email có hợp lệ không
    private boolean isValidEmail(String email) {
        // Sử dụng biểu thức chính quy để kiểm tra
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    //phương thức kiểm tra số điện thoại
    public boolean isValidPhoneNumber(String phoneNumber) {
        // Biểu thức chính quy cho số điện thoại
        String phoneRegex = "^\\d{3}-\\d{3}-\\d{3,6}$";

        // Biên dịch biểu thức chính quy
        Pattern pattern = Pattern.compile(phoneRegex);

        // Tạo một Matcher để so khớp với chuỗi đầu vào
        Matcher matcher = pattern.matcher(phoneNumber);

        // Kiểm tra xem chuỗi đầu vào khớp với biểu thức chính quy không
        return matcher.matches();
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

}
