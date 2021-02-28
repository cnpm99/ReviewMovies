package com.cmonee.util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author luan_
 */
public class DBUtil implements Serializable {

    public static Connection makeConnection()
            throws NamingException, SQLException {
        Context context = new InitialContext();
        Context tomcatCtx = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) tomcatCtx.lookup("CmoneeDS");
        if (ds != null) {
            Connection con = ds.getConnection();
            return con;
        }
        return null;
    }
    static final String HOST = "http://localhost:8080/CmoneeWeb/";

    public static String fullPath(String path) {
        return HOST + path;
    }
}
