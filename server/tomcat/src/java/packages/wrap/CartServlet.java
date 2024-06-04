package packages.wrap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import packages.*;

class Cart {
    public ArrayList<Product> products = new ArrayList<Product>();
    public ArrayList<ProductCount> quantities = new ArrayList<ProductCount>();
    public String userName;

    public void updateQuantity() {
        HashMap<Integer, Integer> productCountMap = new HashMap<Integer, Integer>();
        for (Product product : products) {
            productCountMap.put(product.id, productCountMap.getOrDefault(product.id, 0) + 1);
        }
        quantities.clear();
        for (Map.Entry<Integer, Integer> entry : productCountMap.entrySet()) {
            quantities.add(new ProductCount(entry.getKey(), entry.getValue()));
        }
    }

    public Cart(String userName) {
        this.userName = userName;
    }

    public void addProduct(String type, int id) {
        Product newProduct = null;

        switch (type) {
            case "cpu":
                newProduct = new CPU(id);
                break;
            case "gpu":
                newProduct = new GPU(id);
                break;
            case "ram":
                newProduct = new RAM(id);
                break;
            case "psu":
                newProduct = new PSU(id);
                break;
            case "ssd":
                newProduct = new SSD(id);
                break;
            case "motherboard":
                newProduct = new Motherboard(id);
                break;
        }
        products.add(newProduct);
        updateQuantity();
    }

    @Override
    public String toString() {
        int maxId = quantities.stream().mapToInt(pc -> pc.id).max().orElse(0);
        boolean[] printed = new boolean[maxId + 1];
        StringBuilder sb = new StringBuilder();

        for (ProductCount productCount : quantities) {
            if (!printed[productCount.id]) {
                printed[productCount.id] = true;
                for (Product product : products) {
                    if (product.id == productCount.id) {
                        sb.append(productCount.count).append(" x ").append(product.name).append("<br>");
                        break;
                    }
                }
            }
        }

        return sb.toString();
    }
}

public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action.equals("viewCart")) {
            tempViewCart(request, response);
            return;
        } else if (action.equals("addItem")) {
            addProduct(request, response);
            response.sendRedirect("/Test");
            return;
        }
    }

    protected void tempViewCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Cart((String) session.getAttribute("userName")));
        }
        Cart cart = (Cart) session.getAttribute("cart");
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("/test/cart.jsp").forward(request, response);
    }

    protected void addProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Cart((String) session.getAttribute("userName")));
        }

        Cart cart = (Cart) session.getAttribute("cart");
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