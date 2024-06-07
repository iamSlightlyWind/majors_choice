<%-- 
    Document   : updateCPU
    Created on : Jun 6, 2024, 9:15:34 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector,packages.CPU"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update CPU</title>
    </head>
    <body>
        <%
Vector<CPU> vector = (Vector<CPU>) request.getAttribute("vector");
CPU cpu = vector.get(0);
        %>
        <form action="cpu" method="post" >
            <table>
                <tr>
                    <td>ID</td>
                    <td><%=cpu.getId()%></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%=cpu.getName()%>"></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="file" value="<%=cpu.getImages()%>"></td>
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
