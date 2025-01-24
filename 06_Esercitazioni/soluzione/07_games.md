# Tabella Games

## 10 query SQL molto semplici per la tabella **games**:

---

### 1. Selezionare tutti i campi della tabella.
```sql
SELECT * 
FROM games;
```

---

### 2. Elencare i nomi di tutti i giochi.
```sql
SELECT Game 
FROM games;
```

---

### 3. Trovare tutti i giochi pubblicati nel 2020.
```sql
SELECT Game 
FROM games
WHERE year = 2020;
```

---

### 4. Elencare tutti i giochi di un genere specifico, ad esempio "Action".
```sql
SELECT Game 
FROM games
WHERE Genre = 'Action';
```

---

### 5. Visualizzare i giochi pubblicati da un determinato editore, ad esempio "Nintendo".
```sql
SELECT Game 
FROM games
WHERE Publisher = 'Nintendo';
```

---

### 6. Elencare i giochi di un genere specifico, ad esempio "RPG", pubblicati da "Square Enix"

```sql
SELECT Game, year
FROM games
WHERE Genre = 'RPG' AND Publisher = 'Square Enix';
```

---


### 7. Mostrare tutti i giochi pubblicati su una piattaforma specifica, ad esempio "PlayStation".
```sql
SELECT Game 
FROM games
WHERE Original_platform = 'PlayStation';
```

---

### 8. Elencare i giochi pubblicati prima dell'anno 2000.
```sql
SELECT Game 
FROM games
WHERE year < 2000;
```

---

### 9. Visualizzare i generi distinti presenti nella tabella.
```sql
SELECT DISTINCT Genre 
FROM games;
```

---

### 10. Mostrare tutti i giochi ordinati per anno di pubblicazione (dal più recente al più vecchio).
```sql
SELECT Game, year 
FROM games
ORDER BY year DESC;
```

---

### 11. Elencare tutti i giochi che non appartengono ai generi "Action" o "Adventure"

```sql
SELECT Game, Genre
FROM games
WHERE Genre NOT IN ('Action', 'Adventure');
```

---

### 12. Elencare i giochi con anno di pubblicazione compreso tra il 2000 e il 2010

```sql
SELECT Game, year
FROM games
WHERE year BETWEEN 2000 AND 2010
ORDER BY year;
```

---

### 13. Mostrare il nome dei giochi e il loro editore per tutti i giochi pubblicati dopo il 2015, ordinati per editore

```sql
SELECT Game, Publisher, year
FROM games
WHERE year > 2015
ORDER BY Publisher, Game;
```

---

### 14. Contare il numero totale di giochi nella tabella

```sql
SELECT COUNT(*) AS TotalGames 
FROM games;
```

---

### 15. Trovare il numero di giochi per ogni genere

```sql
SELECT Genre, COUNT(*) AS TotalGames
FROM games
GROUP BY Genre;
```

---

### 16. Trovare i giochi pubblicati nell'anno più recente disponibile nella tabella

```sql
SELECT Game, year
FROM games
WHERE year = (SELECT MAX(year) FROM games);
```

---

### 17. Contare il numero di giochi pubblicati da ciascun editore

```sql
SELECT Publisher, COUNT(*) AS TotalGames
FROM games
GROUP BY Publisher
ORDER BY TotalGames DESC;
```

---


### 18. Trovare il genere più comune nella tabella

```sql
SELECT Genre, COUNT(*) AS TotalGames
FROM games
GROUP BY Genre
ORDER BY TotalGames DESC
LIMIT 1;
```

---

### 19. Trovare il numero di giochi pubblicati per ciascun anno

```sql
SELECT year, COUNT(*) AS TotalGames
FROM games
GROUP BY year
ORDER BY year DESC;
```

---



---

### 20. Mostrare l'elenco dei giochi pubblicati su più piattaforme (conteggiando le occorrenze di ciascun gioco)

```sql
SELECT Game, COUNT(DISTINCT Original_platform) AS PlatformCount
FROM games
GROUP BY Game
HAVING PlatformCount > 1;
```

---

### 21. Trovare i giochi con lo stesso nome e anno, ma pubblicati da editori diversi

```sql
SELECT Game, year, COUNT(DISTINCT Publisher) AS PublisherCount
FROM games
GROUP BY Game, year
HAVING PublisherCount > 1;
```

---

### 22. Identificare gli editori che hanno pubblicato giochi per almeno 3 piattaforme diverse

```sql
SELECT Publisher, COUNT(DISTINCT Original_platform) AS PlatformCount
FROM games
GROUP BY Publisher
HAVING PlatformCount >= 3;
```

---

### 23. Elencare il numero di giochi per piattaforma e per anno, solo per piattaforme con più di 5 giochi pubblicati in un anno

```sql
SELECT Original_platform, year, COUNT(*) AS TotalGames
FROM games
GROUP BY Original_platform, year
HAVING COUNT(*) > 5;
```

---

### 24. Trovare i giochi che appartengono a più di un genere

```sql
SELECT Game, COUNT(DISTINCT Genre) AS GenreCount
FROM games
GROUP BY Game
HAVING GenreCount > 1;
```

---

### 25. Trovare l'editore con il maggior numero di giochi pubblicati per ogni genere

```sql
SELECT Genre, Publisher, COUNT(*) AS TotalGames
FROM games
GROUP BY Genre, Publisher
HAVING COUNT(*) = (
    SELECT MAX(PubCount)
    FROM (
        SELECT Publisher, Genre, COUNT(*) AS PubCount
        FROM games
        GROUP BY Genre, Publisher
    ) AS SubQuery
    WHERE SubQuery.Genre = games.Genre
);
```

---

### 26. Trovare il gioco più vecchio per ogni piattaforma

```sql
SELECT Original_platform, Game, year
FROM games
WHERE (Original_platform, year) IN (
    SELECT Original_platform, MIN(year)
    FROM games
    GROUP BY Original_platform
);
```

---

### 27. Trovare tutti i giochi che condividono lo stesso nome ma appartengono a generi o editori diversi

```sql
SELECT Game, Genre, Publisher
FROM games
WHERE Game IN (
    SELECT Game
    FROM games
    GROUP BY Game
    HAVING COUNT(DISTINCT Genre) > 1 OR COUNT(DISTINCT Publisher) > 1
)
ORDER BY Game;
```

---

### 28. Calcolare la distribuzione percentuale dei giochi per genere

```sql
SELECT Genre, COUNT(*) AS TotalGames, 
       ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM games)), 2) AS Percentage
FROM games
GROUP BY Genre
ORDER BY Percentage DESC;
```

---

### 29. Creare una "classifica" degli editori in base al numero di giochi pubblicati, assegnando un rank

```sql
SELECT Publisher, COUNT(*) AS TotalGames, 
       RANK() OVER (ORDER BY COUNT(*) DESC) AS Rank
FROM games
GROUP BY Publisher;
```

---

### 30. Creare una classifica per anno dei generi più pubblicati

```sql
SELECT year, Genre, COUNT(*) AS TotalGames,
       RANK() OVER (PARTITION BY year ORDER BY COUNT(*) DESC) AS Rank
FROM games
GROUP BY year, Genre
ORDER BY year, Rank;
```
