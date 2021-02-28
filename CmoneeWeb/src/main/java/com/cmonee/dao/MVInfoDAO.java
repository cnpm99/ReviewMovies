/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.cmonee.dao;
import com.cmonee.model.Movie;
import com.cmonee.model.Post;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import com.cmonee.util.DBUtil;
import java.sql.Statement;
import java.util.ArrayList;


/**
 *
 * @author luan_
 */
public  class MVInfoDAO implements Serializable {
       public static ArrayList<Movie> getAllMovie() throws NamingException, SQLException {
        Movie m = new Movie();
        String sql = "Select * from MOVIE";
        ArrayList<Movie> listMovie = new ArrayList<Movie>();
        Connection con = null;
        try {
            con = DBUtil.makeConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                String id = rs.getString(1);
                String movieName = rs.getString(2);
                String datePublished = rs.getString(3);
                String publisher = rs.getString(4);
                String nation = rs.getString(5);
                String director = rs.getString(6);
                String casts = rs.getString(7);
                String categoryId = rs.getString(8);
                String description = rs.getString(9);  
                int isPublished = rs.getInt(10);
                String poster = rs.getString(11);
                String trailer = rs.getString(12);
                String postId = rs.getString(13);
                float rating = rs.getFloat(14); 
                int year = rs.getInt(15);
                m = new Movie(id, movieName, datePublished, publisher, nation, director, 
                        casts, categoryId, description, poster, trailer, postId, rating, isPublished, year);
                listMovie.add(m);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        finally{
            if(con!=null)
                con.close();
        }
        return listMovie;
    }
       
    public static Movie getMovieInfo (String ID) throws NamingException, SQLException {
         Movie Temp = new Movie();
         Connection con = null;      
         try
         {
            con = DBUtil.makeConnection();    
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM MOVIE WHERE ID = " + ID;
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            
            Temp.setId(rs.getString(1));
            Temp.setName(rs.getString(2));
            Temp.setDatePublished(rs.getString(3));
            Temp.setPublisher(rs.getString(4));
            Temp.setNation(rs.getString(5));
            Temp.setDirector(rs.getString(6));
            Temp.setCasts(rs.getString(7));
            Temp.setCategoryId(rs.getString(8));
            Temp.setDescription(rs.getString(9));
            Temp.setIsPublished(rs.getInt(10));
            Temp.setPoster(rs.getString(11));
            Temp.setTrailer(rs.getString(12));
            Temp.setPostId(rs.getString(13));
            Temp.setRating(rs.getFloat(14));
            Temp.setYear(rs.getInt(15));
            stmt.close();
            rs.close();
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }finally{
             if(con!=null)
                 con.close();
         } 
        return Temp;
    }
    
    public static Post getPostInfo(String ID) throws NamingException, SQLException {
         Post Temp = new Post();
         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
            con = DBUtil.makeConnection();    
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM POST WHERE ID = " + ID;
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            
            Temp.setId(rs.getString(1));
            Temp.setContents(rs.getString(2));
            stmt.close();
            rs.close();
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }     finally{
             if(con!=null)
                 con.close();
         } 
    return Temp;
    }
    
    public static String countReviews(String ID) throws NamingException, SQLException {
         String Temp = new String();
         Connection con = null;      
         try
         {
            con = DBUtil.makeConnection();    
            Statement stmt = con.createStatement();
            String sql = "SELECT count(*) FROM RATING WHERE MOVIEID = " + ID;
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            
            Temp = rs.getString(1);
            stmt.close();
            rs.close();
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }   finally{
             if(con!=null)
                 con.close();
         }   
    return Temp;
    }
    
    public static String getCategory(String ID) throws NamingException, SQLException {
         String Temp = new String();
         Connection con = null;       
         try
         {
            con = DBUtil.makeConnection();    
            ResultSet rs;
             try (Statement stmt = con.createStatement()) {
                 String sql = "SELECT NAME FROM CATEGORY WHERE ID = " + ID;
                 rs = stmt.executeQuery(sql);
                 rs.next();
                 Temp = rs.getString(1);
             }
             //khong dong connection o day
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         } 
         if(con!=null)
            con.close();
        return Temp;
    }
    
    public static Movie getMovieByName(String name) throws NamingException, SQLException {
        Movie m = new Movie();
        String sql = "Select * from MOVIE m, Category c where m.Name = ? and m.categoryId = c.ID";
        Connection con = null;
        try {
            con = DBUtil.makeConnection();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, name);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
            String id = rs.getString(1);
            String movieName = rs.getString(2);
            String datePublished = rs.getString(3);
            String publisher = rs.getString(4);
            String nation = rs.getString(5);
            String director = rs.getString(6);
            String casts = rs.getString(7);
            String categoryId = rs.getString(8);
            String description = rs.getString(9);  
            int isPublished = rs.getInt(10);
            String poster = rs.getString(11);
            String trailer = rs.getString(12);
            String postId = rs.getString(13);
            float rating = rs.getFloat(14); 
            int year = rs.getInt(15);
            m = new Movie(id, movieName, datePublished, publisher, nation, director, 
                    casts, categoryId, description, poster, trailer, postId, rating, isPublished, year);
            }
        } catch (SQLException e) {
            e.getMessage();
        } finally{
            if(con!=null)
                con.close();
        }
        return m;
    }
}
