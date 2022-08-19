package br.com.apss.financeiro.singleton;

import br.com.apss.financeiro.model.Empresa;
import br.com.apss.financeiro.service.EmpresaService;

import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Singleton;
import javax.servlet.http.HttpSession;

@Singleton
public class EmpresaSingleton {

	@Inject
	private EmpresaService empresaService;

	public EmpresaSingleton() {
		//empresaService = CDIServiceLocator.getBean(EmpresaService.class);
	}

	public Empresa carregarEmpresas() {
		FacesContext ctx = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) ctx.getExternalContext().getSession(false);

		Empresa empresa = (Empresa) session.getAttribute("empresa");
		
		if(null == empresa) {
			empresa = empresaService.porId(1L);
			session.setAttribute("empresa", empresa);			
		}		
		
		return empresa;
	}
}
