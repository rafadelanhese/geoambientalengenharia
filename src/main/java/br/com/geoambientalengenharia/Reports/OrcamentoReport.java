/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.Reports;

import br.com.caelum.vraptor.jasperreports.Report;
import br.com.geoambientalengenharia.Model.Orcamento;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;

/**
 *
 * @author Rafael Delanhese
 */

public class OrcamentoReport implements Report {

    private final List<Orcamento> data;
    private Map<String, Object> parameters;

    public OrcamentoReport(List<Orcamento> data) {
        this.data = data;  
        this.parameters = new HashMap<String, Object>();        
    }

    @Override
    public String getTemplate() {
        return "orcamento.jasper";
    }

    @Override
    public Map<String, Object> getParameters() {
        return parameters;
    }

    @Override
    public Collection<Orcamento> getData() {
        return data;
    }

    @Override
    public String getFileName() {
        return "report" + System.currentTimeMillis();
    }

    @Override
    public Report addParameter(String parameter, Object value) {
        parameters.put(parameter, value);
        return this;
    }

    @Override
    public boolean isCacheable() {
        return true;
    }

}
