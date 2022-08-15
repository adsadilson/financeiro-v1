ALTER TABLE cab_conta_apagar
ADD COLUMN periodo bigint;

ALTER TABLE cab_conta_apagar
ADD COLUMN qtde bigint;

ALTER TABLE cab_conta_apagar
ADD COLUMN rateio boolean;

ALTER TABLE cab_conta_apagar
ADD COLUMN replicar boolean;

ALTER TABLE cab_conta_apagar
ADD COLUMN tipo_lanc text;

ALTER TABLE conta_apagar
ADD COLUMN cab_conta_apagar_id bigint;

ALTER TABLE conta_apagar
ADD COLUMN valor_multa_juros numeric(12,2);

ALTER TABLE conta_apagar
ADD COLUMN valor_desc numeric(12,2);

ALTER TABLE conta_apagar
ADD COLUMN valor_pago numeric(12,2);

ALTER TABLE conta_apagar
ADD COLUMN conta_apagar_id bigint;

ALTER TABLE movimentacao
ADD COLUMN cab_conta_apagar_id bigint;

ALTER TABLE conta_apagar ADD CONSTRAINT fk_cab_conta_apagar_x_conta_apagar 
FOREIGN KEY (cab_conta_apagar_id) REFERENCES cab_conta_apagar(id);

ALTER TABLE conta_apagar ADD CONSTRAINT fk_conta_apagar_x_conta_apagar 
FOREIGN KEY (conta_apagar_id) REFERENCES conta_apagar(id);

ALTER TABLE movimentacao ADD CONSTRAINT fk_cab_conta_apagar_x_movimentacao 
FOREIGN KEY (cab_conta_apagar_id) REFERENCES cab_conta_apagar(id);

update cab_conta_apagar set periodo = 30, qtde = 1, tipo_lanc='AP' where periodo is null and qtde is null;

update parametro  set versao_gerencial ='0103dm0003hm', versao_pdv ='0103dm0003hm';




