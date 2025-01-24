# Tabella country-data

Ecco il significato e la traduzione delle colonne, con l'indicazione delle unità di misura

---

1. **country**  
   - **Significato**: Nome del paese.  
   - **Traduzione**: Paese.  
   - **Unità di misura**: Nome proprio (nessuna unità).

2. **child_mort**  
   - **Significato**: Mortalità infantile (numero di decessi sotto i 5 anni per 1000 nati vivi).  
   - **Traduzione**: Mortalità infantile.  
   - **Unità di misura**: Numero di decessi per 1000 nati vivi.

3. **exports**  
   - **Significato**: Percentuale delle esportazioni rispetto al PIL (% del PIL).  
   - **Traduzione**: Esportazioni.  
   - **Unità di misura**: Percentuale (%).

4. **health**  
   - **Significato**: Spesa sanitaria come percentuale del PIL (% del PIL).  
   - **Traduzione**: Spesa sanitaria.  
   - **Unità di misura**: Percentuale (%).

5. **imports**  
   - **Significato**: Percentuale delle importazioni rispetto al PIL (% del PIL).  
   - **Traduzione**: Importazioni.  
   - **Unità di misura**: Percentuale (%).

6. **income**  
   - **Significato**: Reddito nazionale lordo pro capite (PPA, in dollari internazionali).  
   - **Traduzione**: Reddito pro capite.  
   - **Unità di misura**: Dollari internazionali (PPA).

7. **inflation**  
   - **Significato**: Tasso di inflazione annuale medio (%).  
   - **Traduzione**: Inflazione.  
   - **Unità di misura**: Percentuale (%).

8. **life_expec**  
   - **Significato**: Aspettativa di vita alla nascita (anni).  
   - **Traduzione**: Aspettativa di vita.  
   - **Unità di misura**: Anni.

9. **total_fer**  
   - **Significato**: Tasso di fertilità totale (numero medio di figli per donna).  
   - **Traduzione**: Tasso di fertilità totale.  
   - **Unità di misura**: Numero medio di figli.

10. **gdpp**  
    - **Significato**: Prodotto interno lordo pro capite (PPA, in dollari internazionali).  
    - **Traduzione**: PIL pro capite.  
    - **Unità di misura**: Dollari internazionali (PPA).

---

Ecco 19 query SQL semplici che puoi eseguire sulla struttura dati fornita:

---

### 1. Selezionare tutti i paesi e i loro dati

```sql
SELECT * FROM country_data;
```

---

### 2. Selezionare solo il nome dei paesi

```sql
SELECT country FROM country_data;
```

---

### 3. Selezionare i paesi con un'aspettativa di vita superiore a 70 anni

```sql
SELECT country, life_expec FROM country_data WHERE life_expec > 70;
```

---

### 4. Selezionare i paesi con un PIL pro capite maggiore di 10.000

```sql
SELECT country, gdpp FROM country_data WHERE gdpp > 10000;
```

---

### 5. Trovare i paesi con un tasso di mortalità infantile inferiore a 20

```sql
SELECT country, child_mort FROM country_data WHERE child_mort < 20;
```

---

### 6. Ordinare i paesi per reddito pro capite in ordine decrescente

```sql
SELECT country, income FROM country_data ORDER BY income DESC;
```

---

### 7. Ordinare i paesi per aspettativa di vita in ordine crescente

```sql
SELECT country, life_expec FROM country_data ORDER BY life_expec ASC;
```

---

### 8. Selezionare i paesi con un tasso di fertilità superiore a 5

```sql
SELECT country, total_fer FROM country_data WHERE total_fer > 5;
```

---

### 9. Trovare i paesi con una spesa sanitaria superiore al 10% del PIL

```sql
SELECT country, health FROM country_data WHERE health > 10;
```

---

### 10. Selezionare i paesi con un'inflazione negativa (deflazione)

```sql
SELECT country, inflation FROM country_data WHERE inflation < 0;
```

---

### 11. Trovare i paesi con esportazioni che superano il 50% del PIL

```sql
SELECT country, exports FROM country_data WHERE exports > 50;
```

---

### 12. Trovare i paesi con importazioni maggiori delle esportazioni

```sql
SELECT country, imports, exports FROM country_data WHERE imports > exports;
```

