<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.RAM"%>
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
        <form action="rams" method="get">
        </form>
        <a href="/tomcat/jsp/insertRAM.jsp"><button>Insert RAM</button></a>
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
                <th>capacity</th>
                <th>speed</th>
                <th>latency</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <%
                ArrayList<RAM> rams = (ArrayList<RAM>) request.getAttribute("rams");
                for (RAM ram : rams) {
            %>
            <tr>
                <td><%=ram.getId()%> </td>
                <td><%=ram.getSellingPrice()%> </td>
                <td><%=ram.getCostPrice()%> </td>
                <td><img href="#" src="/tomcat/assets/images/<%=ram.getImage()%>" style="width: 100px; height: auto;"/></td>
                <td><%=ram.getName()%> </td>
                <td><%=ram.getGeneration()%> </td>
                <td><%=ram.getCapacity()%> </td>
                <td><%=ram.getSpeed()%> </td>
                <td><%=ram.getLatency()%> </td>
                <td><a href="rams?service=update&id=<%=ram.getId()%>">Update</a></td>
                <td><a href="rams?service=delete&id=<%=ram.getId()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>

