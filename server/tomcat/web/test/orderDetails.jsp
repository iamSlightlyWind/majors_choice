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
            <p>${Order.orderInfo.fullName}</p>
            <p>${Order.orderInfo.phoneNumber}</p>
            <p>${Order.orderInfo.address}</p>
            <p>${Order.orderInfo.payment}</p>
            <p>Price: ${Order.cartTotal}</p>
            <c:if test="${Order.status eq 'Pending' and not managing}">
                <form action="/order" method="get">
                    <input type="hidden" name="id" value="${Order.id}" />
                    <button type="submit" name="action" value="cancel">Cancel Order</button>
                </form>
            </c:if>
            <c:choose>
                <c:when test="${managing}">
                    <c:choose>
                        <c:when
                            test="${Order.status eq 'Pending' or Order.status eq 'Cancellation Denied, Shipping Pending'}">
                            <form action="/manage/order" method="get">
                                <input type="hidden" name="id" value="${Order.id}" />
                                <button type="submit" name="action" value="cancel">Cancel Order</button>
                                <button type="submit" name="action" value="ship">Ship Order</button>
                            </form>
                        </c:when>
                        <c:when test="${Order.status eq 'Cancellation Requested'}">
                            <form action="/manage/order" method="get">
                                <input type="hidden" name="id" value="${Order.id}" />
                                <button type="submit" name="action" value="approve">Approve Cancellation</button>
                                <button type="submit" name="action" value="deny">Deny Cancellation</button>
                            </form>
                        </c:when>
                    </c:choose>
                </c:when>
            </c:choose>
            <br>

            <form action="/auth/login" method="post">
                <input type="hidden" name="action" value="logout" />
                <button type="submit">logout</button>
            </form>
        </body>

        </html>