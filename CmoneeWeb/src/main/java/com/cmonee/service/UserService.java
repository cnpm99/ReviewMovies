/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cmonee.service;
import com.cmonee.model.User;
/**
 *
 * @author luan_
 */
public class UserService {
    public boolean checkLogin(User user, String username, String password) {
        if (user.getUsername() == username && user.getPassword() == password)
            return true;
        return false;
    }
}
