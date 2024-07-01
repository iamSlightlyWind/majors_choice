<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector,packages.Case"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Case</title>
    </head>
    <body>
        <%
            Case case = (Case) request.getAttribute("case");
        %>
        <form action="cases" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>ID</td>
                    <td><%=cases.getId()%></td>
                </tr>
                <tr>
                    <td>Selling Price</td>
                    <td><input type="number" name="sellingPrice" value="<%=cases.getSellingPrice()%>"></td>
                </tr>
                <tr>
                    <td>Cost Price</td>
                    <td><input type="number" name="costPrice" value="<%=cases.getCostPrice()%>"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=cases.getName()%>"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" accept="image/*" value="<%=cases.getImage()%>"></td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td><input type="text" name="type" value="<%=cases.getType()%>"></td>
                </tr>
                <tr>
                    <td>Form Factor</td>
                    <td><input type="text" name="formFactor" value="<%=cases.getFormFactor()%>"></td>
                </tr>
                <tr>
                    <td>Color</td>
                    <td><input type="text" name="color" value="<%=cases.getColor()%>"></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" name="quantity" value="<%=cases.getQuantity()%>"></td>
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
