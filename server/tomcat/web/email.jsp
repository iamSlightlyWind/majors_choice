<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="/register" method="post">
            <input type="text" name="username" placeholder="username">
            <input type="text" name="password" placeholder="password">
            <input type="text" name="fullName" placeholder="fullName">
            <input type="text" name="email" placeholder="email">
            <input type="text" name="phoneNumber" placeholder="phoneNumber">
            <input type="text" name="address" placeholder="address">
            <input type="date" name="dateOfBirth" placeholder="dateOfBirth">
            <input type="submit" value="Submit">
        </form>
        <p>${output}</p>
    </body>
</html>