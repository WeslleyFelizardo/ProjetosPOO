package br.com.fatecpg.tabelaPrice;

import java.text.DecimalFormat;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Cleide
 */
public class TabelaPrice {

    private double valorPresente = 0.0;
    private double prestacao = 0.0;
    private int numeroParcelas = 0;
    private double taxa = 0.0;
    private double saldoDevedor = 0.0;
    private double juros = 0.0;
    private double amortizacao = 0.0;
    private double totalJuros = 0.0;
    private double totalAmortizacao = 0.0;

    public TabelaPrice(double valorFinanciado, double entrada, double taxa, int numeroParcelas) {
        this.saldoDevedor = valorFinanciado - entrada;
        this.taxa = taxa / 100;
        this.numeroParcelas = numeroParcelas;
        this.valorPresente = this.saldoDevedor;
    }

    public double getValorPresente() {
        return this.valorPresente;
    }

    public double getTotalJuros() {
        return this.totalJuros;
    }

    public double getTotalAmortizacao() {
        return totalAmortizacao;
    }

    public double calcularParcelas() {

        double dividendo = Math.pow((1 + taxa), this.numeroParcelas) * this.taxa;
        double divisor = Math.pow((taxa + 1), this.numeroParcelas) - 1;
        this.prestacao = this.saldoDevedor * (dividendo / divisor);
        return this.prestacao;

    }

    public double calcularJuros() {

        this.juros = this.saldoDevedor * this.taxa;
        this.totalJuros += this.juros;
        return this.juros;

    }

    public double calcularAmortizacao() {

        this.amortizacao = this.prestacao - juros;
        this.totalAmortizacao += this.amortizacao;
        return this.amortizacao;

    }

    public Double calcularSaldoDevedor() {

        this.saldoDevedor = this.saldoDevedor - this.amortizacao;
        if (this.saldoDevedor < 0) {
            this.saldoDevedor = 0.0;
        }

        return this.saldoDevedor;

    }
}
