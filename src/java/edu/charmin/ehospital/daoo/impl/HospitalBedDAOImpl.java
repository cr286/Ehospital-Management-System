/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.HospitalBedDAO;
import edu.charmin.ehospital.entity.Appointment;
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
public class HospitalBedDAOImpl implements HospitalBedDAO{

    @Override
    public int insert(HospitalBed t) throws ClassNotFoundException, SQLException {
         String sql = "INSERT INTO `hospital_bed`(`bed_no`, `bed_type`, `bed_floor`, `bed_status`,`bed_price`) VALUES (?,?,?,?,?)";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, t.getBedNo());
        stmt.setString(2, t.getBedType());
        stmt.setInt(3, t.getBedFloor());
        stmt.setInt(4, t.getBedStatus());
        stmt.setDouble(5, t.getBedPrice());
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(HospitalBed t, int id) throws ClassNotFoundException, SQLException {
      String sql = "UPDATE `hospital_bed` SET `bed_no`=?,`bed_type`=?,`bed_floor`=?,`bed_status`=? `bed_price`=? WHERE `bed_id`=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
         stmt.setInt(1, t.getBedNo());
        stmt.setString(2, t.getBedType());
        stmt.setInt(3, t.getBedFloor());
        stmt.setInt(4, t.getBedStatus());
        stmt.setDouble(5, t.getBedPrice());
        stmt.setInt(6, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
       String sql = "DELETE FROM `hospital_bed` WHERE bed_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public HospitalBed getById(int id) throws ClassNotFoundException, SQLException {
         String sql = "SELECT * FROM `hospital_bed` WHERE `bed_id`=?";

        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();

        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        HospitalBed con = new HospitalBed();
        while (rs.next()) {
            con.setBedId(rs.getInt("bed_id"));
            con.setBedNo(rs.getInt("bed_no"));
            con.setBedType(rs.getString("bed_type"));
            con.setBedFloor(rs.getInt("bed_floor"));
            con.setBedStatus(rs.getInt("bed_status"));
            con.setBedAddedDate(rs.getDate("added_date"));
            con.setBedPrice(rs.getDouble("bed_price"));
        }
         dbCon.closeConnection();
        return con;
    }

    @Override
    public List<HospitalBed> getAll() throws ClassNotFoundException, SQLException {
          String sql = "Select * from `hospital_bed`";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        List<HospitalBed> conList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();

        while (rs.next()) {
            HospitalBed con = new HospitalBed();
            con.setBedId(rs.getInt("bed_id"));
            con.setBedNo(rs.getInt("bed_no"));
            con.setBedType(rs.getString("bed_type"));
            con.setBedFloor(rs.getInt("bed_floor"));
            con.setBedStatus(rs.getInt("bed_status"));
            con.setBedAddedDate(rs.getDate("added_date"));
            con.setBedPrice(rs.getDouble("bed_price"));
            conList.add(con);
        }
        dbCon.closeConnection();
        return conList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
         String sql = "SELECT COUNT(bed_id) FROM `hospital_bed`";
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
