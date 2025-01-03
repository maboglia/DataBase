# ORDER BY

L'istruzione `ORDER BY` consente di ordinare i risultati di una query. Essa è seguita dal campo o dai campi su cui si basa l’ordinamento.

L'ordine predefinito è crescente (`ASC`). Utilizzando l'istruzione `DESC`, si ordina in modo decrescente.

Esempi:

Per ordinare per nome in modo crescente:
```sql
SELECT *
FROM studenti
ORDER BY cognome;
```

Per ordinare per nome in modo decrescente:
```sql
SELECT *
FROM studenti
ORDER BY cognome DESC;
```

Per ordinare per nome in modo decrescente e, in caso di cognomi uguali, per età in modo crescente:
```sql
SELECT *
FROM studenti
ORDER BY cognome DESC, eta;
```