<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.CPU"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
    </head>
    <body>
        <form action="/cpus?service=insertCPU" method="post" enctype="multipart/form-data">
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
                    <td>igpu</td>
                    <td><input type="text" name="igpu" ></td>
                </tr>
                <tr>
                    <td>socket</td>
                    <td><input type="text" name="socket"></td>
                </tr>
                <tr>
                    <td>Cores</td>
                    <td><input type="number" name="cores"></td>
                </tr>
                <tr>
                    <td>Threads</td>
                    <td><input type="number" name="threads"></td>
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
                    <td>quantity</td>
                    <td><input type="number" name="quantity"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Add CPU"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="insertCPU">
        </form>
    </body>
</html>

