# SELECT e WHERE

L'istruzione `WHERE` consente di filtrare i risultati di una query, mostrando solo i record che soddisfano la condizione imposta.

Se vogliamo selezionare il nome e cognome degli studenti di genere maschile, possiamo applicare un filtro sull'attributo `genere` come condizione del `WHERE` utilizzando gli operatori.

Esempio:

```sql
SELECT nome, cognome
FROM studenti
WHERE genere = 'm';
```

Questa query selezionerà il nome e il cognome degli studenti di genere maschile dalla tabella `studenti`.
