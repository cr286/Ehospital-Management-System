/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.DoctorDAO;
import edu.charmin.ehospital.entity.Doctor;

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
public class DoctorDAOImpl implements DoctorDAO{

    @Override
    public int insert(Doctor t) throws ClassNotFoundException, SQLException {
       String sql = "INSERT INTO `doctor`(`doctor_first_name`, `doctor_last_name`, `doctor_address`, `doctor_email`, `doctor_gender`, `doctor_description`, `doctor_status`, `doctor_post`, `doctor_username`, `doctor_password`, `doctor_specification`, `doctor_salary`,`doctor_phone`,department_id,doctor_charge,profile_image) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getDoctorFirstName());
        stmt.setString(2, t.getDoctorLastName());
        stmt.setString(3, t.getDoctorAddress());
        stmt.setString(4, t.getDoctorEmail());
        stmt.setString(5, t.getDoctorGender());
        stmt.setString(6, t.getDoctorDescription());
        stmt.setString(7, t.getDoctorStatus());
        stmt.setString(8, t.getDoctorPost());
        stmt.setString(9, t.getDoctorUsername());
        stmt.setString(10, t.getDoctorPassword());
        stmt.setString(11, t.getDoctorspecification());
        stmt.setDouble(12, t.getDoctorSalary());
        stmt.setString(13, t.getDoctorPhone());
        stmt.setInt(14, t.getDepartment_id());
        stmt.setDouble(15, t.getDoctorCharge());
        stmt.setString(16, t.getDoctorImage());
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(Doctor t, int id) throws ClassNotFoundException, SQLException {
           String sql = "UPDATE `doctor` SET `doctor_first_name`=?,`doctor_last_name`=?,`doctor_address`=?,`doctor_email`=?,`doctor_gender`=?,doctor_description=?,`doctor_status`=?,`doctor_post`=?,`doctor_username`=?,`doctor_password`=?,`doctor_specification`=?,`doctor_salary`=?,`doctor_phone`=?,department_id=?,doctor_charge=? WHERE `doctor_id` = ?";
         
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
     
        PreparedStatement stmt = dbCon.initStatement(sql);
      stmt.setString(1, t.getDoctorFirstName());
        stmt.setString(2, t.getDoctorLastName());
        stmt.setString(3, t.getDoctorAddress());
        stmt.setString(4, t.getDoctorEmail());
        stmt.setString(5, t.getDoctorGender());
        stmt.setString(6, t.getDoctorDescription());
        stmt.setString(7, t.getDoctorStatus());
        stmt.setString(8, t.getDoctorPost());
        stmt.setString(9, t.getDoctorUsername());
        stmt.setString(10, t.getDoctorPassword());
        stmt.setString(11, t.getDoctorspecification());
        stmt.setDouble(12, t.getDoctorSalary());
        stmt.setString(13, t.getDoctorPhone());
         stmt.setInt(14, t.getDepartment_id());
        stmt.setDouble(15, t.getDoctorCharge());
        stmt.setInt(16, id);
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
                 String sql = "DELETE FROM `doctor` WHERE doctor_id=?";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setInt(1, id);
       
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public Doctor getById(int id) throws ClassNotFoundException, SQLException {
       String sql = "Select * from doctor where doctor_id=?";
        
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        Doctor ad = new Doctor();
        while(rs.next()){
         ad.setDoctorId(rs.getInt("doctor_id"));
         ad.setDoctorFirstName(rs.getString("doctor_first_name"));
         ad.setDoctorLastName(rs.getString("doctor_last_name"));
         ad.setDoctorGender(rs.getString("doctor_gender"));
         ad.setDoctorEmail(rs.getString("doctor_email"));
         ad.setDoctorPhone(rs.getString("doctor_phone"));
         ad.setDoctorPost(rs.getString("doctor_post"));
         ad.setDoctorDescription(rs.getString("doctor_description"));
         ad.setDoctorAddress(rs.getString("doctor_address"));
         ad.setDoctorAddedDate(rs.getDate("doctor_added_date"));
         ad.setDoctorUsername(rs.getString("doctor_username"));
         ad.setDoctorPassword(rs.getString("doctor_password"));
         ad.setDoctorSalary(rs.getDouble("doctor_salary"));
         ad.setDoctorStatus(rs.getString("doctor_status"));
         ad.setDoctorspecification(rs.getString("doctor_specification"));
         ad.setDepartment_id(rs.getInt("department_id"));
         ad.setDoctorCharge(rs.getDouble("doctor_charge"));
         ad.setDoctorImage(rs.getString("profile_image"));
    }
         dbCon.closeConnection();
        return ad;
    }

    @Override
    public List<Doctor> getAll() throws ClassNotFoundException, SQLException {
         String sql = "Select * from doctor";
        
        Dbconn dbCon=new Dbconn(sql);
        dbCon.openConnection();
        
        List<Doctor> doctorList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();
           
        while(rs.next()){
            Doctor ad = new Doctor();
              
         ad.setDoctorId(rs.getInt("doctor_id"));
         ad.setDoctorFirstName(rs.getString("doctor_first_name"));
         ad.setDoctorLastName(rs.getString("doctor_last_name"));
         ad.setDoctorGender(rs.getString("doctor_gender"));
         ad.setDoctorEmail(rs.getString("doctor_email"));
         ad.setDoctorPhone(rs.getString("doctor_phone"));
         ad.setDoctorPost(rs.getString("doctor_post"));
         ad.setDoctorDescription(rs.getString("doctor_description"));
         ad.setDoctorAddress(rs.getString("doctor_address"));
         ad.setDoctorAddedDate(rs.getDate("doctor_added_date"));
         ad.setDoctorUsername(rs.getString("doctor_username"));
         ad.setDoctorPassword(rs.getString("doctor_password"));
         ad.setDoctorSalary(rs.getDouble("doctor_salary"));
         ad.setDoctorStatus(rs.getString("doctor_status"));
         ad.setDoctorspecification(rs.getString("doctor_specification"));
           ad.setDepartment_id(rs.getInt("department_id"));
            ad.setDoctorCharge(rs.getDouble("doctor_charge"));
            ad.setDoctorImage(rs.getString("profile_image"));
         doctorList.add(ad);
            
        }
        dbCon.closeConnection();
       return doctorList;
    }

    @Override
     public int count() throws ClassNotFoundException, SQLException {
       String sql = "SELECT COUNT(doctor_id) FROM doctor";
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
