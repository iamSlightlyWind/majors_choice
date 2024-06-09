<%-- 
    Document   : ManagerAccount
    Created on : Jun 8, 2024, 10:09:08 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>User Account: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="register?actor=user" style="font-size:20px">Add User Account</a></h3>
        <table class="user" border="2px">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Active</th>
                    <th>DateJoined</th>
                    <th colspan="2">Edit</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${requestScope.users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.password}</td>
                        <td>${user.active}</td>
                        <td>${user.dateJoined}</td>
                        <td><a href="editprofile?id=${user.id}&action=update&actor=users">Update</a></td>
                        <td><a href="editprofile?id=${user.id}&action=delete&actor=users">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <h3>Staff Account:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="register?actor=staff" style="font-size:20px">Add Staff Account</a></h3>
        <table class="staff" border="2px">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Position</th>
                    <th>Active</th>
                    <th>DateJoined</th>
                    <th colspan="2">Edit</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="staff" items="${requestScope.staffs}">
                    <tr>
                        <td>${staff.id}</td>
                        <td>${staff.username}</td>
                        <td>${staff.password}</td>
                        <td>Staff</td>
                        <td>${staff.active}</td>
                        <td>${staff.dateJoined}</td>
                        <td></td>
                        <td><a href="editprofile?id=${staff.id}&action=update&actor=staffs">Update</a></td>
                        <td><a href="editprofile?id=${staff.id}&action=delete&actor=staffs">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
