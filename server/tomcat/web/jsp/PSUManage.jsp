<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.PSU,java.util.Locale"%>
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
        <form action="psus" method="get">
        </form>
        <a href="/jsp/insertPSU.jsp"><button>Insert PSU</button></a>
        <table border=1>
            <% String titleTable= (String)request.getAttribute("titleTable"); %>
            <caption><%=titleTable%></caption>
            <tr>
                <th>id</th>
                <th>sellingPrice</th>
                <th>costPrice</th>
                <th>image</th>
                <th>name</th>
                <th>wattage</th>
                <th>effciency</th>
                <th>quantity</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <%
                ArrayList<PSU> psus = (ArrayList<PSU>) request.getAttribute("psus");
                for (PSU psu : psus) {
                String  costPrice = String.format(Locale.US, "%,.0f", psu.getCostPrice());
                String sellingPrice = String.format(Locale.US, "%,.0f", psu.getSellingPrice());
            %>
            <tr>
                <td><%=psu.getId()%> </td>
                <td><%=sellingPrice%> </td>
                <td><%=costPrice%> </td>
                <td><img src="images/<%=psu.getId()%>.png" style="width: 100px; height: auto;"/></td>
                <td><%=psu.getName()%> </td>
                <td><%=psu.getWattage()%> </td>
                <td><%=psu.getEfficiency()%> </td>
                <td><%=psu.getQuantity()%> </td>
                <td><a href="psus?service=update&id=<%=psu.getId()%>">Update</a></td>
                <td><a href="psus?service=delete&id=<%=psu.getId()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
