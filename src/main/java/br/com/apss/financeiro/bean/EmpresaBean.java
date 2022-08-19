package br.com.apss.financeiro.bean;

import br.com.apss.financeiro.enums.Sexo;
import br.com.apss.financeiro.model.Empresa;
import br.com.apss.financeiro.service.EmpresaService;
import br.com.apss.financeiro.singleton.EmpresaSingleton;
import br.com.apss.financeiro.util.jsf.NegocioException;
import br.com.apss.financeiro.util.jsf.SistemaUtil;
import org.omnifaces.util.Messages;
import org.omnifaces.util.Utils;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.StreamedContent;
import org.primefaces.model.UploadedFile;

import javax.faces.view.ViewScoped;
import javax.inject.Named;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.List;

@Named
@ViewScoped
public class EmpresaBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private Empresa empresa;

	private StreamedContent foto;


	private String caminhoTemp;

	private boolean habilitarCampo = false;
	private EmpresaService empresaService;


	/********************* Metodos ********************************/

	public EmpresaBean() {
		//this.empresa = EmpresaSingleton.getInstance().getEmpresa();
		this.empresa = new EmpresaSingleton().carregarEmpresas();
		//this.parametro = ParametroSingleton.getInstance().getParametro();
	}

	public void inicializar() {
		this.empresa = empresaService.porId(1L);

		if (this.empresa == null) {
			this.empresa = new Empresa();
		}

		this.habilitarCampo = false;
		// carregarMMNome();


	}

	public void fileUploadListener(FileUploadEvent e) {
		try {
			// Pegar o arquivo temporario da memoria
			UploadedFile arquivoUpload = e.getFile();
			// Criar uma arquivo temporario no sistema operacional
			Path arquivoTemp = Files.createTempFile(null, null);
			// Copia o arquivo da memoria para o arquivo temporario
			Files.copy(arquivoUpload.getInputstream(), arquivoTemp, StandardCopyOption.REPLACE_EXISTING);
			this.setCaminhoTemp(arquivoTemp.toString());

		} catch (Exception e1) {
			e1.printStackTrace();
			throw new NegocioException("Ocorreu um erro ao tentar realizar  o upload do logotipo.");
		}
	}

	public void copiarImagem(String origem, String destino) {
		try {
			Path caminhoOrigem = Paths.get(origem);
			Path caminhoDestino = Paths.get(destino);
			Files.copy(caminhoOrigem, caminhoDestino, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void copyImagem(String origem, String destino) {
		FileInputStream in;
		try {
			in = new FileInputStream(origem);
			FileOutputStream ou = new FileOutputStream(destino);
			BufferedInputStream bin = new BufferedInputStream(in);
			BufferedOutputStream bou = new BufferedOutputStream(ou);
			int b = 0;
			while (b != -1) {
				b = bin.read();
				bou.write(b);
			}
			bin.close();
			bou.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void editar() {
		this.empresa = empresaService.porId(this.empresa.getId());
	}

	public void novo() {
		this.empresa = new Empresa();
	}

	public void preparEdicao() {
		this.empresa = empresaService.porId(this.empresa.getId());
	}

	public void salvar() {
		if (!Utils.isBlank(caminhoTemp)) {
			this.empresa.setFoto(
					SistemaUtil.pathImagem() + "logo" + this.empresa.getCpfCnpj().replaceAll("[^0-9]", "") + ".png");
			// copiarImagem(caminhoTemp, this.empresa.getFoto());
			copyImagem(caminhoTemp, this.empresa.getFoto());
		}

	this.habilitarCampo = false;
		Messages.addGlobalInfo("Empresa salvo com sucesso.");
		inicializar();
	}

	public List<Sexo> getlistaSexos() {
		return Arrays.asList(Sexo.values());
	}


	/********************** Getters e Setters *********************/

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

	public StreamedContent getFoto() {
		return foto;
	}

	public void setFoto(StreamedContent foto) {
		this.foto = foto;
	}


	public String getCaminhoTemp() {
		return caminhoTemp;
	}

	public void setCaminhoTemp(String caminhoTemp) {
		this.caminhoTemp = caminhoTemp;
	}


	public boolean isHabilitarCampo() {
		return habilitarCampo;
	}

	public void setHabilitarCampo(boolean habilitarCampo) {
		this.habilitarCampo = habilitarCampo;
	}


}
