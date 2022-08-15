INSERT INTO forma_pagto (id, nome, tipo_pagto, flag) VALUES(0, 'INFO', 'A VISTA', 'INFO');
ALTER TABLE movto_caixa ADD forma_pagto_id int8 NULL;
ALTER TABLE movto_caixa ADD CONSTRAINT movto_caixa_fk FOREIGN KEY (forma_pagto_id) REFERENCES forma_pagto(id);
update movto_caixa set forma_pagto_id = 0 where flag ='INFO';
update movto_caixa set forma_pagto_id = 1 where flag ='DINHEIRO';
update movto_caixa set forma_pagto_id = 4 where flag ='CARTAO DE DEBITO';
update movto_caixa set forma_pagto_id = 4 where flag ='CARTAO DE CREDITO';
update movto_caixa set forma_pagto_id = 5 where flag ='NOTA A PRAZO';








