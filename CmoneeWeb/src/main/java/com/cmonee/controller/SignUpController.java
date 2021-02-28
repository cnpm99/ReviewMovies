package com.cmonee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cmonee.model.User;
import com.cmonee.dao.SignUpDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

public class SignUpController extends HttpServlet {

    public SignUpController() {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Copying all the input parameters in to local variables
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String userName = request.getParameter("username");
            String password = request.getParameter("password");

            User user = new User();

            user.setName(name);
            user.setEmail(email);
            user.setUsername(userName);
            user.setPassword(password);

            SignUpDAO registerDao = new SignUpDAO();

            //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
            String userRegistered = registerDao.registerUser(user);

            if (userRegistered.equals("SUCCESS")) //On success, you can display a message to user on Home page
            {
                request.getRequestDispatcher("/login.html").forward(request, response);
            } else //On Failure, display a meaningful message to the User.
            {
                request.setAttribute("errMessage", userRegistered);
                request.getRequestDispatcher("/signup.html").forward(request, response);
            }
        } catch (NamingException ex) {
            Logger.getLogger(SignUpController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
