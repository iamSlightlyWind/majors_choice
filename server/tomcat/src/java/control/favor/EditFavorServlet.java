package control.favor;

import database.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;
import control.view.detail.ProductDetail;

public class EditFavorServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User user = (User) request.getSession().getAttribute("userObject");
        
        if (user == null) {
            response.sendRedirect("/auth/login.jsp");
            return;
        }
        
        user.retrieveData((String) request.getSession().getAttribute("table"));       
        
        String action = request.getParameter("action");
        String productId = request.getParameter("productId");
        String category = request.getParameter("category");
        
        switch(action){
            case "add":
                addFavor(request, response, category, productId, user.id);
                break;
            case "delete":
                deleteFavor(request, response, category, productId);
                break;
            default:
                response.sendRedirect("/");
                break;
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

    protected void addFavor(HttpServletRequest request, HttpServletResponse response, String category, String productId, String userId)
    throws ServletException, IOException {       
       int userID = Integer.parseInt(userId);
       int productID = Integer.parseInt(productId);
       
       int result = Database.addFavor(userID, productID);
       String status = (result==1) ? "successFavor" : "failFavor";
       
       response.sendRedirect("/view/detail/product?category="+category+"&id="+productID+"&status="+status);
    }
    
    protected void deleteFavor(HttpServletRequest request, HttpServletResponse response, String category, String productId)
    throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("userObject");
        user.retrieveData((String) request.getSession().getAttribute("table"));
        
        int result = Database.deleteFavor(Integer.parseInt(user.id), Integer.parseInt(productId));
        request.setAttribute("deleteFavorStatus", result==1?"success":"fail");
                      
        ViewListFavorServlet.listFavorProducts(request, response);
    }
    
}
