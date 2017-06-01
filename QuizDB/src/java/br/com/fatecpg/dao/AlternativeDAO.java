/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.dao;

import br.com.fatecpg.modelo.Alternative;
import br.com.fatecpg.modelo.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Cleide
 */
public class AlternativeDAO {

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    private String sql;

    public AlternativeDAO() {
        this.connection = ConnectionDAO.getInstancy().getConnection();
        this.sql = "";
    }

    public void registerAlternative(ArrayList<Alternative> alternatives) {
        try {
            this.sql = "insert into alternative (description, answerCorrect, id_question) values (?, ?, ?)";

            this.statement = this.connection.prepareStatement(this.sql);

            for (Alternative alternative : alternatives) {

                this.statement.setString(1, alternative.getDescription());
                this.statement.setInt(2, alternative.isAnswerCorrect());
                this.statement.setInt(3, alternative.getQuestion().getId());

                this.statement.execute();
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    public void getAlternativeQuestion(ArrayList<Question> questions) {
        //ArrayList<Alternative> alternatives = new ArrayList<Alternative>();
        try {
            for (Question question : questions) {
                this.sql = "select * from alternative where id_question = ?";

                this.statement = this.connection.prepareStatement(this.sql);
                this.statement.setInt(1, question.getId());

                this.resultSet = this.statement.executeQuery();

                while (this.resultSet.next()) {
                    question.getAlternatives().add(new Alternative(this.resultSet.getInt("id"), this.resultSet.getString("description"),
                            this.resultSet.getInt("answerCorrect"), question));

                }
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        //return alternatives;
    }

    public Alternative getById(int id) {
        Alternative alternative = null;
        try {
            this.sql = "select * from alternative where id = ?";

            this.statement = this.connection.prepareCall(this.sql);
            this.statement.setInt(1, id);

            this.resultSet = this.statement.executeQuery();

            if (this.resultSet.next()) {
                alternative = new Alternative(this.resultSet.getInt("id"), this.resultSet.getString("description"),
                        this.resultSet.getInt("answerCorrect"));
            }
            return alternative;
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return null;
    }

    public static String toJson(ArrayList<Question> questions) throws JSONException {
        JSONArray list = new JSONArray();

         for (Question question : questions) {
            
            ArrayList<Alternative> alternatives = question.getAlternatives();
            for (int i = 0; i < 4; i++) {
                JSONObject my_obj = new JSONObject();
                my_obj.put("id", alternatives.get(i).getId());
                my_obj.put("description", alternatives.get(i).getDescription());
                my_obj.put("isCorrect", alternatives.get(i).isAnswerCorrect());
                my_obj.put("idQuestion", alternatives.get(i).getQuestion().getId());
                list.put(my_obj);
            }
           
        }
        //System.out.println(lista.toString());
        return list.toString();
    }

    public void updateAlternatives(ArrayList<Alternative> alternatives) {
        try {
            this.sql = "update alternative set description = ?, answerCorrect = ? where id_question = ? and id = ?";
            
            this.statement = this.connection.prepareStatement(this.sql);
            
            for (Alternative alternative : alternatives) {
                this.statement.setString(1, alternative.getDescription());
                this.statement.setInt(2, alternative.isAnswerCorrect());
                this.statement.setInt(3, alternative.getQuestion().getId());
                this.statement.setInt(4, alternative.getId());
                
                this.statement.execute();
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
    
    
}
