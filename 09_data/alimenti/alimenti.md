

## **DQL (Data Query Language)**: selezione, filtraggio, aggregazione e ordinamento

### 1. Selezionare tutti gli alimenti presenti nella tabella  

```sql
SELECT * FROM alimenti;
```

### 2. Ottenere tutti gli alimenti appartenenti alla categoria "CARNE"  

```sql
SELECT * FROM alimenti WHERE categoria = 'CARNE';
```

### 3. Contare quanti alimenti ci sono nella tabella  

```sql
SELECT COUNT(*) AS numero_alimenti FROM alimenti;
```

### 4. Trovare gli alimenti con più di 10g di proteine  

```sql
SELECT * FROM alimenti WHERE proteine > 10;
```

### 5. Selezionare i primi 5 alimenti con il valore energetico più alto  

```sql
SELECT * FROM alimenti ORDER BY energia DESC LIMIT 5;
```

### 6. Calcolare la media delle proteine per gli alimenti della categoria "CARNE"  

```sql
SELECT AVG(proteine) AS media_proteine FROM alimenti WHERE categoria = 'CARNE';
```

### 7. Trovare gli alimenti che non contengono carboidrati  

```sql
SELECT * FROM alimenti WHERE carboidrati = 0;
```

### 8. Trovare il prodotto con il massimo contenuto di lipidi  

```sql
SELECT * FROM alimenti ORDER BY lipidi DESC LIMIT 1;
```

### 9. Raggruppare gli alimenti per categoria e contare quanti ce ne sono per ogni categoria  

```sql
SELECT categoria, COUNT(*) AS numero_alimenti 
FROM alimenti 
GROUP BY categoria;
```

### 10. Trovare tutti gli alimenti che hanno un contenuto di carboidrati tra 10g e 30g  

```sql
SELECT * FROM alimenti WHERE carboidrati BETWEEN 10 AND 30;
```

---

## le principali **funzioni aggregate** (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, ecc.) sulla tabella `alimenti`:  

---

### 1. Contare il numero totale di alimenti  

```sql
SELECT COUNT(*) AS totale_alimenti FROM alimenti;
```

---

### 2. Calcolare la media delle proteine per tutti gli alimenti  

```sql
SELECT AVG(proteine) AS media_proteine FROM alimenti;
```

---

### 3. Trovare il valore massimo e minimo di energia tra tutti gli alimenti  

```sql
SELECT MAX(energia) AS energia_massima, MIN(energia) AS energia_minima FROM alimenti;
```

---

### 4. Calcolare la somma totale dei lipidi presenti negli alimenti  

```sql
SELECT SUM(lipidi) AS totale_lipidi FROM alimenti;
```

---

### 5. Contare il numero di alimenti per ogni categoria  

```sql
SELECT categoria, COUNT(*) AS numero_alimenti 
FROM alimenti 
GROUP BY categoria;
```

---

### 6. Calcolare la media dei carboidrati per ogni categoria  

```sql
SELECT categoria, AVG(carboidrati) AS media_carboidrati 
FROM alimenti 
GROUP BY categoria;
```

---

### 7. Trovare la categoria con il valore energetico medio più alto  

```sql
SELECT categoria, AVG(energia) AS media_energia 
FROM alimenti 
GROUP BY categoria 
ORDER BY media_energia DESC 
LIMIT 1;
```

---

### 8. Trovare il prodotto con il massimo contenuto di proteine  

```sql
SELECT prodotto, proteine 
FROM alimenti 
WHERE proteine = (SELECT MAX(proteine) FROM alimenti);
```

---

### 9. Sommare l'energia totale per ogni categoria di alimento  

```sql
SELECT categoria, SUM(energia) AS energia_totale 
FROM alimenti 
GROUP BY categoria;
```

---

### 10. Contare quanti alimenti hanno più di 10g di proteine  

```sql
SELECT COUNT(*) AS alimenti_proteici 
FROM alimenti 
WHERE proteine > 10;
```

---

## **subquery** sulla tabella `alimenti`:  

---

### 1. Trovare gli alimenti con il massimo valore energetico  

```sql
SELECT * 
FROM alimenti 
WHERE energia = (SELECT MAX(energia) FROM alimenti);
```

---

### 2. Trovare gli alimenti con un valore di proteine superiore alla media  

```sql
SELECT * 
FROM alimenti 
WHERE proteine > (SELECT AVG(proteine) FROM alimenti);
```

---

### 3. Trovare le categorie che hanno almeno un alimento con più di 20g di proteine  

```sql
SELECT DISTINCT categoria 
FROM alimenti 
WHERE categoria IN (SELECT categoria FROM alimenti WHERE proteine > 20);
```

---

### 4. Trovare il prodotto con il minimo contenuto di lipidi  

```sql
SELECT prodotto, lipidi 
FROM alimenti 
WHERE lipidi = (SELECT MIN(lipidi) FROM alimenti);
```

---

### 5. Trovare gli alimenti appartenenti alla categoria con il valore energetico medio più alto  

```sql
SELECT * 
FROM alimenti 
WHERE categoria = (
    SELECT categoria 
    FROM alimenti 
    GROUP BY categoria 
    ORDER BY AVG(energia) DESC 
    LIMIT 1
);
```

---

### 6. Trovare gli alimenti con meno energia rispetto alla media della loro categoria  

```sql
SELECT * 
FROM alimenti a1
WHERE energia < (
    SELECT AVG(energia) 
    FROM alimenti a2 
    WHERE a1.categoria = a2.categoria
);
```

---

### 7. Trovare il prodotto con il massimo contenuto di carboidrati all'interno di ogni categoria  

