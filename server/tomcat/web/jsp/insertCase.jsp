<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector,packages.Case"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
    </head>
    <body>
        <form action="/cases" method="post" >
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="number" name="id"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td><input type="text" name="type"></td>
                </tr>
                <tr>
                    <td>FormFactor</td>
                    <td><input type="text" name="formFactor"></td>
                </tr>
                <tr>
                    <td>Color</td>
                    <td><input type="text" name="color"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Add Case"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="insertCase">
        </form>
    </body>
</html>

