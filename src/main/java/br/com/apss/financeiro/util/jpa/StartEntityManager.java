package br.com.apss.financeiro.util.jpa;

import javax.enterprise.context.RequestScoped;
import javax.persistence.Persistence;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


@RequestScoped
public class StartEntityManager implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("########################################################");
		System.out.println("##########                                    ##########");
		System.out.println("##########       Iniciando a criacao do       ##########");
		System.out.println("##########        EntityManagerFactory        ##########");
		System.out.println("##########                                    ##########");

		EntityManagerProducer.factorylavReforco = Persistence.createEntityManagerFactory("lav-reforco-local");

		System.out.println("##########                                     ##########");
		System.out.println("##########  Criacao realizado com sucesso...   ##########");
		System.out.println("##########                                     ##########");
		System.out.println("#########################################################");

	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
	}
}
