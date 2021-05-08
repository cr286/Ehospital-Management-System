/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.utility;

import edu.charmin.ehospital.entity.Checkup;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author charm_000
 */
public class AppointmentStatusUpdate {

    public void AppointStatusUpdate(int status, int id) throws ClassNotFoundException, SQLException {
        int pay = 2;

        String sql = "UPDATE `appointment` SET `appointment_status`=? WHERE appointment_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);

        stmt.setInt(1, pay);
        stmt.setInt(2, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
    }

    public static boolean DoctorAppointmentLimitCheck(Date date, int docId) throws ClassNotFoundException, SQLException {

        String sql = "SELECT COUNT(appointment_id) FROM appointment where doctor_id=? AND DATE(appointment_date)=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();

        int s = 0;
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, docId);
        stmt.setDate(2, date);
        ResultSet rs = dbCon.executeQuery();
        while (rs.next()) {
            s = Integer.parseInt(rs.getObject(1).toString());
        }
        dbCon.closeConnection();

        return s < 5;
    }
    
    public static Checkup GetCheckupDetailByAppId(int appId) throws ClassNotFoundException, SQLException {
    String sql = "SELECT * FROM `checkup` WHERE `appointment_id`=?";

        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();

        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, appId);
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
}
