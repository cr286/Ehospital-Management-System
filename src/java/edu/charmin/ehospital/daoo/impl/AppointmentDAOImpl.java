/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.AppointmentDAO;
import edu.charmin.ehospital.entity.Appointment;
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
public class AppointmentDAOImpl implements AppointmentDAO {

    @Override
    public int insert(Appointment t) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO `appointment`(`doctor_id`, `patient_id`, `appointment_status`) VALUES (?,?,?)";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, t.getDoctorId());
        stmt.setInt(2, t.getPatientId());
        stmt.setInt(3, t.getAppointmentStatus());
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(Appointment t, int id) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE `appointment` SET `doctor_id`=?,`patient_id`=?,`appointment_status`=?, WHERE appointment_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, t.getDoctorId());
        stmt.setInt(2, t.getPatientId());
        stmt.setInt(3, t.getAppointmentStatus());
        stmt.setInt(4, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM `appointment` WHERE appointment_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public Appointment getById(int id) throws ClassNotFoundException, SQLException {
        String sql = "Select * from appointment where appointment_id=?";

        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();

        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        Appointment con = new Appointment();
        while (rs.next()) {
            con.setAppointmentID(rs.getInt("appointment_id"));
            con.setDoctorId(rs.getInt("doctor_id"));
            con.setPatientId(rs.getInt("patient_id"));
            con.setAppointmentStatus(rs.getInt("appointment_status"));
            con.setAppointmentDate(rs.getDate("appointment_date"));
        }
         dbCon.closeConnection();
        return con;
    }

    @Override
    public List<Appointment> getAll() throws ClassNotFoundException, SQLException {
        String sql = "Select * from appointment";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        List<Appointment> conList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();

        while (rs.next()) {
            Appointment con = new Appointment();
            con.setAppointmentID(rs.getInt("appointment_id"));
            con.setDoctorId(rs.getInt("doctor_id"));
            con.setPatientId(rs.getInt("patient_id"));
            con.setAppointmentStatus(rs.getInt("appointment_status"));
            con.setAppointmentDate(rs.getDate("appointment_date"));
            conList.add(con);
        }
        dbCon.closeConnection();
        return conList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
        String sql = "SELECT COUNT(appointment_id) FROM appointment";
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
