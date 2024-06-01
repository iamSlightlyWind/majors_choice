/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import helper.jbcrypt.BCrypt;

/**
 *
 * @author thang
 */
public class tesst {
    public static void main(String[] args) {
        String pass = "123";
        
        String pass1 = BCrypt.hashpw(pass, BCrypt.gensalt());
        String pass2 = BCrypt.hashpw(pass, BCrypt.gensalt());
        
        System.out.println("Result"+ BCrypt.checkpw("123", pass2));
        System.out.println(pass2);
    }
}
