-- Table: frota
CREATE TABLE frota
(
  id bigint NOT NULL,
  descricao character varying(255),
  frota character varying(255),
  motorista character varying(255),
  placa character varying(255),
  status character varying(255),
  pessoa_id bigint,
  CONSTRAINT frota_pkey PRIMARY KEY (id),
  CONSTRAINT fk_pessoa_x_frota FOREIGN KEY (pessoa_id)
      REFERENCES pessoa (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE frota
  OWNER TO postgres;
  
  
 -- Sequence: frota_seq
CREATE SEQUENCE frota_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE frota_seq
  OWNER TO postgres;
  
