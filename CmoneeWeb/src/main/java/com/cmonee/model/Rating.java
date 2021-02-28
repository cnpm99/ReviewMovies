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
public class Rating {
    private String movieId;
    private String userId;
    private int rate;
    
    public Rating(){
        super();
    }
    
    public Rating(String movieId, String userId, int rate){
        super();
        this.movieId=movieId;
        this.userId=userId;
        this.rate=rate;
    }

    public String getMovieId() {
        return movieId;
    }

    public void setMovieId(String movieId) {
        this.movieId = movieId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }
    
    
}
