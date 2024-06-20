<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector,packages.Case"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update CPU</title>
    </head>
    <body>
        <%
Vector<Case> vector = (Vector<Case>) request.getAttribute("vector");
Case cases = vector.get(0);
        %>
        <form action="cases" method="post" >
            <table>
                <tr>
                    <td>ID</td>
                    <td><%=cases.getId()%></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=cases.getName()%>"></td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td><input type="text" name="type" value="<%=cases.getType()%>"></td>
                </tr>
                <tr>
                    <td>FormFactor</td>
                    <td><input type="text" name="formFactor" value="<%=cases.getFormFactor()%>"></td>
                </tr>
                <tr>
                    <td>Color</td>
                    <td><input type="text" name="color" value="<%=cases.getColor()%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update Case"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="update">
            <input type="hidden" name="id" value="<%=cases.getId()%>">
        </form>
    </body>
</html>
