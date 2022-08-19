package br.com.apss.financeiro.repository;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import br.com.apss.financeiro.model.Empresa;
import br.com.apss.financeiro.util.jsf.NegocioException;

public class EmpresaRepository implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private EntityManager manager;

	public Empresa salvar(Empresa obj) {
		return manager.merge(obj);
	}

	public void excluir(Empresa obj) {
		try {
			obj = porId(obj.getId());
			manager.remove(obj);
			manager.flush();

		} catch (Exception e) {
			throw new NegocioException("Empresa não pode ser excluída");
		}
	}

	public Empresa porId(Long id) {
		return manager.find(Empresa.class, id);
	}

	public List<Empresa> listarTodos() {
		return manager.createQuery("from Empresa order by nome", Empresa.class).getResultList();
	}

	public Empresa porNome(String nome) {
		try {
			return manager.createQuery("from Empresa where upper(nome) = :nome", Empresa.class)
					.setParameter("nome", nome.toUpperCase()).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
