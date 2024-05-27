<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Test" method="post">
            <input type="text" name="address" placeholder="address">
            <input type="text" name="title" placeholder="title">
            <input type="submit" value="Submit">
        </form>
        <p>${output}</p>
    </body>
</html>