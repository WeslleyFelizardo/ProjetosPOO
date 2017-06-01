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
public class Question {
    
    private Integer id;
    private String description;
    private Category category;
    private int active;
    private ArrayList<Alternative> alternatives;

    public Question(Integer id, String description) {
        this.id = id;
        this.description = description;
        this.alternatives = new ArrayList<Alternative>();
    }

    public Question(Integer id, String description, Category category, int active) {
        this.id = id;
        this.description = description;
        this.category = category;
        this.active = active;
        this.alternatives = new ArrayList<Alternative>();
    }

    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int isActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public ArrayList<Alternative> getAlternatives() {
        return alternatives;
    }

    public void setAlternatives(ArrayList<Alternative> alternatives) {
        this.alternatives = alternatives;
    }
    
    
    
}
