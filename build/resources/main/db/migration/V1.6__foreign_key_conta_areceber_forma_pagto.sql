ALTER TABLE conta_areceber DROP COLUMN flag;
ALTER TABLE conta_areceber DROP COLUMN agencia;
ALTER TABLE conta_areceber DROP COLUMN banco;
ALTER TABLE conta_areceber DROP COLUMN titular;
ALTER TABLE conta_areceber DROP COLUMN cpf;
ALTER TABLE conta_areceber RENAME COLUMN cmc7 TO placa;
ALTER TABLE conta_areceber ADD forma_pagto_id int8 NULL;
update conta_areceber set forma_pagto_id = 5 where id > 0;
ALTER TABLE conta_areceber ALTER COLUMN forma_pagto_id SET NOT NULL;
ALTER TABLE conta_areceber ADD CONSTRAINT conta_areceber_x_forma_pagto FOREIGN KEY (forma_pagto_id) REFERENCES forma_pagto(id);

