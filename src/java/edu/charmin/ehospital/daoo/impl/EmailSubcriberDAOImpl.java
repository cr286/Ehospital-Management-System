/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;


import edu.charmin.ehospital.daoo.EmailSubscriberDAO;
import edu.charmin.ehospital.entity.EmailSubscriber;
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
public class EmailSubcriberDAOImpl implements EmailSubscriberDAO {

    @Override
    public int insert(EmailSubscriber t) throws ClassNotFoundException, SQLException {

        String sql = "INSERT INTO `email_subscriber`(`subscriber_email`) VALUES (?)";

        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getSubscriberEmail());

        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(EmailSubscriber t, int id) throws ClassNotFoundException, SQLException {
          String sql = "UPDATE `email_subscriber` SET `subscriber_email`=? WHERE `subscriber_id`=?";
         
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
     
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getSubscriberEmail());
        stmt.setInt(2, id);
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM `email_subscriber` WHERE subscriber_id=?";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setInt(1, id);
       
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public EmailSubscriber getById(int id) throws ClassNotFoundException, SQLException {
        String sql = "Select * from email_subscriber where subscriber_id=?";
        
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        EmailSubscriber em = new EmailSubscriber();
        while(rs.next()){
            em.setSubcriberId(rs.getInt("subscriber_id"));
           em.setSubscriberEmail(rs.getString("subscriber_email"));
           em.setSubscriberDate(rs.getDate("date"));
    }
         dbCon.closeConnection();
        return em;
    }

    @Override
    public List<EmailSubscriber> getAll() throws ClassNotFoundException, SQLException {
       String sql = "Select * from email_subscriber";
        
        Dbconn dbCon=new Dbconn(sql);
        dbCon.openConnection();
        
        List<EmailSubscriber> emList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();
           
        while(rs.next()){
            EmailSubscriber em = new EmailSubscriber();
           em.setSubcriberId(rs.getInt("subscriber_id"));
           em.setSubscriberEmail(rs.getString("subscriber_email"));
           em.setSubscriberDate(rs.getDate("date"));
            emList.add(em);
            
        }
        dbCon.closeConnection();
       return emList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
       String sql = "SELECT COUNT(subscriber_id) FROM email_subscriber";
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


