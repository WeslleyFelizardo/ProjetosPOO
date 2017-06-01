/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.dao;

import br.com.fatecpg.modelo.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Aula
 */
public class CategoryDAO {

    private ArrayList<Category> categorys;
    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    private String sql;

    public CategoryDAO() {
        this.connection = ConnectionDAO.getInstancy().getConnection();
        this.sql = "";
    }

    public ArrayList<Category> getCategory() {
        try {
            this.categorys = new ArrayList<Category>();
            this.sql = "select * from category";

            this.statement = this.connection.prepareStatement(this.sql);

            this.resultSet = this.statement.executeQuery();

            while (this.resultSet.next()) {
                categorys.add(new Category(this.resultSet.getInt("id"), this.resultSet.getString("name")));
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        
        return categorys;
    }
    
    public Category getById(int id){
        try {
            this.categorys = new ArrayList<Category>();
            this.sql = "select * from category where id = ?";

            this.statement = this.connection.prepareStatement(this.sql);
            this.statement.setInt(1, id);
            
            this.resultSet = this.statement.executeQuery();

            if (this.resultSet.next()) {
                return new Category(this.resultSet.getInt("id"), this.resultSet.getString("name"));
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        
        return null;
    }
}
