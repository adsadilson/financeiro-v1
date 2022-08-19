package br.com.apss.financeiro.service;

import br.com.apss.financeiro.model.ControleMenu;
import br.com.apss.financeiro.model.ControleMenuFilter;
import br.com.apss.financeiro.repository.ControleMenuRepository;
import br.com.apss.financeiro.util.jpa.Transacional;

import javax.inject.Inject;
import java.io.Serializable;
import java.util.List;

public class ControleMenuService implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private ControleMenuRepository dao;

	@Transacional
	public void salvar(ControleMenu obj) {
		dao.salvar(obj);
	}

	@Transacional
	public void excluir(ControleMenu obj) {
		dao.excluir(obj);
	}

	public List<ControleMenu> filtrados(ControleMenuFilter filtro) {
		return dao.filtrados(filtro);
	}

	public List<ControleMenu> listarTodos() {
		return dao.listarTodos();
	}

	public ControleMenu porId(Long id) {
		return dao.porId(id);
	}

	public ControleMenu porNome(String nome) {
		return dao.porNome(nome);
	}

	public int quantidadeFiltrados(ControleMenuFilter filtro) {
		return dao.quantidadeFiltrados(filtro);
	}
}
