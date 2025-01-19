Ecco 20 query semplici per esercitarsi con SQL sulla tabella `alimenti`:

---

---

### 1. Seleziona tutti i campi della tabella.
```sql
SELECT * FROM alimenti;
```

---

### 2. Mostra solo i prodotti e la loro categoria.
```sql
SELECT prodotto, categoria FROM alimenti;
```

---

### 3. Trova tutti gli alimenti che appartengono alla categoria "Frutta".
```sql
SELECT * FROM alimenti WHERE categoria = 'Frutta';
```

---

### 4. Trova tutti gli alimenti con un contenuto di proteine maggiore di 10g.
```sql
SELECT * FROM alimenti WHERE proteine > 10;
```

---

### 5. Mostra i prodotti con meno di 5g di lipidi.
```sql
SELECT prodotto FROM alimenti WHERE lipidi < 5;
```

---

### 6. Ordina tutti gli alimenti per energia in ordine decrescente.
```sql
SELECT * FROM alimenti ORDER BY energia DESC;
```

---

### 7. Trova i prodotti con carboidrati tra 10g e 20g.
```sql
SELECT * FROM alimenti WHERE carboidrati BETWEEN 10 AND 20;
```

---

### 8. Mostra solo i prodotti con energia superiore a 200 kcal.
```sql
SELECT prodotto FROM alimenti WHERE energia > 200;
```

---

### 9. Conta quanti alimenti appartengono alla categoria "Cereali".
```sql
SELECT COUNT(*) AS totale_cereali FROM alimenti WHERE categoria = 'Cereali';
```

---

### 10. Calcola la quantità media di proteine per tutti gli alimenti.
```sql
SELECT AVG(proteine) AS proteine_medie FROM alimenti;
```

---

### 11. Trova il prodotto con il massimo contenuto di energia.
```sql
SELECT prodotto, energia FROM alimenti ORDER BY energia DESC LIMIT 1;
```

---

### 12. Trova il prodotto con il minimo contenuto di carboidrati.
```sql
SELECT prodotto, carboidrati FROM alimenti ORDER BY carboidrati ASC LIMIT 1;
```

---

### 13. Mostra tutti gli alimenti con proteine nulle.
```sql
SELECT * FROM alimenti WHERE proteine IS NULL;
```

---

### 14. Seleziona i prodotti il cui nome contiene la parola "Pane".
```sql
SELECT * FROM alimenti WHERE prodotto LIKE '%Pane%';
```

---

### 15. Mostra i primi 5 alimenti nella tabella ordinati per categoria.
```sql
SELECT * FROM alimenti ORDER BY categoria LIMIT 5;
```

---

### 16. Raggruppa gli alimenti per categoria e conta quanti ce ne sono in ogni gruppo.
```sql
SELECT categoria, COUNT(*) AS totale_alimenti FROM alimenti GROUP BY categoria;
```

---

### 17. Filtra le categorie che hanno più di 3 alimenti.
```sql
SELECT categoria, COUNT(*) AS totale_alimenti
FROM alimenti
GROUP BY categoria
HAVING COUNT(*) > 3;
```

---

### 18. Trova i prodotti con un contenuto di lipidi inferiore alla media.
```sql
SELECT * 
FROM alimenti 
WHERE lipidi < (SELECT AVG(lipidi) FROM alimenti);
```

---

### 19. Elimina gli alimenti con energia pari a zero.
```sql
DELETE FROM alimenti WHERE energia = 0;
```

---

### 20. Aggiungi un alias alle colonne nella query.
```sql
SELECT prodotto AS NomeProdotto, categoria AS Tipo, energia AS Calorie
FROM alimenti;
```
