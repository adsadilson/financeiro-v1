package br.com.apss.financeiro.repository;

import br.com.apss.financeiro.model.Usuario;
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

public class UsuarioRepository implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private EntityManager manager;

	public Usuario salvar(Usuario obj) {
		return manager.merge(obj);
	}

	public void excluir(Usuario obj) {
		try {
			obj = porId(obj.getId());
			manager.remove(obj);
			manager.flush();

		} catch (Exception e) {
			throw new NegocioException("Usuario não pode ser excluído");
		}
	}

	public Usuario porId(Long id) {
		return manager.find(Usuario.class, id);
	}

	public List<Usuario> listarTodos() {
		return manager.createQuery("from Usuario order by nome", Usuario.class).getResultList();
	}

	public Usuario porNome(String nome) {
		try {
			return manager.createQuery("from Usuario where upper(nome) = :nome", Usuario.class)
					.setParameter("nome", nome.toUpperCase()).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public List<Usuario> completarVendedor(String nome) {
		return this.manager.createQuery("from Usuario " + "where upper(nome) like :nome", Usuario.class)
				.setParameter("nome", nome.toUpperCase() + "%").getResultList();
	}

	public Usuario porEmail(String email) {
		try {
			return manager.createQuery("from Usuario where email = :email", Usuario.class)
					.setParameter("email", email.toLowerCase()).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public Usuario autenticacao(String nome, String senha) {
		try {
			return manager.createQuery("from Usuario u where nome = :nome and senha = :senha", Usuario.class)
					.setParameter("nome", nome.toUpperCase())
					.setParameter("senha", senha)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@SuppressWarnings({ "deprecation" })
	private Criteria criarCriteriaParaFiltro(Usuario filtro) {

		Session session = manager.unwrap(Session.class);
		Criteria criteria = session.createCriteria(Usuario.class);
		
		criteria.createAlias("grupos", "grupo", Criteria.INNER_JOIN);
		



			if (StringUtils.isNotBlank(filtro.getNome())) {
				criteria.add(Restrictions.ilike("nome", filtro.getNome(), MatchMode.ANYWHERE));
			}

			if (StringUtils.isNotBlank(filtro.getEmail())) {
				criteria.add(Restrictions.ilike("email", filtro.getEmail(), MatchMode.ANYWHERE));
			}

			if (filtro.getStatus() != null) {
				if (filtro.getStatus()) {
					criteria.add(Restrictions.eq("status", true));
				} else {
					criteria.add(Restrictions.eq("status", false));
				}

			}


		return criteria;
	}

	@SuppressWarnings("unchecked")
	public List<Usuario> filtrados(Usuario filtro) {
		Criteria criteria = criarCriteriaParaFiltro(filtro);

		return criteria.addOrder(Order.asc("nome")).list();
	}

	public int quantidadeFiltrados(Usuario filtro) {
		Criteria criteria = criarCriteriaParaFiltro(filtro);
		criteria.setProjection(Projections.rowCount());
		return ((Number) criteria.uniqueResult()).intValue();
	}

}
