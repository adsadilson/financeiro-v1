package br.com.apss.financeiro.bean;

import br.com.apss.financeiro.model.Usuario;
import br.com.apss.financeiro.service.UsuarioService;
import br.com.apss.financeiro.util.jsf.NegocioException;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.omnifaces.util.Messages;
import org.primefaces.context.RequestContext;

import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Named
@ViewScoped
public class UsuarioBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private Usuario usuario = new Usuario();

	private Usuario usuarioSelecionado;



	private List<Usuario> usuarios = new ArrayList<Usuario>();

	private List<Usuario> list = null;



	@Inject
	private UsuarioService usuarioService;

	private boolean aprovado = true;

	/******************** Metodos ***********************/

	public void inicializar() {
		if (this.usuario == null) {
			novo();
		}


	}

	public void salvar() {

		Usuario usuarioExistente = usuarioService.porEmail(usuario.getEmail());
		if (usuarioExistente != null && !usuarioExistente.equals(usuario)) {
			this.aprovado = false;
			throw new NegocioException("Já existe um Usuário com esse e-mail informado.");
		}

	if (aprovado) {
			RequestContext request = RequestContext.getCurrentInstance();
			request.addCallbackParam("sucesso", true);
			usuarioService.salvar(usuario);
			Messages.addGlobalInfo("Registro salvor com sucesso.");
			novo();

		}
	}

	public void trocaSenha() {
		SimpleHash hash = new SimpleHash("md5", this.usuario.getSenha());
		Usuario usuarioExistente = usuarioService.porEmail(this.usuario.getEmail());
		if (!hash.toHex().equals(usuarioExistente.getSenha())) {
			this.aprovado = false;
			throw new NegocioException("Senha atual invalida.");
		} else {
			this.aprovado = true;
		}

		if (aprovado) {
			RequestContext request = RequestContext.getCurrentInstance();
			request.addCallbackParam("sucesso", true);
			hash = new SimpleHash("md5",usuario.getNovaSenha());
			usuario.setSenha(hash.toHex());
			usuarioService.salvar(usuario);
			Messages.addGlobalInfo("Senha alterada com sucesso.");
			novo();

		}
	}

	public void editar() {
		this.usuario = usuarioService.porId(this.usuarioSelecionado.getId());
	}

	public void novo() {
		usuario = new Usuario();
	}





	public void preparEdicao() {
		this.usuario = usuarioService.porId(this.usuarioSelecionado.getId());
	}

	public void excluir() {
		usuarioService.excluir(usuarioSelecionado);
		Messages.addGlobalInfo("Registro excluido com sucesso.");

	}



	/******************** Getters e Setters ***************************/

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public List<Usuario> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

	public Usuario getUsuarioSelecionado() {
		return usuarioSelecionado;
	}

	public void setUsuarioSelecionado(Usuario usuarioSelecionado) {
		this.usuarioSelecionado = usuarioSelecionado;
	}


	public List<Usuario> getList() {
		return list;
	}

	public void setList(List<Usuario> list) {
		this.list = list;
	}

}
