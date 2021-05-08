/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.PatientDAO;
import edu.charmin.ehospital.entity.Patient;
import edu.charmin.ehospital.utility.Dbconn;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author charm_000
 */
public class PatientDAOimpl implements PatientDAO{

    @Override
    public int insert(Patient t) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO `patient`(`patient_first_name`, `patient_last_name`, `patient_address`, `dob`, `patient_email`, `patient_gender`, `patient_phone`, `patient_username`, `patient_password`, `patient_status`,`patient_image`,firstlogin) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getPatientFirstName());
        stmt.setString(2, t.getPatientLastName());
        stmt.setString(3, t.getPatientAddress());
        stmt.setDate(4, t.getPatientDateOfBirth());
        stmt.setString(5, t.getPatientEmail());
        stmt.setString(6, t.getPatientGender());
        stmt.setString(7, t.getPatientPhone());
        stmt.setString(8, t.getPatientUsername());
        stmt.setString(9,t.getPatientPassword());
        stmt.setString(10,t.getPatientStatus());
        stmt.setString(11, t.getPatientImage());
        stmt.setString(12,"T");
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(Patient t, int id) throws ClassNotFoundException, SQLException {
    String sql = "UPDATE `patient` SET `patient_first_name`=?,`patient_last_name`=?,`patient_address`=?,`dob`=?,`patient_email`=?,`patient_gender`=?,`patient_added_date`=?,`patient_phone`=?,`patient_username`=?,`patient_password`=?,`patient_status`=?,patient_image=? WHERE `patient_id`=?";
         
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
     
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getPatientFirstName());
        stmt.setString(2, t.getPatientLastName());
        stmt.setString(3, t.getPatientAddress());
        stmt.setDate(4, t.getPatientDateOfBirth());
        stmt.setString(5, t.getPatientEmail());
        stmt.setString(6, t.getPatientGender());
        stmt.setString(7, t.getPatientPhone());
        stmt.setString(8, t.getPatientUsername());
        stmt.setString(9,t.getPatientPassword());
        stmt.setString(10,t.getPatientStatus());
        stmt.setString(11, t.getPatientImage());

        stmt.setInt(12, id);
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
    String sql = "DELETE FROM `patient` WHERE patient_id=?";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setInt(1, id);
       
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public Patient getById(int id) throws ClassNotFoundException, SQLException {
       String sql = "Select * from patient where patient_id=?";
        
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        Patient ad = new Patient();
        while(rs.next()){
         ad.setPatientId(rs.getInt("patient_id"));
         ad.setPatientFirstName(rs.getString("patient_first_name"));
         ad.setPatientLastName(rs.getString("patient_last_name"));
         ad.setPatientEmail(rs.getString("patient_email"));
         ad.setPatientPhone(rs.getString("patient_phone"));
         ad.setPatientAddress(rs.getString("patient_address"));
         ad.setPatientAddedDate(rs.getDate("patient_added_date"));
         ad.setPatientUsername(rs.getString("patient_username"));
         ad.setPatientPassword(rs.getString("patient_password"));
         ad.setPatientDateOfBirth(rs.getDate("dob"));
         ad.setPatientStatus(rs.getString("patient_status"));
         ad.setPatientGender(rs.getString("patient_gender"));
         ad.setPatientImage(rs.getString("patient_image"));
         ad.setFirstLogin(rs.getString("firstlogin"));
        }
         dbCon.closeConnection();
        return ad;
    }

    @Override
    public List<Patient> getAll() throws ClassNotFoundException, SQLException {
      String sql = "Select * from patient";
        
        Dbconn dbCon=new Dbconn(sql);
        dbCon.openConnection();
        
        List<Patient> patientList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();
           
        while(rs.next()){
            Patient ad = new Patient();
               ad.setPatientId(rs.getInt("patient_id"));
         ad.setPatientFirstName(rs.getString("patient_first_name"));
         ad.setPatientLastName(rs.getString("patient_last_name"));
         ad.setPatientEmail(rs.getString("patient_email"));
         ad.setPatientPhone(rs.getString("patient_phone"));
         ad.setPatientAddress(rs.getString("patient_address"));
         ad.setPatientAddedDate(rs.getDate("patient_added_date"));
         ad.setPatientUsername(rs.getString("patient_username"));
         ad.setPatientPassword(rs.getString("patient_password"));
         ad.setPatientDateOfBirth(rs.getDate("dob"));
         ad.setPatientStatus(rs.getString("patient_status"));
         ad.setPatientGender(rs.getString("patient_gender"));  
          ad.setPatientImage(rs.getString("patient_image"));
            ad.setFirstLogin(rs.getString("firstlogin"));
         patientList.add(ad);
            
        }
        dbCon.closeConnection();
       return patientList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
       String sql = "SELECT COUNT(patient_id) FROM patient";
       Dbconn dbCon=new Dbconn(sql);
        dbCon.openConnection();
        
      int s=0;
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();
        while(rs.next()){
            s =  Integer.parseInt(rs.getObject(1).toString());
        }
        dbCon.closeConnection();
       return s;
    }
    
}
