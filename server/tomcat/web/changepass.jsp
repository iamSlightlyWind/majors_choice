<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password</title>
        <script type="text/javascript">
            function confirmChange() {
                if (confirm("Are you sure you want to change your password?")) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <form action="changepass" method="post" onsubmit="return confirmChange();">
            <label for="oldPassword">Old Password:</label>
            <input type="oldpass" id="oldPassword" required><br><br>

            <label for="newPassword">New Password:</label>
            <input type="newpass" id="newPassword" required><br><br>

            <label for="confirmPassword">Confirm New Password:</label>
            <input type="comfirm" id="confirmPassword" required><br><br>

            <input type="submit" value="Change Password">
        </form>
        <p style="font-size:large;color: green">${requestScope.status}</p>
    </body>
</html>
