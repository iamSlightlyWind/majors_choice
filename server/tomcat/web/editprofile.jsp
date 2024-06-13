<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <form action="/editprofile" method="post" onsubmit="return confirmChange();">
                <c:set var="user" value="${requestScope.user}"/> 
                <c:if test="${requestScope.possition != null}">
                    <div class="form-item">
                        <label>ID:</label>
                        <input type="text" name="id" value="<c:out value="${user.id}"></c:out>" readonly>
                    </div>
                </c:if>
                <div class="form-item">
                    <label>Tên Đăng Nhập:</label>
                    <input type="text" name="username" value="<c:out value="${user.username}"></c:out>" readonly>
                    </div>
                    <div class="form-item">
                        <label>Mật khẩu:</label>
                        <input type="password" name="password" value="<c:out value="${user.password}"></c:out>" required>
                    </div>
                <c:if test="${requestScope.possition != null}">
                    <div class="form-item">
                        <label>Possition:</label>
                        <input type="text" name="possition" value="<c:out value="${requestScope.possition}"></c:out>" readonly>
                        </div>
                        <div class="form-item">
                            <label>Active:</label>
                            <input type="number" name="active" value="<c:out value="${user.active}"></c:out>" min="0" max="1" required>
                        </div>
                </c:if>
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
                        <input type="date" name="dateOfBirth" id="dateID" required>
                    </div>
                <c:if test="${requestScope.possition != null}">
                    <div class="form-item">
                        <label>DateJoined:</label>
                        <input type="date" name="dateJoined" value="<c:out value="${user.dateJoined}"></c:out>" readonly>
                        </div>
                </c:if>
                <div class="font-item">
                    <span style="color: greenyellow; font-size: 25px">${requestScope.status} </span>
                </div>
                <div class="buttons">
                    <button type="submit">Save</button>
                </div>
            </form>
        </div>
        <script>
            function formatDateInput(dateString) {

                var date = new Date(dateString);

                var year = date.getFullYear();
                var month = ('0' + (date.getMonth() + 1)).slice(-2);
                var day = ('0' + date.getDate()).slice(-2);

                var formattedDate = year + '-' + month + '-' + day;

                return formattedDate;
            }
            var dateString = "${user.dateOfBirth}";
            var dateInput = document.getElementById("dateID");
            dateInput.value = formatDateInput(dateString);
        </script>
    </body>

</html>
