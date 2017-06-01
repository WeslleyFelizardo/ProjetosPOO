/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.dao;

import br.com.fatecpg.modelo.Alternative;
import br.com.fatecpg.modelo.QuestionQuiz;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Cleide
 */
public class QuestionQuizDAO {

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    private String sql;

    public QuestionQuizDAO() {
        this.connection = ConnectionDAO.getInstancy().getConnection();
        this.sql = "";
    }

    public void registerAnswers(QuestionQuiz questionQuiz) {
        try {
            this.sql = "insert into question_quiz (id_alternative, id_quiz) values(?, ?)";
            
            this.statement = this.connection.prepareStatement(this.sql);
            
            for (Alternative alternatives : questionQuiz.getAnswers()) {
                this.statement.setInt(1, alternatives.getId());
                this.statement.setInt(2, questionQuiz.getQuiz().getId());
                
                this.statement.execute();
            }
            
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}
