/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.dao;

import br.com.fatecpg.modelo.Player;
import br.com.fatecpg.modelo.Quiz;
import br.com.fatecpg.modelo.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Cleide
 */
public class PlayerDAO {

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    private String sql;

    public PlayerDAO() {
        this.connection = ConnectionDAO.getInstancy().getConnection();
        this.sql = "";
    }

    public boolean playerRegistering(Player player) {
        try {
            this.sql = "insert into player (name, email, password, id_role, active) values (?, ?, ?, ?, ?)";

            this.statement = this.connection.prepareStatement(this.sql);
            this.statement.setString(1, player.getName());
            this.statement.setString(2, player.getEmail());
            this.statement.setString(3, player.getPassword());
            this.statement.setInt(4, player.getIdRole());
            this.statement.setInt(5, 1);
            
            boolean result = this.statement.execute();
            if (result) {
                System.out.println("inserido");
                return true;
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return false;
    }

    public boolean logIn(Player player) {
        try {
            this.sql = "select * from player where email = ? and password = ? and active = 1";

            this.statement = this.connection.prepareStatement(this.sql);
            this.statement.setString(1, player.getEmail());
            this.statement.setString(2, player.getPassword());

            this.resultSet = this.statement.executeQuery();

            if (this.resultSet.next()) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return false;
    }

    public Player getPlayer(String email) {
        try {
            this.sql = "select * from player where email = ?";

            this.statement = this.connection.prepareStatement(this.sql);
            this.statement.setString(1, email);

            this.resultSet = this.statement.executeQuery();

            if (this.resultSet.next()) {
                return new Player(this.resultSet.getInt("id"), this.resultSet.getString("name"),
                        this.resultSet.getString("email"), this.resultSet.getInt("id_role"));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public double getScoreAverage(int id) {
        try {
            this.sql = "select avg(score) as 'Média' from quiz\n"
                    + "where id_player = ?";

            this.statement = this.connection.prepareStatement(this.sql);
            this.statement.setInt(1, id);

            this.resultSet = this.statement.executeQuery();

            if (this.resultSet.next()) {
                return this.resultSet.getDouble("Média");
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return 0.0;
    }

    public Player getHistoric(String email) {
        Player player;
        try {
            player = this.getPlayer(email);

            this.sql = "select score, date, quiz.id as id_quiz from quiz\n"
                    + "inner join player\n"
                    + "on quiz.id_player = player.id\n"
                    + "where id_player = ? and active = 1 order by date desc";
            this.statement = this.connection.prepareStatement(this.sql);

            this.statement.setInt(1, player.getId());

            this.resultSet = this.statement.executeQuery();

            while (this.resultSet.next()) {
                Quiz quiz = new Quiz();
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
                quiz.setId(this.resultSet.getInt("id_quiz"));
                quiz.setDate(sdf.format(this.resultSet.getTimestamp("date")));
                quiz.setScore(this.resultSet.getDouble("score"));

                player.getQuiz().add(quiz);
            }

            return player;
        } catch (Exception e) {
            System.out.println("Erro:" + e.getMessage());
        }
        return null;
    }

    public ArrayList<Player> getAllPlayer() {
        ArrayList<Player> players = new ArrayList<Player>();
        try {
            this.sql = "select player.id, name, email, password, id_role from player\n"
                    + "inner join role\n"
                    + "on role.id = player.id_role where active = 1";
            
            this.statement = this.connection.prepareStatement(this.sql);
            
            this.resultSet = this.statement.executeQuery();
            
            while (this.resultSet.next()) {
                Player player = new Player(this.resultSet.getInt("id"),
                        this.resultSet.getString("name"),
                        this.resultSet.getString("email"),
                        this.resultSet.getInt("id_role"));
                player.setPassword(this.resultSet.getString("password"));
                player.setRole(new RoleDAO().getRoleById(player.getIdRole()));
                //player.setRole();
                
                players.add(player);
          }
          return players;
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return null;
    }

    public boolean deletePlayer(int id) {
        try {
            this.sql = "update player set active = 0 where id = ?";
            
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
    
    public boolean updatePlayer(Player player){
        try {
            this.sql = "update player set name = ?, email = ?, password = ?, id_role = ? where id = ?";
            
            this.statement = this.connection.prepareStatement(this.sql);
            
            this.statement.setString(1, player.getName());
            this.statement.setString(2, player.getEmail());
            this.statement.setString(3, player.getPassword());
            this.statement.setInt(4, player.getIdRole());
            this.statement.setInt(5, player.getId());
            
            if (this.statement.execute()){
                return true;
            }
            
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return false;
    }
}
