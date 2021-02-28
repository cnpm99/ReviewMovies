/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cmonee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.cmonee.model.User;
import com.cmonee.util.DBUtil;
import java.io.Serializable;
import java.sql.ResultSet;
import javax.naming.NamingException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class SignUpDAO {

    public String registerUser(User register) throws NamingException {
        String name = register.getName();
        String email = register.getEmail();
        String userName = register.getUsername();
        String password = register.getPassword();
        Boolean isAdmin = false;
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = DBUtil.makeConnection();

            Statement stmt = con.createStatement();
            String sql = "SELECT COUNT(*) + 1 AS COUNT FROM USERS";
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            int Count = rs.getInt(1);

            String query = "insert into users(ID,Name,Username,Password,Email,isAdmin) values (?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1, String.valueOf(Count));
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, userName);
            preparedStatement.setString(4, password);
            preparedStatement.setString(5, email);
            preparedStatement.setBoolean(6, isAdmin);
            int i = preparedStatement.executeUpdate();

            if (i != 0) //Just to ensure data has been inserted into the database
            {
                return "SUCCESS";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
}
