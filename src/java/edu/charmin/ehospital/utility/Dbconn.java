/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author charm_000
 */
public class Dbconn {
  
    private Connection conn=null;
    private PreparedStatement stmt=null;
    private String sql=null; 

    public Dbconn(String sql) {
        this.sql=sql;
    }

    public Dbconn() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   
   
    
    
    public void openConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://localhost/db_ehospital", "root", "");
    }
    public void closeConnection() throws SQLException{
        if(conn!=null&&!conn.isClosed()){
            conn.close();
        }   
    }
    public int executeUpdate() throws SQLException{
        return stmt.executeUpdate();
    }
    public ResultSet executeQuery() throws SQLException{
        return stmt.executeQuery();
    }
    public PreparedStatement initStatement(String sql) throws SQLException{
         stmt = conn.prepareStatement(sql);
        return stmt;
    }

    }
