<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.GPU"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
    </head>
<!--    enctype="multipart/form-data"-->
    <body>
        <form action="/tomcat/gpus?service=insertGPU" method="post" >
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
                    <td>Vram</td>
                    <td><input type="text" name="vram"></td>
                </tr>
                <tr>
                    <td>BaseClock</td>
                    <td><input type="number" name="baseClock"></td>
                </tr>
                <tr>
                    <td>BoostClock</td>
                    <td><input type="number" name="boostClock"></td>
                </tr>
                <tr>
                    <td>Tdp</td>
                    <td><input type="number" name="tdp"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Add GPU"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="insertGPU">
        </form>
    </body>
</html>

