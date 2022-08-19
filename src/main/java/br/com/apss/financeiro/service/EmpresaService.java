package br.com.apss.financeiro.service;

import br.com.apss.financeiro.model.Empresa;
import br.com.apss.financeiro.repository.EmpresaRepository;
import br.com.apss.financeiro.util.jpa.Transacional;

import javax.inject.Inject;
import java.io.Serializable;
import java.util.List;

public class EmpresaService implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private EmpresaRepository empresaRepository;


	@Transacional
	public void salvar(Empresa tarefa) {
		empresaRepository.salvar(tarefa);
	}

	@Transacional
	public void excluir(Empresa tarefa) {
		empresaRepository.excluir(tarefa);
	}

	public List<Empresa> listarTodos() {
		return empresaRepository.listarTodos();
	}

	public Empresa porId(Long id) {
		return empresaRepository.porId(id);
	}

	public Empresa porNome(String nome) {
		return empresaRepository.porNome(nome);
	}

}
