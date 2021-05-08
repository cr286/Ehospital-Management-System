/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.TestDAO;
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
public class TestDAOImpl implements TestDAO{

    @Override
    public int insert(Test t) throws ClassNotFoundException, SQLException {
       String sql = "INSERT INTO `test`(`test_name`, `test_report`, `test_status`) VALUES (?,?,?)";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getTestName());
        stmt.setString(2, t.getTestReport());
        stmt.setString(3, t.getTestStatus());
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(Test t, int id) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE `test` SET `test_name`=?,`test_report`=?,`test_status`=? WHERE `test_id`=?";
         
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
         PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getTestName());
        stmt.setString(2, t.getTestReport());
        stmt.setString(3, t.getTestStatus());
        stmt.setInt(4, id);
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM `test` WHERE test_id=?";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setInt(1, id);
       
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public Test getById(int id) throws ClassNotFoundException, SQLException {
        String sql = "Select * from test where test_id=?";
        
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
       Test ad = new Test();
        while(rs.next()){
         ad.setTestId(rs.getInt("test_id"));
         ad.setTestName(rs.getString("test_name"));
         ad.setTestReport(rs.getString("test_report"));
         ad.setTestStatus(rs.getString("test_status"));
        }
         dbCon.closeConnection();
         return ad;
    }

    @Override
    public List<Test> getAll() throws ClassNotFoundException, SQLException {
        String sql = "Select * from test";
        
        Dbconn dbCon=new Dbconn(sql);
        dbCon.openConnection();
        
        List<Test> adminList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();
           
        while(rs.next()){
            Test ad = new Test();
       ad.setTestId(rs.getInt("test_id"));
         ad.setTestName(rs.getString("test_name"));
         ad.setTestReport(rs.getString("test_report"));
         ad.setTestStatus(rs.getString("test_status"));
        
         adminList.add(ad);
            
        }
        dbCon.closeConnection();
       return adminList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
            String sql = "SELECT COUNT(test_id) FROM test";
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
