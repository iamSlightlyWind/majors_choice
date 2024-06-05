<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>tests</title>

        </head>

        <body>

            <form action="Cart" method="post">
                <input type="hidden" name="action" value="viewCart" />
                <button type="submit">view cart</button>
            </form>

            <p> cpus </p>
            <c:forEach var="cpu" items="${cpus}">
                <form action="Cart" method="post">
                    <input type="hidden" name="productID" value="${cpu.id}" />
                    <input type="hidden" name="type" value="cpu" />
                    <input type="hidden" name="action" value="addItem" />
                    <button type="submit">${cpu}</button>
                </form>
            </c:forEach>

            <p> gpus </p>
            <c:forEach var="gpu" items="${gpus}">
                <form action="Cart" method="post">
                    <input type="hidden" name="productID" value="${gpu.id}" />
                    <input type="hidden" name="type" value="gpu" />
                    <input type="hidden" name="action" value="addItem" />
                    <button type="submit">${gpu}</button>
                </form>
            </c:forEach>

            <p> rams </p>
            <c:forEach var="ram" items="${rams}">
                <form action="Cart" method="post">
                    <input type="hidden" name="productID" value="${ram.id}" />
                    <input type="hidden" name="type" value="ram" />
                    <input type="hidden" name="action" value="addItem" />
                    <button type="submit">${ram}</button>
                </form>
            </c:forEach>

            <p> ssds </p>
            <c:forEach var="ssd" items="${ssds}">
                <form action="Cart" method="post">
                    <input type="hidden" name="productID" value="${ssd.id}" />
                    <input type="hidden" name="type" value="ssd" />
                    <input type="hidden" name="action" value="addItem" />
                    <button type="submit">${ssd}</button>
                </form>
            </c:forEach>

            <p> motherboards </p>
            <c:forEach var="motherboard" items="${motherboards}">
                <form action="Cart" method="post">
                    <input type="hidden" name="productID" value="${motherboard.id}" />
                    <input type="hidden" name="type" value="motherboard" />
                    <input type="hidden" name="action" value="addItem" />
                    <button type="submit">${motherboard}</button>
                </form>
            </c:forEach>

            <p> psus </p>
            <c:forEach var="psu" items="${psus}">
                <form action="Cart" method="post">
                    <input type="hidden" name="productID" value="${psu.id}" />
                    <input type="hidden" name="type" value="psu" />
                    <input type="hidden" name="action" value="addItem" />
                    <button type="submit">${psu}</button>
                </form>
            </c:forEach>
        </body>

        </html>