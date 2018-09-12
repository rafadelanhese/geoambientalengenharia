/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Validation.Impl;

import br.com.geoambientalengenharia.DAO.PessoaDAO;
import br.com.geoambientalengenharia.Model.Pessoa;
import br.com.geoambientalengenharia.Validation.LoginAvailable;
import javax.inject.Inject;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 *
 * @author Rafael Delanhese
 */
public class LoginAvailableValidator implements ConstraintValidator<LoginAvailable, Pessoa> {

    @Inject
    private PessoaDAO pessoaDao;

    @Override
    public void initialize(LoginAvailable constraintAnnotation) {

    }

    @Override
    public boolean isValid(Pessoa pessoa, ConstraintValidatorContext context) {
        if (pessoa.getIdPessoa() == null) {
            return !pessoaDao.contemLogin(pessoa.getEmail());
        } else {
            return true;
        }
    }
}
