package payment;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.User;
import packages.wrap.Cart;
import packages.wrap.ProductCount;

public class Validate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User currentUser = (User) request.getSession().getAttribute("userObject");
        currentUser.cart = (Cart) request.getSession().getAttribute("cartObject");
        currentUser.cart.updateQuantity();
        currentUser.cart.updateCart();

        if (validate(getParams(request))) {
            String status = request.getParameter("vnp_TransactionStatus");
            if (status.equals("00")) {
                currentUser.cart.placeOrder();
                response.sendRedirect("/Cart");
            } else {
                request.setAttribute("cartPriceDouble", new DecimalFormat("#").format(currentUser.cart.total));
                request.setAttribute("user", currentUser.fullName);
                request.setAttribute("ProductCount", (ArrayList<ProductCount>) currentUser.cart.quantities);
                currentUser.cart.updateQuantity();
                request.setAttribute("cartPrice", String.format(Locale.US, "%,.2f", currentUser.cart.total));
                request.setAttribute("status", "Payment not completed, please try again.");
                request.getRequestDispatcher("/cart/cart.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("cartPriceDouble", new DecimalFormat("#").format(currentUser.cart.total));
            request.setAttribute("user", currentUser.fullName);
            request.setAttribute("ProductCount", (ArrayList<ProductCount>) currentUser.cart.quantities);
            currentUser.cart.updateQuantity();
            request.setAttribute("cartPrice", String.format(Locale.US, "%,.2f", currentUser.cart.total));
            request.setAttribute("status", "Payment failed to validate. Please try again or reach out to support.");
            request.getRequestDispatcher("/cart/cart.jsp").forward(request, response);
        }
    }

    public Map<String, String> getParams(HttpServletRequest request) {
        Map<String, String> vnp_Params = new HashMap<>();
        for (String key : request.getParameterMap().keySet()) {
            vnp_Params.put(key, request.getParameter(key));
        }
        return vnp_Params;
    }

    public boolean validate(Map<String, String> vnp_Params) throws UnsupportedEncodingException {
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
