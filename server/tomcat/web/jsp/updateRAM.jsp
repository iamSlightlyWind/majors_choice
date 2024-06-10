<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.RAM"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update RAM</title>
    </head>
    <body>
        <%
             RAM ram = (RAM) request.getAttribute("rams");
        %>
        <form action="rams" method="post" >
            <table>
                <tr>
                    <td>ID</td>
                    <td><%=ram.getId()%></td>
                </tr>
                <tr>
                    <td>sellingPrice</td>
                    <td><input type="number" name="sellingPrice" value="<%=ram.getSellingPrice()%>"></td>
                </tr>
                <tr>
                    <td>costPrice</td>
                    <td><input type="number" name="costPrice" value="<%=ram.getCostPrice()%>"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=ram.getName()%>"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="file" value="<%=ram.getImage()%>"></td>
                </tr>
                <tr>
                    <td>Generation</td>
                    <td><input type="text" name="generation" value="<%=ram.getGeneration()%>"></td>
                </tr>
                <tr>
                    <td>Capacity</td>
                    <td><input type="number" name="capacity" value="<%=ram.getCapacity()%>"></td>
                </tr>
                <tr>
                    <td>Speed</td>
                    <td><input type="number" name="speed" value="<%=ram.getSpeed()%>"></td>
                </tr>
                <tr>
                    <td>Latency</td>
                    <td><input type="number" name="latency" value="<%=ram.getLatency()%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update RAM"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="update">
            <input type="hidden" name="id" value="<%=ram.getId()%>">
        </form>
    </body>
</html>