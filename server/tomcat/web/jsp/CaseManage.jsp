<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector,packages.Case"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% String titlePage= (String)request.getAttribute("titlePage"); %>
        <title><%=titlePage%></title>
    </head>
    <body>

        <form action="case" method="get">
        </form>
        <a href="/jsp/insertCase.jsp"><button>Insert Case</button></a>
        <table border=1>
            <% String titleTable= (String)request.getAttribute("titleTable"); %>
            <caption><%=titleTable%></caption>
            <tr>
                <th>id</th>
                <th>name</th>
                <th>type</th>
                <th>formFactor</th>
                <th>color</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <%
            Vector<Case> vector = (Vector<Case>) request.getAttribute("data");
            for(Case cases : vector){
            %>
            <tr>
                <td><%=cases.getId()%> </td>
                <td><%=cases.getName()%> </td>
                <td><%=cases.getType()%> </td>
                <td><%=cases.getFormFactor()%> </td>
                <td><%=cases.getColor()%> </td>
                <td><a href="case?service=update&id=<%=case.getId()%>">Update</a></td>
                <td><a href="case?service=delete&id=<%=case.getId()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>