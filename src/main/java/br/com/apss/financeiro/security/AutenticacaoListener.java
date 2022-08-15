package br.com.apss.financeiro.security;

import java.io.IOException;

import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
import javax.servlet.http.HttpSession;

import org.omnifaces.util.Faces;
import org.omnifaces.util.Messages;

import br.com.apss.financeiro.model.Usuario;

public class AutenticacaoListener implements PhaseListener {

	private static final long serialVersionUID = 1L;

	@Override
	public void beforePhase(PhaseEvent event) {

	}

	@Override
	public void afterPhase(PhaseEvent event) {

		String pageAtual = Faces.getViewId();

		boolean ehPageDeAutenticacao = pageAtual.contains("login.xhtml") || pageAtual.contains("acessoNegado.xhtml");

		if (!ehPageDeAutenticacao) {

			// Usuario userLogado = Faces.getSessionAttribute("usuarioAutenticado");
			Usuario userLogado = new Usuario();
			FacesContext ctx = FacesContext.getCurrentInstance();
			HttpSession session = (HttpSession) ctx.getExternalContext().getSession(true);
			userLogado = (Usuario) session.getAttribute("usuarioLogado");

			if (null == userLogado) {
				try {
					Faces.redirect("./login.xhtml");
				} catch (IOException e) {
					e.printStackTrace();
					Messages.addGlobalError(e.getMessage());
				}
				return;
			} else {
				boolean possui = false;

				if (!possui) {
					try {
						Faces.redirect("./acessoNegado.xhtml");
					} catch (IOException e) {
						e.printStackTrace();
						Messages.addGlobalError(e.getMessage());
					}
				}
			}
		}

	}

	@Override
	public PhaseId getPhaseId() {
		return PhaseId.RESTORE_VIEW;
	}

}
