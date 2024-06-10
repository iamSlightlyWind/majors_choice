<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.RAM"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
    </head>
    <!--    enctype="multipart/form-data"-->
    <body>
        <form action="/tomcat/rams?service=insertRAM" method="post" >
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
                    <td>Generation</td>
                    <td><input type="text" name="generation"></td>
                </tr>
                <tr>
                    <td>Capacity</td>
                    <td><input type="number" name="capacity"></td>
                </tr>
                <tr>
                    <td>Speed</td>
                    <td><input type="number" name="speed"></td>
                </tr>
                <tr>
                    <td>Latency</td>
                    <td><input type="number" name="latency"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Add RAM"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="insertRAM">
        </form>
    </body>
</html>

