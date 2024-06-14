<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>

        <body>
            <table class="user" border="2px">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Phone Number</th>
                        <th>Active</th>
                        <th>DateJoined</th>
                        <th colspan="2">Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.fullName}</td>
                            <td>${user.phoneNumber}</td>
                            <td>${user.active}</td>
                            <td>${user.dateJoined}</td>
                            <td><a href="/editprofile?id=${user.id}&action=update&actor=users">Update</a></td>
                            <td><a href="/editprofile?id=${user.id}&action=delete&actor=users">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </body>

        </html>