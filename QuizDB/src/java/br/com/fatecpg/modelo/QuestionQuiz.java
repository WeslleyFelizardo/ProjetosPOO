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
public class QuestionQuiz {
    
    private int id;
    private ArrayList<Alternative> answers;
    private Quiz quiz;

    public QuestionQuiz(ArrayList<Alternative> answers, Quiz quiz) {
        this.answers = answers;
        this.quiz = quiz;
    }

    public QuestionQuiz() {
        this.answers = new ArrayList<Alternative>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ArrayList<Alternative> getAnswers() {
        return answers;
    }

    public void setAnswers(ArrayList<Alternative> answers) {
        this.answers = answers;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }
    
    
}
