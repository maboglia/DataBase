# Delete: Eliminazione dei Record in una Tabella

L'istruzione `DELETE` viene utilizzata per eliminare gruppi di record in una tabella. È necessario utilizzare la parola chiave condizionale `WHERE` per isolare quali record si desidera eliminare, altrimenti si eliminano tutti i record.

La sintassi di base per l'istruzione è la seguente:

```sql
DELETE FROM tableName
WHERE field = value;
```

---

Esempio:

```sql
DELETE FROM studenti
WHERE genere = 'm';
```

Nell'esempio sopra, stiamo eliminando i record dalla tabella `studenti` dove il genere è "m".

---

## Eliminare Tutti i Record della Tabella

Per **svuotare una tabella**, si usa l’istruzione `TRUNCATE`. Questa soluzione è la più veloce perché elimina la struttura della tabella per poi ricrearne una uguale vuota, azzerando il valore di eventuali campi AUTO_INCREMENT.

---

Usando `DELETE`, si eliminano tutti i record presenti nella tabella specificata uno per uno. Questo metodo, seppur funzionante, è poco efficiente poiché **dipende dalla quantità** di righe presenti in tabella. Inoltre, usando `DELETE`, il valore di un eventuale **AUTO_INCREMENT rimane inalterato**; si può comunque modificare il valore di incremento con l'istruzione `ALTER`:

```sql
TRUNCATE [TABLE] tableName;

DELETE FROM tableName;

ALTER TABLE tableName AUTO_INCREMENT = 1;
```

---

La differenza principale tra `TRUNCATE` e `DELETE` è che `TRUNCATE` è un'operazione non registrata, mentre `DELETE` viene registrato in log, quindi `TRUNCATE` è generalmente più veloce su grandi tabelle. Tuttavia, `TRUNCATE` non può essere eseguito su tabelle referenziate da vincoli esterni di chiave, mentre `DELETE` può.
