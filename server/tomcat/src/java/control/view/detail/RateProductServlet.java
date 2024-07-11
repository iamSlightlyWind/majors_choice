
package control.view.detail;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;


public class RateProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action") == null? "" : request.getParameter("action");
        
        switch(action){
            case "add":
                addRating(request, response);
                break;
            case "update":
                updateRating(request, response);
                break;
            default:
                break;
        }       
    } 

    @SuppressWarnings("unused")
    protected void addRating(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        User user = (User) request.getSession().getAttribute("userObject");
        
        int productID = request.getParameter("productID") == null ? 0 : Integer.parseInt(request.getParameter("productID"));
        int userID = request.getParameter("userId") == null ? 0 : Integer.parseInt(request.getParameter("userId"));
        int rateStar = request.getParameter("rateStar") == null ? 0 : Integer.parseInt(request.getParameter("rateStar"));
        
        String category = request.getParameter("category");
        String rateText = request.getParameter("rateText");
        
        int result = Database.addRating(productID, userID, rateStar, rateText);
        switch(result){
            case -1:
                response.sendRedirect("/view/detail/product?category="+category+"&id="+productID+"&status=-1");
                break;
            case 1:
                response.sendRedirect("/view/detail/product?category="+category+"&id="+productID+"&status=1");
                break;
        }
    }
    protected void updateRating(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        int productID = request.getParameter("productID") == null ? 0 : Integer.parseInt(request.getParameter("productID"));
        int rateID = request.getParameter("rateID") == null ? 0 : Integer.parseInt(request.getParameter("rateID"));
        int rateStar = request.getParameter("rateStar") == null ? 0 : Integer.parseInt(request.getParameter("rateStar"));
        
        String category = request.getParameter("category");
        String rateText = request.getParameter("rateText");
        
        int result = Database.updateRating(rateID, rateStar, rateText);
        switch(result){
            case 0:
                response.sendRedirect("/view/detail/product?category="+category+"&id="+productID+"&status=-2");
                break;
            case 1:
                response.sendRedirect("/view/detail/product?category="+category+"&id="+productID+"&status=2");
                break;
        }
    }
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
