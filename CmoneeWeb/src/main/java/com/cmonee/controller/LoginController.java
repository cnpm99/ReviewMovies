/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cmonee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.*;
import javax.servlet.*;


import com.cmonee.model.User;
import com.cmonee.dao.LoginDAO;
import com.cmonee.service.UserService;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
/**
 *
 * @author luan_
 */

@WebServlet (name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {
    private final String loginPage = "/login.html";
    private final String welcomePage = "/welcome.jsp";
    
    public LoginController() {
        super();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //get all values from login.html
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            //set values to user
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            
            LoginDAO dao = new LoginDAO();
            //UserService service = new UserService();
            
            String button = request.getParameter("btAction");
            String url = loginPage;
            if (button == null) {
                //do nothing
            } else if (button.equals("Login")) {
                try {
                    //boolean result = service.checkLogin(user);
                    boolean result = dao.checkLogin(username, password);
                    if (result) {
                        url = welcomePage;
                        HttpSession session = request.getSession();
                        session.setAttribute("USER", username);
                    }
                    else {
                        url = loginPage;
                        HttpSession session = request.getSession();
                    }
                    
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            } catch (SQLException ex) {
                log("LoginServlet_SQL" + ex.getMessage());
            }
            }
        } catch (NamingException ex) {
                log("LoginServlet_JNDI" + ex.getMessage());
        }
        out.flush();
    }
    
}

   

