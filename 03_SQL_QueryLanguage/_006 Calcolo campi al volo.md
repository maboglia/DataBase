# Calcolo campi al volo

Utilizzando il comando SELECT possiamo aggiungere campi alla nostra query che rappresentano calcoli algebrici di base su un campo esistente. Nell'esempio che segue, la query restituirà il prezzo corrente e il prezzo con il 10% in più.

```sql
SELECT nome_prodotto, prezzo, prezzo * 1.10 AS 'prezzo_con_incremento_10%'
FROM prodotti;
```

Usare gli operatori permette di fare un calcolo per ogni campo.

---

### Colonne generate (virtuali e persistenti / memorizzate)

Una colonna generata è una colonna in una tabella che non può essere impostata esplicitamente su un valore specifico in una query DML. Il suo valore viene invece generato automaticamente in base a un’espressione. Questa espressione potrebbe generare il valore in base ai valori di altre colonne nella tabella oppure potrebbe generare il valore chiamando funzioni incorporate o funzioni definite dall'utente (UDF).

---

### Esistono due tipi di colonne generate

- **PERSISTENT** (STORED): il valore di questo tipo è effettivamente memorizzato nella tabella.
- **VIRTUAL**: Il valore di questo tipo non viene memorizzato affatto. Il valore viene invece generato dinamicamente quando viene eseguita una query sulla tabella. Questo tipo è l'impostazione predefinita.

Le colonne generate sono talvolta chiamate anche colonne calcolate o colonne virtuali.

Sintassi:

```sql
<type> [GENERATED ALWAYS] AS (<expression>)
[VIRTUAL | PERSISTENT | STORED] [UNIQUE] [UNIQUE KEY] [COMMENT <text>]
```

---

### tabella studente

Esempio sulla tabella studente. Creiamo un campo generato al volo che contenga il nome e il cognome dello studente:

```sql
ALTER TABLE studente
ADD fullName VARCHAR(255) AS (CONCAT(nome, ' ', cognome)) AFTER cognome;
```

---

### tabella corsi

Esempio sulla tabella corsi. Creiamo un campo generato al volo che calcoli il prezzo del corso compreso di IVA:

```sql
ALTER TABLE corsi
ADD prezzo_iva DECIMAL(6,2) GENERATED ALWAYS AS (prezzo * 1.10) STORED
AFTER prezzo;
```

Approfondimenti: [Documentazione MySQL - Colonne generate](https:/dev.mysql.com/doc/refman/8.0/en/create-table-generated-columns.html)
