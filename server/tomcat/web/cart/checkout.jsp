<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <script src="/payment/assets/jquery-1.11.3.min.js"></script>
        </head>

        <body>
            <form action="/Cart" method="get">
                <button type="submit" name="action" value="restore">Back to Cart</button>
            </form>
            <p> confirm your order </p>
            <c:forEach var="ProductCount" items="${ProductCount}">
                <p> ${ProductCount.name} </p>
                <p> ${ProductCount.count} x ${ProductCount.pricePer} </p>
            </c:forEach>
            <p>Total: ${cartPrice}</p>
            <p>Hardware Validation</p>
            <p>${validation}</p>

            <form action="/payment/vnpayajax" id="frmCreateOrder" method="post">
                <p>Confirm your shipping information: </p>
                <input type="text" required="true" name="fullName" placeholder="Full Name" value="${user.fullName}" />
                <input type="text" required="true" name="address" placeholder="Address" value="${user.address}" />
                <input type="text" required="true" name="phone" placeholder="Phone Number"
                    value="${user.phoneNumber}" />
                <input type="hidden" type="text" name="amount" value="${cartPriceDouble}" />
                <input type="hidden" name="language" value="vn" />
                <input type="hidden" name="bankCode" value="" />

                <p>Select Payment Method:</p>
                <input type="radio" name="paymentMethod" value="Cash"> Cash on Delivery<br>
                <input type="radio" name="paymentMethod" value="Online Banking" checked> Online Banking<br>

                <input type="submit" value="Continue to Payment" />
            </form>
            <script defer="" src="https://unpkg.com/@teleporthq/teleport-custom-scripts"></script>
            <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
            <script type="text/javascript">
                $("#frmCreateOrder").submit(function () {
                    var postData = $("#frmCreateOrder").serialize();
                    var submitUrl = $("#frmCreateOrder").attr("action");
                    $.ajax({
                        type: "POST",
                        url: submitUrl,
                        data: postData,
                        dataType: 'JSON',
                        success: function (x) {
                            if (x.code === '00') {
                                if (window.vnpay) {
                                    vnpay.open({ width: 768, height: 600, url: x.data });
                                } else {
                                    location.href = x.data;
                                }
                                return false;
                            } else {
                                alert(x.Message);
                            }
                        }
                    });
                    return false;
                });
            </script>
        </body>