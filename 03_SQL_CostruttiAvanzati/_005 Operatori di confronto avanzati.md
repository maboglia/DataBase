# Operatori Avanzati di Confronto

- `BETWEEN` (tra due valori inclusi)
- `NOT BETWEEN` (non tra due valori inclusi)
- `IN` (presente in un elenco)
- `NOT IN` (non presente in un elenco)
- `IS NULL` (valore nullo)
- `IS NOT NULL` (valore non nullo)
- `LIKE` (corrispondenza parziale)
- `NOT LIKE` (nessuna corrispondenza parziale)
- `REGEXP` (corrispondenza con espressione regolare)

Questi operatori sono utilizzati per formulare condizioni nei comandi SQL come `SELECT`, `UPDATE`, `DELETE`, ecc.

---

## Operatori di confronto avanzati: IN, NOT IN

L’operatore IN ci consente di selezionare i record indicando più valori di campo. Possiamo farlo con l'operatore OR, ma può diventare complicato quando confrontiamo molti valori. Prendiamo ad esempio l'esecuzione di una query in cui cerchiamo solo gli studenti di alcune province:

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE provincia IN ('to','cn','at','no');
```

---

L'operatore NOT IN funziona in modo simile a IN, mostra i record che NON contengono i valori selezionati. Così la seguente query mostrerà tutti i record di studenti che non appartengono alle province in elenco:

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE provincia NOT IN ('to','cn','at','no');
```

---

### BETWEEN, NOT BETWEEN

Utilizzando l'operatore BETWEEN possiamo selezionare un intervallo di valori. I valori di inizio e fine dell’intervallo sono inclusi. I valori dell’intervallo possono essere numeri, testo o date.

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE data_nascita BETWEEN '1985-01-01' AND '1994-12-31';
```

---

### IS NULL e IS NOT NULL

L'operatore IS NULL viene utilizzato per visualizzare i record che non hanno un valore impostato per un campo. Viceversa, IS NOT NULL mostra i record che hanno un valore impostato per un campo. Questi operatori possono essere utilizzati per trovare i record che hanno bisogno di informazioni aggiuntive.

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE data_nascita IS NULL;
```

---

### LIKE, NOT LIKE

Un operatore piuttosto "particolare" è LIKE, il quale consente di effettuare dei "paragoni di somiglianza".

```sql
SELECT * FROM studenti WHERE cognome LIKE 'v%';
SELECT * FROM studenti WHERE nome LIKE '%a';
SELECT * FROM studenti WHERE indirizzo LIKE 'via %';
SELECT * FROM studenti WHERE email LIKE '%gmail.com';
SELECT * FROM studenti WHERE nome LIKE 'paol_';
SELECT * FROM studenti WHERE nome LIKE '_a%';
```

---

La differenza è data dalla posizione del carattere percentuale (%), che sta ad indicare "qualsiasi carattere dopo" e "qualsiasi carattere prima".

Descrizione:

- `%`: sostituisce zero o più caratteri (wildcard)
- `_`: indica un solo carattere

Tuttavia, è consigliabile non abusare degli operatori di somiglianza, in quanto i criteri di ricerca che iniziano con caratteri jolly possono avere tempi di elaborazione più lunghi.

---

### REGEXP_LIKE() (REGEXP e RLIKE sono sinonimi di REGEXP_LIKE())

Un operatore più potente di LIKE è REGEXP, il quale consente di utilizzare molti più simboli per ricerche più complesse.

```sql
SELECT * FROM studenti WHERE REGEXP_LIKE(nome,'ra');
SELECT * FROM studenti WHERE nome REGEXP 'ra';
SELECT * FROM studenti WHERE nome REGEXP '^mar';
SELECT * FROM studenti WHERE nome REGEXP 'co$';
SELECT * FROM studenti WHERE nome REGEXP 'mar|ara|ola';
```

---

Potete combinare i simboli per creare combinazioni di pattern:

```sql
SELECT * FROM studenti WHERE nome REGEXP '^mar|ara|co$';
SELECT * FROM studenti WHERE nome REGEXP '[mcp]a';
SELECT * FROM studenti WHERE nome REGEXP 'a[ero]';
SELECT * FROM studenti WHERE nome REGEXP 'l[ao]$';
SELECT * FROM studenti WHERE nome REGEXP '^[a-m]'; -- '^[n-z]'
```

---

Per ulteriori approfondimenti, si consiglia di consultare la documentazione ufficiale:
- [Operator REGEXP](https:/dev.mysql.com/doc/refman/8.0/en/regexp.html#operator_regexp)
- [Sintassi REGEXP](https:/dev.mysql.com/doc/refman/8.0/en/regexp.html#regexp-syntax)
