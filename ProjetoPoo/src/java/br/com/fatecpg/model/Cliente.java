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
public class Cliente extends Pessoa {

    private String rg;
    private String cpf;
    public static int idGerado = 0;
    private int quantidadePorPagina = 3;
    public static boolean proximoAnterior = true;

    public Cliente(String nome, String telefone, String email, String endereco, String rg, String cpf) {
        this.rg = rg;
        this.cpf = cpf;
        super.setNome(nome);
        super.setTelefone(telefone);
        super.setEndereco(endereco);
        super.setEmail(email);
        idGerado++;
        super.setId(idGerado);
    }

    public Cliente() {

    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    
    public boolean inserir(Cliente client) {
        try {
            Cliente cliente = client;

            BancoDados.getDadosCliente().add(cliente);

        } catch (Exception e) {
            return false;
        }
        return true;
    }

    
    public ArrayList<Cliente> listar() {
        return BancoDados.getDadosCliente();
    }

    public ArrayList<Cliente> listarPaginado(int pagina) {
        ArrayList<Cliente> clientes = new ArrayList<Cliente>();
        pagina -= 1;

        if (pagina * this.quantidadePorPagina + this.quantidadePorPagina >= this.listar().size()) {
            Cliente.proximoAnterior = true;
            //System.out.println(this.listar().size());
        } else {
            proximoAnterior = false;
        }

        for (int i = pagina * (int)this.quantidadePorPagina; i < (pagina * (int)this.quantidadePorPagina) + (int)this.quantidadePorPagina; i++) {
            if (i >= this.listar().size())
                break;
            clientes.add((Cliente) this.listar().get(i));
        }

        return clientes;
    }

    
    public boolean editar(Cliente client) {
        try {
            Cliente clienteAtualizar = client;

            for (Cliente item : BancoDados.getDadosCliente()) {
                if (item.getId() == clienteAtualizar.getId()) {
                    Cliente cliente = item;
                    cliente.setNome(clienteAtualizar.getNome());
                    cliente.setCpf(clienteAtualizar.getCpf());
                    cliente.setRg(clienteAtualizar.getRg());
                    cliente.setEndereco(clienteAtualizar.getEndereco());
                    cliente.setEmail(clienteAtualizar.getEmail());
                    cliente.setTelefone(clienteAtualizar.getTelefone());
                }
            }
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    
    public boolean deletar(int id) {
        try {
            for (Cliente cliente : BancoDados.getDadosCliente()) {
                if (cliente.getId() == id) {
                    BancoDados.getDadosCliente().remove(cliente);
                    break;
                }
            }
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    
    public Cliente getPorId(int id) {
        try {
            for (Cliente cliente : BancoDados.getDadosCliente()) {
                if (cliente.getId() == id) {
                    return cliente;

                }
            }
        } catch (Exception e) {
        }
        return null;
    }

    public float gerarLinks() {
        float links = (float)this.listar().size() / (float)this.quantidadePorPagina;
        int linksInteiro = (int) ((float)this.listar().size() / (float)this.quantidadePorPagina);
        
        if (links > linksInteiro) 
            links = linksInteiro + 1;
        
        return links;
    }
}
