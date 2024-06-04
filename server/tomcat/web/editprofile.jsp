<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
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
    <div class="container">
        <h1>Edit Profile</h1>
        <form action="editprofile" method="post" onsubmit="return confirmChange();">
            <div class="form-item">
                <label>Họ và Tên:</label>
                <input type="text" name="fullname" value="<c:out value="${user.fullname}"></c:out>">
            </div>
            <div class="form-item">
                <label>Email:</label>
                <input type="text" name="email" value="<c:out value="${user.email}"></c:out>">
            </div>
            <div class="form-item">
                <label>Số Điện Thoại:</label>
                <input type="text" name="phoneNumber" value="<c:out value="${user.phoneNumber}"></c:out>">
            </div>
            <div class="form-item">
                <label>Địa Chỉ:</label>
                <input type="text" name="address" value="<c:out value="${user.address}"></c:out>">
            </div>
            <div class="form-item">
                <label>Ngày Sinh:</label>
                <input type="date" name="dateOfBirth" value="<c:out value="${user.dateOfBirth}"></c:out>">
            </div>
            <div class="buttons">
                <button type="submit">Save</button>
            </div>
        </form>
    </div>
</body>
</html>
