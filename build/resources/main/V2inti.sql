CREATE TABLE grupo_pessoa
(
  id bigint NOT NULL,
  nome character varying(80),
  descricao character varying(80),
  status boolean NOT NULL,
  CONSTRAINT grupo_pessoa_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE grupo_pessoa
  OWNER TO postgres;
