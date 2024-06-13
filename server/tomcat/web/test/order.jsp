<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>product tests</title>

        </head>

        <body>
            <c:forEach var="Order" items="${OrderList}">
                <p>ID: ${Order.id}</p>
                <p>Status: ${Order.status}</p>
                <ul>
                    <c:forEach var="ProductCount" items="${Order.quantities}">
                        <li>${ProductCount.count} x ${ProductCount.name}</li>
                    </c:forEach>
                </ul>
                <br>
            </c:forEach>

            <form action="/auth/login" method="post">
                <input type="hidden" name="action" value="logout" />
                <button type="submit">logout</button>
            </form>
        </body>

        </html>