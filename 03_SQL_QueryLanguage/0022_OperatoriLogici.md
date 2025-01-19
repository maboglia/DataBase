
# Operatori Logici

- `AND` (e logico)
- `OR` (o logico)


## AND

Quando si utilizza l'operatore AND, tutte le condizioni specificate devono essere vere affinché un record venga selezionato. Ad esempio:

```sql
SELECT field(s)
FROM tableName
WHERE condition1 AND condition2 AND condition3;
```

---

Un esempio pratico potrebbe essere:

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE genere = 'm' AND provincia = 'to';
```

In questa query, vengono selezionati i record degli studenti maschi provenienti dalla provincia di Torino.

---

## OR

D'altro canto, quando si utilizza l'operatore OR, almeno una delle condizioni specificate deve essere vera per selezionare un record. Ad esempio:

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE genere = 'm' OR provincia = 'to';
```

In questo caso, vengono selezionati i record degli studenti maschi e quelli che provengono dalla provincia di Torino, inclusi gli studenti di sesso femminile che possono essere presenti nella provincia di Torino.

---

### Parentesi

Attraverso l’uso delle parentesi potete creare e combinare i vostri criteri di ricerca. I risultati saranno diversi:

```sql
SELECT * FROM studenti
WHERE cognome='verdi' OR cognome='rossi'
AND provincia='to';
```

In questa query, vengono selezionati i record degli studenti con il cognome "verdi" o "rossi" e che sono residenti nella provincia di Torino.

---

```sql
SELECT * FROM studenti
WHERE (cognome='verdi' OR cognome='rossi')
AND (provincia='to' OR provincia='al');
```

In questa query, vengono selezionati i record degli studenti con il cognome "verdi" o "rossi" e che sono residenti sia nella provincia di Torino che nella provincia di Alessandria.

[esempi](0026_AND_OR_NOT.md)