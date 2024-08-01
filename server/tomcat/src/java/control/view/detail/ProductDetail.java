package control.view.detail;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import packages.CPU;
import packages.GPU;
import packages.Motherboard;
import packages.PSU;
import packages.RAM;
import packages.Rating;
import packages.SSD;
import database.Database;
import main.User;
import packages.Case;

public class ProductDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String category = request.getParameter("category");        
       int id = (request.getParameter("id") == null)||(request.getParameter("id").isEmpty()) ? 0 : Integer.parseInt(request.getParameter("id")); 
       viewDetailProduct(request, response, category, id);
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
    
    public static void viewDetailProduct(HttpServletRequest request, HttpServletResponse response, String category, int id)
            throws ServletException, IOException {
        userViewAllOrders(request, response);                         
        ArrayList<Rating> ratings = Database.getRating(id);
      
        if(ratings != null && !ratings.isEmpty()){
            request.setAttribute("ratings", ratings);
        }
        request.setAttribute("category", category);
        switch (category) {
            case "cpu":
                CPU cpu = new CPU(id);
                request.setAttribute("product", cpu);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            case "gpu":
                GPU gpu = new GPU(id);
                request.setAttribute("product", gpu);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            case "mobo":
                Motherboard mobo = new Motherboard(id);
                request.setAttribute("product", mobo);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            case "psu":
                PSU psu = new PSU(id);
                request.setAttribute("product", psu);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            case "ram":
                RAM ram = new RAM(id);
                request.setAttribute("product", ram);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            case "ssd":
                SSD ssd = new SSD(id);
                request.setAttribute("product", ssd);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            case "case":
                Case case1 = new Case(id);
                request.setAttribute("product", case1);
                request.getRequestDispatcher("/view/detail/detailCPU.jsp").forward(request, response);
                break;
            default:
                break;
        }
    }           
    
    protected static void userViewAllOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         User currentUser = (User) request.getSession().getAttribute("userObject");
        if(currentUser == null){
            return;
        }
        int productId = (request.getParameter("id") == null)||(request.getParameter("id").isEmpty()) ? 0 : Integer.parseInt(request.getParameter("id"));   
       
        int result = Database.checkUserRateProduct(productId, Integer.parseInt(currentUser.id));
        
        switch(result){
            case 0:
                request.setAttribute("userId", currentUser.id);
                request.setAttribute("rateStatus", "add");
                break;
            case 1:
                Rating rate = new Rating(productId, Integer.parseInt(currentUser.id));
                request.setAttribute("rate", rate);
                request.setAttribute("rateStatus", "update");
                break;
            default:
                request.setAttribute("rateStatus", "noAction");
                break;
        }
        
    }

}
