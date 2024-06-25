<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.GPU,java.util.Locale"%>
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
        <form action="gpus" method="get">
        </form>
        <a href="/jsp/insertGPU.jsp"><button>Insert GPU</button></a>
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
                <th>vram</th>
                <th>baseClock</th>
                <th>boostClock</th>
                <th>tdp</th>
                <th>quantity</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <%
                ArrayList<GPU> gpus = (ArrayList<GPU>) request.getAttribute("gpus");
                for (GPU gpu : gpus) {
                String  costPrice = String.format(Locale.US, "%,.0f", gpu.getCostPrice());
                String sellingPrice = String.format(Locale.US, "%,.0f", gpu.getSellingPrice());
            %>
            <tr>
                <td><%=gpu.getId()%> </td>
                <td><%=sellingPrice%> </td>
                <td><%=costPrice%> </td>
                <td><img src="images/<%=gpu.getId()%>.png" style="width: 100px; height: auto;"/></td>
                <td><%=gpu.getName()%> </td>
                <td><%=gpu.getGeneration()%> </td>
                <td><%=gpu.getVram()%> </td>
                <td><%=gpu.getBaseClock()%> </td>
                <td><%=gpu.getBoostClock()%> </td>
                <td><%=gpu.getTdp()%> </td>
                <td><%=gpu.getQuantity()%> </td>
                <td><a href="gpus?service=update&id=<%=gpu.getId()%>">Update</a></td>
                <td><a href="gpus?service=delete&id=<%=gpu.getId()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
