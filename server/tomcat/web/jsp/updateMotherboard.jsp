<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.Motherboard"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Motherboard</title>
    </head>
    <body>
        <%
             Motherboard motherboard = (Motherboard) request.getAttribute("motherboards");
        %>
        <form action="motherboards" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>ID</td>
                    <td><%=motherboard.getId()%></td>
                </tr>
                <tr>
                    <td>sellingPrice</td>
                    <td><input type="number" name="sellingPrice" value="<%=motherboard.getSellingPrice()%>"></td>
                </tr>
                <tr>
                    <td>costPrice</td>
                    <td><input type="number" name="costPrice" value="<%=motherboard.getCostPrice()%>"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=motherboard.getName()%>"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" accept="image/*" value="<%=motherboard.getImage()%>"></td>
                </tr>
                <tr>
                    <td>Socket</td>
                    <td><input type="text" name="socket" value="<%=motherboard.getSocket()%>"></td>
                </tr>
                <tr>
                    <td>Chipset</td>
                    <td><input type="text" name="chipset" value="<%=motherboard.getChipset()%>"></td>
                </tr>
                <tr>
                    <td>FormFactor</td>
                    <td><input type="text" name="formFactor" value="<%=motherboard.getFormFactor()%>"></td>
                </tr>
                <tr>
                    <td>RamType</td>
                    <td><input type="text" name="ramType" value="<%=motherboard.getRamType()%>"></td>
                </tr>
                <tr>
                    <td>maxRamSpeed</td>
                    <td><input type="number" name="maxRamSpeed" value="<%=motherboard.getMaxRamSpeed()%>"></td>
                </tr>
                <tr>
                    <td>RamSlots</td>
                    <td><input type="number" name="ramSlots" value="<%=motherboard.getRamSlots()%>"></td>
                </tr>
                <tr>
                    <td>Wifi</td>
                    <td><input type="number" name="wifi" value="<%=motherboard.getWifi()%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update Motherboard"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="update">
            <input type="hidden" name="id" value="<%=motherboard.getId()%>">
        </form>
    </body>
</html>