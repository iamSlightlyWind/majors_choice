<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>product tests</title>

        </head>

        <form action="/manage/order" method="get">
            <button type="submit" name="action" value="viewAll">All Orders</button>
            <button type="submit" name="action" value="viewPending">Pending</button>
            <button type="submit" name="action" value="viewRequested">Requested</button>
            <button type="submit" name="action" value="viewDenied">Denied</button>
            <button type="submit" name="action" value="viewCancelled">Cancelled</button>
            <button type="submit" name="action" value="viewShipping">Shipping</button>
            <button type="submit" name="action" value="viewCompleted">Completed</button>
        </form>

        <body>
            <table>
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Customer</th>
                    <th>Status</th>
                    <th>Items</th>
                    <th>Total</th>
                    <th>Payment Method</th>
                    <th>View</th>
                </tr>
                <c:forEach var="Order" items="${OrderList}">
                    <tr>
                        <td>${Order.id}</td>
                        <td>${Order.date}</td>
                        <td>${Order.user.fullName}</td>
                        <td>${Order.status}</td>
                        <td>${Order.count}</td>
                        <td>${Order.cartTotal}</td>
                        <td>${Order.paymentMethod}</td>
                        <td>
                            <form action="/order" method="get">
                                <input type="hidden" name="id" value="${Order.id}" />
                                <button type="submit" name="action" value="viewDetails">View Details</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>