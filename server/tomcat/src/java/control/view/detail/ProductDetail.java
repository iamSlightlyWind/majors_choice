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
import packages.wrap.Order;
import packages.wrap.Product;

public class ProductDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        userViewAllOrders(request, response);
        String category = request.getParameter("category");        
        int id = (request.getParameter("id") == null)||(request.getParameter("id").isEmpty()) ? 0 : Integer.parseInt(request.getParameter("id"));         
           
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
            default:
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
    
    protected void userViewAllOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("userObject");
        if(currentUser == null){
            return;
        }
        int productId = (request.getParameter("id") == null)||(request.getParameter("id").isEmpty()) ? 0 : Integer.parseInt(request.getParameter("id"));   
       
        ArrayList<Order> list = new ArrayList<>();
        ArrayList<Order> orders = Database.getOrders(-6);        
        for (Order order : orders) {
            if (order.user.id.equals(currentUser.id)) {
                for (Product product : order.products) {
                    if(product.id == productId){
                        list.add(order);
                    }
                }
            }
        }
        for (Order order : list) {   
            
            if(Database.checkOrderRate(order.id) == 0){
                request.setAttribute("rateStatus", 0);
                request.setAttribute("order", order);
                return;
            }
            
            if( (order.id == list.get(list.size() - 1).id) && Database.checkOrderRate(order.id) == 1){
                Rating rate = new Rating(order.id, productId);
                request.setAttribute("rateStatus", 1);               
                request.setAttribute("rate", rate);   
                return;
            }
        }   
        
    }

}
