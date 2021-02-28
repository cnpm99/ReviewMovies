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
public class Comment {
    private String id;
    private String description;
    private String time;
    private String userId;
    private String movieId;
    
    public Comment(){
        super();
    }
    
    public Comment(String id, String description, String time, String userId, String movieId){
        this.id=id;
        this.description=description;
        this.time=time;
        this.userId=userId;
        this.movieId=movieId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }
    
}
