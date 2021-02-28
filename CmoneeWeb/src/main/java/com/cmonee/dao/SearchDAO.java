package com.cmonee.dao;

import com.cmonee.model.Movie;
import com.cmonee.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author David
 */
public class SearchDAO {
    public static ArrayList<Movie> searchMovieByName(String name) throws NamingException, SQLException{
        ArrayList<Movie> listMovie = new ArrayList<>();
        Connection con = null;      
        ResultSet rs;
        try {
            con = DBUtil.makeConnection();
            String sql = "SELECT * FROM movie WHERE name LIKE ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1,"%"+name+"%");        
            rs = pst.executeQuery();
            while (rs.next()) {
                Movie movie = MVInfoDAO.getMovieByName(rs.getString("name"));//ten film tu csdl
                listMovie.add(movie);
            }
        } catch (SQLException e) {
            
        }finally {
            if (con != null) {
                con.close();
            }
        }
        return listMovie;
    }
}
