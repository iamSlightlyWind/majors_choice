<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, packages.Case, java.util.Locale"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% String titlePage = (String) request.getAttribute("titlePage"); %>
        <title><%= titlePage %></title>
    </head>
    <body>
        <%
            String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        %>
        <form action="cases" method="get">
        </form>
        <a href="/jsp/insertCase.jsp"><button>Insert Case</button></a>
        <form action="cases?service=importExcel" method="post" enctype="multipart/form-data">
            <label for="excel">Chọn file Excel:</label>
            <input type="file" name="excel" id="excel" accept=".xlsx">
            <button type="submit">Import</button>
        </form>
        <table border=1>
            <% String titleTable = (String) request.getAttribute("titleTable"); %>
            <caption><%= titleTable %></caption>
            <tr>
                <th>id</th>
                <th>sellingPrice</th>
                <th>costPrice</th>
                <th>image</th>
                <th>name</th>
                <th>formFactor</th>
                <th>color</th>
                <th>quantity</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <%
                ArrayList<Case> cases = (ArrayList<Case>) request.getAttribute("cases");
                for (Case caseItem : cases) {
                    String costPrice = String.format(Locale.US, "%,.0f", caseItem.getCostPrice());
                    String sellingPrice = String.format(Locale.US, "%,.0f", caseItem.getSellingPrice());
            %>
            <tr>
                <td><%= caseItem.getId() %> </td>
                <td><%= sellingPrice %> </td>
                <td><%= costPrice %> </td>
                <td><img src="images/<%= caseItem.getId() %>.png" style="width: 100px; height: auto;"/></td>
                <td><%= caseItem.getName() %> </td>
                <td><%= caseItem.getFormFactor() %> </td>
                <td><%= caseItem.getColor() %> </td>
                <td><%= caseItem.getQuantity() %> </td>
                <td><a href="cases?service=update&id=<%= caseItem.getId() %>">Update</a></td>
                <td><a href="cases?service=delete&id=<%= caseItem.getId() %>">Delete</a></td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
