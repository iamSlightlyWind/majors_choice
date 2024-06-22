
package packages.wrap;

import java.io.IOException;
import java.util.ArrayList;
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
                staffViewOrderDetails(request, response);
                break;
            case "cancel":
                staffCancelOrder(request, response);
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
            case "viewPending":
                staffViewOrders(request, response, -1);
                break;
            case "viewRequested":
                staffViewOrders(request, response, -2);
                break;
            case "viewDenied":
                staffViewOrders(request, response, -3);
                break;
            case "viewCancelled":
                staffViewOrders(request, response, -4);
                break;
            case "viewShipping":
                staffViewOrders(request, response, -5);
                break;
            case "viewCompleted":
                staffViewOrders(request, response, -6);
                break;
            case "viewAll":
            default:
                staffViewOrders(request, response, 0);
                break;
        }
    }

    protected void staffViewOrderDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Order> orders = db.getOrders(0);
        int orderId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("managing", true);

        for (Order order : orders) {
            if (order.id == orderId) {
                request.setAttribute("Order", order);
                request.getRequestDispatcher("/test/orderDetails.jsp").forward(request, response);
                return;
            }
        }
    }

    protected void staffCancelOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        db.updateOrder(Integer.parseInt(orderID), "cancel");
        db.updateOrder(Integer.parseInt(orderID), "approve");
        response.sendRedirect("/manage/order");
    }

    protected void staffViewOrders(HttpServletRequest request, HttpServletResponse response, int list)
            throws ServletException, IOException {
        ArrayList<Order> orders = db.getOrders(list);
        request.setAttribute("managing", true);
        request.setAttribute("OrderList", orders);
        request.getRequestDispatcher("/test/staffViewOrders.jsp").forward(request, response);
    }

    protected void shipOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        db.updateOrder(Integer.parseInt(orderID), "ship");
        response.sendRedirect("/manage/order");
    }

    protected void approveRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        db.updateOrder(Integer.parseInt(orderID), "approve");
        response.sendRedirect("/manage/order");
    }

    protected void denyRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        db.updateOrder(Integer.parseInt(orderID), "deny");
        response.sendRedirect("/manage/order");
    }

    protected void doUser(HttpServletRequest request, HttpServletResponse response, String action)
            throws ServletException, IOException {
        switch (action) {
            case "viewDetails":
                userViewOrderDetails(request, response);
                break;
            case "cancel":
                cancelOrder(request, response);
                break;
            default:
                userViewAllOrders(request, response);
                break;
        }
    }

    protected void userViewOrderDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("userObject");
        int orderId = Integer.parseInt(request.getParameter("id"));
        currentUser.getOrders();

        for (Order order : currentUser.orders) {
            if (order.id == orderId) {
                System.out.println(order.orderInfo.fullName);
                request.setAttribute("Order", order);
                request.getRequestDispatcher("/test/orderDetails.jsp").forward(request, response);
                return;
            }
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
