create table forma_pagto (
  id serial,
  nome text,
  permitir_desconto boolean,
  desc_perc numeric(6,2),
  prazo integer,
  conta_creditar_id bigint,
  conta_debitar_id bigint,
  usuario_id bigint,
  status boolean,
  CONSTRAINT forma_pagto_pk PRIMARY KEY (id),
  CONSTRAINT usuario_fk FOREIGN KEY (usuario_id)
      REFERENCES usuario (id),
  CONSTRAINT plano_conta_fk FOREIGN KEY (conta_creditar_id)
      REFERENCES plano_conta (id),
  CONSTRAINT forma_pagto_fk FOREIGN KEY (conta_debitar_id)
      REFERENCES plano_conta (id)
);


INSERT INTO forma_pagto(nome, status) VALUES ('DINHEIRO', TRUE);
INSERT INTO forma_pagto(nome, status) VALUES ('CHEQUE A VISTA', TRUE);
INSERT INTO forma_pagto(nome, status) VALUES ('CHEQUE PRE-DATADO', TRUE);
INSERT INTO forma_pagto(nome, status) VALUES ('CARTAO DE CREDITO', TRUE);
INSERT INTO forma_pagto(nome, status) VALUES ('NOTA A PRAZO', TRUE);


CREATE TABLE tabela_preco
(
  id serial,
  nome text,
  grupo_pessoa bigint,
  forma_pagto bigint,
  CONSTRAINT tabela_preco_pk PRIMARY KEY (id),
  CONSTRAINT grupo_pessoa_fk FOREIGN KEY (grupo_pessoa)
  REFERENCES grupo_pessoa (id),
  CONSTRAINT forma_pagto_fk FOREIGN KEY (forma_pagto)
  REFERENCES forma_pagto (id)
);


CREATE TABLE tabela_preco_produto
(
  tabela_preco bigint,
  produto bigint,
  CONSTRAINT tabela_preco_fk FOREIGN KEY (tabela_preco)
  REFERENCES tabela_preco (id),
  CONSTRAINT produto_fk FOREIGN KEY (produto)
  REFERENCES produto (id)
);