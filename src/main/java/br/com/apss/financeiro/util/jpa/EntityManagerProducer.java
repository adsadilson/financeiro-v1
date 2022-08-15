package br.com.apss.financeiro.util.jpa;

import br.com.apss.financeiro.util.jsf.NegocioException;
import org.hibernate.Session;

import javax.annotation.PostConstruct;
import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.context.RequestScoped;
import javax.enterprise.inject.Default;
import javax.enterprise.inject.Disposes;
import javax.enterprise.inject.Produces;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.servlet.http.HttpSession;

@ApplicationScoped
public class EntityManagerProducer {
	public static EntityManagerFactory factorylavReforco;
	private EntityManagerFactory factory;

	@PostConstruct
	public void postConstruct() {
		// initProperties();
	}

	@Produces
	@RequestScoped
	@Default
	public Session createEntityManager() {
		FacesContext ctx = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) ctx.getExternalContext().getSession(false);

		if (null == this.factory) {
				this.factory = EntityManagerProducer.factorylavReforco;
		}
		return (Session) this.factory.createEntityManager();
	}

	public void closeEntityManager(@Disposes EntityManager manager) {
		this.factory = null;
		manager.close();
	}
}