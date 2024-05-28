package main;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.util.Properties;

public class Email {
    private final String username = "phongpthe182589@fpt.edu.vn";//System.getenv("EMAIL_ADDRESS");
    private final String password = "swra dvwj agvc nlmy"; //System.getenv("EMAIL_PASSWORD");

    public void sendConfirmCode(String email, String code){
        sendEmail(email, "Your account register confirmation code is " + code);
    }

    public void sendEmail(String address, String content) {
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
            message.setSubject("Confirmation Code");
            message.setText(content);

            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}