package br.com.apss.financeiro.service;

import br.com.apss.financeiro.model.Usuario;
import br.com.apss.financeiro.repository.UsuarioRepository;
import br.com.apss.financeiro.util.jpa.Transacional;
import org.apache.shiro.crypto.hash.SimpleHash;

import javax.inject.Inject;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class UsuarioService implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private UsuarioRepository dao;

	@Transacional
	public void salvar(Usuario obj) {
		if (null == obj.getId()) {
			obj.setCadastro(new Date());
			SimpleHash hash = new SimpleHash("md5",obj.getSenha());
			obj.setSenha(hash.toHex());
		}
		
		dao.salvar(obj);
	}

	@Transacional
	public void excluir(Usuario obj) {
		dao.excluir(obj);
	}


	public List<Usuario> listarTodos() {
		return dao.listarTodos();
	}

	public Usuario porId(Long id) {
		return dao.porId(id);
	}

	public Usuario porNome(String nome) {
		return dao.porNome(nome);
	}
	
	public List<Usuario> completarVendedor(String nome) {
		return dao.completarVendedor(nome);
	}

	public Usuario porEmail(String email) {
		return dao.porEmail(email);
	}
	
	public Usuario autenticacao(String email, String senha) {
		return dao.autenticacao(email, senha);
	}


}
