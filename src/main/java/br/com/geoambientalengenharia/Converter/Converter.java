/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Converter;

/**
 *
 * @author Rafael Delanhese
 * @param <T>
 */
public interface Converter<T> {
    T convert(String value, Class<? extends T> type);
}
