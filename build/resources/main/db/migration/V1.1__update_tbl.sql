ALTER TABLE cheque
ADD COLUMN flag text;

ALTER TABLE cartao
ADD COLUMN movto_caixa_id bigint;

ALTER TABLE cheque
ADD COLUMN movto_caixa_id bigint;

ALTER TABLE cartao ADD CONSTRAINT fk_movto_caixa_x_cartao FOREIGN KEY (movto_caixa_id) REFERENCES movto_caixa(id);

ALTER TABLE cheque ADD CONSTRAINT fk_movto_caixa_x_cheque FOREIGN KEY (movto_caixa_id) REFERENCES movto_caixa(id);


ALTER TABLE cheque
ADD COLUMN recebimento_id bigint;

ALTER TABLE cartao
ADD COLUMN recebimento_id bigint;

ALTER TABLE cheque
  ADD CONSTRAINT fk_recebimento_x_cheque FOREIGN KEY (recebimento_id) REFERENCES recebimento (id)
   MATCH SIMPLE
   ON UPDATE NO ACTION ON DELETE NO ACTION;
   
ALTER TABLE cartao
  ADD CONSTRAINT fk_recebimento_x_cartao FOREIGN KEY (recebimento_id) REFERENCES recebimento (id)
   MATCH SIMPLE
   ON UPDATE NO ACTION ON DELETE NO ACTION;

