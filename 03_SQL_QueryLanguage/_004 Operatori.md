# Operatori

## Operatori matematici

MySQL supporta i classici operatori matematici tradizionali, cioè:

- **+** (addizione)
- **-** (sottrazione)
- **\*** (moltiplicazione)
- **/** (divisione)
- **%** (modulo - il resto della divisione tra due numeri)

---

Questi operatori risultano molto utili quando si devono svolgere dei calcoli all'interno di una SELECT. Per fare un esempio, si supponga di voler restituire il valore dato dalla sottrazione di due campi:

```sql
Potete eseguire dei calcoli matematici con SELECT:
SELECT (field1 - field2)
FROM tableName
[WHERE condition(s)];
```

---

Alcuni esempi di calcoli matematici:

```sql
SELECT 6 / 2; -- 3
SELECT 35 % 3; -- 2
SELECT (35 / 3) * 2; -- 11.6667
```

---

## Operatori di Confronto

- `=`, `<>`, `!=` (uguaglianza e disuguaglianza)
- `>` (maggiore di)
- `>=` (maggiore o uguale a)
- `<` (minore di)
- `<=` (minore o uguale a)

---

### Operatori di confronto

Gli operatori di confronto sono utilizzati per confrontare valori e stabilire condizioni nelle query SQL. Ecco una lista di operatori di confronto comuni:

- `=` (Uguale): Verifica se due valori sono uguali.
- `!=` o `<>` (Diverso da): Verifica se due valori non sono uguali.
- `>` (Maggiore di): Verifica se il valore a sinistra è maggiore del valore a destra.
- `<` (Minore di): Verifica se il valore a sinistra è minore del valore a destra.
- `>=` (Maggiore o uguale a): Verifica se il valore a sinistra è maggiore o uguale al valore a destra.
- `<=` (Minore o uguale a): Verifica se il valore a sinistra è minore o uguale al valore a destra.

Questi operatori sono fondamentali per filtrare i dati nelle query SQL e stabilire le condizioni di ricerca dei dati desiderati.

---

### Operatori di confronto nelle query SQL

Ecco alcuni esempi di utilizzo degli operatori di confronto nelle query SQL:

1. Seleziona il nome, il cognome, l'email e la data di nascita degli studenti di genere femminile, ordinati per cognome e poi per nome:

   ```sql
   SELECT nome, cognome, email, data_nascita
   FROM studenti
   WHERE genere = 'f'
   ORDER BY cognome, nome;
   ```

---

1. Seleziona il nome, il cognome, l'email e la data di nascita degli studenti che non vivono a Torino, ordinati per cognome e poi per nome:

   ```sql
   SELECT nome, cognome, email, data_nascita
   FROM studenti
   WHERE citta != 'torino'
   ORDER BY cognome, nome;
   ```

---

3. Seleziona il nome, il cognome, l'email e la data di nascita degli studenti nati dopo il 31 dicembre 1989, ordinati per data di nascita:

   ```sql
   SELECT nome, cognome, email, data_nascita
   FROM studenti
   WHERE data_nascita >= '1989-12-31'
   ORDER BY data_nascita;
   ```

Questi esempi illustrano come utilizzare gli operatori di confronto per filtrare i dati in base a determinate condizioni nelle query SQL.

---

### Operatori Logici

- `AND` (e logico)
- `OR` (o logico)

---

### operatori logici: AND e OR

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
