ALTER TABLE conta_areceber ADD recebimento_id int8 NULL;
ALTER TABLE conta_areceber ADD CONSTRAINT fk_recebimento_x_conta_areceber FOREIGN KEY (recebimento_id) REFERENCES recebimento(id);