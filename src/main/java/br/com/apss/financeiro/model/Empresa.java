package br.com.apss.financeiro.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "empresa")
@SequenceGenerator(name = "EMPRESA_ID", sequenceName = "EMPRESA_SEQ", allocationSize = 1)
public class Empresa implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "EMPRESA_ID")
	private Long id;

	@Column(columnDefinition = "text")
	private String nome;

	@Column(columnDefinition = "text")
	private String apelido;

	@Column(name = "cpf_cnpj", columnDefinition = "text")
	private String cpfCnpj;

	@Column(name = "rg_insc", columnDefinition = "text")
	private String rgInsc;

	@Column(name = "insc_municipal", columnDefinition = "text")
	private String inscMunicipal;

	@Column(name = "cnae", columnDefinition = "text")
	private String cnae;

	@Column(name = "contato1", columnDefinition = "text")
	private String contato1;

	@Column(name = "contato2", columnDefinition = "text")
	private String contato2;

	@Column(name = "email", columnDefinition = "text")
	private String email;

	@Column(name = "site", columnDefinition = "text")
	private String site;

	@Temporal(TemporalType.DATE)
	@Column(name = "nascimento", columnDefinition = "text")
	private Date nascimento;

	@Column(name = "celular", columnDefinition = "text")
	private String celular;

	@Column(name = "telefone", columnDefinition = "text")
	private String telefone;

	@Column(name = "telefone_2", columnDefinition = "text")
	private String telefone2;

	@Column(name = "endereco", columnDefinition = "text")
	private String endereco;

	@Column(name = "cep", length = 12)
	private String cep;

	@Column(name = "num", columnDefinition = "text")
	private String num;

	@Column(name = "complemento", columnDefinition = "text")
	private String complemento;

	@Column(name = "bairro", columnDefinition = "text")
	private String bairro;

	@Column(name = "cidade", columnDefinition = "text")
	private String cidade;

	@Column(name = "status", length = 1)
	private Boolean status = true;

	@Column(name = "obs", columnDefinition = "text")
	private String obs;

	@Column(name = "foto", columnDefinition = "text")
	private String foto;

	@Column(name = "atividade", columnDefinition = "text")
	private String atividade;

	@Temporal(TemporalType.DATE)
	@Column(name = "data_cadastro", columnDefinition = "text")
	private Date dataCadastro;

	@Transient
	private String caminhoLogo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome == null ? null : nome.toUpperCase();
	}

	public String getApelido() {
		return apelido;
	}

	public void setApelido(String apelido) {
		this.apelido = apelido;
	}

	public String getCpfCnpj() {
		return cpfCnpj;
	}

	public void setCpfCnpj(String cpfCnpj) {
		this.cpfCnpj = cpfCnpj;
	}

	public String getRgInsc() {
		return rgInsc;
	}

	public void setRgInsc(String rgInsc) {
		this.rgInsc = rgInsc;
	}

	public String getInscMunicipal() {
		return inscMunicipal;
	}

	public void setInscMunicipal(String inscMunicipal) {
		this.inscMunicipal = inscMunicipal;
	}

	public String getCnae() {
		return cnae;
	}

	public void setCnae(String cnae) {
		this.cnae = cnae;
	}

	public String getContato1() {
		return contato1;
	}

	public void setContato1(String contato1) {
		this.contato1 = contato1;
	}

	public String getContato2() {
		return contato2;
	}

	public void setContato2(String contato2) {
		this.contato2 = contato2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public Date getNascimento() {
		return nascimento;
	}

	public void setNascimento(Date nascimento) {
		this.nascimento = nascimento;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getTelefone2() {
		return telefone2;
	}

	public void setTelefone2(String telefone2) {
		this.telefone2 = telefone2;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco == null ? null : endereco.toUpperCase();
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento == null ? null : complemento.toUpperCase();
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro == null ? null : bairro.toUpperCase();
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade == null ? null : cidade.toUpperCase();
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getAtividade() {
		return atividade;
	}

	public void setAtividade(String atividade) {
		this.atividade = atividade;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public String getCaminhoLogo() {
		return caminhoLogo;
	}

	public void setCaminhoLogo(String caminhoLogo) {
		this.caminhoLogo = caminhoLogo;
	}

	public boolean isInclusao() {
		return getId() == null ? true : false;
	}

	public boolean isEditando() {
		return !isInclusao();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Empresa other = (Empresa) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("%s[id=%d]", getClass().getSimpleName(), getId());
	}

}
