<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.CPU, java.util.Locale"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% String titlePage= (String)request.getAttribute("titlePage"); %>
        <title><%=titlePage%></title>
    </head>
    <body>
        <%
            String url = request.getScheme()+ "://"+ request.getServerName()+":"+request.getServerPort()+request.getContextPath();
        %>
        <form action="cpus" method="get">
        </form>
        <a href="/jsp/insertCPU.jsp"><button>Insert CPU</button></a>
        <table border=1>
            <% String titleTable= (String)request.getAttribute("titleTable"); %>
            <caption><%=titleTable%></caption>
            <tr>
                <th>id</th>
                <th>sellingPrice</th>
                <th>costPrice</th>
                <th>image</th>
                <th>name</th>
                <th>generation</th>
                <th>igpu</th>
                <th>socket</th>
                <th>cores</th>
                <th>threads</th>
                <th>baseClock</th>
                <th>boostClock</th>
                <th>tdp</th>
                <th>quantity</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <%
                ArrayList<CPU> cpus = (ArrayList<CPU>) request.getAttribute("cpus");
                for (CPU cpu : cpus) {
                String  costPrice = String.format(Locale.US, "%,.0f", cpu.getCostPrice());
                String sellingPrice = String.format(Locale.US, "%,.0f", cpu.getSellingPrice());
            %>
            <tr>
                <td><%=cpu.getId()%> </td>
                <td><%=sellingPrice%> </td>
                <td><%=costPrice%> </td>
                <td><img src="<%=cpu.getId()%>.png" style="width: 100px; height: auto;"/></td>
                <td><%=cpu.getName()%> </td>
                <td><%=cpu.getGeneration()%> </td>
                <td><%=cpu.getIgpu()%> </td>
                <td><%=cpu.getSocket()%> </td>
                <td><%=cpu.getCores()%> </td>
                <td><%=cpu.getThreads()%> </td>
                <td><%=cpu.getBaseClock()%> </td>
                <td><%=cpu.getBoostClock()%> </td>
                <td><%=cpu.getTdp()%> </td>
                <td><%=cpu.getQuantity()%> </td>
                <td><a href="cpus?service=update&id=<%=cpu.getId()%>">Update</a></td>
                <td><a href="cpus?service=delete&id=<%=cpu.getId()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
