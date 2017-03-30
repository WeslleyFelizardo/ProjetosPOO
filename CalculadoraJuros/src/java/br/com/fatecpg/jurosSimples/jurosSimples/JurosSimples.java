/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.jurosSimples.jurosSimples;

/**
 *
 * @author Cleide
 */
public class JurosSimples {
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
    
    public double CalcularJurosSimples(JurosSimples juros){
        double resultado = 0.0;
        
        resultado = juros.getCapital() * (juros.getTaxa() / 100) * juros.getPeriodo();
        resultado = resultado + juros.getCapital();
        return  resultado;
    }
}
