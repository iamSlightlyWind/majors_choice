package payment;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class PaymentValidator {

    public static void main(String[] args) throws Exception {
        String vnp_Amount = "950000000";
        String vnp_BankCode = "VNPAY";
        String vnp_CardType = "QRCODE";
        String vnp_OrderInfo = "Thanh toan don hang:54989335";
        String vnp_PayDate = "20240621011257";
        String vnp_ResponseCode = "24";
        String vnp_TmnCode = "H4H0HG0B";
        String vnp_TransactionNo = "0";
        String vnp_TransactionStatus = "02";
        String vnp_TxnRef = "54989335";
        String vnp_SecureHash = "4cf0d57c19c6d1daf72ccea786dafd2958cc1b33414de37fc7b937f689b54868d6bf58cf639ada1be9886188085a1b41d1417cadd2725b3c94e93efd178c2458";

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Amount", vnp_Amount);
        vnp_Params.put("vnp_BankCode", vnp_BankCode);
        vnp_Params.put("vnp_CardType", vnp_CardType);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_PayDate", vnp_PayDate);
        vnp_Params.put("vnp_ResponseCode", vnp_ResponseCode);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_TransactionNo", vnp_TransactionNo);
        vnp_Params.put("vnp_TransactionStatus", vnp_TransactionStatus);
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_SecureHash", vnp_SecureHash);

        System.out.println("Validator 1: " + validate(vnp_Params));
    }

    public static boolean validate(Map<String, String> vnp_Params) throws UnsupportedEncodingException {
        String receivedHash = vnp_Params.remove("vnp_SecureHash");
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        for (String fieldName : fieldNames) {
            if (vnp_Params.get(fieldName) != null && !vnp_Params.get(fieldName).isEmpty()) {
                hashData.append(fieldName)
                        .append('=')
                        .append(URLEncoder.encode(vnp_Params.get(fieldName), StandardCharsets.US_ASCII.toString()));
                if (!fieldName.equals(fieldNames.get(fieldNames.size() - 1))) {
                    hashData.append('&');
                }
            }
        }

        String computedHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        boolean isValid = computedHash.equals(receivedHash);
        return isValid;
    }
}