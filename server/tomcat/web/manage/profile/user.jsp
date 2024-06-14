<%-- 
    Document   : user
    Created on : Jun 10, 2024, 9:02:38 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .container {
                width: 50%;
                margin: 0 auto;
            }

            .form-item {
                margin-bottom: 15px;
            }

            .form-item label {
                display: block;
                font-weight: bold;
            }

            .form-item input {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
            }

            .buttons {
                margin-top: 20px;
            }
        </style>
        <script type="text/javascript">
            function confirmChange() {
                if (confirm("Are you sure you want to change your profile?")) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <c:set var="user" value="${requestScope.user}"/>
        <c:set var="pos" value="${requestScope.possition}"/>
        <form action="/manage/profile/user" method="post" onsubmit="return confirmChange();">
            
            <div class="form-item">
                <label>Active:</label>
                <input type="number" name="active" value="<c:out value="${user.active}"></c:out>" min="0" max="1" required>
            </div>

            <div class="form-item">
                <label>Họ và Tên:</label>
                <input type="text" name="fullname" value="<c:out value="${user.fullName}"></c:out>" required>
            </div>

            <div class="form-item">
                <label>Email:</label>
                <input type="text" name="email" value="<c:out value="${user.email}"></c:out>" required>
            </div>

            <div class="form-item">
                <label>Số Điện Thoại:</label>
                <input type="text" name="phoneNumber" value="<c:out value="${user.phoneNumber}"></c:out>" required>
            </div>

            <div class="form-item">
                <label>Địa Chỉ:</label>
                <input type="text" name="address" value="<c:out value="${user.address}"></c:out>" required>
            </div>

            <div class="form-item">
                <label>Ngày Sinh:</label>
                <input type="date" name="dateOfBirth" value="<c:out value="${user.dateOfBirth}"></c:out>" required>
            </div>
            
                <p>${requestScope.status}</p>
            <input type="hidden" name="actor" value="${pos}"/>
            <input type="hidden" name="username" value="${user.username}"/>
            <div class="buttons">
                    <button type="submit">Save</button>
            </div>
        </form>
    </body>
</html>