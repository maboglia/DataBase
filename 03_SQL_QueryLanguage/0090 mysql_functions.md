# **Funzioni SQL con spiegazione ed esempio per ciascuna categoria**

---

#### **String Functions**

---

1. **ASCII**  
Restituisce il valore ASCII del primo carattere di una stringa.  
```sql
SELECT ASCII('A'); -- Risultato: 65
```

---

2. **CHAR_LENGTH**  
Restituisce la lunghezza della stringa.  
```sql
SELECT CHAR_LENGTH('SQL Tutorial'); -- Risultato: 11
```

---

3. **CONCAT**  
Concatena più stringhe.  
```sql
SELECT CONCAT('Hello', ' ', 'World!'); -- Risultato: Hello World!
```

---

4. **CONCAT_WS**  
Concatena stringhe usando un separatore.  
```sql
SELECT CONCAT_WS('-', '2024', '12', '30'); -- Risultato: 2024-12-30
```

---

5. **INSERT**  
Sostituisce parte di una stringa con un’altra.  
```sql
SELECT INSERT('SQL Tutorial', 5, 7, 'Example'); -- Risultato: SQL Example
```

---

6. **LCASE/LOWER**  
Converte la stringa in minuscolo.  
```sql
SELECT LOWER('HELLO'); -- Risultato: hello
```

---

7. **LEFT**  
Restituisce i primi N caratteri di una stringa.  
```sql
SELECT LEFT('Database', 4); -- Risultato: Data
```

---

8. **LENGTH**  
Restituisce la lunghezza della stringa in byte.  
```sql
SELECT LENGTH('SQL'); -- Risultato: 3
```

---

9. **REPLACE**  
Sostituisce tutte le occorrenze di una stringa con un'altra.  
```sql
SELECT REPLACE('Hello World', 'World', 'SQL'); -- Risultato: Hello SQL
```

---

10. **UPPER**  
Converte la stringa in maiuscolo.  
```sql
SELECT UPPER('hello'); -- Risultato: HELLO
```

---

#### **Numeric Functions**

---

1. **ABS**  
Restituisce il valore assoluto di un numero.  
```sql
SELECT ABS(-5); -- Risultato: 5
```

---

2. **ROUND**  
Arrotonda un numero al numero di decimali specificato.  
```sql
SELECT ROUND(123.456, 2); -- Risultato: 123.46
```

---

3. **CEIL/CEILING**  
Arrotonda un numero al valore intero più vicino verso l’alto.  
```sql
SELECT CEIL(10.3); -- Risultato: 11
```

---

4. **FLOOR**  
Arrotonda un numero al valore intero più vicino verso il basso.  
```sql
SELECT FLOOR(10.7); -- Risultato: 10
```

---

5. **SQRT**  
Calcola la radice quadrata.  
```sql
SELECT SQRT(16); -- Risultato: 4
```

---

6. **PI**  
Restituisce il valore di π.  
```sql
SELECT PI(); -- Risultato: 3.141593
```

---

7. **POWER**  
Eleva un numero a una potenza.  
```sql
SELECT POWER(2, 3); -- Risultato: 8
```

---

8. **MOD**  
Restituisce il resto della divisione.  
```sql
SELECT MOD(10, 3); -- Risultato: 1
```

---

9. **RAND**  
Genera un numero casuale compreso tra 0 e 1.  
```sql
SELECT RAND(); -- Risultato: Numero casuale
```

---

10. **SUM**  
Restituisce la somma di una colonna numerica.  
```sql
SELECT SUM(Prezzo) FROM Prodotti;
```

---

#### **Date Functions**

---

1. **CURDATE**  
Restituisce la data corrente.  
```sql
SELECT CURDATE(); -- Risultato: 2024-12-30
```

---

2. **NOW**  
Restituisce data e ora corrente.  
```sql
SELECT NOW(); -- Risultato: 2024-12-30 14:30:45
```

---

3. **DATE_ADD**  
Aggiunge un intervallo di tempo a una data.  
```sql
SELECT DATE_ADD('2024-12-30', INTERVAL 5 DAY); -- Risultato: 2025-01-04
```

---

4. **DATEDIFF**  
Calcola la differenza in giorni tra due date.  
```sql
SELECT DATEDIFF('2024-12-30', '2024-12-25'); -- Risultato: 5
```

---

5. **DAY**  
Restituisce il giorno di una data.  
```sql
SELECT DAY('2024-12-30'); -- Risultato: 30
```

---

6. **MONTH**  
Restituisce il mese di una data.  
```sql
SELECT MONTH('2024-12-30'); -- Risultato: 12
```

---

7. **YEAR**  
Restituisce l’anno di una data.  
```sql
SELECT YEAR('2024-12-30'); -- Risultato: 2024
```

---

8. **TIME**  
Estrae l’ora da un valore `DATETIME`.  
```sql
SELECT TIME('2024-12-30 14:30:45'); -- Risultato: 14:30:45
```

---

9. **DAYNAME**  
Restituisce il nome del giorno di una data.  
```sql
SELECT DAYNAME('2024-12-30'); -- Risultato: Monday
```

---

10. **LAST_DAY**  
Restituisce l’ultimo giorno del mese per una data specifica.  
```sql
SELECT LAST_DAY('2024-12-15'); -- Risultato: 2024-12-31
```

---

#### **Advanced Functions**

---

1. **CASE**  
Crea condizioni all’interno delle query.  
```sql
SELECT Nome, 
       CASE 
         WHEN Età < 18 THEN 'Minorenne' 
         ELSE 'Maggiorenne' 
       END AS Categoria 
FROM Utenti;
```

---

2. **CAST**  
Converte un valore in un altro tipo di dato.  
```sql
SELECT CAST(123.45 AS INT); -- Risultato: 123
```

---

3. **COALESCE**  
Restituisce il primo valore non nullo.  
```sql
SELECT COALESCE(NULL, NULL, 'Valore'); -- Risultato: Valore
```

---

4. **ISNULL**  
Verifica se un valore è `NULL`.  
```sql
SELECT ISNULL(Colonna); -- Risultato: 1 (se NULL)
```

---

5. **VERSION**  
Restituisce la versione del server SQL.  
```sql
SELECT VERSION();
```