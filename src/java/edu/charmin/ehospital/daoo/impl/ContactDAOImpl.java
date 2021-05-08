/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.ContactDAO;
import edu.charmin.ehospital.entity.Contact;
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
public class ContactDAOImpl implements ContactDAO{

    @Override
    public int insert(Contact t) throws ClassNotFoundException, SQLException {
      String sql = "INSERT INTO `contact`(`contact_name`, `contact_subject`, `contact_email`, `contact_message` ) VALUES (?,?,?,?)";
        
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getContactName());
        stmt.setString(2, t.getContactSubject());
        stmt.setString(3, t.getContactEmail());
        stmt.setString(4, t.getContactMessage());
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(Contact t, int id) throws ClassNotFoundException, SQLException {
       String sql = "UPDATE `contact` SET `contact_name`=?,`contact_subject`=?,`contact_email`=?,`contact_message`=? WHERE `id`=?";
         
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
     
        PreparedStatement stmt = dbCon.initStatement(sql);
      stmt.setString(1, t.getContactName());
        stmt.setString(2, t.getContactSubject());
        stmt.setString(3, t.getContactEmail());
        stmt.setString(4, t.getContactMessage());
        stmt.setInt(5, id);
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
      String sql = "DELETE FROM `contact` WHERE id=?";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setInt(1, id);
       
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public Contact getById(int id) throws ClassNotFoundException, SQLException {
       String sql = "Select * from contact where id=?";
        
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        Contact con = new Contact();
        while(rs.next()){
          con.setContactId(rs.getInt("id"));
            con.setContactName(rs.getString("contact_name"));
            con.setContactSubject(rs.getString("contact_subject"));
            con.setContactEmail(rs.getString("contact_email"));
            con.setContactMessage(rs.getString("contact_message"));
            con.setContactAddedDate(rs.getDate("contact_added_date"));
    }
         dbCon.closeConnection();
        return con;
    }

    @Override
    public List<Contact> getAll() throws ClassNotFoundException, SQLException {
        String sql = "Select * from contact";
        Dbconn dbCon=new Dbconn(sql);
        dbCon.openConnection();
        List<Contact> conList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();
           
        while(rs.next()){
            Contact con = new Contact();
            con.setContactId(rs.getInt("id"));
            con.setContactName(rs.getString("contact_name"));
            con.setContactSubject(rs.getString("contact_subject"));
            con.setContactEmail(rs.getString("contact_email"));
            con.setContactMessage(rs.getString("contact_message"));
            con.setContactAddedDate(rs.getDate("contact_added_date"));
            conList.add(con);
        }
        dbCon.closeConnection();
       return conList;
    }

    @Override
     public int count() throws ClassNotFoundException, SQLException {
       String sql = "SELECT COUNT(id) FROM contact";
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
