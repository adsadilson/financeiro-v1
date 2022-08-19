CREATE TABLE public.usuario (
	id int8 NOT NULL,
	cadastro timestamp NULL,
	email varchar(80) NOT NULL,
	nome varchar(80) NOT NULL,
	senha varchar(32) NOT NULL,
	status bool NULL,
	CONSTRAINT uk_5171l57faosmj8myawaucatdw UNIQUE (email),
	CONSTRAINT usuario_pkey PRIMARY KEY (id)
);

CREATE TABLE public.grupo_usuario (
	id int8 NOT NULL,
	descricao varchar(80) NULL,
	nome varchar(80) NOT NULL,
	status bool NULL,
	CONSTRAINT grupo_usuario_pkey PRIMARY KEY (id)
);

CREATE TABLE public.usuario_grupo (
	usuario_id int8 NOT NULL,
	grupo_id int8 NOT NULL,
	CONSTRAINT fkbj4ww434edski6oip0u50q5lr FOREIGN KEY (grupo_id) REFERENCES public.grupo_usuario(id),
	CONSTRAINT fkdofo9es0esuiahyw2q467crxw FOREIGN KEY (usuario_id) REFERENCES public.usuario(id)
);


CREATE TABLE public.controle_menu (
	id int8 NOT NULL,
	formulario varchar(150) NULL,
	funcao varchar(150) NULL,
	url varchar(250) NULL,
	CONSTRAINT controle_menu_pkey PRIMARY KEY (id)
);

CREATE TABLE public.permissao (
	id int8 NOT NULL,
	alterar bool NOT NULL,
	excluir bool NOT NULL,
	formulario bool NOT NULL,
	imprimir bool NOT NULL,
	incluir bool NOT NULL,
	visualizar bool NOT NULL,
	controle_menu_id int8 NOT NULL,
	grupo_usuario_id int8 NOT NULL,
	CONSTRAINT permissao_pkey PRIMARY KEY (id),
	CONSTRAINT fk6b9uxxt1l5qe9t3jikn4d10b3 FOREIGN KEY (controle_menu_id) REFERENCES public.controle_menu(id),
	CONSTRAINT fktrdbp4u5c46qcj6veg6k3a5k7 FOREIGN KEY (grupo_usuario_id) REFERENCES public.grupo_usuario(id)
);





INSERT INTO public.usuario
(id, cadastro, email, nome, senha, status)
VALUES(1, '2017-12-23 20:32:29.323', 'adilson.curso@yahoo.com.br', 'PARAGUAI', 'c4ca4238a0b923820dcc509a6f75849b', true);


INSERT INTO public.grupo_usuario
(id, descricao, nome, status)
VALUES(1, NULL, 'SUPORTE', true);
INSERT INTO public.grupo_usuario
(id, descricao, nome, status)
VALUES(3, NULL, 'OPERADOR DE CAIXA', true);
INSERT INTO public.grupo_usuario
(id, descricao, nome, status)
VALUES(4, NULL, 'CONFERENTE DE CAIXA', true);
INSERT INTO public.grupo_usuario
(id, descricao, nome, status)
VALUES(6, NULL, 'GERENTE', true);
INSERT INTO public.grupo_usuario
(id, descricao, nome, status)
VALUES(7, NULL, 'SUPERVISOR DE VENDA', true);
INSERT INTO public.grupo_usuario
(id, descricao, nome, status)
VALUES(2, NULL, 'ADMINISTRADOR', true);
INSERT INTO public.grupo_usuario
(id, descricao, nome, status)
VALUES(5, NULL, 'COBRANCA', true);
INSERT INTO public.grupo_usuario
(id, descricao, nome, status)
VALUES(8, NULL, 'ESTOQUISTA', true);


INSERT INTO public.usuario_grupo
(usuario_id, grupo_id)
VALUES(1, 2);


INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(47, 'menu_relatorio', 'MENU RELATORIO', 'menu_relatorio');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(46, 'menu_estoque', 'MENU ESTOQUE', 'menu_estoque');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(45, 'menu_financeiro', 'MENU FINANCEIRO', 'menu_financeiro');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(44, 'menu_comercial', 'MENU COMERCIAL', 'menu_comercial');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(43, 'menu_cadastro', 'MENU CADASTRO', 'menu_cadastro');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(42, 'dialogVenda.xhtml', 'DIALOG DE VENDA', '/pages/dialogs/dialogVenda.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(40, 'resultado.xhtml', 'LANCAMENTO DE RESULTADO', '/pages/financeiro/resultado/resultado.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(39, 'pdvOutro.xhtml', 'OUTROS LANCAMENTOS PDV', '/pages/pdv/pdvOutro.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(38, 'acessoPDV.xhtml', 'ACESSO AO CAIXA', '/pages/comercial/caixa/acessoPDV.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(37, 'cheque.xhtml', 'CHEQUE', '/pages/comercial/cheque/cheque.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(36, 'cartao.xhtml', 'CARTAO DE CREDITO', '/pages/comercial/cartao/cartao.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(35, 'conferenciaCaixa2Etapa.xhtml', 'CONFERENCIA DE CAXA 2 ETAPA', '/pages/comercial/caixa/conferenciaCaixa2Etapa.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(34, 'pdvDespesa', 'LANCAMENTO DE DESPESAS NO PDV', '/pages/pdv/pdvDespesa.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(32, 'pdvRecebimento.xhtml', 'RECEBIMENTO NO PDV', '/pages/pdv/pdvRecebimento.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(31, 'tabelaPreco.xhtml', 'CADASTRO TABELA DE PRECO', '/pages/cadastro/tabelaPreco/tabelaPreco.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(30, 'formaPagto.xhtml', 'CADASTRO FORMA DE PAGTO', '/pages/cadastro/formaPagto/formaPagto.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(29, 'grupoPessoa.xhtml', 'CADASTRO GRUPO DE PESSOA', '/pages/cadastro/grupoPessoa/grupoPessoa.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(28, 'pdvVenda.xhtml', 'TELA DE VENDA', '/pages/pdv/pdvVenda.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(27, 'dialogSelecaoCliente.xhtml', 'SELECAO DE CLIENTE', '/pages/relatorios/dialogSelecaoCliente.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(26, 'dialogSelecaoFornecedor.xhtml', 'SELECAO DE FORNECEDOR', '/pages/relatorios/dialogSelecaoFornecedor.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(25, 'relatorioDespesas.xhtml', 'RELATORIO DE DESPESAS', '/pages/relatorios/relatorioDespesas.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(24, 'relatContasApagar.xhtml', 'RELATORIO CONTAS A PAGAR', '/pages/relatorios/relatContasApagar.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(23, 'empresa.xhtml', 'CADASTRA EMPRESA', '/pages/cadastro/empresa/empresa.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(8, 'erro.xhtml', 'ERRO', '/erro.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(33, 'pdvFechamentoLava.xhtml', 'FECHAMENTO DE CAIXA - LAVANDERIA', '/pages/pdv/lavanderia/pdvFechamentoLava.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(41, 'pdvVendaLava.xhtml', 'TELA DE VENDA - LAVANDERIA', '/pages/pdv/lavanderia/pdvVendaLava.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(22, 'admCartao.xhtml', 'ADMINISTRADORA DE CARTOES', '/pages/cadastro/admCartao/admCartao.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(21, 'conferenciaCaixa.xhtml', 'CONFERENCIA DE CAIXA', '/pages/comercial/caixa/conferenciaCaixa.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(20, 'homePDV.xhtml', 'PDV', '/homePDV.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(19, 'deposito.xhtml', 'CADASTRO DE DEPOSITO DE PRODUTO', '/pages/cadastro/deposito/deposito.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(18, 'compra.xhtml', 'ENTRA DE MERCADORIA', '/pages/estoque/compra/compra.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(17, 'contaAReceber.xhtml', 'CADASTRO DE CONTA A RECEBER', '/pages/financeiro/contaAReceber/contaAReceber.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(16, 'movimentacao.xhtml', 'MOVIMENTACAO DE CONTAS', '/pages/financeiro/movimentacao/movimentacao.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(15, 'contaAPagar.xhtml', 'CONTAS A PAGAR', '/pages/financeiro/contaAPagar/contaAPagar.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(14, 'funcionario.xhtml', 'CADASTRO DE FUNCIONARIO', '/pages/cadastro/funcionario/funcionario.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(13, 'planoConta.xhtml', 'CADASTRO PLANO DE CONTA', '/pages/cadastro/planoConta/planoConta.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(12, 'produto.xhtml', 'CADASTRO DE PRODUTO', '/pages/cadastro/produto/produto.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(11, 'subCategoria.xhtml', 'CADASTRO DE SUBCATEGORIA PRODUTO', '/pages/cadastro/subCategoria/subCategoria.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(10, 'categoria.xhtml', 'CADASTRO DE CATEGORIA PRODUTO', '/pages/cadastro/categoria/categoria.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(9, 'unidadeMedida.xhtml', 'CADASTRO DE UNIDADE DE MEDIDA', '/pages/cadastro/unidadeMedida/unidadeMedida.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(7, 'fornecedor.xhtml', 'CADASTRO DE FORNECEDOR', '/pages/cadastro/fornecedor/fornecedor.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(6, 'cliente.xhtml', 'CADASTRO DE CLIENTE', '/pages/cadastro/cliente/cliente.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(5, 'controleMenu.xhtml', 'CADASTRO DE MENU', '/pages/cadastro/controleMenu/controleMenu.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(4, 'trocaSenha.xhtml', 'TELE TROCA DE SENHA', '/pages/cadastro/trocaSenha/trocaSenha.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(3, 'usuario.xhtml', 'CADASTRO DE USUARIO', '/pages/cadastro/usuario/usuario.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(2, 'grupoUsuario.xhtml', 'GRUPO DE USUARIO', '/pages/cadastro/grupoUsuario/grupoUsuario.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(1, 'home.xhtml', 'HOME', '/home.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(48, 'pdvVendaLoja.xhtml', 'TELA DE VENDA - LOJA', '/pages/pdv/loja/pdvVendaLoja.xhtm');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(49, 'acertoEstoque.xhtml', 'ACERTO DE ESTOQUE', '/pages/estoque/acertoEstoque/acertoEstoque.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(50, 'consultarVenda.xhtml', 'CONSULTA DE VENDA', '/pages/comercial/venda/consultarVenda.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(51, 'veiculo.xhtml', 'CADASTRO DE VEICULO', '/pages/cadastro/veiculo/veiculo.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(52, 'viagem.xhtml', 'LANÇAMENTO DE VIAGEM', '/pages/veiculo/viagem/viagem.xhtml');
INSERT INTO public.controle_menu
(id, formulario, funcao, url)
VALUES(53, 'menu_veiculo', 'MENU VEICULO', 'menu_veiculo');


INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(220, false, false, true, false, false, false, 8, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(223, false, false, true, false, false, false, 1, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(230, false, false, true, false, false, false, 27, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(231, false, false, true, false, false, false, 26, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(271, false, false, true, false, false, false, 37, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(276, false, false, false, false, false, false, 38, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(278, false, false, false, false, false, false, 39, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(282, false, false, false, false, false, false, 41, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(200, true, true, true, true, true, true, 22, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(201, true, false, true, false, true, true, 23, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(202, true, true, true, true, true, true, 10, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(203, true, true, true, true, true, true, 6, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(204, true, true, true, true, true, true, 17, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(205, true, true, true, true, true, true, 19, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(207, true, true, true, true, true, true, 14, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(209, true, true, true, true, true, true, 12, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(210, true, true, true, true, true, true, 11, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(211, true, true, true, true, true, true, 9, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(212, true, true, true, true, true, true, 3, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(213, true, true, true, true, true, true, 30, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(214, true, true, true, true, true, true, 29, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(215, true, true, true, true, true, true, 13, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(216, true, true, true, true, true, true, 31, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(218, true, true, true, true, true, true, 15, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(219, true, true, true, true, true, true, 18, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(221, true, true, true, true, true, true, 33, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(206, true, true, true, true, true, true, 7, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(270, true, true, true, true, true, true, 36, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(277, true, true, true, true, true, true, 40, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(281, true, true, true, true, true, true, 42, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(222, true, true, true, true, true, true, 2, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(224, false, false, false, false, false, false, 34, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(225, true, true, true, true, true, true, 16, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(226, false, false, false, false, false, false, 20, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(227, false, false, false, false, false, false, 32, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(228, true, true, true, true, true, true, 24, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(229, true, true, true, true, true, true, 25, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(232, false, false, false, false, false, false, 28, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(233, true, true, true, true, true, true, 4, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(217, true, true, true, true, true, true, 21, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(268, true, true, true, true, true, true, 35, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(409, false, false, true, false, false, false, 43, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(410, false, false, true, false, false, false, 44, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(411, false, false, true, false, false, false, 46, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(412, false, false, true, false, false, false, 45, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(413, false, false, true, false, false, false, 47, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(208, false, false, true, false, false, false, 5, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(421, false, false, false, false, false, false, 49, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(422, false, false, true, false, false, true, 50, 2);
INSERT INTO public.permissao
(id, alterar, excluir, formulario, imprimir, incluir, visualizar, controle_menu_id, grupo_usuario_id)
VALUES(423, false, false, false, false, false, false, 48, 2);


-- public.empresa definition

-- Drop table

-- DROP TABLE public.empresa;

CREATE TABLE public.empresa (
	id int8 NOT NULL,
	apelido text NULL,
	atividade text NULL,
	bairro text NULL,
	celular text NULL,
	cep varchar(12) NULL,
	cidade text NULL,
	cnae text NULL,
	complemento text NULL,
	contato1 text NULL,
	contato2 text NULL,
	cpf_cnpj text NULL,
	data_cadastro text NULL,
	email text NULL,
	endereco text NULL,
	estado text NULL,
	estado_civil varchar(255) NULL,
	foto text NULL,
	insc_municipal text NULL,
	nascimento text NULL,
	nome text NULL,
	num text NULL,
	obs text NULL,
	rg_insc text NULL,
	site text NULL,
	status bool NULL,
	telefone text NULL,
	telefone_2 text NULL,
	tipo_pessoa varchar(1) NULL,
	CONSTRAINT empresa_pkey PRIMARY KEY (id)
);

INSERT INTO public.empresa
(id, apelido, atividade, bairro, celular, cep, cidade, cnae, complemento, contato1, contato2, cpf_cnpj, data_cadastro, email, endereco, estado, estado_civil, foto, insc_municipal, nascimento, nome, num, obs, rg_insc, site, status, telefone, telefone_2, tipo_pessoa)
VALUES(1, NULL, NULL, 'KM 768', '77 99857-9024', '45260-000', 'POÇÕES', NULL, '', NULL, NULL, '10.***.***/0001-**', NULL, 'teste@yahoo.con', 'ROD BR 116', 'BA', NULL, '/usr/local/tomcat/webapps/financeiro/WEB-INF/classes/relatorios/logo123.png', NULL, NULL, 'LAVANDERIA REFORCO', 'sn', NULL, '', '', true, '', '', 'F');
