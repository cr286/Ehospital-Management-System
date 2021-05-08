/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.charmin.ehospital.daoo.impl;

import edu.charmin.ehospital.daoo.PostDAO;
import edu.charmin.ehospital.entity.Appointment;
import edu.charmin.ehospital.entity.Post;
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
public class PostDAOImpl implements PostDAO {

    @Override
    public int insert(Post t) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO `post`(`post_title`, `post_category`, `post_body`,`post_image`) VALUES (?,?,?,?)";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getPostTitle());
        stmt.setString(2, t.getPostCategory());
        stmt.setString(3, t.getPostbody());
        stmt.setString(4, t.getPostImage());
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int update(Post t, int id) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE `post` SET `post_title`=?,`post_category`=?,`post_body`=? WHERE `post_id`=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setString(1, t.getPostTitle());
        stmt.setString(2, t.getPostCategory());
        stmt.setString(3, t.getPostbody());
        stmt.setInt(4, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public int deleteById(int id) throws ClassNotFoundException, SQLException {
       String sql = "DELETE FROM `post` WHERE post_id=?";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        int result = dbCon.executeUpdate();
        dbCon.closeConnection();
        return result;
    }

    @Override
    public Post getById(int id) throws ClassNotFoundException, SQLException {
         String sql = "Select * from post where post_id=?";

        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();

        PreparedStatement stmt = dbCon.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = dbCon.executeQuery();
        Post con = new Post();
        while (rs.next()) {
            con.setPostId(rs.getInt("post_id"));
            con.setPostTitle(rs.getString("post_title"));
            con.setPostCategory(rs.getString("post_category"));
            con.setPostbody(rs.getString("post_body"));
            con.setPostImage(rs.getString("post_image"));
        }
         dbCon.closeConnection();
        return con;
    }

    @Override
    public List<Post> getAll() throws ClassNotFoundException, SQLException {
      String sql = "Select * from post";
        Dbconn dbCon = new Dbconn(sql);
        dbCon.openConnection();
        List<Post> conList = new ArrayList<>();
        PreparedStatement stmt = dbCon.initStatement(sql);
        ResultSet rs = dbCon.executeQuery();

        while (rs.next()) {
            Post con = new Post();
           con.setPostId(rs.getInt("post_id"));
            con.setPostTitle(rs.getString("post_title"));
            con.setPostCategory(rs.getString("post_category"));
            con.setPostbody(rs.getString("post_body"));
            con.setPostImage(rs.getString("post_image"));
            conList.add(con);
        }
        dbCon.closeConnection();
        return conList;
    }

    @Override
    public int count() throws ClassNotFoundException, SQLException {
         String sql = "SELECT COUNT(post_id) FROM post";
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
