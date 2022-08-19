package br.com.apss.financeiro.service;

import br.com.apss.financeiro.model.GrupoUsuario;
import br.com.apss.financeiro.model.GrupoUsuarioFilter;
import br.com.apss.financeiro.repository.GrupoUsuarioRepository;
import br.com.apss.financeiro.util.jpa.Transacional;

import javax.inject.Inject;
import java.io.Serializable;
import java.util.List;

public class GrupoUsuarioService implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private GrupoUsuarioRepository dao;

	@Transacional
	public void salvar(GrupoUsuario obj) {
		dao.salvar(obj);
	}

	@Transacional
	public void excluir(GrupoUsuario obj) {
		dao.excluir(obj);
	}

	public List<GrupoUsuario> filtrados(GrupoUsuarioFilter filtro) {
		return dao.filtrados(filtro);
	}

	public List<GrupoUsuario> listarTodos() {
		return dao.listarTodos();
	}

	public GrupoUsuario porId(Long id) {
		return dao.porId(id);
	}

	public GrupoUsuario porNome(String nome) {
		return dao.porNome(nome);
	}

	public int quantidadeFiltrados(GrupoUsuarioFilter filtro) {
		return dao.quantidadeFiltrados(filtro);
	}
}
