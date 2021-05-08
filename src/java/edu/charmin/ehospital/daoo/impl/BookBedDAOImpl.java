/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.BookBedDAO;
import edu.charmin.ehospital.entity.BookBed;
import edu.charmin.ehospital.entity.HospitalBed;
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
public class BookBedDAOImpl implements BookBedDAO{

    @Override
    public int insert(BookBed t) throws ClassNotFoundException, SQLException {
           String sql = "INSERT INTO `book_bed`(`bed_id`,`patient_id`, `book_status`) VALUES (?,?,?)";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, t.getBedId());
       stmt.setInt(2, t.getPatientId());
        stmt.setInt(3, t.getBookStatus());
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(BookBed t, int id) throws ClassNotFoundException, SQLException {
    
      String sql = "UPDATE `book_bed` SET `bed_id`=?,`patient_id`=?,`book_status`=? WHERE `book_id`=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
         stmt.setInt(1, t.getBedId());
       stmt.setInt(2, t.getPatientId());
        stmt.setInt(3, t.getBookStatus());
        stmt.setInt(4, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
       String sql = "DELETE FROM `book_bed` WHERE book_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public BookBed getById(int id) throws ClassNotFoundException, SQLException {
       String sql = "SELECT * FROM `book_bed` WHERE book_id=?";

        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();

        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        BookBed con = new BookBed();
        while (rs.next()) {
            con.setBedId(rs.getInt("bed_id"));
            con.setBookId(rs.getInt("book_id"));
            con.setPatientId(rs.getInt("patient_id"));
            con.setBookStatus(rs.getInt("book_status"));
            con.setAddedDate(rs.getDate("added_date"));
             con.setDischargeDate(rs.getDate("discharge_date"));
        }
         dbCon.closeConnection();
        return con;
    }

    @Override
    public List<BookBed> getAll() throws ClassNotFoundException, SQLException {
            String sql = "Select * from `book_bed`";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        List<BookBed> conList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();

        while (rs.next()) {
            BookBed con = new BookBed();
             con.setBedId(rs.getInt("bed_id"));
            con.setBookId(rs.getInt("book_id"));
            con.setPatientId(rs.getInt("patient_id"));
            con.setBookStatus(rs.getInt("book_status"));
            con.setAddedDate(rs.getDate("added_date"));
             con.setDischargeDate(rs.getDate("discharge_date"));
            conList.add(con);
        }
        dbCon.closeConnection();
        return conList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
           String sql = "SELECT COUNT(book_id) FROM `book_bed`";
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
