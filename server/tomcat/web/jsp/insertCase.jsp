<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector,packages.Case"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Case</title>
    </head>
    <body>
        <form action="cases?service=insertCase" method="post" enctype="multipart/form-data">
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
                    <td>Type</td>
                    <td><input type="text" name="type"></td>
                </tr>
                <tr>
                    <td>Form Factor</td>
                    <td><input type="text" name="formFactor"></td>
                </tr>
                <tr>
                    <td>Color</td>
                    <td><input type="text" name="color"></td>
                </tr>
                <tr>
                    <td>quantity</td>
                    <td><input type="number" name="quantity"></td>
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
