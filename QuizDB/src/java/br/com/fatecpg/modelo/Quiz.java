/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.modelo;

import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Cleide
 */
public class Quiz {
    private int id;
    private double score;
    private String date;
    private Player player;

    public Quiz(double score, Player player) {
        this.id = id;
        this.score = score;
        this.date = date;
        this.player = player;
    }

    public Quiz(int id, double score) {
        this.id = id;
        this.score = score;
    }

    public Quiz() {
    }
 
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }
    
    
}
