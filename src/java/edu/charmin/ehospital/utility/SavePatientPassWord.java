/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.utility;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author charm_000
 */
public class SavePatientPassWord {
    public static boolean savePass(String newpass,int id) throws ClassNotFoundException, SQLException{
    String sql = "UPDATE `patient` SET `patient_password`=?,`firstlogin`=? WHERE patient_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setString(1,newpass );
        stmt.setString(2, "F");
        stmt.setInt(3, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        if(result>0){
        return true;}
        return false;
    }
    
}
