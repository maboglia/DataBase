# Create: INSERT INTO


Una volta **creata** la **struttura** del nostro database, ci ritroveremo, ovviamente, con una serie di **tabelle vuote**. Prima di **aggiungere record** a una tabella, è necessario conoscere il **tipo di dati** previsto per ogni campo, quali campi non possono avere valore nullo e quali campi hanno l’incremento automatico.

---

Quando si inseriscono i dati, bisogna utilizzare le virgolette o gli **apici** per i dati di tipo **stringa** (compresa la data), mentre **non si utilizzano** virgolette o apici per i dati di tipo **numerico**. Inoltre, non si inseriscono i valori per i campi definiti con l’attributo auto_increment.

---

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

---

## INSERT INTO 

È possibile utilizzare il comando `INSERT INTO` senza l'uso di nomi di campo se si inserisce un record rispettando l’ordine dei campi della tabella. In questo caso, devono essere inseriti i valori di tutti i campi, **anche i valori AUTO_INCREMENT o TIMESTAMP** (passando "default" per inserimento automatico). Per i campi che accettano i valori nulli, è possibile passare "null".

```sql
INSERT INTO tableName
VALUES (value1, value2, value3);
```

---

Esempio:

```sql
INSERT INTO studente
VALUES (default, 'fabio', 'rossi', 'fbr@gmail.com', null, default);
```

