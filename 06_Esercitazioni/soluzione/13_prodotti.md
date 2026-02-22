# Tabella prodotti

[Scarica la tabella](../../09_data/prodotti.sql)

### **1-5: Inserimento Dati**  

1. Aggiungi un nuovo prodotto alla categoria "Elettronica":  

   ```sql
   INSERT INTO prodotti (nome, categoria, prezzo, giacenza) VALUES ('Tablet Android 10"', 'Elettronica', 249.99, 25);
   ```

2. Inserisci un nuovo prodotto nella categoria "Sport":  

   ```sql
   INSERT INTO prodotti (nome, categoria, prezzo, giacenza) VALUES ('Guantoni da Boxe', 'Sport', 39.99, 30);
   ```

3. Inserisci un nuovo prodotto economico nella categoria "Alimentari":  

   ```sql
   INSERT INTO prodotti (nome, categoria, prezzo, giacenza) VALUES ('Acqua Naturale 1.5L', 'Alimentari', 0.49, 200);
   ```

4. Inserisci un nuovo prodotto con scarsa giacenza:  

   ```sql
   INSERT INTO prodotti (nome, categoria, prezzo, giacenza) VALUES ('Orologio da Polso Elegante', 'Elettronica', 199.99, 5);
   ```

5. Inserisci un prodotto costoso nella categoria "Casalinghi":  

   ```sql
   INSERT INTO prodotti (nome, categoria, prezzo, giacenza) VALUES ('Lavastoviglie Smart', 'Casalinghi', 699.99, 8);
   ```

### **6-10: Selezione Dati**  

6. Mostra tutti i prodotti:  

   ```sql
   SELECT * FROM prodotti;
   ```

7. Trova tutti i prodotti della categoria "Sport":  

   ```sql
   SELECT * FROM prodotti WHERE categoria = 'Sport';
   ```

8. Trova tutti i prodotti con prezzo superiore a 50€:  

   ```sql
   SELECT * FROM prodotti WHERE prezzo > 50;
   ```

9. Mostra i prodotti in ordine decrescente di prezzo:  

   ```sql
   SELECT * FROM prodotti ORDER BY prezzo DESC;
   ```

10. Conta quanti prodotti ci sono nella tabella:  

   ```sql
   SELECT COUNT(*) FROM prodotti;
   ```

### **11-15: Filtri Avanzati**  

11. Trova i prodotti con prezzo tra 10€ e 50€:  

   ```sql
   SELECT * FROM prodotti WHERE prezzo BETWEEN 10 AND 50;
   ```

12. Trova i prodotti con una giacenza inferiore a 20:  

   ```sql
   SELECT * FROM prodotti WHERE giacenza < 20;
   ```

13. Trova i prodotti che contengono la parola "Smart" nel nome:  

   ```sql
   SELECT * FROM prodotti WHERE nome LIKE '%Smart%';
   ```

14. Mostra i prodotti più economici (prezzo minimo):  

   ```sql
   SELECT * FROM prodotti ORDER BY prezzo ASC LIMIT 5;
   ```

15. Conta quanti prodotti ci sono per ogni categoria:  

   ```sql
   SELECT categoria, COUNT(*) FROM prodotti GROUP BY categoria;
   ```

### **16-20: Modifica Dati**  

16. Aggiorna il prezzo di tutti i prodotti della categoria "Elettronica" aumentandolo del 10%:  

   ```sql
   UPDATE prodotti SET prezzo = prezzo * 1.10 WHERE categoria = 'Elettronica';
   ```

17. Riduci la giacenza di 5 unità per tutti i prodotti con prezzo superiore a 100€:  

   ```sql
   UPDATE prodotti SET giacenza = giacenza - 5 WHERE prezzo > 100;
   ```

18. Cambia il nome di un prodotto:  

   ```sql
   UPDATE prodotti SET nome = 'TV 4K Ultra HD 55"' WHERE nome = 'TV 4K Smart 55"';
   ```

19. Modifica la categoria di un prodotto:  

   ```sql
   UPDATE prodotti SET categoria = 'Elettronica' WHERE nome = 'Ripetitore Wi-Fi';
   ```

20. Azzera la giacenza di un prodotto fuori produzione:  

   ```sql
   UPDATE prodotti SET giacenza = 0 WHERE nome = 'Tostapane Inox';
   ```

### **21-25: Eliminazione Dati**  

21. Elimina un prodotto specifico:  

   ```sql
   DELETE FROM prodotti WHERE nome = 'Pane Fresco';
   ```

22. Elimina tutti i prodotti con giacenza pari a zero:  

   ```sql
   DELETE FROM prodotti WHERE giacenza = 0;
   ```

23. Elimina tutti i prodotti con prezzo inferiore a 1€:  

   ```sql
   DELETE FROM prodotti WHERE prezzo < 1;
   ```

24. Elimina tutti i prodotti della categoria "Alimentari":  

   ```sql
   DELETE FROM prodotti WHERE categoria = 'Alimentari';
   ```

25. Elimina tutti i prodotti con il nome contenente la parola "Vecchio":  

   ```sql
   DELETE FROM prodotti WHERE nome LIKE '%Vecchio%';
   ```

### **26-30: Query Complesse**  

26. Trova il prodotto più costoso nella tabella:  

   ```sql
   SELECT * FROM prodotti ORDER BY prezzo DESC LIMIT 1;
   ```

27. Trova il prodotto con la maggiore giacenza:  

   ```sql
   SELECT * FROM prodotti ORDER BY giacenza DESC LIMIT 1;
   ```

28. Calcola il prezzo medio dei prodotti nella categoria "Elettronica":  

   ```sql
   SELECT AVG(prezzo) AS prezzo_medio FROM prodotti WHERE categoria = 'Elettronica';
   ```

29. Elenca le categorie e il prezzo massimo per ciascuna:  

   ```sql
   SELECT categoria, MAX(prezzo) AS prezzo_massimo FROM prodotti GROUP BY categoria;
   ```

30. Mostra la somma del valore totale di magazzino per ogni categoria (prezzo × giacenza):  

   ```sql
   SELECT categoria, SUM(prezzo * giacenza) AS valore_magazzino FROM prodotti GROUP BY categoria;
   ```

