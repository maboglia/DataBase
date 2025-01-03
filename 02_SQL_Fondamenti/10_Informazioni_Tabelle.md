# INFORMAZIONI SULLE TABELLE

Per conoscere la struttura della tabella con più o meno informazioni (valore dell'auto_increment, data di creazione, collation):

- `DESCRIBE tableName;` o `DESC tableName;`
- `SHOW COLUMNS FROM tableName;`
- `SHOW FULL COLUMNS FROM tableName;`
- `SHOW INDEX FROM tableName;`
- `SHOW TABLE STATUS LIKE 'tableName';` -- mostra valore auto_increment

Per conoscere solo il valore dell’auto_increment di una tabella, è possibile interrogare anche il database `INFORMATION_SCHEMA`.

Le statistiche della tabella vengono memorizzate nella cache. Per disabilitare la cache e avere sempre l'ultima versione, è necessario modificare la variabile del server che indica la durata del cache-clear a 0:

```sql
SELECT table_name, auto_increment
FROM information_schema.tables
WHERE table_schema = 'databaseName';
-- AND TABLE_NAME = 'tableName';
```

È necessario usare l’utente DBA (root) per eseguire questa operazione:

```sql
SET PERSIST information_schema_stats_expiry = 0;
```
