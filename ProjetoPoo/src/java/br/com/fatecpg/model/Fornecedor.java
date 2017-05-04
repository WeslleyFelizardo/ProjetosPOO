/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.model;
import static br.com.fatecpg.model.Cliente.proximoAnterior;
import java.util.ArrayList;

/**
 *
 * @author O77O
 */
public class Fornecedor  extends PessoaJuridica{
 private String cnpj; 
 private String rSocial; 
 public static int idGerado = 0;
 private int quantidadePorPagina = 3;
 public static boolean proximoAnterior = true;

 
 public Fornecedor (String nomeFantasia, String telefone, String endereco, String email, String cnpj, String rSocial){
     super.setNomeFantasia(nomeFantasia);
     super.setTelefone(telefone);
     super.setEndereco(endereco);
     super.setEmail(email);
     this.cnpj = cnpj; 
     this.rSocial = rSocial; 
     idGerado++;
     super.setId(idGerado);
 }
 
 public Fornecedor(){
     
 }
 
 
 
    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getrSocial() {
        return rSocial;
    }

    public void setrSocial(String rSocial) {
        this.rSocial = rSocial;
    }

    public int getQuantidadePorPagina() {
        return quantidadePorPagina;
    }

    public void setQuantidadePorPagina(int quantidadePorPagina) {
        this.quantidadePorPagina = quantidadePorPagina;
    }

    public static boolean isProximoAnterior() {
        return proximoAnterior;
    }

    public static void setProximoAnterior(boolean proximoAnterior) {
        Fornecedor.proximoAnterior = proximoAnterior;
    }

    public static int getIdGerado() {
        return idGerado;
    }

    public static void setIdGerado(int idGerado) {
        Fornecedor.idGerado = idGerado;
    }
 
        public boolean inserir(Fornecedor supplyer) {
        try {
            Fornecedor fornecedor = supplyer;

            BancoDados.getDadosFornecedor().add(fornecedor);

        } catch (Exception e) {
            return false;
        }
        return true;
    }  
    
        public ArrayList<Fornecedor> listar() {
        return BancoDados.getDadosFornecedor();
    }

    public ArrayList<Fornecedor> listarPaginado(int pagina) {
        ArrayList<Fornecedor> fornecedores = new ArrayList<Fornecedor>();
        pagina -= 1;

       
        for (int i = pagina * (int)this.quantidadePorPagina; i < (pagina * (int)this.quantidadePorPagina) + (int)this.quantidadePorPagina; i++) {
            if (i >= this.listar().size())
                break;
            fornecedores.add(this.listar().get(i));
        }

        return fornecedores;
    }

    
    public boolean editar(Fornecedor fornecedo) {
        try {
            Fornecedor fornecedorAtualizar = fornecedo;

            for (Fornecedor item : BancoDados.getDadosFornecedor()) {
                if (item.getId() == fornecedorAtualizar.getId()) {
                    Fornecedor fornecedor = item;
                    fornecedor.setNomeFantasia(fornecedorAtualizar.getNomeFantasia());
                    fornecedor.setCnpj(fornecedorAtualizar.getCnpj());
                    fornecedor.setrSocial(fornecedorAtualizar.getrSocial());
                    fornecedor.setEndereco(fornecedorAtualizar.getEndereco());
                    fornecedor.setEmail(fornecedorAtualizar.getEmail());
                    fornecedor.setTelefone(fornecedorAtualizar.getTelefone());
                }
            }
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    
    public boolean deletar(int id) {
        try {
            for (Fornecedor fornecedor : BancoDados.getDadosFornecedor()) {
                if (fornecedor.getId() == id) {
                    BancoDados.getDadosFornecedor().remove(fornecedor);
                    break;
                }
            }
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    
    public Fornecedor getPorId(int id) {
        try {
            for (Fornecedor fornecedor : BancoDados.getDadosFornecedor()) {
                if (fornecedor.getId() == id) {
                    return fornecedor;

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




