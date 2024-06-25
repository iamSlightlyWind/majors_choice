<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.SSD"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update RAM</title>
    </head>
    <body>
        <%
             SSD ssd = (SSD) request.getAttribute("ssd");
        %>
        <form action="ssds" method="post" enctype="multipart/form-data" >
            <table>
                <tr>
                    <td>ID</td>
                    <td><%=ssd.getId()%></td>
                </tr>
                <tr>
                    <td>SellingPrice</td>
                    <td><input type="number" name="sellingPrice" value="<%=ssd.getSellingPrice()%>"></td>
                </tr>
                <tr>
                    <td>CostPrice</td>
                    <td><input type="number" name="costPrice" value="<%=ssd.getCostPrice()%>"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=ssd.getName()%>"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" accept="image/*" value="<%=ssd.getImage()%>"></td>
                </tr>
                <tr>
                    <td>Interface</td>
                    <td><input type="text" name="interface" value="<%=ssd.getConnectionInterface()%>"></td>
                </tr>
                <tr>
                    <td>Capacity</td>
                    <td><input type="number" name="capacity" value="<%=ssd.getCapacity()%>"></td>
                </tr>
                <tr>
                    <td>Cache</td>
                    <td><input type="number" name="cache" value="<%=ssd.getCache()%>"></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" name="quantity" value="<%=ssd.getQuantity()%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update Cache"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="update">
            <input type="hidden" name="id" value="<%=ssd.getId()%>">
        </form>
    </body>
</html>