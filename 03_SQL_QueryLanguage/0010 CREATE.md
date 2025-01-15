# Create: INSERT INTO

`INSERT INTO` è l'istruzione utilizzata per inserire nuovi record in una tabella. Ha due parti:

1. `INSERT INTO` seleziona la tabella e i campi per i quali effettuare l’inserimento.
2. `VALUE`/`VALUES` elenca i valori dei campi da inserire.
È possibile inserire più record con un solo `INSERT`, separando l’elenco dei valori di ogni record con la virgola (`,`).

---

Altra sintassi per un singolo record con l'istruzione `SET`:

```sql
INSERT INTO tableName (field1, field3)
VALUES (value1, value3);
```

```sql
INSERT INTO tableName (field1, field2, field3,...)
VALUES (r1_value1, r1_value2, r1_value3, ...), (r2_value1, r2_value2, r2_value3, ...);
```

```sql
INSERT INTO tableName
SET field1 = 'value1', field2 = 'value2', field3 = 'value2';
```
