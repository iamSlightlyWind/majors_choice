<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>product tests</title>
    </head>
    <body>
        <p> CPUs </p>
        <c:forEach var="cpu" items="${cpus}">
            <p>${cpu}</p>
        </c:forEach>

        <p> GPUs </p>
        <c:forEach var="gpu" items="${gpus}">
            <p>${gpu}</p>
        </c:forEach>

        <p> RAMs </p>
        <c:forEach var="ram" items="${rams}">
            <p>${ram}</p>
        </c:forEach>

        <p> Motherboards </p>
        <c:forEach var="motherboard" items="${motherboards}">
            <p>${motherboard}</p>
        </c:forEach>

        <p> SSDs </p>
        <c:forEach var="ssd" items="${ssds}">
            <p>${ssd}</p>
        </c:forEach>

        <p> PSUs </p>
        <c:forEach var="psu" items="${psus}">
            <p>${psu}</p>
        </c:forEach>
    </body>
</html>
