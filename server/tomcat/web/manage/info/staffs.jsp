<%-- Document : staffaccount Created on : Jun 12, 2024, 3:32:07 PM Author : thang --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
            </head>

            <body>
                <h3>Staff Account:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <form form action="/manage/profile/staff" method="get">
                        <button type="submit">Add Staff</button>
                    </form>
                </h3>
                <table class="staff" border="2px">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Username</th>
                            <th>Active</th>
                            <th colspan="2">Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="staff" items="${requestScope.staffs}">
                            <tr>
                                <td>${staff.id}</td>
                                <td>${staff.fullName}</td>
                                <td>${staff.username}</td>
                                <td>${staff.active == 1 ? 'Activated' : 'Deactivated'}</td>
                                <td><a
                                        href="/editprofile?id=${staff.id}&action=update&actor=staffs&user=${staff.username}">Update</a>
                                </td>
                                <td><a
                                        href="/editprofile?id=${staff.id}&action=delete&actor=staffs&user=${staff.username}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </body>

            </html>