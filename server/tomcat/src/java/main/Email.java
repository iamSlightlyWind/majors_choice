package main;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.util.Properties;

public class Email {
    private final String username = System.getenv("EMAIL_ADDRESS");
    private final String password = System.getenv("EMAIL_PASSWORD");

    public void sendConfirmCode(String email, String code){
        sendEmail(email, "Confirmation Code", "Your account register confirmation code is " + code);
    }

    public void sendRecoveryPassword(String email, String password){
        sendEmail(email, "Recover Password", "Your new password is: " + password + "\nIf you decide to login using this password, it will become your new password.");
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
            message.setSubject("Confirmation Code");
            message.setText(content);

            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}