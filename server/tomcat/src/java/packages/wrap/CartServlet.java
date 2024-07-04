package packages.wrap;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Locale;

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
        } else
            currentUser.retrieveData("user");

        if (action == null) {
            action = "viewCart";
        }

        switch (action) {
            case "viewCart":
                currentUser.retrieveData("user");
                request.setAttribute("buyable", currentUser.cart.buyable());
                request.setAttribute("user", currentUser.fullName);
                request.setAttribute("cartPriceDouble", new DecimalFormat("#").format(currentUser.cart.total));
                request.setAttribute("ProductCount", (ArrayList<ProductCount>) currentUser.cart.quantities);
                request.setAttribute("cartPrice", String.format(Locale.US, "%,.2f", currentUser.cart.total));
                request.getRequestDispatcher("/cart/cart.jsp").forward(request, response);
                break;
            case "addItem":
                currentUser.cart.addProduct(request.getParameter("type"),
                        Integer.parseInt(request.getParameter("productID")));
                response.sendRedirect("/Cart");
                break;
            case "removeOne":
            case "removeAll":
                currentUser.cart.remove(Integer.parseInt(request.getParameter("productID")),
                        ((String) request.getParameter("action")).equals("removeOne"));
                response.sendRedirect("/Cart");
                break;
            case "addOne":
                currentUser.cart.addOne(Integer.parseInt(request.getParameter("productID")));
                response.sendRedirect("/Cart");
                break;
            case "placeOrder":
                currentUser.cart.placeOrder();
                request.setAttribute("cartPrice", 0);
                request.setAttribute("user", currentUser.fullName);
                request.getRequestDispatcher("/cart/cart.jsp").forward(request, response);
                break;
            case "clear":
                currentUser.cart.clearCart();
                response.sendRedirect("/Cart");
                break;
            case "checkout":
                Cart tempCart = new Cart(currentUser.cart);
                request.getSession().setAttribute("tempCart", tempCart);
                currentUser.cart.clearCart();

                request.setAttribute("cartPriceDouble", new DecimalFormat("#").format(tempCart.total));
                request.setAttribute("cartPrice", String.format(Locale.US, "%,.2f", tempCart.total));
                request.setAttribute("ProductCount", (ArrayList<ProductCount>) tempCart.quantities);
                request.setAttribute("validation", tempCart.getValidate());
                request.setAttribute("user", currentUser);

                request.getRequestDispatcher("/cart/checkout.jsp").forward(request, response);
                break;
            case "restore":
                Cart restoreCart = (Cart) request.getSession().getAttribute("tempCart");
                currentUser.cart = new Cart(restoreCart);
                currentUser.cart.updateCart();

                response.sendRedirect("/Cart");
                break;
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