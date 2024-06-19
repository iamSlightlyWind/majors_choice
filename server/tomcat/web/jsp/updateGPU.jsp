<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.GPU"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update GPU</title>
    </head>
    <body>
        <%
            GPU gpu = (GPU) request.getAttribute("gpu");
        %>
        <form action="gpus" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>ID</td>
                    <td><%=gpu.getId()%></td>
                </tr>
                <tr>
                    <td>SellingPrice</td>
                    <td><input type="number" name="sellingPrice" value="<%=gpu.getSellingPrice()%>"></td>
                </tr>
                <tr>
                    <td>CostPrice</td>
                    <td><input type="number" name="costPrice" value="<%=gpu.getCostPrice()%>"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=gpu.getName()%>"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" accept="image/*" value="<%=gpu.getImage()%>"></td>
                </tr>
                <tr>
                    <td>Generation</td>
                    <td><input type="text" name="generation" value="<%=gpu.getGeneration()%>"></td>
                </tr>
                <tr>
                    <td>Vram</td>
                    <td><input type="number" name="vram" value="<%=gpu.getVram()%>"></td>
                </tr>
                <tr>
                    <td>BaseClock</td>
                    <td><input type="number" name="baseClock" value="<%=gpu.getBaseClock()%>"></td>
                </tr>
                <tr>
                    <td>BoostClock</td>
                    <td><input type="number" name="boostClock" value="<%=gpu.getBoostClock()%>"></td>
                </tr>
                <tr>
                    <td>Tdp</td>
                    <td><input type="number" name="tdp" value="<%=gpu.getTdp()%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update GPU"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="update">
            <input type="hidden" name="id" value="<%=gpu.getId()%>">
        </form>
    </body>
</html>