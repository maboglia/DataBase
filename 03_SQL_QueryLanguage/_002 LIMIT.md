# LIMIT

L'istruzione `LIMIT` consente di definire il numero massimo di record da visualizzare.

Accetta due argomenti:
- Il primo argomento, opzionale, specifica l'indice da cui iniziare per mostrare i record.
- Il secondo argomento indica la quantità di record da mostrare.

Esempi:

La seguente query mostra solo i primi 10 record della tabella `studente`:

```sql
SELECT *
FROM studenti
ORDER BY cognome
LIMIT 10;
```

---

La seguente query mostra 10 record della tabella `studenti` presi a partire dall'undicesimo record:

```sql
SELECT *
FROM studenti
ORDER BY cognome
LIMIT 10, 10;
```

Ricordate che l'indice parte da 0, quindi l'undicesimo record ha l'indice 10.
