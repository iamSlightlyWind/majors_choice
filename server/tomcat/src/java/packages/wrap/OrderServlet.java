
package packages.wrap;

import java.io.IOException;

import database.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;

public class OrderServlet extends HttpServlet {
    protected Database db = new Database();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if ((User) request.getSession().getAttribute("userObject") == null) {
            response.sendRedirect("/auth/login.jsp");
            return;
        }

        String action = request.getParameter("action") == null ? "" : request.getParameter("action");

        switch ((String) request.getSession().getAttribute("table")) {
            case "staff":
                doStaff(request, response, action);
                break;
            case "user":
                doUser(request, response, action);
                break;
        }
    }

    protected void doStaff(HttpServletRequest request, HttpServletResponse response, String action)
            throws ServletException, IOException {
        switch (action) {
            case "viewDetails":
                viewOrderDetails(request, response);
                break;
            case "deny":
                denyRequest(request, response);
                break;
            case "approve":
                approveRequest(request, response);
                break;
            case "ship":
                shipOrder(request, response);
                break;
            case "viewOnGoing":
                staffViewCompletedOrders(request, response);
                break;
            default:
                staffViewOnGoingOrders(request, response);
                break;
        }
    }

    protected void shipOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        System.out.println(db.updateOrder(Integer.parseInt(orderID), "ship"));
        
    }

    protected void approveRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        System.out.println(db.updateOrder(Integer.parseInt(orderID), "approve"));
    }

    protected void denyRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        System.out.println(db.updateOrder(Integer.parseInt(orderID), "deny"));
    }

    protected void staffViewOnGoingOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("userObject");
        currentUser.orders = db.getOrders(0);
        request.setAttribute("OrderList", currentUser.orders);
        request.getRequestDispatcher("/test/order.jsp").forward(request, response);
    }

    protected void staffViewCompletedOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("userObject");
        currentUser.orders = db.getOrders(-1);
        request.setAttribute("OrderList", currentUser.orders);
        request.getRequestDispatcher("/test/order.jsp").forward(request, response);
    }

    protected void doUser(HttpServletRequest request, HttpServletResponse response, String action)
            throws ServletException, IOException {
        switch (action) {
            case "viewDetails":
                viewOrderDetails(request, response);
                break;
            case "cancelOrder":
                cancelOrder(request, response);
                break;
            default:
                userViewAllOrders(request, response);
                break;
        }
    }

    protected void cancelOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("userObject");
        int orderId = Integer.parseInt(request.getParameter("id"));

        db.updateOrder(orderId, "cancel");
        currentUser.getOrders();
        response.sendRedirect("/order");
    }

    protected void viewOrderDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("userObject");
        int orderId = Integer.parseInt(request.getParameter("id"));
        currentUser.getOrders();

        for (Order order : currentUser.orders) {
            if (order.id == orderId) {
                request.setAttribute("Order", order);
                request.getRequestDispatcher("/test/orderDetails.jsp").forward(request, response);
                return;
            }
        }
    }

    protected void userViewAllOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("userObject");
        currentUser.getOrders();
        request.setAttribute("OrderList", currentUser.orders);
        request.getRequestDispatcher("/test/order.jsp").forward(request, response);
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
