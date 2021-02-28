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
public class Movie {
    private String id;
    private String name;
    private String datePublished;
    private String nation;
    private String publisher;
    private String director;
    private String casts;
    private String categoryId;
    private String description;
    private String poster;
    private String trailer;
    private String postId;
    private float rating;   
    private int year;
    private int isPublished;

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    
    public Movie(){
        super();
    }
    
     public Movie(String id, String name, String datePublished, String publisher, String nation,
            String director, String casts, String categoryId, String description,
            String poster, String trailer, String postId, float rating, int isPublished, int year){
        super();
        this.id=id;
        this.name=name;
        this.datePublished=datePublished;
        this.publisher=publisher;
        this.nation = nation;
        this.director=director;
        this.casts=casts;
        this.categoryId=categoryId;
        this.description=description;
        this.poster=poster;
        this.postId=postId;
        this.trailer=trailer;
        this.rating=rating;
        this.isPublished=isPublished;
        this.year = year;
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

    public String getDatePublished() {
        return datePublished;
    }

    public void setDatePublished(String datePublished) {
        this.datePublished = datePublished;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getCasts() {
        return casts;
    }

    public void setCasts(String casts) {
        this.casts = casts;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String decription) {
        this.description = decription;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public int getIsPublished() {
        return isPublished;
    }

    public void setIsPublished(int isPublished) {
        this.isPublished = isPublished;
    }
    
    
}

