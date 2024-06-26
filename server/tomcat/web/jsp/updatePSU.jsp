<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.PSU"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Motherboard</title>
    </head>
    <body>
        <%
             PSU psu = (PSU) request.getAttribute("psu");
        %>
        <form action="psus" method="post" enctype="multipart/form-data" >
            <table>
                <tr>
                    <td>ID</td>
                    <td><%=psu.getId()%></td>
                </tr>
                <tr>
                    <td>SellingPrice</td>
                    <td><input type="number" name="sellingPrice" value="<%=psu.getSellingPrice()%>"></td>
                </tr>
                <tr>
                    <td>CostPrice</td>
                    <td><input type="number" name="costPrice" value="<%=psu.getCostPrice()%>"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=psu.getName()%>"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" accept="image/*" value="<%=psu.getImage()%>"></td>
                </tr>
                <tr>
                    <td>Wattage</td>
                    <td><input type="number" name="wattage" value="<%=psu.getWattage()%>"></td>
                </tr>
                <tr>
                    <td>Efficiency</td>
                    <td><input type="text" name="efficiency" value="<%=psu.getEfficiency()%>"></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" name="quantity" value="<%=psu.getQuantity()%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update PSU"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="update">
            <input type="hidden" name="id" value="<%=psu.getId()%>">
        </form>
    </body>
</html>