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
            case "complete":
                completeOrder(request, response);
                break;
            case "viewPending":
                request.setAttribute("view", "Pending");
                staffViewOrders(request, response, -1);
                break;
            case "viewRequested":
                request.setAttribute("view", "Requested");
                staffViewOrders(request, response, -2);
                break;
            case "viewDenied":
                request.setAttribute("view", "Denied");
                staffViewOrders(request, response, -3);
                break;
            case "viewCancelled":
                request.setAttribute("view", "Cancelled");
                staffViewOrders(request, response, -4);
                break;
            case "viewShipping":
                request.setAttribute("view", "Shipping");
                staffViewOrders(request, response, -5);
                break;
            case "viewCompleted":
                request.setAttribute("view", "Completed");
                staffViewOrders(request, response, -6);
                break;
            case "viewAll":
            default:
                staffViewOrders(request, response, 0);
                break;
        }
    }

    protected void completeOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        Database.updateOrder(Integer.parseInt(orderID), "complete");
        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void staffViewOrderDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Order> orders = Database.getOrders(0);
        int orderId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("managing", true);

        for (Order order : orders) {
            if (order.id == orderId) {
                request.setAttribute("Order", order);
                request.getRequestDispatcher("/test/orderDetails.jsp").forward(request, response);
                return;
            }
        }

        request.setAttribute("searchError", "Order not found!");
        staffViewOrders(request, response, 0);
    }

    protected void restoreStock(HttpServletRequest request) {
        User currentUser = (User) request.getSession().getAttribute("userObject");
        int orderId = Integer.parseInt(request.getParameter("id"));
        currentUser.getOrders();

        for (Order order : currentUser.orders) {
            if (order.id == orderId) {
                for (ProductCount product : order.quantities) {
                    Database.productAdjust(product.id, product.count);
                }
                return;
            }
        }
    }

    protected void staffCancelOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        Database.updateOrder(Integer.parseInt(orderID), "forceCancel");
        restoreStock(request);
        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void staffViewOrders(HttpServletRequest request, HttpServletResponse response, int list)
            throws ServletException, IOException {
        ArrayList<Order> orders = Database.getOrders(list);
        request.setAttribute("managing", true);
        request.setAttribute("OrderList", orders);
        request.getRequestDispatcher("/cart/orderManage.jsp").forward(request, response);
    }

    protected void shipOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        Database.updateOrder(Integer.parseInt(orderID), "ship");
        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void approveRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        Database.updateOrder(Integer.parseInt(orderID), "approve");
        restoreStock(request);
        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void denyRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderID = request.getParameter("id");
        Database.updateOrder(Integer.parseInt(orderID), "deny");
        response.sendRedirect(request.getHeader("Referer"));
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
            case "viewOngoing":
            case "viewCompleted":
            default:
                userViewAllOrders(request, response, action);
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
                request.setAttribute("Order", order);
                request.getRequestDispatcher("/test/orderDetails.jsp").forward(request, response);
                return;
            }
        }

        request.setAttribute("searchError", "Order not found!");
        userViewAllOrders(request, response, "");
    }

    protected void cancelOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("userObject");
        int orderId = Integer.parseInt(request.getParameter("id"));

        Database.updateOrder(orderId, "cancel");
        currentUser.getOrders();
        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void userViewAllOrders(HttpServletRequest request, HttpServletResponse response, String action)
            throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("userObject");
        currentUser.getOrders();

        if (action.equals("viewOngoing")) {
            request.setAttribute("view", "Ongoing");
            for (int i = 0; i < currentUser.orders.size(); i++) {
                if (currentUser.orders.get(i).status.equals("Completed")
                        || currentUser.orders.get(i).status.equals("Cancelled")) {
                    currentUser.orders.remove(i);
                    i--;
                }
            }
        } else if (action.equals("viewCompleted")) {
            request.setAttribute("view", "Completed");
            for (int i = 0; i < currentUser.orders.size(); i++) {
                if (!currentUser.orders.get(i).status.equals("Completed")
                        && !currentUser.orders.get(i).status.equals("Cancelled")) {
                    currentUser.orders.remove(i);
                    i--;
                }
            }
        }

        request.setAttribute("OrderList", currentUser.orders);
        request.getRequestDispatcher("/cart/orderList.jsp").forward(request, response);
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
