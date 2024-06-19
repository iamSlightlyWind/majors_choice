package packages.wrap;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;

public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        User currentUser = (User) request.getSession().getAttribute("userObject");

        if (currentUser == null) {
            response.sendRedirect("/auth/login.jsp");
            return;
        }

        if (currentUser.cart == null) {
            currentUser.cart = new Cart(currentUser.id, currentUser.db);
        }

        if (action == null || action.equals("viewCart")) {
            request.setAttribute("user", currentUser.fullName);
            request.setAttribute("ProductCount", (ArrayList<ProductCount>) currentUser.cart.quantities);
            currentUser.cart.updateQuantity();
            request.setAttribute("cartPrice", currentUser.cart.totalPrice);
            request.getRequestDispatcher("/cart/cart.jsp").forward(request, response);
        } else if (action.equals("addItem")) {
            currentUser.cart.addProduct(request.getParameter("type"),
                    Integer.parseInt(request.getParameter("productID")));
            response.sendRedirect("/Test");
        } else if (action.equals("removeOne") || action.equals("removeAll")) {
            currentUser.cart.remove(Integer.parseInt(request.getParameter("productID")),
                    ((String) request.getParameter("action")).equals("removeOne"));
            response.sendRedirect("/Cart");
        } else if (action.equals("addOne")) {
            currentUser.cart.addOne(Integer.parseInt(request.getParameter("productID")));
            response.sendRedirect("/Cart");
        } else if (action.equals("placeOrder")) {
            currentUser.cart.placeOrder();
            request.setAttribute("cartPrice", 0);
            request.setAttribute("user", currentUser.fullName);
            request.getRequestDispatcher("/cart/cart.jsp").forward(request, response);
        } else if (action.equals("clear")) {
            currentUser.cart.clearCart();
            response.sendRedirect("/Cart");
        }

        request.getSession().setAttribute("userObject", currentUser);
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