
### **1-5: Selezioni semplici**

1. **Seleziona tutti i record dalla tabella `biblioteca`.**
   ```sql
   SELECT * FROM biblioteca;
   ```

2. **Trova i titoli di tutti i libri.**
   ```sql
   SELECT Titolo FROM biblioteca;
   ```

3. **Trova gli autori e i loro editori.**
   ```sql
   SELECT Autore, Editore FROM biblioteca;
   ```

4. **Trova i libri pubblicati nell'anno 2020.**
   ```sql
   SELECT * FROM biblioteca WHERE Anno = '2020';
   ```

5. **Trova i dettagli dei libri con più di 300 pagine.**
   ```sql
   SELECT * FROM biblioteca WHERE Pagine > 300;
   ```

---

### **6-10: Filtri e ordinamenti**

6. **Trova i libri il cui titolo contiene la parola "Storia".**
   ```sql
   SELECT * FROM biblioteca WHERE Titolo LIKE '%Storia%';
   ```

7. **Trova i libri pubblicati a Roma.**
   ```sql
   SELECT * FROM biblioteca WHERE Luogo = 'Roma';
   ```

8. **Ordina i libri in base al numero di pagine in ordine decrescente.**
   ```sql
   SELECT * FROM biblioteca ORDER BY Pagine DESC;
   ```

9. **Trova i libri di un autore specifico, ad esempio "Italo Calvino".**
   ```sql
   SELECT * FROM biblioteca WHERE Autore = 'Italo Calvino';
   ```

10. **Ordina i libri per anno di pubblicazione e titolo.**
    ```sql
    SELECT * FROM biblioteca ORDER BY Anno, Titolo;
    ```

---

### **11-15: Funzioni aggregate**

11. **Trova il numero totale di libri nella tabella.**
    ```sql
    SELECT COUNT(*) AS TotaleLibri FROM biblioteca;
    ```

12. **Trova il numero massimo di pagine tra i libri.**
    ```sql
    SELECT MAX(Pagine) AS MaxPagine FROM biblioteca;
    ```

13. **Calcola il numero medio di pagine dei libri.**
    ```sql
    SELECT AVG(Pagine) AS MediaPagine FROM biblioteca;
    ```

14. **Conta il numero di libri per ciascun editore.**
    ```sql
    SELECT Editore, COUNT(*) AS NumeroLibri FROM biblioteca GROUP BY Editore;
    ```

15. **Trova l'anno di pubblicazione più recente nella tabella.**
    ```sql
    SELECT MAX(Anno) AS AnnoRecente FROM biblioteca;
    ```

---

### **16-20: Join simulati e raggruppamenti**

16. **Trova i libri classificati come "Storia".**
    ```sql
    SELECT * FROM biblioteca WHERE Classificazione = 'Storia';
    ```

17. **Trova i libri pubblicati in anni compresi tra il 2000 e il 2020.**
    ```sql
    SELECT * FROM biblioteca WHERE Anno BETWEEN '2000' AND '2020';
    ```

18. **Trova il numero di libri pubblicati in ogni luogo.**
    ```sql
    SELECT Luogo, COUNT(*) AS NumeroLibri FROM biblioteca GROUP BY Luogo;
    ```

19. **Trova i dettagli dei libri che hanno tra 200 e 500 pagine.**
    ```sql
    SELECT * FROM biblioteca WHERE Pagine BETWEEN 200 AND 500;
    ```

20. **Trova i libri che non hanno informazioni sul numero di pagine.**
    ```sql
    SELECT * FROM biblioteca WHERE Pagine IS NULL;
    ```

---

### **21-25: Subquery e filtri avanzati**

21. **Trova i libri pubblicati nello stesso anno del libro con il titolo "Il Nome della Rosa".**
    ```sql
    SELECT * FROM biblioteca 
    WHERE Anno = (SELECT Anno FROM biblioteca WHERE Titolo = 'Il Nome della Rosa');
    ```

22. **Trova i libri con il maggior numero di pagine.**
    ```sql
    SELECT * FROM biblioteca 
    WHERE Pagine = (SELECT MAX(Pagine) FROM biblioteca);
    ```

23. **Trova i libri di autori che hanno pubblicato più di 5 libri.**
    ```sql
    SELECT Autore 
    FROM biblioteca 
    GROUP BY Autore 
    HAVING COUNT(*) > 5;
    ```

24. **Trova i libri di editori con almeno 3 pubblicazioni.**
    ```sql
    SELECT Editore, COUNT(*) AS NumeroLibri 
    FROM biblioteca 
    GROUP BY Editore 
    HAVING COUNT(*) >= 3;
    ```

25. **Trova i libri il cui numero di pagine è superiore alla media.**
    ```sql
    SELECT * 
    FROM biblioteca 
    WHERE Pagine > (SELECT AVG(Pagine) FROM biblioteca);
    ```

---

### **26-30: Query avanzate**

26. **Trova i libri pubblicati in anni dispari.**
    ```sql
    SELECT * FROM biblioteca WHERE MOD(Anno, 2) = 1;
    ```

27. **Trova i titoli di libri classificati come "Scienza" o "Tecnologia".**
    ```sql
    SELECT Titolo 
    FROM biblioteca 
    WHERE Classificazione IN ('Scienza', 'Tecnologia');
    ```

28. **Trova gli autori che hanno pubblicato in più di un luogo.**
    ```sql
    SELECT Autore 
    FROM biblioteca 
    GROUP BY Autore 
    HAVING COUNT(DISTINCT Luogo) > 1;
    ```

29. **Trova i titoli di libri con classificazione vuota o non specificata.**
    ```sql
    SELECT Titolo 
    FROM biblioteca 
    WHERE Classificazione IS NULL OR Classificazione = '';
    ```

30. **Trova il numero totale di pagine per ciascun editore.**
    ```sql
    SELECT Editore, SUM(Pagine) AS TotalePagine 
    FROM biblioteca 
    GROUP BY Editore;
    ```

