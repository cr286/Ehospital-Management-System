/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.MedicineDAO;
import edu.charmin.ehospital.entity.Medicine;

import edu.charmin.ehospital.entity.Test;
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
public class MedicineDAOImpl implements MedicineDAO{

    @Override
    public int insert(Medicine t) throws ClassNotFoundException, SQLException {
       String sql = "INSERT INTO `medicines` (`medicine_name`, `medicine_description`, `medicine_purpose`, `medicine_status`) VALUES (?,?,?,?)";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getMedicineName());
        stmt.setString(2, t.getMedicineDescription());
        stmt.setString(3, t.getMedicinePurpose());
        stmt.setInt(4, t.getMedicineStatus());
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(Medicine t, int id) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE `medicines` SET `medicine_name`=?,`medicine_description`=?,`medicine_purpose`=?,`medicine_status`=? WHERE `medicine_id`=?";
         
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
         PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getMedicineName());
        stmt.setString(2, t.getMedicineDescription());
        stmt.setString(3, t.getMedicinePurpose());
        stmt.setInt(4, t.getMedicineStatus());
        stmt.setInt(5, id);
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM `medicines` WHERE medicine_id=?";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setInt(1, id);
       
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public Medicine getById(int id) throws ClassNotFoundException, SQLException {
        String sql = "Select * from medicines where test_id=?";
        
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
       Medicine ad = new Medicine();
        while(rs.next()){
          ad.setMedicineId(rs.getInt("medicine_id"));
         ad.setMedicineName(rs.getString("medicine_name"));
         ad.setMedicineDescription(rs.getString("medicine_description"));
         ad.setMedicinePurpose(rs.getString("medicine_purpose"));
         ad.setMedicineStatus(rs.getInt("medicine_status"));
         ad.setMedicineAddedDate(rs.getDate("medicine_addeddate"));
        }
         dbCon.closeConnection();
         return ad;
    }

    @Override
    public List<Medicine> getAll() throws ClassNotFoundException, SQLException {
        String sql = "Select * from medicines";
        
        Dbconn dbCon=new Dbconn(sql);
        dbCon.openConnection();
        
        List<Medicine> adminList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();
           
        while(rs.next()){
            Medicine ad = new Medicine();
       ad.setMedicineId(rs.getInt("medicine_id"));
         ad.setMedicineName(rs.getString("medicine_name"));
         ad.setMedicineDescription(rs.getString("medicine_description"));
         ad.setMedicinePurpose(rs.getString("medicine_purpose"));
         ad.setMedicineStatus(rs.getInt("medicine_status"));
        ad.setMedicineAddedDate(rs.getDate("medicine_addeddate"));
         adminList.add(ad);
            
        }
        dbCon.closeConnection();
       return adminList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
            String sql = "SELECT COUNT(medicine_id) FROM medicines";
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