```sql
SELECT * 
FROM alimenti a1 
WHERE carboidrati = (
    SELECT MAX(carboidrati) 
    FROM alimenti a2 
    WHERE a1.categoria = a2.categoria
);
```

---

### 8. Trovare gli alimenti che hanno la stessa quantità di proteine del prodotto con più proteine  

```sql
SELECT * 
FROM alimenti 
WHERE proteine = (SELECT MAX(proteine) FROM alimenti);
```

---

### 9. Trovare le categorie che hanno almeno un alimento con meno di 50 kcal di energia  

```sql
SELECT DISTINCT categoria 
FROM alimenti 
WHERE categoria IN (SELECT categoria FROM alimenti WHERE energia < 50);
```

---

### 10. Trovare i prodotti che hanno un contenuto di proteine superiore al massimo contenuto di lipidi  

```sql
SELECT * 
FROM alimenti 
WHERE proteine > (SELECT MAX(lipidi) FROM alimenti);
```

---

## **10 query con self join** sulla tabella `alimenti`

---

### 1. Trovare coppie di alimenti della stessa categoria  

```sql
SELECT a1.prodotto AS alimento1, a2.prodotto AS alimento2, a1.categoria
FROM alimenti a1
JOIN alimenti a2 ON a1.categoria = a2.categoria
WHERE a1.id < a2.id;
```

**Descrizione**: Mostra coppie di alimenti appartenenti alla stessa categoria.

---

### 2. Trovare gli alimenti con lo stesso valore energetico  

```sql
SELECT a1.prodotto AS alimento1, a2.prodotto AS alimento2, a1.energia
FROM alimenti a1
JOIN alimenti a2 ON a1.energia = a2.energia AND a1.id <> a2.id;
```

**Descrizione**: Trova alimenti con lo stesso valore di energia (escludendo confronti con sé stessi).

---

### 3. Trovare gli alimenti con un contenuto proteico simile (±1g di proteine)  

```sql
SELECT a1.prodotto AS alimento1, a2.prodotto AS alimento2, a1.proteine, a2.proteine
FROM alimenti a1
JOIN alimenti a2 ON ABS(a1.proteine - a2.proteine) <= 1 AND a1.id <> a2.id;
```

**Descrizione**: Confronta alimenti con proteine simili.

---

### 4. Trovare gli alimenti con un contenuto di lipidi superiore a un altro della stessa categoria  

```sql
SELECT a1.prodotto AS alimento_maggiore, a2.prodotto AS alimento_minore, a1.lipidi, a2.lipidi, a1.categoria
FROM alimenti a1
JOIN alimenti a2 ON a1.categoria = a2.categoria AND a1.lipidi > a2.lipidi;
```

**Descrizione**: Mostra alimenti della stessa categoria dove uno ha più lipidi dell’altro.

---

### 5. Trovare alimenti con un contenuto di carboidrati inferiore rispetto a un altro della stessa categoria  

```sql
SELECT a1.prodotto AS alimento_povero, a2.prodotto AS alimento_ricco, a1.carboidrati, a2.carboidrati, a1.categoria
FROM alimenti a1
JOIN alimenti a2 ON a1.categoria = a2.categoria AND a1.carboidrati < a2.carboidrati;
```

**Descrizione**: Trova alimenti della stessa categoria con meno carboidrati rispetto a un altro.

---

### 6. Trovare gli alimenti con un valore energetico simile (±10 kcal)  

```sql
SELECT a1.prodotto AS alimento1, a2.prodotto AS alimento2, a1.energia, a2.energia
FROM alimenti a1
JOIN alimenti a2 ON ABS(a1.energia - a2.energia) <= 10 AND a1.id <> a2.id;
```

**Descrizione**: Trova alimenti con energia simile.

---

### 7. Trovare gli alimenti con valori nutrizionali uguali in una stessa categoria  

```sql
SELECT a1.prodotto, a2.prodotto, a1.categoria
FROM alimenti a1
JOIN alimenti a2 
ON a1.categoria = a2.categoria 
AND a1.proteine = a2.proteine 
AND a1.lipidi = a2.lipidi 
AND a1.carboidrati = a2.carboidrati 
AND a1.id <> a2.id;
```

**Descrizione**: Cerca alimenti identici dal punto di vista nutrizionale nella stessa categoria.

---

### 8. Trovare il prodotto con il massimo contenuto proteico in ogni categoria  

```sql
SELECT a1.prodotto, a1.categoria, a1.proteine
FROM alimenti a1
LEFT JOIN alimenti a2 
ON a1.categoria = a2.categoria AND a1.proteine < a2.proteine
WHERE a2.proteine IS NULL;
```

**Descrizione**: Utilizza un **self join con LEFT JOIN** per trovare gli alimenti con più proteine in ogni categoria.

---

### 9. Trovare gli alimenti meno calorici per ogni categoria  

```sql
SELECT a1.prodotto, a1.categoria, a1.energia
FROM alimenti a1
LEFT JOIN alimenti a2 
ON a1.categoria = a2.categoria AND a1.energia > a2.energia
WHERE a2.energia IS NULL;
```

**Descrizione**: Simile alla precedente, ma per trovare il prodotto meno calorico per categoria.

---

### 10. Trovare alimenti con una differenza energetica di almeno 100 kcal  

```sql
SELECT a1.prodotto AS alimento_piu_energetico, a2.prodotto AS alimento_meno_energetico, a1.energia, a2.energia
FROM alimenti a1
JOIN alimenti a2 ON a1.energia - a2.energia >= 100;
```

**Descrizione**: Trova coppie di alimenti con almeno 100 kcal di differenza.

---

