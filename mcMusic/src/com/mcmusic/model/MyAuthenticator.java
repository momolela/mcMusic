package com.mcmusic.model;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator { 
    private String userName; 
    private String emailpassword; 
 
    public MyAuthenticator(String userName, String emailpassword){ 
        this.userName= userName; 
        this.emailpassword= emailpassword; 
    } 
 
    @Override 
    protected PasswordAuthentication getPasswordAuthentication() { 
        return new PasswordAuthentication(userName, emailpassword); 
    } 
}
