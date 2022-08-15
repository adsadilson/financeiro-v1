package br.com.apss.financeiro.enums;

public enum Status {

	ATIVO("ATIVO"),
	INATIVO("INATIVO");
	
	private String descricao;

	Status(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
}