---

### 13. Selezionare i paesi con un PIL pro capite compreso tra 5.000 e 10.000

```sql
SELECT country, gdpp FROM country_data WHERE gdpp BETWEEN 5000 AND 10000;
```

---

### 14. Trovare i paesi con un tasso di fertilità inferiore a 2 e un'aspettativa di vita superiore a 75 anni

```sql
SELECT country, total_fer, life_expec FROM country_data WHERE total_fer < 2 AND life_expec > 75;
```

---

### 15. Selezionare i paesi con un tasso di mortalità infantile maggiore di 100

```sql
SELECT country, child_mort FROM country_data WHERE child_mort > 100;
```

---

### 16. Trovare i paesi con reddito pro capite maggiore di 15.000 e inflazione inferiore a 5%

```sql
SELECT country, income, inflation FROM country_data WHERE income > 15000 AND inflation < 5;
```

---

### 17. Ordinare i paesi per spesa sanitaria in ordine decrescente

```sql
SELECT country, health FROM country_data ORDER BY health DESC;
```

---

### 18. Selezionare i paesi con un PIL pro capite inferiore a 2.000

```sql
SELECT country, gdpp FROM country_data WHERE gdpp < 2000;
```

---

### 19. Trovare i paesi con esportazioni e importazioni combinate superiori al 90% del PIL

```sql
SELECT country, (exports + imports) AS total_trade FROM country_data WHERE (exports + imports) > 90;
```

---

### 20. Trovare i 3 paesi con il più alto rapporto tra spesa sanitaria e reddito pro capite

```sql
SELECT country, (health / income) AS health_income_ratio 
FROM country_data 
ORDER BY health_income_ratio DESC 
LIMIT 3;
```

---

### 21. Trovare il rapporto tra fertilità totale e aspettativa di vita per ogni paese e ordinarlo in ordine crescente

```sql
SELECT country, (total_fer / life_expec) AS fertility_life_ratio 
FROM country_data 
ORDER BY fertility_life_ratio ASC;
```


---

### 22. Calcolare la media del tasso di fertilità per i paesi con un’aspettativa di vita superiore a 70 anni

```sql
SELECT AVG(total_fer) AS avg_fertility 
FROM country_data 
WHERE life_expec > 70;
```

---

### 23. Trovare i paesi con il massimo e il minimo reddito pro capite

```sql
SELECT country, income 
FROM country_data 
WHERE income = (SELECT MAX(income) FROM country_data) 
   OR income = (SELECT MIN(income) FROM country_data);
```

---

### 24. Contare il numero di paesi con inflazione negativa

```sql
SELECT COUNT(*) AS deflation_countries 
FROM country_data 
WHERE inflation < 0;
```

---

### 25. Trovare i 5 paesi con il PIL pro capite (gdpp) più alto

```sql
SELECT country, gdpp 
FROM country_data 
ORDER BY gdpp DESC 
LIMIT 5;
```

---

### 26. Calcolare la somma delle esportazioni e delle importazioni per ciascun paese

```sql
SELECT country, (exports + imports) AS total_trade 
FROM country_data 
ORDER BY total_trade DESC;
```

---

### 27. Trovare i paesi dove il totale delle esportazioni è almeno il doppio delle importazioni

```sql
SELECT country, exports, imports 
FROM country_data 
WHERE exports >= 2 * imports;
```

---

### 28. Calcolare il PIL pro capite medio (gdpp) per ogni gruppo di aspettativa di vita (fasce di 10 anni)

```sql
SELECT FLOOR(life_expec / 10) * 10 AS life_expectancy_range, AVG(gdpp) AS avg_gdpp 
FROM country_data 
GROUP BY life_expectancy_range 
ORDER BY life_expectancy_range;
```

---

### 29. Trovare i paesi con un tasso di mortalità infantile superiore alla media globale

```sql
SELECT country, child_mort 
FROM country_data 
WHERE child_mort > (SELECT AVG(child_mort) FROM country_data);
```

---

### 30. Trovare i paesi con il massimo tasso di mortalità infantile in ogni fascia di reddito

```sql
SELECT income, country, MAX(child_mort) AS max_child_mort 
FROM country_data 
GROUP BY income 
ORDER BY income;
```

