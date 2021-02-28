/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cmonee.model;

/**
 *
 * @author MaiBui
 */
public class User {
    private String id;
    private String name;
    private String username;
    private String password;
    private String email;
    private String phone;
    private String address;
    private boolean isAdmin;
    
    public User(){
        super();
    }
    
    public User(String username, String password){
        super();
        this.username=username;
        this.password=password;
        this.isAdmin=false;
    }
    
    public User(String id, String name, String username, String password, String email, String phone, String address, boolean isAdmin){
        super();
        this.id=id;
        this.name=name;
        this.username=username;
        this.password=password;
        this.email=email;
        this.phone=phone;
        this.address=address;
        this.isAdmin=isAdmin;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
    
}
