<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>product tests</title>

        </head>

        <body>
            <c:forEach var="ProductCount" items="${ProductCount}">
                <form action="Cart" method="post">
                    <input type="hidden" name="productID" value="${ProductCount.id}" />
                    <button type="submit" name="action" value="removeAll">${ProductCount.count}</button>
                    <button type="submit" name="action" value="removeOne">${ProductCount.id} ${ProductCount.name}</button>
                    <button type="submit" name="action" value="addOne">+1</button>
                </form>
                <br>
            </c:forEach>

            <form>
                <p>Place Order</p>
                <form action="order" method="post">
                    <button type="submit" name="action" value="placeOrder">Place Order</button>
                </form>
        </body>

        </html>