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
                        <th>Activation</th>
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
                            <td>${user.active == 1 ? 'Activated' : (user.active == 0 ? 'Not Activated' : 'Deactivated')}</td>
                            <td>${user.dateJoined}</td>
                            <td><a href="/editprofile?id=${user.id}&action=update&actor=users&user=${user.username}">Update</a></td>
                            <td><a href="/editprofile?id=${user.id}&action=delete&actor=users&user=${user.username}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </body>

        </html>