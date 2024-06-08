
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 50%;
            margin: 0 auto;
        }
        .section {
            margin-bottom: 20px;
        }
        .section h2 {
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .profile-info, .account-info {
            margin-top: 20px;
        }
        .info-item {
            margin-bottom: 10px;
        }
        .info-item label {
            display: block;
            font-weight: bold;
        }
        .info-item span {
            display: block;
            margin-top: 5px;
        }
        .buttons {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Profile Page</h1>
        <div class="info-item">
            <span><c:if test="${requestScope.status!=null}">${requestScope.status}</c:if></span>
        </div>
        <div class="section profile-info">
        <c:set var="user" value="${requestScope.user}"/>
            <h2>Thông Tin Cá Nhân</h2>
            <div class="info-item">
                <label>Họ và Tên:</label>
                <span><c:out value="${user.fullName}"></c:out></span>
            </div>
            <div class="info-item">
                <label>Email:</label>
                <span><c:out value="${user.email}"></c:out></span>
            </div>
            <div class="info-item">
                <label>Số Điện Thoại:</label>
                <span><c:out value="${user.phoneNumber}"></c:out></span>
            </div>
            <div class="info-item">
                <label>Địa Chỉ:</label>
                <span><c:out value="${user.address}"></c:out></span>
            </div>
            <div class="info-item">
                <label>Ngày Sinh:</label>
                <span><c:out value="${user.dateOfBirth}"></c:out></span>
            </div>
        </div>
        
        <div class="section account-info">
            <h2>Thông Tin Tài Khoản</h2>
            <div class="info-item">
                <label>Tên Đăng Nhập:</label>
                <span><c:out value="${user.username}"></c:out></span>
            </div>
            <div class="info-item">
                <label>Mật khẩu:</label>
                <span id="maskedPassword"></span>
            </div>
        </div>
        
        <div class="buttons">
            <form action="profile" method="post" style="display:inline;">
                <button type="submit">Chỉnh Sửa Hồ Sơ</button>
            </form>
        <c:if test="${sessionScope.table == 'managers'}">
            <form action="meditprofile" method="post" style="display:inline;">
                <button type="submit">Manager Account</button>
            </form>
        </c:if>
        </div>
    </div>
    
   <script>
        // Hàm thoát các ký tự đặc biệt
        function escapeHtml(text) {
            var map = {
                '&': '&amp;',
                '<': '&lt;',
                '>': '&gt;',
                '"': '&quot;',
                "'": '&#039;'
            };
            return text.replace(/[&<>"']/g, function(m) { return map[m]; });           
        }
        // Lấy mật khẩu từ đối tượng user và thoát ký tự đặc biệt
        var password = escapeHtml("${user.password}");

        // Tạo chuỗi dấu chấm có cùng độ dài với mật khẩu
        var maskedPassword = "*".repeat(password.length);

        // Thay thế nội dung của thẻ span bằng chuỗi dấu chấm
        document.getElementById("maskedPassword").textContent = maskedPassword;
    </script>
  </body>
</html>
