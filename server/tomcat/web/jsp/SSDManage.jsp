<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.SSD,java.util.Locale"%>
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
        <form action="ssds" method="get">
        </form>
        <a href="/jsp/insertSSD.jsp"><button>Insert SSD</button></a>
        <table border=1>
            <% String titleTable= (String)request.getAttribute("titleTable"); %>
            <caption><%=titleTable%></caption>
            <tr>
                <th>id</th>
                <th>sellingPrice</th>
                <th>costPrice</th>
                <th>image</th>
                <th>name</th>
                <th>interface</th>
                <th>capacity</th>
                <th>cache</th>
                <th>quantity</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <%
                ArrayList<SSD> ssds = (ArrayList<SSD>) request.getAttribute("ssds");
                for (SSD ssd : ssds) {
                String  costPrice = String.format(Locale.US, "%,.0f", ssd.getCostPrice());
                String sellingPrice = String.format(Locale.US, "%,.0f", ssd.getSellingPrice());
            %>
            <tr>
                <td><%=ssd.getId()%> </td>
                <td><%=sellingPrice%> </td>
                <td><%=costPrice%> </td>
                <td><img src="images/<%=ssd.getId()%>.png" style="width: 100px; height: auto;"/></td>
                <td><%=ssd.getName()%> </td>
                <td><%=ssd.getConnectionInterface()%> </td>
                <td><%=ssd.getCapacity()%> </td>
                <td><%=ssd.getCache()%> </td>
                <td><%=ssd.getQuantity()%> </td>
                <td><a href="ssds?service=update&id=<%=ssd.getId()%>">Update</a></td>
                <td><a href="ssds?service=delete&id=<%=ssd.getId()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>

