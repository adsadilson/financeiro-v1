package br.com.apss.financeiro.security;

import br.com.apss.financeiro.model.Usuario;
import br.com.apss.financeiro.service.UsuarioService;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.hibernate.jdbc.BatchedTooManyRowsAffectedException;
import org.omnifaces.util.Faces;
import org.omnifaces.util.Messages;

import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.util.Enumeration;

@Named
@ViewScoped
public class LoginBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private Usuario usuario = new Usuario();

	@Inject
	private UsuarioLogado usuarioLogado;

	private String codigoEmpresa;

	@Inject
	private UsuarioService usuarioService;

	/******************** Metodos ***********************/

	public void autenticar() throws IOException {

		SimpleHash hash = new SimpleHash("md5", this.usuario.getSenha());
		usuarioLogado.setUsuario(usuarioService.autenticacao(this.usuario.getNome(), hash.toHex()));

		if (null != usuarioLogado.getUsuario()) {
			System.out.println("Usuario encontado....");
			try {

				FacesContext ctx = FacesContext.getCurrentInstance();
				HttpSession session = (HttpSession) ctx.getExternalContext().getSession(true);
				session.setAttribute("usuarioLogado", usuarioLogado.getUsuario());

				Faces.redirect("./");

			} catch (Exception e) {
				for (Throwable t = e.getCause(); t != null; t = t.getCause()) {
					if (t instanceof BatchedTooManyRowsAffectedException) {
						BatchedTooManyRowsAffectedException s = (BatchedTooManyRowsAffectedException) t;
						Messages.addGlobalInfo(
								"Registro duplicado: tbl log_acesso para o usuário " + usuario.getNome());
					}
				}
				e.printStackTrace();
				Messages.addGlobalError(e.getMessage());
			}
		} else {
			Messages.addGlobalInfo("Login ou Senha inválida.");
		}

	}

	public String logout() {
		HttpSession session;
		FacesContext ctx = FacesContext.getCurrentInstance();
		session = (HttpSession) ctx.getExternalContext().getSession(false);
		session.setAttribute("usuarioLogado", null);
		Enumeration<String> vals = session.getAttributeNames();
		while (vals.hasMoreElements()) {
			session.removeAttribute(vals.nextElement());
		}
		return "/login?faces-redirect=true";

	}

	/******************** Getters e Setters ***************************/

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Usuario getUsuarioLogado() {
		return usuarioLogado.getUsuario();
	}

	public String getCodigoEmpresa() {
		return codigoEmpresa;
	}

	public void setCodigoEmpresa(String codigoEmpresa) {
		this.codigoEmpresa = codigoEmpresa == null ? null : codigoEmpresa.toUpperCase();
	}

}
