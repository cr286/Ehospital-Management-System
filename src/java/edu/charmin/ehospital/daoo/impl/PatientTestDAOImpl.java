/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.PatientTestDAO;

import edu.charmin.ehospital.entity.PatientTest;
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
public class PatientTestDAOImpl implements PatientTestDAO{

    @Override
    public int insert(PatientTest t) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO `patient_test`(`test_body`, `test_id`, `patient_id`, `doctor_id`, `status`,`report_image`) VALUES (?,?,?,?,?,?)";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getTestBody());
        stmt.setInt(2, t.getTestId());
        stmt.setInt(3, t.getPatientId());
        stmt.setInt(4, t.getDoctorId());        
        stmt.setInt(5, t.getStatus());
        stmt.setString(6, t.getReportImage());
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(PatientTest t, int id) throws ClassNotFoundException, SQLException {
     String sql = " UPDATE `patient_test` SET `test_body`=?,`test_id`=?,`patient_id`=?,`doctor_id`=?,`status`=?,`report_image`=? WHERE `patient_test_id`=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
       stmt.setString(1, t.getTestBody());
        stmt.setInt(2, t.getTestId());
        stmt.setInt(3, t.getPatientId());
        stmt.setInt(4, t.getDoctorId());        
        stmt.setInt(5, t.getStatus());
        stmt.setString(6, t.getReportImage());
          stmt.setInt(7, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
       
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
          String sql = "DELETE FROM `patient_test` WHERE patient_test_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public PatientTest getById(int id) throws ClassNotFoundException, SQLException {
      String sql = "Select * from `patient_test` WHERE patient_test_id=?";

        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();

        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        PatientTest con = new PatientTest();
        while (rs.next()) {
            con.setPatientTestId(rs.getInt("patient_test_id"));
            con.setTestId(rs.getInt("test_id"));
            con.setTestBody(rs.getString("test_body"));
            con.setDoctorId(rs.getInt("doctor_id"));
            con.setPatientId(rs.getInt("patient_id"));
            con.setStatus(rs.getInt("status"));
            con.setAddedDate(rs.getDate("added_date"));
            con.setTestedDate(rs.getDate("tested_date"));
            con.setReportImage(rs.getString("report_image"));
        }
         dbCon.closeConnection();
        return con;
    }

    @Override
    public List<PatientTest> getAll() throws ClassNotFoundException, SQLException {
          String sql = "Select * from `patient_test`";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        List<PatientTest> conList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();

        while (rs.next()) {
            PatientTest con = new PatientTest();
             con.setPatientTestId(rs.getInt("patient_test_id"));
            con.setTestId(rs.getInt("test_id"));
            con.setTestBody(rs.getString("test_body"));
            con.setDoctorId(rs.getInt("doctor_id"));
            con.setPatientId(rs.getInt("patient_id"));
            con.setStatus(rs.getInt("status"));
            con.setAddedDate(rs.getDate("added_date"));
            con.setTestedDate(rs.getDate("tested_date"));
             con.setReportImage(rs.getString("report_image"));
            conList.add(con);
        }
        dbCon.closeConnection();
        return conList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
          String sql = "SELECT COUNT(patient_test_id) FROM patient_test";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();

        int s = 0;
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();
        while (rs.next()) {
            s = Integer.parseInt(rs.getObject(1).toString());
        }
         dbCon.closeConnection();
        return s;
    }
    
}
