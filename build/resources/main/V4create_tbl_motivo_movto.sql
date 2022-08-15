-- Table: parametro
--DROP TABLE parametro;

CREATE TABLE parametro
(
  id bigint NOT NULL,
  oculta_aba_frota_cli boolean,
  estado_padrao text,
  grupo_pessoa text,
  lista_anv boolean,
  lista_conta_apagar boolean,
  lista_conta_areceber boolean,
  plano_fundo text,
  validar_cpf boolean,
  CONSTRAINT parametro_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE parametro
  OWNER TO postgres;
  

-- Sequence: parametro_seq
--DROP SEQUENCE parametro_seq;

CREATE SEQUENCE parametro_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE parametro_seq
  OWNER TO postgres;

  


-- Table: motivo_movto_nome 
--DROP TABLE motivo_movto_nome;

CREATE TABLE motivo_movto_nome
(
  id bigint NOT NULL,
  status boolean,
  nome text,
  CONSTRAINT motivo_movto_nome_pkey PRIMARY KEY (id)
  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE motivo_movto_nome
  OWNER TO postgres;
  
  
-- Sequence: motivo_movto_seq
--DROP SEQUENCE motivo_movto_nome_seq;

CREATE SEQUENCE motivo_movto_nome_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE motivo_movto_nome_seq
  OWNER TO postgres;
  
  

-- Table: motivo_movto
--DROP TABLE motivo_movto;

CREATE TABLE motivo_movto
(
  id bigint NOT NULL,
  status boolean,
  conta bigint,
  conta_pai bigint,
  motivo_movto_nome bigint,
  empresa bigint NOT NULL,
  CONSTRAINT motivo_movto_pkey PRIMARY KEY (id),
  CONSTRAINT fk_plano_conta_x_motivo_movto FOREIGN KEY (conta_pai)
      REFERENCES plano_conta (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_plano_conta2_x_motivo_movto FOREIGN KEY (conta)
      REFERENCES plano_conta (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_plano_conta_x_empresa FOREIGN KEY (empresa)
      REFERENCES empresa (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_motivo_movto_nome_x_motivo_movto FOREIGN KEY (motivo_movto_nome)
      REFERENCES motivo_movto_nome (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE motivo_movto
  OWNER TO postgres;
  
  
-- Sequence: motivo_movto_seq
--DROP SEQUENCE motivo_movto_seq;

CREATE SEQUENCE motivo_movto_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE motivo_movto_seq
  OWNER TO postgres;
  
  
  
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(1, true, 'DESCONTO CONCEDIDO');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(2, true, 'DESCONTO RECEBIDO');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(3, true, 'DINHEIRO INFORMANDO CAIXA');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(4, true, 'FALTA DE CAIXA');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(5, true, 'JUROS CONCEDIDO');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(6, true, 'JUROS RECEBIDO');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(7, true, 'MULTA CONCEDIDO');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(8, true, 'QUEBRA DE ESTOQUE');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(9, true, 'SANGRIA DE CAIXA');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(10, true, 'SOBRA DE CAIXA');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(11, true, 'SOBRA DE ESTOQUE');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(12, true, 'SUPRIMENTO DE CAIXA');
INSERT INTO motivo_movto_nome (id, status, nome) VALUES(13, true, 'TAXA DE CARTAO');

  
  
  
  
  
  
  
  
