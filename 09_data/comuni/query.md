
### **1-5: Selezioni semplici**

1. **Seleziona tutti i comuni.**
   ```sql
   SELECT * FROM comuni;
   ```

2. **Trova la denominazione e la popolazione di tutti i comuni.**
   ```sql
   SELECT denominazione, popolazione FROM comuni;
   ```

3. **Trova i comuni con popolazione superiore a 50.000.**
   ```sql
   SELECT * FROM comuni WHERE popolazione > 50000;
   ```

4. **Trova i comuni situati a un'altitudine superiore a 500 metri.**
   ```sql
   SELECT * FROM comuni WHERE altitudine > 500;
   ```

5. **Trova i comuni con una superficie maggiore di 100 km².**
   ```sql
   SELECT * FROM comuni WHERE superficie > 100;
   ```

---

### **6-10: Filtri e ordinamenti**

6. **Trova i comuni che iniziano con la lettera "A".**
   ```sql
   SELECT * FROM comuni WHERE denominazione LIKE 'A%';
   ```

7. **Ordina i comuni per popolazione in ordine decrescente.**
   ```sql
   SELECT * FROM comuni ORDER BY popolazione DESC;
   ```

8. **Trova i comuni capoluogo.**
   ```sql
   SELECT * FROM comuni WHERE capoluogo = 1;
   ```

9. **Trova i comuni di una specifica provincia, ad esempio con `idprovincia = 10`.**
   ```sql
   SELECT * FROM comuni WHERE idprovincia = 10;
   ```

10. **Ordina i comuni per altitudine e denominazione.**
    ```sql
    SELECT * FROM comuni ORDER BY altitudine DESC, denominazione ASC;
    ```

---

### **11-15: Funzioni aggregate**

11. **Trova il numero totale di comuni.**
    ```sql
    SELECT COUNT(*) AS TotaleComuni FROM comuni;
    ```

12. **Trova la popolazione totale di tutti i comuni.**
    ```sql
    SELECT SUM(popolazione) AS PopolazioneTotale FROM comuni;
    ```

13. **Trova il comune con la popolazione più alta.**
    ```sql
    SELECT * FROM comuni WHERE popolazione = (SELECT MAX(popolazione) FROM comuni);
    ```

14. **Trova l'altitudine media dei comuni.**
    ```sql
    SELECT AVG(altitudine) AS AltitudineMedia FROM comuni;
    ```

15. **Trova il numero di comuni per ogni provincia.**
    ```sql
    SELECT idprovincia, COUNT(*) AS NumeroComuni FROM comuni GROUP BY idprovincia;
    ```

---

### **16-20: Raggruppamenti e filtri avanzati**

16. **Trova la superficie totale dei comuni per ciascuna provincia.**
    ```sql
    SELECT idprovincia, SUM(superficie) AS SuperficieTotale FROM comuni GROUP BY idprovincia;
    ```

17. **Trova il numero di comuni capoluogo per provincia.**
    ```sql
    SELECT idprovincia, COUNT(*) AS NumeroCapoluoghi FROM comuni WHERE capoluogo = 1 GROUP BY idprovincia;
    ```

18. **Trova i comuni con una popolazione maggiore della media.**
    ```sql
    SELECT * FROM comuni WHERE popolazione > (SELECT AVG(popolazione) FROM comuni);
    ```

19. **Trova le province che hanno più di 10 comuni.**
    ```sql
    SELECT idprovincia, COUNT(*) AS NumeroComuni FROM comuni GROUP BY idprovincia HAVING COUNT(*) > 10;
    ```

20. **Trova i comuni con una superficie maggiore di 50 e una popolazione inferiore a 10.000.**
    ```sql
    SELECT * FROM comuni WHERE superficie > 50 AND popolazione < 10000;
    ```

---

### **21-25: Subquery e condizioni complesse**

21. **Trova i comuni con la popolazione più alta in ogni provincia.**
    ```sql
    SELECT * 
    FROM comuni c1
    WHERE popolazione = (
        SELECT MAX(popolazione) 
        FROM comuni c2 
        WHERE c1.idprovincia = c2.idprovincia
    );
    ```

22. **Trova i comuni che non sono capoluoghi.**
    ```sql
    SELECT * FROM comuni WHERE capoluogo = 0;
    ```

23. **Trova il comune con la superficie maggiore in ciascuna città metropolitana.**
    ```sql
    SELECT * 
    FROM comuni c1 
    WHERE superficie = (
        SELECT MAX(superficie) 
        FROM comuni c2 
        WHERE c1.idcittametropolitana = c2.idcittametropolitana
    );
    ```

24. **Trova i comuni con una popolazione compresa tra 20.000 e 50.000 abitanti.**
    ```sql
    SELECT * FROM comuni WHERE popolazione BETWEEN 20000 AND 50000;
    ```

25. **Trova i comuni situati ad altitudini pari a multipli di 100.**
    ```sql
    SELECT * FROM comuni WHERE MOD(altitudine, 100) = 0;
    ```

---

### **26-30: Query avanzate**

26. **Trova i comuni che appartengono sia alla provincia 1 sia alla provincia 2.**
    ```sql
    SELECT * FROM comuni WHERE idprovincia IN (1, 2);
    ```

27. **Trova i comuni con denominazione duplicata.**
    ```sql
    SELECT denominazione, COUNT(*) 
    FROM comuni 
    GROUP BY denominazione 
    HAVING COUNT(*) > 1;
    ```

28. **Trova la popolazione totale per ciascuna città metropolitana.**
    ```sql
    SELECT idcittametropolitana, SUM(popolazione) AS PopolazioneTotale 
    FROM comuni 
    GROUP BY idcittametropolitana;
    ```

29. **Trova i comuni che non hanno una superficie definita.**
    ```sql
    SELECT * FROM comuni WHERE superficie IS NULL;
    ```

30. **Trova la popolazione totale dei comuni capoluogo.**
    ```sql
    SELECT SUM(popolazione) AS PopolazioneCapoluoghi FROM comuni WHERE capoluogo = 1;
    ```

