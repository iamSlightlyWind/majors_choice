<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.Motherboard,java.util.Locale"%>
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
        <form action="motherboards" method="get">
        </form>
        <a href="/jsp/insertMotherboard.jsp"><button>Insert Motherboard</button></a>
        <table border=1>
            <% String titleTable= (String)request.getAttribute("titleTable"); %>
            <caption><%=titleTable%></caption>
            <tr>
                <th>id</th>
                <th>sellingPrice</th>
                <th>costPrice</th>
                <th>image</th>
                <th>name</th>
                <th>socket</th>
                <th>chipset</th>
                <th>igpu</th>
                <th>formFactor</th>
                <th>ramType</th>
                <th>maxRamSpeed</th>
                <th>maxRamCapacity</th>
                <th>ramSlots</th>
                <th>wifi</th>
                <th>quantity</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <%
                ArrayList<Motherboard> motherboards = (ArrayList<Motherboard>) request.getAttribute("motherboards");
                for (Motherboard motherboard : motherboards) {
                String  costPrice = String.format(Locale.US, "%,.0f", motherboard.getCostPrice());
                String sellingPrice = String.format(Locale.US, "%,.0f", motherboard.getSellingPrice());
            %>
            <tr>
                <td><%=motherboard.getId()%> </td>
                <td><%=sellingPrice%> </td>
                <td><%=costPrice%> </td>
                <td><img src="<%=motherboard.getId()%>.png" style="width: 100px; height: auto;"/></td>
                <td><%=motherboard.getName()%> </td>
                <td><%=motherboard.getSocket()%> </td>
                <td><%=motherboard.getChipset()%> </td>
                <td><%=motherboard.getIgpu()%> </td>
                <td><%=motherboard.getFormFactor()%> </td>
                <td><%=motherboard.getRamType()%> </td>
                <td><%=motherboard.getMaxRamSpeed()%> </td>
                <td><%=motherboard.getMaxRamCapacity()%> </td>
                <td><%=motherboard.getRamSlots()%> </td>
                <td><%=motherboard.getWifi()%> </td>
                <td><%=motherboard.getQuantity()%> </td>
                <td><a href="motherboards?service=update&id=<%=motherboard.getId()%>">Update</a></td>
                <td><a href="motherboards?service=delete&id=<%=motherboard.getId()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
