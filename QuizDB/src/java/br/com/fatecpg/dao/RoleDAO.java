/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.dao;

import br.com.fatecpg.modelo.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Cleide
 */
public class RoleDAO {

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    private String sql;

    public RoleDAO() {
        this.connection = ConnectionDAO.getInstancy().getConnection();
        this.sql = "";
    }
    
    public ArrayList<Role> getAllRole(){
        ArrayList<Role> roles = new ArrayList<Role>();
        try {
            this.sql = "select * from role";
            
            this.statement = this.connection.prepareStatement(this.sql);
            
            this.resultSet = this.statement.executeQuery();
            
            while (this.resultSet.next()) {
                roles.add(new Role(this.resultSet.getInt("id"), this.resultSet.getString("role")));
                
            }
           
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return roles;
    }
    
    public Role getRoleById(int id){
        try {
            this.sql = "select * from role where id = ?";
            
            this.statement = this.connection.prepareStatement(this.sql);
            this.statement.setInt(1, id);
            
            this.resultSet = this.statement.executeQuery();
            
            if(this.resultSet.next()) {
                return new Role(this.resultSet.getInt("id"), this.resultSet.getString("role"));
            }
            
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
        return null;
    }
}
