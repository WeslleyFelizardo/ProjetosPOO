/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.jurosComposto.jurosComposto;

import java.util.ArrayList;

/**
 *
 * @author Cleide
 */
public class JurosComposto {
    private double capital;
    private double taxa;
    private Integer periodo;

    public double getCapital() {
        return capital;
    }

    public void setCapital(double capital) {
        this.capital = capital;
    }

    public double getTaxa() {
        return taxa;
    }

    public void setTaxa(double taxa) {
        this.taxa = taxa;
    }

    public Integer getPeriodo() {
        return periodo;
    }

    public void setPeriodo(Integer periodo) {
        this.periodo = periodo;
    }
    
    public ArrayList<Double> CalcularJurosComposto (JurosComposto jurosComposto){
        Integer tamanho = 0;
        ArrayList<Double> resultadosAcumulado = new  ArrayList<Double>();
        
        resultadosAcumulado.add(jurosComposto.capital);
        
        for (int i = 1; i <= jurosComposto.periodo; i++) {
            tamanho = resultadosAcumulado.size();
            resultadosAcumulado.add((resultadosAcumulado.get(tamanho-1) * (jurosComposto.taxa / 100)) + resultadosAcumulado.get(tamanho-1));
        }
        resultadosAcumulado.remove(0);
        return resultadosAcumulado;
    }
}
