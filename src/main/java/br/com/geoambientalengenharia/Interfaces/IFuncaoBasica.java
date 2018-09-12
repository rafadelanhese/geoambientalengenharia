/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Interfaces;

/**
 *
 * @author Rafael Delanhese
 * 
 * Interface que define os métodos das funções básicas do sistema
 */
public interface IFuncaoBasica {

    public void lista();

    public void remover(Long id);

    public void editar(Long id);

    public void visualizar(Long id);
}
