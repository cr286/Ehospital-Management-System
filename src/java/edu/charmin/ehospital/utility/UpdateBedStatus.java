/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.utility;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 *
 * @author charm_000
 */
public class UpdateBedStatus {

    public void BedStatusUpdate(int status, int id) throws ClassNotFoundException, SQLException {

        String sql = "UPDATE `hospital_bed` SET `bed_status`=? WHERE bed_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);

        stmt.setInt(1, status);
        stmt.setInt(2, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
    }

    public static void DischargePatient(int bedId,int bookId) throws ClassNotFoundException, SQLException {

        String sql = "UPDATE `hospital_bed` SET `bed_status`=? WHERE bed_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, 0);
        stmt.setInt(2, bedId);
        dbCon.executeUpdate();
         dbCon.closeConnection();

        String sql2 = "UPDATE `book_bed` SET `book_status`=?,`discharge_date`=NOW() WHERE book_id=?";
        Dbconn dbConn = new Dbconn(sql2);
        dbConn.openConnection();
        PreparedStatement stmt1 = dbConn.initStatement(sql2);

        stmt1.setInt(1, 0);
        
        stmt1.setInt(2, bookId);
        dbConn.executeUpdate();
        dbConn.closeConnection();
       
    }
}
