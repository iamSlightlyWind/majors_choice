package main;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class User {
    public String username, password;
    public String fullName, address, email, phoneNumber;
    public int sex;
    public LocalDate birthDate, joinDate;

    public String formatedDate(LocalDate date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return date.format(formatter);
    }
}