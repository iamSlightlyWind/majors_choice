<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
            <form action="/manage/profile/staff" method="post" onsubmit="return confirmChange();">

                <div class="form-item">
                    <label>Active:</label>
                    <select name="active" required>
                        <option value="1" ${staff.active==1 ? 'selected' : '' }>Activated</option>
                        <option value="-1" ${staff.active==-1 ? 'selected' : '' }>Deactivated</option>
                    </select>
                </div>

                <div class="form-item">
                    <label>Họ và Tên:</label>
                    <input type="text" name="fullname" value="${staff.fullName}" required>
                </div>

                <div class="form-item">
                    <label>Username:</label>
                    <input type="text" name="username" value="${staff.username}" required>
                </div>

                <div class="form-item">
                    <label>Password:</label>
                    <input type="password" name="fullname" value="${staff.password}" required>
                </div>

                <p>${status}</p>
                <input type="hidden" name="actor" value="staffs" />
                <input type="hidden" name="id" value="${staff.id}" />
                <div class="buttons">
                    <button type="submit" name="action" value="${submitAction}">${submitAction}</button>
                </div>
            </form>
        </body>

        </html>