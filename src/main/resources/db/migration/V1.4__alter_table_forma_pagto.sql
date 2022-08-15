ALTER TABLE forma_pagto ADD COLUMN tipo_pagto varchar(20);
ALTER TABLE forma_pagto ADD flag varchar(15) NULL DEFAULT 'OUT';

UPDATE forma_pagto SET tipo_pagto='A VISTA', flag='DIN' WHERE id=1;
UPDATE forma_pagto SET tipo_pagto='A VISTA', flag='CHQ' WHERE id=2;
UPDATE forma_pagto SET tipo_pagto='A PRAZO', flag='CHQ' WHERE id=3;
UPDATE forma_pagto SET tipo_pagto='A PRAZO', flag='CAR' WHERE id=4;
UPDATE forma_pagto SET tipo_pagto='A PRAZO', flag='NT' WHERE id=5;

update parametro  set versao_gerencial ='2803dm1020hm', versao_pdv ='2803dm1020hm';




