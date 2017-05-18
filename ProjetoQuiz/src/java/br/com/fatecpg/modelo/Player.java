package br.com.fatecpg.modelo;


import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author 
 */
public class Player implements Comparable<Player>{
    
    private String name;
    private ArrayList<Double> points;

    public Player(String name) {
        this.name = name;
        this.points = new ArrayList<Double>();
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Double> getPoints() {
        return points;
    }

    public void setPoints(ArrayList<Double> points) {
        this.points = points;
    }
    
    //Método que verifica se o jogador ja esta no rank
    public static Player jogadorRank(String name){
        for (Player item : Quiz.ranking) {
            if(item.getName().equals(name)){
                return item;
            }
        }
        return null;
    }
    
    
    public static void adicionarJogadorRank(Player player, Double point){
        Player p = jogadorRank(player.getName());
        if(p != null){
            p.getPoints().add(point * 100.0);
        }else{
            player.getPoints().add(point * 100.0);
            Quiz.ranking.add(player);
        }
    }
    
    public static Double sumPoints(ArrayList<Double> points){
        Double sum = 0.0;
        
        for (Double point : points) {
            sum += point;
        }
        return sum;
    }
    
    @Override
    public int compareTo(Player o) {
        if(sumPoints(this.getPoints()) / this.getPoints().size() > sumPoints(o.getPoints()) / o.getPoints().size()){       
            return -1;
        }
        return 1;
    }
    
}
