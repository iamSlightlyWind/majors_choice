package packages.wrap;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        if (action.equals("viewCart") || action.equals("")) {
            tempViewCart(request, response);
            return;
        } else if (action.equals("addItem")) {
            addProduct(request, response);
            response.sendRedirect("/Test");
            return;
        } else if (action.equals("removeOne") || action.equals("removeAll")) {
            removeProduct(request, response);
            response.sendRedirect("/Cart");
            return;
        }
    }

    protected void removeProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        Cart cart = getCart(session);

        cart.remove(Integer.parseInt(request.getParameter("productID")),
                ((String) request.getParameter("action")).equals("removeOne"));
    }

    protected Cart getCart(HttpSession session) {
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Cart((String) session.getAttribute("userName")));
        }
        return (Cart) session.getAttribute("cart");
    }

    protected void tempViewCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        Cart cart = getCart(session);

        request.setAttribute("ProductCount", (ArrayList<ProductCount>) cart.quantities);
        request.getRequestDispatcher("/test/cart.jsp").forward(request, response);
    }

    protected void addProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        Cart cart = getCart(session);

        cart.addProduct(request.getParameter("type"), Integer.parseInt(request.getParameter("productID")));
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