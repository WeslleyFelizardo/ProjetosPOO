/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.dao;

import br.com.fatecpg.modelo.Alternative;
import br.com.fatecpg.modelo.Player;
import br.com.fatecpg.modelo.Question;
import br.com.fatecpg.modelo.QuestionQuiz;
import br.com.fatecpg.modelo.Quiz;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Cleide
 */
public class QuizDAO {

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    private String sql;
    private ArrayList<QuestionQuiz> details;

    public QuizDAO() {
        this.connection = ConnectionDAO.getInstancy().getConnection();
        this.sql = "";
    }

    public void newQuiz(Quiz quiz) {

        try {
            this.sql = "insert into quiz (score, date, id_player) values(?, now(), ?)";

            this.statement = this.connection.prepareStatement(this.sql);
            this.statement.setDouble(1, quiz.getScore());
            //this.statement.setString(2, "2017-05-26");
            this.statement.setInt(2, quiz.getPlayer().getId());

            this.statement.execute();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Quiz getLastQuiz(int id) {
        try {
            this.sql = "select * from Quiz where id_player = ?\n"
                    + "order by date desc limit 1";

            this.statement = this.connection.prepareStatement(this.sql);
            this.statement.setInt(1, id);

            this.resultSet = this.statement.executeQuery();

            if (this.resultSet.next()) {
                return new Quiz(this.resultSet.getInt("id"), this.resultSet.getDouble("score"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public void validateQuiz(int idQuiz) {
        try {
            this.sql = "{call validateQuiz(?)}";
            CallableStatement callableStatemet = this.connection.prepareCall(sql);

            callableStatemet.setInt(1, idQuiz);

            callableStatemet.execute();

        } catch (Exception e) {
            System.out.println("Erro:" + e.getMessage());
        }
    }

    public ArrayList<Player> getRanking() {
        ArrayList<Player> ranking = new ArrayList<Player>();
        try {
            this.sql = "select name, score, date from quiz\n"
                    + "inner join player\n"
                    + "on player.id = quiz.id_player where player.id_role = 2 order by score desc limit 10";

            this.statement = this.connection.prepareStatement(this.sql);

            this.resultSet = this.statement.executeQuery();

            while (this.resultSet.next()) {
                Player player = new Player();

                player.setName(this.resultSet.getString("name"));
                Quiz quiz = new Quiz();
                
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
                
                quiz.setDate(sdf.format(this.resultSet.getTimestamp("date")));                
                quiz.setScore(this.resultSet.getDouble("score"));
                player.getQuiz().add(quiz);
                
                ranking.add(player);

            }
            return ranking;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    private ArrayList<QuestionQuiz> detailsQuiz() {
        details = new ArrayList<QuestionQuiz>();
        try {
            this.sql = "select question.id as id_question, quiz.id as id_quiz, alternative.id as id_alternative\n"
                    + "from question_quiz\n"
                    + "inner join quiz\n"
                    + "on quiz.id = question_quiz.id_quiz\n"
                    + "inner join alternative\n"
                    + "on alternative.id = question_quiz.id_alternative\n"
                    + "inner join question\n"
                    + "on alternative.id_question = question.id";

            this.statement = this.connection.prepareStatement(this.sql);

            this.resultSet = this.statement.executeQuery();

            while (this.resultSet.next()) {
                QuestionQuiz questionQuiz = new QuestionQuiz();

                Alternative alternative = new AlternativeDAO().getById(this.resultSet.getInt("id_alternative"));

                questionQuiz.getAnswers().add(alternative);
                questionQuiz.getAnswers().get(0).setQuestion(new QuestionDAO().getById(this.resultSet.getInt("id_question")));
                questionQuiz.setId(this.resultSet.getInt("id_quiz"));

                details.add(questionQuiz);

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return details;
    }

    public String detailsToJson() throws JSONException {
        ArrayList<QuestionQuiz> details = this.detailsQuiz();

        JSONArray list = new JSONArray();

        for (QuestionQuiz questionQuiz : details) {
            JSONObject objectJson = new JSONObject();
            objectJson.put("question", questionQuiz.getAnswers().get(0).getQuestion().getDescription());
            objectJson.put("answer", questionQuiz.getAnswers().get(0).getDescription());
            objectJson.put("idQuiz", questionQuiz.getId());

            list.put(objectJson);
        }
        return list.toString();
    }
}
