/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.utility;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author charm_000
 */
public class PasswordEncrpter {
    private static final Random randomNumber = new Random((new Date()).getTime());
  
  /**
   * Encrypt password by using SHA-256 algorithm, encryptedPassword length is 32 bits
   * @param clearTextPassword
   * @return
   */
  public static String getEncryptedPassword(String clearTextPassword)   {  
  
    
    try {
      MessageDigest md = MessageDigest.getInstance("SHA-256");
      md.update(clearTextPassword.getBytes());
//      return 
      return clearTextPassword;

    } catch (NoSuchAlgorithmException e) {
      //_log.error("Failed to encrypt password.", e);
    }
    return "";
}
}
