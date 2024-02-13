-- Active: 1707677310290@@127.0.0.1@1433#nova_checkin
-- Active: 1707677310290@@127.0.0.1@1433#nova_checkin
BEGIN TRANSACTION;

-- Crie uma nova coluna temporária do tipo TIMESTAMP
ALTER TABLE nova_checkin ADD COLUMN date_temp TIMESTAMP;

-- Atualize a nova coluna com os valores convertidos da coluna date
UPDATE nova_checkin SET date_temp = datetime(date);

-- Remova a coluna date antiga
ALTER TABLE nova_checkin RENAME TO old_table;

-- Crie a nova tabela com a coluna date do tipo TIMESTAMP
CREATE TABLE nova_checkin AS SELECT business_id, date_temp AS date FROM old_table;

-- Remova a tabela antiga
DROP TABLE old_table;

COMMIT;
