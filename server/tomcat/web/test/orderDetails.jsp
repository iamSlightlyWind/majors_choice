<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>product tests</title>

        </head>

        <body>

            <p>ID: ${Order.id}</p>
            <p>Status: ${Order.status}</p>
            <ul>
                <c:forEach var="ProductCount" items="${Order.quantities}">
                    <li>
                        <p>${ProductCount.name}</p>
                        <p>${ProductCount.count} x ${ProductCount.pricePer} = ${ProductCount.totalPrice}</p>
                    </li>
                </c:forEach>
            </ul>
            <p>Price: ${Order.cartTotal}</p>
            <c:if test="${Order.status eq 'Pending'}">
                <form action="/order" method="get">
                    <input type="hidden" name="id" value="${Order.id}" />
                    <button type="submit" name="action" value="cancelOrder">Cancel Order</button>
                </form>
            </c:if>
            <br>

            <form action="/auth/login" method="post">
                <input type="hidden" name="action" value="logout" />
                <button type="submit">logout</button>
            </form>
        </body>

        </html>