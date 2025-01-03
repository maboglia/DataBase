# Raggruppamento e funzioni built-in

Esempi di query SQL che utilizzano funzioni principali e raggruppamenti:

---

1. **Conteggio delle righe:**
   - Trova il numero totale di prodotti presenti in magazzino.

   ```sql
   SELECT COUNT(*) AS NumeroProdotti
   FROM Prodotti;
   ```

---

2. **Somma dei valori:**
   - Calcola la somma totale del valore degli ordini.

   ```sql
   SELECT SUM(Valore) AS SommaValoreOrdini
   FROM Ordini;
   ```

---

3. **Media dei valori:**
   - Calcola la media dei prezzi dei prodotti nella categoria "Elettronica".

   ```sql
   SELECT AVG(Prezzo) AS MediaPrezzoElettronica
   FROM Prodotti
   WHERE Categoria = 'Elettronica';
   ```

---

4. **Valore massimo:**
   - Trova il prezzo massimo tra tutti i prodotti.

   ```sql
   SELECT MAX(Prezzo) AS PrezzoMassimo
   FROM Prodotti;
   ```

---

5. **Valore minimo:**
   - Trova il prezzo minimo tra tutti i prodotti.

   ```sql
   SELECT MIN(Prezzo) AS PrezzoMinimo
   FROM Prodotti;
   ```

---

6. **Raggruppamento con COUNT:**
   - Conta il numero di prodotti disponibili in ciascuna categoria.

   ```sql
   SELECT Categoria, COUNT(*) AS NumeroProdotti
   FROM Prodotti
   GROUP BY Categoria;
   ```

---

7. **Raggruppamento con SUM:**
   - Calcola il valore totale degli ordini per ciascun cliente.

   ```sql
   SELECT ClienteID, SUM(Valore) AS ValoreTotaleOrdini
   FROM Ordini
   GROUP BY ClienteID;
   ```

---

8. **Raggruppamento con AVG:**
   - Calcola la media delle valutazioni per ciascun fornitore.

   ```sql
   SELECT ID_Fornitore, AVG(Valutazione) AS MediaValutazione
   FROM Fornitori
   GROUP BY ID_Fornitore;
   ```

---

9. **Raggruppamento con HAVING:**
   - Trova le categorie con un numero minimo di prodotti.

   ```sql
   SELECT Categoria, COUNT(*) AS NumeroProdotti
   FROM Prodotti
   GROUP BY Categoria
   HAVING COUNT(*) >= 5;
   ```

---

10. **Utilizzo di funzioni di data:**

- Trova la data dell'ordine più recente.

   ```sql
   SELECT MAX(DataOrdine) AS UltimaDataOrdine
   FROM Ordini;
   ```

Questi sono esempi di come puoi utilizzare funzioni aggregate e clausole di raggruppamento nelle tue query SQL per ottenere informazioni aggregate e statistiche dai dati del tuo database.

---

### Altri esempi più complessi

Esempi di utilizzo delle funzioni di raggruppamento (GROUP BY) e della clausola HAVING:

---

1. **Raggruppamento e Conteggio:**
   - Conta quanti prodotti ci sono in ciascuna categoria.

   ```sql
   SELECT Categoria, COUNT(*) AS NumeroProdotti
   FROM Prodotti
   GROUP BY Categoria;
   ```

---

2. **Raggruppamento e Somma:**
   - Calcola la somma delle quantità disponibili per ciascun fornitore.

   ```sql
   SELECT ID_Fornitore, SUM(Quantità_Disponibile) AS SommaQuantità
   FROM Prodotti
   GROUP BY ID_Fornitore;
   ```

---

3. **Raggruppamento e Media con Filtraggio:**
   - Calcola la media dei prezzi solo per i prodotti con valutazione superiore a 4.

   ```sql
   SELECT Categoria, AVG(Prezzo) AS MediaPrezzo
   FROM Prodotti
   WHERE Valutazione > 4
   GROUP BY Categoria;
   ```

---

4. **Raggruppamento e Minimo/Massimo:**
   - Trova il prezzo minimo e massimo per ciascuna categoria.

   ```sql
   SELECT Categoria, MIN(Prezzo) AS PrezzoMinimo, MAX(Prezzo) AS PrezzoMassimo
   FROM Prodotti
   GROUP BY Categoria;
   ```

---

5. **Filtraggio con HAVING:**
   - Trova le categorie con una media di valutazione superiore a 3.

   ```sql
   SELECT Categoria, AVG(Valutazione) AS MediaValutazione
   FROM Prodotti
   GROUP BY Categoria
   HAVING AVG(Valutazione) > 3;
   ```

---

6. **Filtraggio con HAVING e Conteggio:**
   - Trova i fornitori con più di 5 prodotti in magazzino.

   ```sql
   SELECT ID_Fornitore, COUNT(*) AS NumeroProdotti
   FROM Prodotti
   GROUP BY ID_Fornitore
   HAVING COUNT(*) > 5;
   ```

---

7. **Raggruppamento su più colonne:**
   - Conta il numero di prodotti per ciascun fornitore in ogni categoria.

   ```sql
   SELECT ID_Fornitore, Categoria, COUNT(*) AS NumeroProdotti
   FROM Prodotti
   GROUP BY ID_Fornitore, Categoria;
   ```

Questi esempi mostrano come utilizzare GROUP BY e HAVING per eseguire operazioni di raggruppamento, filtraggio e calcoli aggregati in SQL.
