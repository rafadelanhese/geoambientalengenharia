/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.geoambientalengenharia.File;

import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.geoambientalengenharia.Controller.ProjetoController;
import br.com.geoambientalengenharia.DAO.AtividadeDAO;
import br.com.geoambientalengenharia.DAO.DocumentoDAO;
import br.com.geoambientalengenharia.Model.Atividade;
import br.com.geoambientalengenharia.Model.Documento;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import org.joda.time.LocalDate;

/**
 *
 * @author Rafael Delanhese
 */
@RequestScoped
public class Arquivo {

    private AtividadeDAO atividadeDao;
    private DocumentoDAO docDao;
    private ServletContext context;
    private static String PATH_FOTO;

    /**
     * @deprecated CDI eyes only
     */
    public Arquivo() {
        this(null, null, null);
    }

    @Inject
    public Arquivo(AtividadeDAO atividadeDao, DocumentoDAO docDao, ServletContext context) {
        this.atividadeDao = atividadeDao;
        this.docDao = docDao;
        this.context = context;
    }

    @PostConstruct
    public void init() {        
        PATH_FOTO = context.getRealPath("/arquivos/documentos");
        File diretorio = new File(PATH_FOTO);
        if (!diretorio.exists()) {
            diretorio.mkdirs();
        }       
    }

    public void uploadArquivos(Long idAtividade, List<UploadedFile> files) {
        try {            
            Atividade atividade = atividadeDao.findById(idAtividade);
            for (int i = 0; i < files.size(); i++) {
                String nomeArq = idAtividade + "@" + files.get(i).getFileName();
                File arquivo = new File(PATH_FOTO, nomeArq);
                files.get(i).writeTo(arquivo);

                atividade.addDocumentos(new Documento(nomeArq, PATH_FOTO + "/" + nomeArq, LocalDate.now(), files.get(i).getSize()));
            }
            atividadeDao.saveOrUpdate(atividade);
        } catch (IOException ex) {
            Logger.getLogger(ProjetoController.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.toString());
        }
    }

    public Download download(Long idAtividade, Long idDocumento) {
        Atividade atividade = atividadeDao.findById(idAtividade);
        File file = null;
        String contentType = null;
        String filename = null;
        try {
            for (int i = 0; i < atividade.getDocumentos().size(); i++) {
                if (idDocumento.compareTo(atividade.getDocumentos().get(i).getIdDocumento()) == 0) {
                    file = new File(atividade.getDocumentos().get(i).getCaminhoArquivo());
                    contentType = getContentType(atividade.getDocumentos().get(i).getNomeArquivo());
                    filename = atividade.getDocumentos().get(i).getNomeArquivo();
                }
            }
            return new FileDownload(file, contentType, filename);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Arquivo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void excluirArquivo(Long idAtividade, Long idDocumento) {
        Atividade atividade = atividadeDao.findById(idAtividade);
        Documento documento = new Documento();
        File file = null;
        for (int i = 0; i < atividade.getDocumentos().size(); i++) {
            if (idDocumento.compareTo(atividade.getDocumentos().get(i).getIdDocumento()) == 0) {
                file = new File(atividade.getDocumentos().get(i).getCaminhoArquivo());
                file.delete();
                documento = docDao.findById(atividade.getDocumentos().get(i).getIdDocumento());
                atividade.removeDocumento(i);
            }
        }
        atividadeDao.saveOrUpdate(atividade);
        docDao.delete(documento);
    }

    private String getContentType(String nomeArquivo) {        
        String separadorTemp = nomeArquivo.replace('.', '#');
        String[] split = separadorTemp.split("#");
        String contentType = null;
        switch (split[1]) {
            case "pdf":
                contentType = "aplication/pdf";
                break;

            case "doc":
                contentType = "aplication/doc";
                break;

            case "jpg":
                contentType = "image/jpg";
                break;

            case "png":
                contentType = "image/png";
                break;

            case "xlsx":
                contentType = "aplication/xlsx";
                break;
        }

        return contentType;
    }
}
