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
            Case caseItem = (Case) request.getAttribute("caseItem");
        %>
        <form action="cases" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>ID</td>
                    <td><%=caseItem.getId()%></td>
                </tr>
                <tr>
                    <td>Selling Price</td>
                    <td><input type="number" name="sellingPrice" value="<%=caseItem.getSellingPrice()%>" step="0.01"></td>
                </tr>
                <tr>
                    <td>Cost Price</td>
                    <td><input type="number" name="costPrice" value="<%=caseItem.getCostPrice()%>" step="0.01"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=caseItem.getName()%>"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" accept="image/*" value="<%=caseItem.getImage()%>"></td>
                </tr>
                <tr>
                    <td>Form Factor</td>
                    <td><input type="text" name="formFactor" value="<%=caseItem.getFormFactor()%>"></td>
                </tr>
                <tr>
                    <td>Color</td>
                    <td><input type="text" name="color" value="<%=caseItem.getColor()%>"></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" name="quantity" value="<%=caseItem.getQuantity()%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update Case"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="update">
            <input type="hidden" name="id" value="<%=caseItem.getId()%>">
        </form>
    </body>
</html>
