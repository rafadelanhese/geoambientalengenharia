/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Validation;

import br.com.geoambientalengenharia.Validation.Impl.LoginAvailableValidator;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;


/**
 *
 * @author Rafael Delanhese
 */
@Target({ ElementType.PARAMETER })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {LoginAvailableValidator.class })
@Documented
public @interface LoginAvailable {
    String message() default "{E-mail já cadastrado}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
