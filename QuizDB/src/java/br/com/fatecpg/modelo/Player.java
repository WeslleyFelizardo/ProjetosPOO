/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.modelo;

import java.util.ArrayList;

/**
 *
 * @author Cleide
 */
public class Player {
    private int id;
    private String name;
    private String email;
    private String password;
    private Role role;
    private int idRole;
    private Double media;
    ArrayList<Quiz> quiz;

    public Player(int id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }

    public Player() {
        this.quiz = new ArrayList<Quiz>();
    }

    public Player(int id, String name, String email, int idRole) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.idRole = idRole;
        this.quiz = new ArrayList<Quiz>();
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    public ArrayList<Quiz> getQuiz() {
        return quiz;
    }

    public void setQuiz(ArrayList<Quiz> quiz) {
        this.quiz = quiz;
    }

    public Double getMedia() {
        return media;
    }

    public void setMedia(Double media) {
        this.media = media;
    }
    
    
}
