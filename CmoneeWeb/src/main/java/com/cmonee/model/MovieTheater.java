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
public class MovieTheater {
    private String id;
    private String name;
    private String link;

    public MovieTheater(){
        super();
    }
    
    public MovieTheater(String id, String name, String link){
        super();
        this.id=id;
        this.name=name;
        this.link=link;
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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
    
}
