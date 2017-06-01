/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Cleide
 */
public class ConnectionDAO {
    private static final String password = "weslley10";
    private static final String url = "jdbc:mysql://localhost:3306/quiz";
    private static final String user = "root";
    private Connection connection;
    
    private static ConnectionDAO instancy = null;
    
    private ConnectionDAO(){       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.connection = DriverManager.getConnection(url, user, password);
            
        } catch (Exception e) {
            System.out.println("Erro:" + e.getMessage());
        }
        
    }
    
    public static ConnectionDAO getInstancy(){
        if (instancy == null)
            instancy = new ConnectionDAO();
        
        return instancy;
    }
    
    public Connection getConnection(){
        
        return this.connection;
    }
    
}
