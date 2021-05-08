/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.EmployeeDAO;
import edu.charmin.ehospital.entity.Employee;


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
public class EmployeeDAOImpl implements EmployeeDAO{

    @Override
    public int insert(Employee t) throws ClassNotFoundException, SQLException {
         String sql = "INSERT INTO `employee`(`employee_first_name`, `employee_last_name`, `employee_address`, `employee_gender`, `employee_phone`, `employee_post`, `employee_salary`,`employee_description`,`employee_email`, `employee_status`,`employee_username`, `employee_password`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getEmployeeFirstName());
        stmt.setString(2, t.getEmployeeLastName());
        stmt.setString(3, t.getEmployeeAddress());
        stmt.setString(4,t.getEmployeeGender());
        stmt.setString(5, t.getEmployeePhone());
        stmt.setString(6, t.getEmployeePost());
        stmt.setDouble(7, t.getEmployeeSalary());
        stmt.setString(8, t.getEmployeeDescription());
        stmt.setString(9, t.getEmployeeEmail());
        stmt.setString(10,t.getEmployeeStatus());
        stmt.setString(11, t.getEmployeeUsername());
         stmt.setString(12,t.getEmployeePassword());
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
       
    }

    @Override
    public int update(Employee t, int id) throws ClassNotFoundException, SQLException {
          String sql = "UPDATE `employee` SET `employee_first_name`=?,`employee_last_name`=?,`employee_address`=?,`employee_gender`=?,`employee_phone`=?,`employee_post`=?,`employee_salary`=?,`employee_email`=?,`employee_description`=?,`employee_status`=?,`employee_username`=?,`employee_password`=? WHERE employee_id=?";
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
     
        PreparedStatement stmt = dbCon.initStatement(sql);
          stmt.setString(1, t.getEmployeeFirstName());
        stmt.setString(2, t.getEmployeeLastName());
        stmt.setString(3, t.getEmployeeAddress());
        stmt.setString(4,t.getEmployeeGender());
        stmt.setString(5, t.getEmployeePhone());
        stmt.setString(6, t.getEmployeePost());
        stmt.setDouble(7, t.getEmployeeSalary());
        stmt.setString(8, t.getEmployeeDescription());
        stmt.setString(9, t.getEmployeeEmail());
        stmt.setString(10,t.getEmployeeStatus());
        stmt.setString(11, t.getEmployeeUsername());
         stmt.setString(12,t.getEmployeePassword());
    
        stmt.setInt(13, id);
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
               String sql = "DELETE FROM `employee` WHERE employee_id=?";
        
        Dbconn dbCon= new Dbconn(sql);
        dbCon.openConnection();
        
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        
        stmt.setInt(1, id);
       
        int result= dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public Employee getById(int id) throws ClassNotFoundException, SQLException {
         String sql = "Select * from employee where employee_id=?";
        
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        Employee ad = new Employee();
        while(rs.next()){
         ad.setEmployeeId(rs.getInt("employee_id"));
         ad.setEmployeeFirstName(rs.getString("employee_first_name"));
         ad.setEmployeeLastName(rs.getString("employee_last_name"));
         ad.setEmployeeGender(rs.getString("employee_gender"));
         ad.setEmployeeEmail(rs.getString("employee_email"));
         ad.setEmployeePhone(rs.getString("employee_phone"));
         ad.setEmployeePost(rs.getString("employee_post"));
         ad.setEmployeeDescription(rs.getString("employee_description"));
         ad.setEmployeeAddress(rs.getString("employee_address"));
         ad.setEmployeeAddedDate(rs.getDate("employee_added_date"));
         ad.setEmployeeUsername(rs.getString("employee_username"));
         ad.setEmployeePassword(rs.getString("employee_password"));
         ad.setEmployeeSalary(rs.getDouble("employee_salary"));
         ad.setEmployeeStatus(rs.getString("employee_status"));
            
    }
         dbCon.closeConnection();
        return ad;
    }

    @Override
    public List<Employee> getAll() throws ClassNotFoundException, SQLException {
            String sql = "Select * from employee";
        
        Dbconn dbCon=new Dbconn(sql);
        dbCon.openConnection();
        
        List<Employee> patientList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();
           
        while(rs.next()){
            Employee ad = new Employee();
              
           ad.setEmployeeId(rs.getInt("employee_id"));
         ad.setEmployeeFirstName(rs.getString("employee_first_name"));
         ad.setEmployeeLastName(rs.getString("employee_last_name"));
         ad.setEmployeeGender(rs.getString("employee_gender"));
         ad.setEmployeeEmail(rs.getString("employee_email"));
         ad.setEmployeePhone(rs.getString("employee_phone"));
         ad.setEmployeePost(rs.getString("employee_post"));
         ad.setEmployeeDescription(rs.getString("employee_description"));
         ad.setEmployeeAddress(rs.getString("employee_address"));
         ad.setEmployeeAddedDate(rs.getDate("employee_added_date"));
         ad.setEmployeeUsername(rs.getString("employee_username"));
         ad.setEmployeePassword(rs.getString("employee_password"));
         ad.setEmployeeSalary(rs.getDouble("employee_salary"));
         ad.setEmployeeStatus(rs.getString("employee_status"));
         patientList.add(ad);
            
        }
        dbCon.closeConnection();
       return patientList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
       String sql = "SELECT COUNT(employee_id) FROM employee";
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

    

