<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.CPU"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update CPU</title>
    </head>
    <body>
        <%
            CPU cpu = (CPU) request.getAttribute("cpus");
        %>
        <form action="cpus" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>ID</td>
                    <td><%=cpu.getId()%></td>
                </tr>
                <tr>
                    <td>sellingPrice</td>
                    <td><input type="number" name="sellingPrice" value="<%=cpu.getSellingPrice()%>"></td>
                </tr>
                <tr>
                    <td>costPrice</td>
                    <td><input type="number" name="costPrice" value="<%=cpu.getCostPrice()%>"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=cpu.getName()%>"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" accept="image/*" value="<%=cpu.getImage()%>"></td>
                </tr>
                <tr>
                    <td>Generation</td>
                    <td><input type="text" name="generation" value="<%=cpu.getGeneration()%>"></td>
                </tr>
                <tr>
                    <td>Socket</td>
                    <td><input type="text" name="socket" value="<%=cpu.getSocket()%>"></td>
                </tr>
                <tr>
                    <td>Cores</td>
                    <td><input type="number" name="cores" value="<%=cpu.getCores()%>"></td>
                </tr>
                <tr>
                    <td>Threads</td>
                    <td><input type="number" name="threads" value="<%=cpu.getThreads()%>"></td>
                </tr>
                <tr>
                    <td>BaseClock</td>
                    <td><input type="number" name="baseClock" value="<%=cpu.getBaseClock()%>"></td>
                </tr>
                <tr>
                    <td>BoostClock</td>
                    <td><input type="number" name="boostClock" value="<%=cpu.getBoostClock()%>"></td>
                </tr>
                <tr>
                    <td>Tdp</td>
                    <td><input type="number" name="tdp" value="<%=cpu.getTdp()%>"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Update CPU"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="update">
            <input type="hidden" name="id" value="<%=cpu.getId()%>">
        </form>
    </body>
</html>
