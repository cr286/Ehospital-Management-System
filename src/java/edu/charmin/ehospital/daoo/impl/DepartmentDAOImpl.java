/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.DepartmentDAO;
import edu.charmin.ehospital.entity.Admin;
import edu.charmin.ehospital.entity.Department;
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
public class DepartmentDAOImpl implements DepartmentDAO{

    @Override
    public int insert(Department t) throws ClassNotFoundException, SQLException {
       String sql = "INSERT INTO `department`(`department_name`, `department_description`, `department_status`) VALUES (?,?,?)";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getDepartmentName());
        stmt.setString(2, t.getDepartmentDescription());
        stmt.setString(3, t.getDepartmentStatus());
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(Department t, int id) throws ClassNotFoundException, SQLException {
         String sql = "UPDATE `department` SET `department_name`=?,`department_description`=?,`department_status`=? WHERE `department_id`=?";
         
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
     
        PreparedStatement stmt = dbCon.initStatement(sql);
          stmt.setString(1, t.getDepartmentName());
        stmt.setString(2, t.getDepartmentDescription());
        stmt.setString(3, t.getDepartmentStatus());
        stmt.setInt(4, id);
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM `department` WHERE department_id=?";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setInt(1, id);
       
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public Department getById(int id) throws ClassNotFoundException, SQLException {
        String sql = "Select * from department where department_id=?";
        
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
       Department ad = new Department();
        while(rs.next()){
         ad.setDepartmentId(rs.getInt("department_id"));
         ad.setDepartmentName(rs.getString("department_name"));
         ad.setDepartmentDescription(rs.getString("department_description"));
         ad.setDepartmentStatus(rs.getString("department_status"));
        }
         dbCon.closeConnection();
         return ad;
    }

    @Override
    public List<Department> getAll() throws ClassNotFoundException, SQLException {
         String sql = "Select * from department";
        
        Dbconn dbCon=new Dbconn(sql);
        dbCon.openConnection();
        
        List<Department> adminList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();
           
        while(rs.next()){
            Department ad = new Department();
         ad.setDepartmentId(rs.getInt("department_id"));
         ad.setDepartmentName(rs.getString("department_name"));
         ad.setDepartmentDescription(rs.getString("department_description"));
         ad.setDepartmentStatus(rs.getString("department_status"));
           
         adminList.add(ad);
            
        }
        dbCon.closeConnection();
       return adminList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
        String sql = "SELECT COUNT(department_id) FROM department";
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
