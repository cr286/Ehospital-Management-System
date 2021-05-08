/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.CheckupDAO;
import edu.charmin.ehospital.entity.Appointment;
import edu.charmin.ehospital.entity.Checkup;
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
public class CheckupDAOImpl implements CheckupDAO{

    @Override
    public int insert(Checkup t) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO `checkup`(`checkup_report`, `checkup_tests`, `checkup_medicine`, `checkup_remarks`, `patient_id`, `doctor_id`, `appointment_id`) VALUES (?,?,?,?,?,?,?)";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getCheckupReport());
        stmt.setString(2, t.getCheckupTest());
        stmt.setString(3, t.getCheckupMedicine());
        stmt.setString(4, t.getCheckupRemarks());
        stmt.setInt(5, t.getPatientId());
        stmt.setInt(6, t.getDoctorId());
        stmt.setInt(7, t.getAppointmentId());
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(Checkup t, int id) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE `checkup` SET `checkup_report`=?,`checkup_tests`=?,`checkup_medicine`=?,`checkup_remarks`=?,`patient_id`=?,`doctor_id`=? WHERE `checkup_id`=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
         stmt.setString(1, t.getCheckupReport());
        stmt.setString(2, t.getCheckupTest());
        stmt.setString(3, t.getCheckupMedicine());
        stmt.setString(4, t.getCheckupRemarks());
        stmt.setInt(5, t.getPatientId());
        stmt.setInt(6, t.getDoctorId());
        stmt.setInt(7, id);
        
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
          String sql = "DELETE FROM `checkup` WHERE checkup_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public Checkup getById(int id) throws ClassNotFoundException, SQLException {
         String sql = "SELECT * FROM `checkup` WHERE `checkup_id`=?";

        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();

        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        Checkup con = new Checkup();
        while (rs.next()) {
            con.setCheckupId(rs.getInt("checkup_id"));
            con.setCheckupReport(rs.getString("checkup_report"));
            con.setCheckupTest(rs.getString("checkup_tests"));
            con.setCheckupMedicine(rs.getString("checkup_medicine"));
            con.setCheckupRemarks(rs.getString("checkup_remarks"));
            con.setDoctorId(rs.getInt("doctor_id"));
            con.setPatientId(rs.getInt("patient_id"));
            con.setAppointmentId(rs.getInt("appointment_id"));
        }
         dbCon.closeConnection();
        return con;
    }

    @Override
    public List<Checkup> getAll() throws ClassNotFoundException, SQLException {
     String sql = "Select * from checkup";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        List<Checkup> conList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();

        while (rs.next()) {
            Checkup con = new Checkup();
                con.setCheckupId(rs.getInt("checkup_id"));
            con.setCheckupReport(rs.getString("checkup_report"));
            con.setCheckupTest(rs.getString("checkup_tests"));
            con.setCheckupMedicine(rs.getString("checkup_medicine"));
            con.setCheckupRemarks(rs.getString("checkup_remarks"));
            con.setDoctorId(rs.getInt("doctor_id"));
            con.setPatientId(rs.getInt("patient_id"));
             con.setAppointmentId(rs.getInt("appointment_id"));
            conList.add(con);
        }
        dbCon.closeConnection();
        return conList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
         String sql = "SELECT COUNT(checkup_id) FROM checkup";
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
