/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.model;

import java.util.ArrayList;

/**
 *
 * @author Cleide
 */
public class BancoDados {

    private static ArrayList<Cliente> dadosCliente;

    public static ArrayList<Cliente> getDadosCliente() {
        if (BancoDados.dadosCliente == null) {
            BancoDados.dadosCliente = new ArrayList<Cliente>();
            BancoDados.dadosCliente.add(new Cliente("Weslley", "(13) 3479-1500", "weslley@gmail.com", "Rua A", "12.548.887-9", "021.554.879-00"));
            BancoDados.dadosCliente.add(new Cliente("Roberta", "(13) 3589-6654", "roberta@hotmail.com", "Rua B", "32.205.108-7", "225.455.879-01"));
            BancoDados.dadosCliente.add(new Cliente("Anderson", "(13) 3596-4785", "arderson.hotmail.com", "Rua C", "33.267.029-4", "332.554.898-77"));
            BancoDados.dadosCliente.add(new Cliente("Otavio", "(13) 3425-7788", "otavio.hotmail.com", "Rua D", "34.025.963-5", "951.025.987-34"));
            BancoDados.dadosCliente.add(new Cliente("Maira", "(13) 3425-0098", "maria.hotmail.com", "Rua E", "35.025.852-1", "951.369.002-98"));
            BancoDados.dadosCliente.add(new Cliente("João", "(13) 3789-0980", "joao.hotmail.com", "Rua F", "36.741.852-4", "987.028.956-20"));
            BancoDados.dadosCliente.add(new Cliente("Matheus", "(13) 3309-1753", "matheus.hotmail.com", "Rua G", "37.741.963-5", "825.985.025-36"));
            BancoDados.dadosCliente.add(new Cliente("Luiz", "(13) 3209-6189", "luiz.hotmail.com", "Rua H", "38.123.753-9", "906.031.976-01"));
            BancoDados.dadosCliente.add(new Cliente("Marcela", "(13) 3467-9820", "marcela.hotmail.com", "Rua I", "32.753.951-7", "445.158.369-00"));
            BancoDados.dadosCliente.add(new Cliente("Bianca", "(13) 3425-7008", "bianca.hotmail.com", "Rua J", "32.020.029-1", "441.136.319-09"));
        }

        return BancoDados.dadosCliente;
    }

    private static ArrayList<Fornecedor> dadosFornecedor;

    public static ArrayList<Fornecedor> getDadosFornecedor() {
        if (BancoDados.dadosFornecedor == null) {
            BancoDados.dadosFornecedor = new ArrayList<Fornecedor>();
            BancoDados.dadosFornecedor.add(new Fornecedor("Fornecedor1", "(13) 3476-9567", "Rua K", "fornecedor1@gmail.com", "12.105.369/0001-22", "Razão1"));
            BancoDados.dadosFornecedor.add(new Fornecedor("Fornecedor2", "(13) 3456-9874", "Rua L", "fornecedor2@gmail.com", "33.025.357/0020-54", "Razão2"));
            BancoDados.dadosFornecedor.add(new Fornecedor("Fornecedor3", "(13) 3496-0587", "Rua M", "fornecedor3@gmail.com", "41.963.852.1117-10", "Razão3"));
            BancoDados.dadosFornecedor.add(new Fornecedor("Fornecedor4", "(13) 3496-9852", "Rua N", "fornecedor4@gmail.com", "44.951.752/9850-36", "Razão4"));
            BancoDados.dadosFornecedor.add(new Fornecedor("Fornecedor5", "(13) 3476-0898", "Rua O", "fornecedor5@gmail.com", "22.654.321/7840-66", "Razão5"));
            BancoDados.dadosFornecedor.add(new Fornecedor("Fornecedor6", "(13) 3469-7582", "Rua P", "fornecedor6@gmail.com", "36.943.349/1115-78", "Razão6"));
            BancoDados.dadosFornecedor.add(new Fornecedor("Fornecedor7", "(13) 3594-0258", "Rua Q", "fornecedor7@gmail.com", "52.987.853/0025-98", "Razão7"));
            BancoDados.dadosFornecedor.add(new Fornecedor("Fornecedor8", "(13) 3594-7775", "Rua R", "fornecedor8@gmail.com", "59.025.987/0251-12", "Razão8"));
            BancoDados.dadosFornecedor.add(new Fornecedor("Fornecedor9", "(13) 3479-9630", "Rua S", "fornecdor9@gmail.com", "65.357.970/0002-98", "Razão9"));
            BancoDados.dadosFornecedor.add(new Fornecedor("Fornecedor10", "(13) 3594-3647", "Rua T", "fornecedor10@gmail.com", "69.254.256/0058-32", "Razão10"));
        }

        return BancoDados.dadosFornecedor;
    }

}
