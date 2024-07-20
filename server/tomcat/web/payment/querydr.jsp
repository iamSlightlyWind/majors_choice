<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Query</title>
        <script src="/payment/assets/jquery-1.11.3.min.js"></script>
    </head>

    <body>
        <h3>Query</h3>
        <form action="/payment/paymentQuery" id="frmQerydr" method="Post">
            <label for="order_id">Mã giao dịch cần truy vấn (Giá trị của vnp_TxnRef)</label>
            <input id="order_id" name="order_id" type="text" />
            <br>
            <label for="trans_date">Thời gian khởi tạo giao dịch (Giá trị của vnp_CreateDate yêu cầu thanh toán)</label>
            <input id="trans_date" name="trans_date" type="text" placeholder="yyyyMMddHHmmss" />
            <button type="submit">QueryDr</button>
        </form>
    </body>

    </html>