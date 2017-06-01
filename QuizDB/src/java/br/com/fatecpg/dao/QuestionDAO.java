/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.dao;

import br.com.fatecpg.modelo.Category;
import br.com.fatecpg.modelo.Player;
import br.com.fatecpg.modelo.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Cleide
 */
public class QuestionDAO {

    private ArrayList<Question> questions;
    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    private String sql;

    public QuestionDAO() {
        this.connection = ConnectionDAO.getInstancy().getConnection();
        this.sql = "";
    }

    public int generateId() {
        try {
            this.sql = "select id from question order by id desc limit 1";
            this.statement = this.connection.prepareStatement(this.sql);

            this.resultSet = this.statement.executeQuery();

            if (this.resultSet.next()) {
                return this.resultSet.getInt("id") + 1;
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return 1;
    }

    public ArrayList<Question> getQuestionRandom(ArrayList<Integer> chooses) throws SQLException {

        try {
            this.questions = new ArrayList<Question>();

            this.sql = "select id, description from question"
                    + " where id_category = ? or id_category = ? or id_category = ? "
                    + "order by rand() LIMIT 10";

            this.statement = this.connection.prepareStatement(this.sql);

            for (int i = 0; i < 3; i++) {
                if (i >= chooses.size()) {
                    this.statement.setInt(i + 1, 0);
                } else {
                    this.statement.setInt(i + 1, chooses.get(i) != null ? chooses.get(i) : 0);
                }
            }

            this.resultSet = this.statement.executeQuery();

            while (this.resultSet.next()) {
                questions.add(new Question(this.resultSet.getInt("id"), this.resultSet.getString("description")));

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            //this.connection.close();
        }

        return questions;
    }

    public ArrayList<Question> getAllQuestions() {
        try {
            questions = new ArrayList<Question>();
            this.sql = "select * from question where active = 1 order by id desc limit 10";

            this.statement = this.connection.prepareStatement(this.sql);

            this.resultSet = this.statement.executeQuery();

            while (this.resultSet.next()) {
                questions.add(new Question(this.resultSet.getInt("id"), this.resultSet.getString("description"),
                        new CategoryDAO().getById(this.resultSet.getInt("id_category")), this.resultSet.getInt("active")));
            }

            return questions;
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return null;
    }

 
    public boolean deleteQuestion(int id) {
        try {
            this.sql = "update question set active = 0 where id = ?";

            this.statement = this.connection.prepareStatement(this.sql);
            this.statement.setInt(1, id);

            if (this.statement.execute()) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return false;
    }

    public boolean registerQuestion(Question question) {
        try {
            this.sql = "insert into question (id, description, id_category, active) values (?, ?, ?, ?)";

            this.statement = this.connection.prepareStatement(this.sql);
            this.statement.setInt(1, question.getId());
            this.statement.setString(2, question.getDescription());
            this.statement.setInt(3, question.getCategory().getId());
            this.statement.setInt(4, 1);

            if (this.statement.execute()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return false;
    }

    public boolean updateQuestion(Question question) {
        try {
            this.sql = "update question set description = ?, id_category = ?, active = 1 where id = ?";

            this.statement = this.connection.prepareStatement(this.sql);

            this.statement.setString(1, question.getDescription());
            this.statement.setInt(2, question.getCategory().getId());
            this.statement.setInt(3, question.getId());

            if (this.statement.execute()) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return false;
    }

    public Question getById(int id) {
        try {
            this.sql = "select id, description from question where id = ?";

            this.statement = this.connection.prepareStatement(this.sql);
            this.statement.setInt(1, id);

            this.resultSet = this.statement.executeQuery();

            if (this.resultSet.next()) {
                return new Question(this.resultSet.getInt("id"), this.resultSet.getString("description"));
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return null;
    }
}
