<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.SSD"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
    </head>
    <!--    enctype="multipart/form-data"-->
    <body>
        <form action="/ssds?service=insertSSD" method="post" enctype="multipart/form-data" >
            <table>
                <tr>
                    <td>SellingPrice</td>
                    <td><input type="number" name="sellingPrice" ></td>
                </tr>
                <tr>
                    <td>CostPrice</td>
                    <td><input type="number" name="costPrice" ></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" ></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Interface</td>
                    <td><input type="text" name="interface"></td>
                </tr>
                <tr>
                    <td>Capacity</td>
                    <td><input type="number" name="capacity"></td>
                </tr>
                <tr>
                    <td>Cache</td>
                    <td><input type="number" name="cache"></td>
                </tr>
                <tr>
                    <td>quantity</td>
                    <td><input type="number" name="quantity"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Add SSD"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="insertSSD">
        </form>
    </body>
</html>

