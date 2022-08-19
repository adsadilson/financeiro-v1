package br.com.apss.financeiro.service;

import br.com.apss.financeiro.model.GrupoUsuario;
import br.com.apss.financeiro.model.Permissao;
import br.com.apss.financeiro.model.PermissaoFilter;
import br.com.apss.financeiro.repository.PermissaoRepository;
import br.com.apss.financeiro.security.UsuarioLogado;
import br.com.apss.financeiro.util.jpa.Transacional;

import javax.inject.Inject;
import java.io.Serializable;
import java.util.List;

public class PermissaoService implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private PermissaoRepository dao;
	
	@Inject
	private UsuarioLogado usuarioLogado;

	@Transacional
	public void salvar(Permissao obj) {
		dao.salvar(obj);
	}

	@Transacional
	public void excluir(Permissao obj) {
		dao.excluir(obj);
	}

	public List<Permissao> filtrados(PermissaoFilter filtro) {
		return dao.filtrados(filtro);
	}

	public List<Permissao> listarTodos() {
		return dao.listarTodos();
	}

	public Permissao porId(Long id) {
		return dao.porId(id);
	}

	public Permissao porNome(String nome) {
		return dao.porNome(nome);
	}

	public List<Permissao> buscarPermissaoPorGrupo() {
		return dao.buscarPermissaoPorGrupo();
	}

	public int quantidadeFiltrados(PermissaoFilter filtro) {
		return dao.quantidadeFiltrados(filtro);
	}

	public Boolean menuPermitido(String menu) {
		if (null != usuarioLogado.getUsuario()) {
			for (GrupoUsuario g : usuarioLogado.getUsuario().getGrupos()) {
				for (Permissao p : g.getPermissoes()) {
					if (menu.equals(p.getControleMenu().getFormulario().split(".xhtml")[0])) {
						return p.getFormulario();
					}
				}
			}
		}
		return false;
	}

	public Boolean acaoPermitida(String acao, String controleMenu) {
		boolean permitido = false;

		if (null != usuarioLogado.getUsuario()) {
			switch (acao) {
			case "incluir":
				for (GrupoUsuario g : usuarioLogado.getUsuario().getGrupos()) {
					for (Permissao p : g.getPermissoes()) {
						if (p.getControleMenu().getFormulario().split(".xhtml")[0].equals(controleMenu)) {
							if (p.getIncluir()) {
								permitido = true;
							}
						}
					}
				}
				return permitido;
			case "excluir":
				for (GrupoUsuario g : usuarioLogado.getUsuario().getGrupos()) {
					for (Permissao p : g.getPermissoes()) {
						if (p.getControleMenu().getFormulario().split(".xhtml")[0].equals(controleMenu)) {
							if (p.getExcluir()) {
								permitido = true;
							}
						}
					}
				}
				return permitido;
			case "alterar":
				for (GrupoUsuario g : usuarioLogado.getUsuario().getGrupos()) {
					for (Permissao p : g.getPermissoes()) {
						if (p.getControleMenu().getFormulario().split(".xhtml")[0].equals(controleMenu)) {
							if (p.getAlterar()) {
								permitido = true;
							}
						}
					}
				}
				return permitido;
			case "imprimir":
				for (GrupoUsuario g : usuarioLogado.getUsuario().getGrupos()) {
					for (Permissao p : g.getPermissoes()) {
						if (p.getControleMenu().getFormulario().split(".xhtml")[0].equals(controleMenu)) {
							if (p.getImprimir()) {
								permitido = true;
							}
						}
					}
				}
				return permitido;
			case "visualizar":
				for (GrupoUsuario g : usuarioLogado.getUsuario().getGrupos()) {
					for (Permissao p : g.getPermissoes()) {
						if (p.getControleMenu().getFormulario().split(".xhtml")[0].equals(controleMenu)) {
							if (p.getVisualizar()) {
								permitido = true;
							}
						}
					}
				}
				return permitido;
			default:
				return false;
			}

		}
		return false;
	}
}
