/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.modelo;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Cleide
 */
public class Alternative {

    private int id;
    private String description;
    private int answerCorrect;
    private Question question;

    public Alternative(int id, String description, int answerCorrect, Question question) {
        this.id = id;
        this.description = description;
        this.answerCorrect = answerCorrect;
        this.question = question;
    }

    public Alternative(int id, String description, int answerCorrect) {
        this.id = id;
        this.description = description;
        this.answerCorrect = answerCorrect;
    }

    public Alternative() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int isAnswerCorrect() {
        return answerCorrect;
    }

    public void setAnswerCorrect(int answerCorrect) {
        this.answerCorrect = answerCorrect;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }   
}
