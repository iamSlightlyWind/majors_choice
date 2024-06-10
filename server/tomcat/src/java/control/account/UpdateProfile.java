/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.account;

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
public class UpdateProfile extends HttpServlet {

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
        User user = new User();
        if (request.getParameter("active") != null) {
            user.active = Integer.parseInt(request.getParameter("active"));
        }
        user.username = request.getParameter("username");
        user.fullName = request.getParameter("fullname");
        user.email = request.getParameter("email");
        user.phoneNumber = request.getParameter("phoneNumber");
        user.address = request.getParameter("address");
        user.dateOfBirth = request.getParameter("dateOfBirth");
        String actor = request.getParameter("actor");

        boolean emailFormat = isValidEmail(user.email);

        if (emailFormat) {
            int result = user.updateInformation(actor, false);
            request.setAttribute("user", user);
            request.setAttribute("possition", actor);
            switch (result) {
                case 1:
                    request.getRequestDispatcher("/manage/profile").forward(request, response);
                    break;
                case -1:
                    request.setAttribute("status", "Update Failed! Email had existed.");
                    request.getRequestDispatcher("/manage/profile/user.jsp").forward(request, response);
                    break;
                case -2:
                    request.setAttribute("status", "Update Failed! Phone had existed.");
                    request.getRequestDispatcher("/manage/profile/user.jsp").forward(request, response);
                    break;
                default:
                    request.setAttribute("status", "Update Failed!");
                    request.getRequestDispatcher("/manage/profile/user.jsp").forward(request, response);
                    break;
            }
        } else {
            request.setAttribute("user", user);
            request.setAttribute("possition", actor);
            request.setAttribute("status", "Update Failed!Error Email Format");
            request.getRequestDispatcher("/manage/profile/user.jsp").forward(request, response);
        }

    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);

        return matcher.matches();
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

}
