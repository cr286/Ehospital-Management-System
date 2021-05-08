/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.AdminDAO;
import edu.charmin.ehospital.entity.Admin;
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
public class AdminDAOImpl implements AdminDAO{

    @Override
    public int insert(Admin t) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO `admin`(`admin_first_name`, `admin_last_name`, `admin_email`, `admin_phone`, `admin_address`, `admin_username`, `admin_password`, `admin_image`) VALUES (?,?,?,?,?,?,?,?)";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getAdminFirstName());
        stmt.setString(2, t.getAdminLastName());
        stmt.setString(3, t.getAdminEmail());
        stmt.setString(4, t.getAdminPhone());
        stmt.setString(5, t.getAdminAddress());
        stmt.setString(6, t.getAdminUsername());
        stmt.setString(7, t.getAdminPassword());
        stmt.setString(8, t.getAdminImage());
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(Admin t, int id) throws ClassNotFoundException, SQLException {
             String sql = "UPDATE `admin` SET `admin_first_name`=?,`admin_last_name`=?,`admin_email`=?,`admin_phone`=?,`admin_address`=?,`admin_username`=?,`admin_password`=?,`admin_added_date`=?,`admin_modified_date`=?,`admin_image`=? WHERE `id` = ?";
         
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
     
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getAdminFirstName());
        stmt.setString(2, t.getAdminLastName());
        stmt.setString(3, t.getAdminEmail());
        stmt.setString(4, t.getAdminPhone());
        stmt.setString(5, t.getAdminAddress());
        stmt.setString(6, t.getAdminUsername());
        stmt.setString(7, t.getAdminPassword());
        stmt.setString(8, t.getAdminImage());
        stmt.setInt(9, id);
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
           String sql = "DELETE FROM `admin` WHERE id=?";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setInt(1, id);
       
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public Admin getById(int id) throws ClassNotFoundException, SQLException {
       String sql = "Select * from admin where id=?";
        
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        Admin ad = new Admin();
        while(rs.next()){
         ad.setAdminId(rs.getInt("id"));
         ad.setAdminFirstName(rs.getString("admin_first_name"));
         ad.setAdminLastName(rs.getString("admin_last_name"));
         ad.setAdminEmail(rs.getString("admin_email"));
         ad.setAdminPhone(rs.getString("admin_phone"));
        ad.setAdminAddress(rs.getString("admin_address"));
         ad.setAdminAddedDate(rs.getDate("admin_added_date"));
         ad.setAdminModifiedDate(rs.getDate("admin_modified_date"));
         ad.setAdminUsername(rs.getString("admin_username"));
         ad.setAdminPassword(rs.getString("admin_password"));
         ad.setAdminImage(rs.getString("admin_image"));
         
            
        }
         dbCon.closeConnection();
        return ad;
        
    }

    @Override
    public List<Admin> getAll() throws ClassNotFoundException, SQLException {
         String sql = "Select * from admin";
        
        Dbconn dbCon=new Dbconn(sql);
        dbCon.openConnection();
        
        List<Admin> adminList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();
           
        while(rs.next()){
            Admin ad = new Admin();
       ad.setAdminId(rs.getInt("id"));
         ad.setAdminFirstName(rs.getString("admin_first_name"));
         ad.setAdminLastName(rs.getString("admin_last_name"));
         ad.setAdminEmail(rs.getString("admin_email"));
        ad.setAdminAddress(rs.getString("admin_address"));
        ad.setAdminPhone(rs.getString("admin_phone"));
         ad.setAdminAddedDate(rs.getDate("admin_added_date"));
         ad.setAdminModifiedDate(rs.getDate("admin_modified_date"));
         ad.setAdminUsername(rs.getString("admin_username"));
         ad.setAdminPassword(rs.getString("admin_password"));
         ad.setAdminImage(rs.getString("admin_image"));
           
         adminList.add(ad);
            
        }
        dbCon.closeConnection();
       return adminList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
       String sql = "SELECT COUNT(id) FROM admin";
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
