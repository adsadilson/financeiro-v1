package br.com.apss.financeiro.repository;

import br.com.apss.financeiro.model.ControleMenu;
import br.com.apss.financeiro.model.ControleMenuFilter;
import br.com.apss.financeiro.util.jsf.NegocioException;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import java.io.Serializable;
import java.util.List;

public class ControleMenuRepository implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private EntityManager manager;

	public ControleMenu salvar(ControleMenu obj) {
		return manager.merge(obj);
	}

	public void excluir(ControleMenu obj) {
		try {
			obj = porId(obj.getId());
			manager.remove(obj);
			manager.flush();

		} catch (Exception e) {
			throw new NegocioException("Controle de Menu n�o pode ser excluído.");
		}
	}

	public ControleMenu porId(Long id) {
		return manager.find(ControleMenu.class, id);
	}

	public List<ControleMenu> listarTodos() {
		return manager.createQuery("from ControleMenu order by funcao", ControleMenu.class).getResultList();
	}

	public ControleMenu porNome(String funcao) {
		try {
			return manager.createQuery("from ControleMenu where upper(funcao) = :funcao", ControleMenu.class)
					.setParameter("funcao", funcao.toUpperCase()).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings({ "deprecation" })
	private Criteria criarCriteriaParaFiltro(ControleMenuFilter filtro) {

		Session session = manager.unwrap(Session.class);
		Criteria criteria = session.createCriteria(ControleMenu.class);

		if (StringUtils.isNotBlank(filtro.getNome())) {
			criteria.add(Restrictions.ilike("funcao", filtro.getNome(), MatchMode.ANYWHERE));
		}

		if (filtro.getStatus() != null) {
			criteria.add(Restrictions.eq("status", filtro.getStatus()));
		}

		return criteria;
	}

	@SuppressWarnings("unchecked")
	public List<ControleMenu> filtrados(ControleMenuFilter filtro) {
		Criteria criteria = criarCriteriaParaFiltro(filtro);

		if (filtro.getCampoOrdenacao() != null) {
			if (filtro.isAscendente()) {
				criteria.addOrder(Order.asc(filtro.getCampoOrdenacao()));
			} else {
				criteria.addOrder(Order.desc(filtro.getCampoOrdenacao()));
			}
		}

		return criteria.addOrder(Order.asc("funcao")).list();
	}

	public int quantidadeFiltrados(ControleMenuFilter filtro) {
		Criteria criteria = criarCriteriaParaFiltro(filtro);
		criteria.setProjection(Projections.rowCount());
		return ((Number) criteria.uniqueResult()).intValue();
	}

}
