package main;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class Email {
    private final String username = "phongpthe182589@fpt.edu.vn";
    private final String password = "vbnr ziks qpxr prgr";

    public void sendConfirmCode(String email, String code) {
        String htmlContent = head()
                + "\n<body>\n" + //
                "    <div class=\"container\">\n" + //
                "        <h1>Welcome to Major's Choice!</h1>\n" + //
                "        <p>Thank you for registering a new account.</p>\n" + //
                "        <p>Your account registration confirmation code is:</p>\n" + //
                "        <p class=\"code\">" + code + "</p>\n" + //
                "        <p>Please enter this code to confirm your account.</p>\n" + //
                "        <p>If you did not request this, please ignore this email.</p>\n" + //
                "\n" + //
                "        <br>\n" + //
                "        <p class=\"footer\">The Major's Choice Team</p>\n" + //
                "        <p class=\"footer\"><a class=\"link\" href=\"https://choice.themajorones.dev\">https://choice.themajorones.dev</a></p>\n"
                + //
                "    </div>\n" + //
                "</body>\n" + //
                "\n" + //
                "</html>";

        sendEmail(email, "Confirm your account on Major's Choice", htmlContent);
    }

    public void sendRecoveryPassword(String email, String password) {
        String htmlContent = head()
                + "\n<body>\n" + //
                "    <div class=\"container\">\n" + //
                "        <h1>Recover your account at Major's Choice!</h1>\n" + //
                "        <p>You sent us a request to reset your password.</p>\n" + //
                "        <p>Here is your new password:</p>\n" + //
                "        <p class=\"code\">" + password + "</p>\n" + //
                "        <p>Please login using this new password if you wish to reset it.<br>You can change your password later in\n"
                + //
                "            profile settings.</p>\n" + //
                "        <p>Otherwise, your old password will stay the same.</p>\n" + //
                "\n" + //
                "        <br>\n" + //
                "        <p class=\"footer\">Your information is in safe hands.</p>\n" + //
                "        <p class=\"footer\">The Major's Choice Team</p>\n" + //
                "        <p class=\"footer\"><a class=\"link\" href=\"https://choice.themajorones.dev\">https://choice.themajorones.dev</a></p>\n"
                + //
                "    </div>\n" + //
                "</body>\n" + //
                "\n" + //
                "</html>";

        sendEmail(email, "Recover your account at Major's Choice", htmlContent);
    }

    public void sendGreet(String email, String username) {
        String htmlContent = head()
                + "\n<body>\n" + //
                "    <div class=\"container\">\n" + //
                "        <h1>Welcome to Major's Choice!</h1>\n" + //
                "        <p>Thank you for registering a new account. We're excited to have you on board.</p>\n" + //
                "        <p>Your account has been successfully registered with the username:<br><span class=\"code\">"
                + username + "</span></p>\n"
                + //
                "        <p>You can now login and start exploring our platform.<br>Remember, you can always update your profile settings\n"
                + //
                "            at any time.</p>\n" + //
                "\n" + //
                "        <p>If you did not register this account, please contact our support team at <a\n" + //
                "                href=\"mailto:support@themajorones.dev\">support@themajorones.dev</a>.</p>\n" + //
                "\n" + //
                "        <br>\n" + //
                "        <p class=\"footer\">Enjoy shopping with Major's Choice!</p>\n" + //
                "        <p class=\"footer\">The Major's Choice Team</p>\n" + //
                "        <p class=\"footer\"><a class=\"link\" href=\"https://choice.themajorones.dev\">https://choice.themajorones.dev</a></p>\n"
                + //
                "    </div>\n" + //
                "</body>\n" + //
                "\n" + //
                "</html>";

        sendEmail(email, "Welcome to Major's Choice!", htmlContent);
    }

    public void sendOrderStatus(String email, String orderID, String status) {
        String htmlContent = head()
                + "\n<body>\n" + //
                "    <div class=\"container\">\n" + //
                "        <h1>Your order has been updated!</h1>\n" + //
                "        <p>Order ID <b>" + orderID + "<b> has been updated to the following:</p>\n" + //
                "        <p class=\"code\">Order Status: " + status + "</p>\n" + //
                "        <p>You can check the status of your order by clicking <a class=\"link\"\n" + //
                "                href=\"https://choice.themajorones.dev/order?id=" + orderID
                + "&action=viewDetails\">here</a>.</p>\n" + //
                "\n" + //
                "        <br>\n" + //
                "        <p class=\"footer\">Your information is in safe hands.</p>\n" + //
                "        <p class=\"footer\">The Major's Choice Team</p>\n" + //
                "        <p class=\"footer\"><a class=\"link\" href=\"https://choice.themajorones.dev\">https://choice.themajorones.dev</a></p>\n"
                + //
                "    </div>\n" + //
                "</body>\n" + //
                "\n" + //
                "</html>";

        sendEmail(email, "Your order has been updated!", htmlContent);
    }

    public void sendOrderConfirmation(String email, String orderID) {
        String htmlContent = head()
                + "\n<body>\n" + //
                "    <div class=\"container\">\n" + //
                "        <h1>Your order has been placed at Major's Choice!</h1>\n" + //
                "        <p>We have received your order and we'll ship it out as soon as possible.</p>\n" + //
                "\n" + //
                "        <table>\n" + //
                "            <tr>\n" + //
                "                <td colspan=\"2\" class=\"section-header summary-item\">Summary</td>\n" + //
                "                <td colspan=\"2\" class=\"section-header\">Shipping Address</td>\n" + //
                "            </tr>\n" + //
                "            <tr>\n" + //
                "                <td>Order ID:</td>\n" + //
                "                <td class=\"summary-item\">0123</td>\n" + //
                "                <td>Full Name:</td>\n" + //
                "                <td>John Doe</td>\n" + //
                "            </tr>\n" + //
                "            <tr>\n" + //
                "                <td>Order Date:</td>\n" + //
                "                <td class=\"summary-item\">28/06/2024</td>\n" + //
                "                <td>Phone Number:</td>\n" + //
                "                <td>123-456-7890</td>\n" + //
                "            </tr>\n" + //
                "            <tr>\n" + //
                "                <td>Order Total:</td>\n" + //
                "                <td class=\"summary-item\">$100.00</td>\n" + //
                "                <td>Address:</td>\n" + //
                "                <td>1234 Street, City, Country</td>\n" + //
                "            </tr>\n" + //
                "        </table>\n" + //
                "\n" + //
                "        <br>\n" + //
                "        <br>\n" + //
                "\n" + //
                "        <table>\n" + //
                "            <tr>\n" + //
                "                <td class=\"section-header\">Items</td>\n" + //
                "                <td class=\"section-header\">Quantity</td>\n" + //
                "                <td class=\"section-header\">Subtotal</td>\n" + //
                "            </tr>\n" + //
                "            <tr>\n" + //
                "                <td>Product 1</td>\n" + //
                "                <td>1</td>\n" + //
                "                <td>$50.00</td>\n" + //
                "            </tr>\n" + //
                "            <tr>\n" + //
                "                <td>Product 2</td>\n" + //
                "                <td>1</td>\n" + //
                "                <td>$50.00</td>\n" + //
                "            </tr>\n" + //
                "            <tf>\n" + //
                "                <td>Product 3</td>\n" + //
                "                <td>1</td>\n" + //
                "                <td>$50.00</td>\n" + //
                "            </tf>\n" + //
                "        </table>\n" + //
                "\n" + //
                "        <p>You can check the status of your order by clicking <a class=\"link\"\n" + //
                "                href=\"https://choice.themajorones.dev/order?id=" + orderID
                + "&action=viewDetails\">here</a>.</p>\n" + //
                "\n" + //
                "        <br>\n" + //
                "        <p class=\"footer\">Thank you for shopping with us!</p>\n" + //
                "        <p class=\"footer\">The Major's Choice Team</p>\n" + //
                "        <p class=\"footer\"><a class=\"link\" href=\"https://choice.themajorones.dev\">https://choice.themajorones.dev</a></p>\n"
                + //
                "    </div>\n" + //
                "</body>\n" + //
                "\n" + //
                "</html>";

        sendEmail(email, "Your order has been placed at Major's Choice!", htmlContent);
    }

    protected String head() {
        String head = "<!DOCTYPE html>\n" + //
                "<html lang=\"en\">\n" + //
                "\n" + //
                "<head>\n" + //
                "    <meta charset=\"UTF-8\">\n" + //
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" + //
                "    <style>\n" + //
                "";

        String tail = "\n" + //
                "    </style>\n" + //
                "</head>";

        return head + style + tail;
    }

    protected String style = "body {\n" + //
                "    font-family: Arial, sans-serif;\n" + //
                "    background-color: #f4f4f4;\n" + //
                "    margin: 0;\n" + //
                "    padding: 0;\n" + //
                "    display: flex;\n" + //
                "    justify-content: center;\n" + //
                "    align-items: center;\n" + //
                "    height: 100vh;\n" + //
                "}\n" + //
                "\n" + //
                ".container {\n" + //
                "    background-color: #ffffff;\n" + //
                "    border-radius: 8px;\n" + //
                "    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n" + //
                "    padding: 20px;\n" + //
                "    max-width: 800px;\n" + //
                "    width: 100%;\n" + //
                "    text-align: center;\n" + //
                "}\n" + //
                "\n" + //
                "p {\n" + //
                "    color: #666;\n" + //
                "    line-height: 1.6;\n" + //
                "}\n" + //
                "\n" + //
                ".code {\n" + //
                "    font-size: 1.2em;\n" + //
                "    font-weight: bold;\n" + //
                "    color: #2c3e50;\n" + //
                "    background-color: #ecf0f1;\n" + //
                "    padding: 10px;\n" + //
                "    border-radius: 5px;\n" + //
                "    display: inline-block;\n" + //
                "    margin: 20px 0;\n" + //
                "}\n" + //
                "\n" + //
                ".link {\n" + //
                "    color: #2980b9;\n" + //
                "    text-decoration: none;\n" + //
                "}\n" + //
                "\n" + //
                ".link:hover {\n" + //
                "    text-decoration: underline;\n" + //
                "}\n" + //
                "\n" + //
                "body {\n" + //
                "    font-family: Arial, sans-serif;\n" + //
                "    background-color: #f4f4f4;\n" + //
                "    margin: 0;\n" + //
                "    padding: 0;\n" + //
                "    display: flex;\n" + //
                "    justify-content: center;\n" + //
                "    align-items: center;\n" + //
                "    height: 100vh;\n" + //
                "}\n" + //
                "\n" + //
                ".container {\n" + //
                "    background-color: #ffffff;\n" + //
                "    border-radius: 8px;\n" + //
                "    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n" + //
                "    padding: 20px;\n" + //
                "    max-width: 800px;\n" + //
                "    width: 100%;\n" + //
                "    text-align: center;\n" + //
                "}\n" + //
                "\n" + //
                "h1 {\n" + //
                "    color: #333;\n" + //
                "}\n" + //
                "\n" + //
                ".link {\n" + //
                "    color: #2980b9;\n" + //
                "    text-decoration: none;\n" + //
                "}\n" + //
                "\n" + //
                ".link:hover {\n" + //
                "    text-decoration: underline;\n" + //
                "}\n" + //
                "\n" + //
                ".footer {\n" + //
                "    color: #999;\n" + //
                "    font-size: 0.8em;\n" + //
                "    margin-top: 20px;\n" + //
                "    clear: both;\n" + //
                "}\n" + //
                "\n" + //
                "table {\n" + //
                "    border-collapse: collapse;\n" + //
                "    max-width: 75%;\n" + //
                "    min-width: 50%;\n" + //
                "    margin: auto;\n" + //
                "    background-color: #ecf0f1;\n" + //
                "}\n" + //
                "\n" + //
                "td,\n" + //
                "th {\n" + //
                "    padding: 8px;\n" + //
                "    text-align: left;\n" + //
                "}\n" + //
                "\n" + //
                ".section-header {\n" + //
                "    color: white;\n" + //
                "    font-weight: bold;\n" + //
                "    background-color: #E65103;\n" + //
                "}\n" + //
                "\n" + //
                ".summary-item {\n" + //
                "    border-right: 2px solid white;\n" + //
                "}";

    public void sendEmail(String address, String subject, String content) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new jakarta.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(address));
            message.setSubject(subject);
            message.setContent(content, "text/html");

            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}