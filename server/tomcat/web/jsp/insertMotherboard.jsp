<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,packages.Motherboard"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
    </head>
    <!--    enctype="multipart/form-data"-->
    <body>
        <form action="/motherboards?service=insertMotherboard" method="post" enctype="multipart/form-data">
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
                    <td>Socket</td>
                    <td><input type="text" name="socket"></td>
                </tr>
                <tr>
                    <td>Chipset</td>
                    <td><input type="text" name="chipset"></td>
                </tr>
                <tr>
                    <td>igpu</td>
                    <td><input type="number" name="igpu"></td>
                </tr>
                <tr>
                    <td>FormFactor</td>
                    <td><input type="text" name="formFactor"></td>
                </tr>
                <tr>
                    <td>RamType</td>
                    <td><input type="text" name="ramType"></td>
                </tr>
                <tr>
                    <td>MaxRamSpeed</td>
                    <td><input type="number" name="maxRamSpeed"></td>
                </tr>
                <tr>
                    <td>MaxRamCapacity</td>
                    <td><input type="number" name="maxRamCapacity"></td>
                </tr>
                <tr>
                    <td>ramSlots</td>
                    <td><input type="number" name="ramSlots"></td>
                </tr>
                <tr>
                    <td>wifi</td>
                    <td><input type="number" name="wifi"></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" name="quantity"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Add Motherboard"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>       
            </table>
            <input type="hidden" name="service" value="insertMotherboard">
        </form>
    </body>
</html>

