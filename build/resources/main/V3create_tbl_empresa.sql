
ALTER TABLE venda_cab
ADD COLUMN frota bigint;

ALTER TABLE venda_cab
ADD COLUMN motorista text;

ALTER TABLE venda_cab
  ADD CONSTRAINT fk_frota_x_venda_cab FOREIGN KEY (frota) REFERENCES frota (id)
   MATCH SIMPLE
   ON UPDATE NO ACTION ON DELETE NO ACTION;



-- Table: empresa
CREATE TABLE empresa
(
  id bigint NOT NULL,
  apelido text,
  atividade text,
  bairro text,
  celular text,
  cep character varying(12),
  cidade text,
  cnae text,
  complemento text,
  contato1 text,
  contato2 text,
  cpf_cnpj text,
  data_cadastro text,
  email text,
  endereco text,
  estado text,
  estado_civil character varying(255),
  foto text,
  insc_municipal text,
  nascimento text,
  nome text,
  num text,
  obs text,
  rg_insc text,
  site text,
  status boolean,
  telefone text,
  telefone_2 text,
  tipo_pessoa character varying(1),
  CONSTRAINT empresa_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE empresa
  OWNER TO postgres;
  
  
 -- Sequence: empresa_seq
CREATE SEQUENCE empresa_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE empresa_seq
  OWNER TO postgres;
  
  


  
 