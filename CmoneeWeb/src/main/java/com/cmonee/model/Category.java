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
public class Category {
    private String id;
    private String name;
    
    public Category(){
        super();
    }
    
    public Category(String id, String name){
        super();
        this.id=id;
        this.name=name;
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
    
    
}
