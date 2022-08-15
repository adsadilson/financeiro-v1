ALTER TABLE conta_areceber ADD origem varchar(25) NULL;
UPDATE conta_areceber SET origem='EXTERNO' where id>0;
