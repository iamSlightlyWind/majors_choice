package main;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class Email {
    private final String username = System.getenv("EMAIL_ADDRESS");
    private final String password = System.getenv("EMAIL_PASSWORD");

    public void sendConfirmCode(String email, String code) {
        String htmlContent = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>Welcome to Major's Choice!</title>\n"
                + "    <style>\n"
                + "        body {\n"
                + "            font-family: Arial, sans-serif;\n"
                + "            background-color: #f4f4f4;\n"
                + "            margin: 0;\n"
                + "            padding: 0;\n"
                + "            display: flex;\n"
                + "            justify-content: center;\n"
                + "            align-items: center;\n"
                + "            height: 100vh;\n"
                + "        }\n"
                + "        .container {\n"
                + "            background-color: #ffffff;\n"
                + "            border-radius: 8px;\n"
                + "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n"
                + "            padding: 20px;\n"
                + "            max-width: 600px;\n"
                + "            width: 100%;\n"
                + "            text-align: center;\n"
                + "        }\n"
                + "        h1 {\n"
                + "            color: #333;\n"
                + "        }\n"
                + "        p {\n"
                + "            color: #666;\n"
                + "            line-height: 1.6;\n"
                + "        }\n"
                + "        .code {\n"
                + "            font-size: 1.2em;\n"
                + "            font-weight: bold;\n"
                + "            color: #2c3e50;\n"
                + "            background-color: #ecf0f1;\n"
                + "            padding: 10px;\n"
                + "            border-radius: 5px;\n"
                + "            display: inline-block;\n"
                + "            margin: 20px 0;\n"
                + "        }\n"
                + "        .link {\n"
                + "            color: #2980b9;\n"
                + "            text-decoration: none;\n"
                + "        }\n"
                + "        .link:hover {\n"
                + "            text-decoration: underline;\n"
                + "        }\n"
                + "    </style>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"container\">\n"
                + "        <h1>Welcome to Major's Choice!</h1>\n"
                + "        <p>Thank you for registering a new account.</p>\n"
                + "        <p>Your account registration confirmation code is:</p>\n"
                + "        <p class=\"code\">" + code + "</p>\n"
                + "        <p>Please enter this code to confirm your account.</p>\n"
                + "        <p>If you did not request this, please ignore this email.</p>\n"
                + "        <p>The Major's Choice Team</p>\n"
                + "        <p><a class=\"link\" href=\"https://choice.themajorones.dev\">https://choice.themajorones.dev</a></p>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>";

        sendEmail(email, "Confirm your account on Major's Choice", htmlContent);
    }

    public void sendRecoveryPassword(String email, String password) {
        String htmlContent = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>Welcome to Major's Choice!</title>\n"
                + "    <style>\n"
                + "        body {\n"
                + "            font-family: Arial, sans-serif;\n"
                + "            background-color: #f4f4f4;\n"
                + "            margin: 0;\n"
                + "            padding: 0;\n"
                + "            display: flex;\n"
                + "            justify-content: center;\n"
                + "            align-items: center;\n"
                + "            height: 100vh;\n"
                + "        }\n"
                + "        .container {\n"
                + "            background-color: #ffffff;\n"
                + "            border-radius: 8px;\n"
                + "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n"
                + "            padding: 20px;\n"
                + "            max-width: 800px;\n"
                + "            width: 100%;\n"
                + "            text-align: center;\n"
                + "        }\n"
                + "        h1 {\n"
                + "            color: #333;\n"
                + "        }\n"
                + "        p {\n"
                + "            color: #666;\n"
                + "            line-height: 1.6;\n"
                + "        }\n"
                + "        .code {\n"
                + "            font-size: 1.2em;\n"
                + "            font-weight: bold;\n"
                + "            color: #2c3e50;\n"
                + "            background-color: #ecf0f1;\n"
                + "            padding: 10px;\n"
                + "            border-radius: 5px;\n"
                + "            display: inline-block;\n"
                + "            margin: 20px 0;\n"
                + "        }\n"
                + "        .link {\n"
                + "            color: #2980b9;\n"
                + "            text-decoration: none;\n"
                + "        }\n"
                + "        .link:hover {\n"
                + "            text-decoration: underline;\n"
                + "        }\n"
                + "    </style>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"container\">\n"
                + "        <h1>Recover your account at Major's Choice!</h1>\n"
                + "        <p>You sent us an request to reset your password.</p>\n"
                + "        <p>Here is your new password:</p>\n"
                + "        <p class=\"code\">" + password + "</p>\n"
                + "        <p>Please login using this new password if you wish to reset it.<br>You can change your password later in profile settings.</p>\n"
                + "        <p>Otherwise, your old password will stay the same.</p>\n"
                + "        <p>The Major's Choice Team</p>\n"
                + "        <p><a class=\"link\" href=\"https://choice.themajorones.dev\">https://choice.themajorones.dev</a></p>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>";

        sendEmail(email, "Recover your account at Major's Choice", htmlContent);
    }

    public void sendGreet(String email, String username) {
        String htmlContent = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>Welcome to Major's Choice!</title>\n"
                + "    <style>\n"
                + "        body {\n"
                + "            font-family: Arial, sans-serif;\n"
                + "            background-color: #f4f4f4;\n"
                + "            margin: 0;\n"
                + "            padding: 0;\n"
                + "            display: flex;\n"
                + "            justify-content: center;\n"
                + "            align-items: center;\n"
                + "            height: 100vh;\n"
                + "        }\n"
                + "        .container {\n"
                + "            background-color: #ffffff;\n"
                + "            border-radius: 8px;\n"
                + "            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n"
                + "            padding: 20px;\n"
                + "            max-width: 800px;\n"
                + "            width: 100%;\n"
                + "            text-align: center;\n"
                + "        }\n"
                + "        h1 {\n"
                + "            color: #333;\n"
                + "        }\n"
                + "        p {\n"
                + "            color: #666;\n"
                + "            line-height: 1.6;\n"
                + "        }\n"
                + "        .code {\n"
                + "            font-size: 1.2em;\n"
                + "            font-weight: bold;\n"
                + "            color: #2c3e50;\n"
                + "            background-color: #ecf0f1;\n"
                + "            padding: 10px;\n"
                + "            border-radius: 5px;\n"
                + "            display: inline-block;\n"
                + "            margin: 20px 0;\n"
                + "        }\n"
                + "        .link {\n"
                + "            color: #2980b9;\n"
                + "            text-decoration: none;\n"
                + "        }\n"
                + "        .link:hover {\n"
                + "            text-decoration: underline;\n"
                + "        }\n"
                + "    </style>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"container\">\n"
                + "        <h1>Welcome to Major's Choice!</h1>\n"
                + "        <p>Thank you for registering a new account. We're excited to have you on board.</p>\n"
                + "        <p>Your account has been successfully registered with the username:<br><span class=\"code\">"
                + username + "</span></p>\n"
                + "        <p>You can now login and start exploring our platform.<br>Remember, you can always update your profile settings at any time.</p>\n"
                + "        <p>If you did not register this account, please contact our support team at <a href=\"mailto:support@themajorones.dev\">support@themajorones.dev</a>.</p>\n"
                + "        <p>Enjoy shopping with Major's Choice!</p>\n"
                + "        <p>The Major's Choice Team</p>\n"
                + "        <p><a class=\"link\" href=\"https://choice.themajorones.dev\">https://choice.themajorones.dev</a></p>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>";

        sendEmail(email, "Welcome to Major's Choice!", htmlContent);
    }

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