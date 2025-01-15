# Le operazioni di filtraggio dei dati

Ecco alcuni **esempi** di operazioni di filtraggio usando la clausola WHERE in SQL:

---

1. **Filtro su un Valore Specifico:**
   - Restituisci tutte le righe dove la colonna "Nome" è uguale a 'Mario'.

   ```sql
   SELECT *
   FROM Tabella
   WHERE Nome = 'Mario';
   ```

---

2. **Filtro con Operatori di Confronto:**
   - Restituisci le righe dove la colonna "Quantità" è maggiore di 10.

   ```sql
   SELECT *
   FROM Magazzino
   WHERE Quantità > 10;
   ```

---

3. **Filtro con Operatori Logici:**
   - Restituisci le righe dove la colonna "Categoria" è 'Elettronica' e la colonna "Prezzo" è inferiore a 500.

   ```sql
   SELECT *
   FROM Prodotti
   WHERE Categoria = 'Elettronica' AND Prezzo < 500;
   ```

---

4. **Filtro con Operatori di Stringa:**
   - Restituisci le righe che contengono la parola 'Java' nella colonna "Linguaggio".

   ```sql
   SELECT *
   FROM Corsi
   WHERE Linguaggio LIKE '%Java%';
   ```

---

5. **Filtro con IN:**
   - Restituisci le righe dove la colonna "Colore" è 'Rosso' o 'Blu'.

   ```sql
   SELECT *
   FROM Auto
   WHERE Colore IN ('Rosso', 'Blu');
   ```

---

6. **Filtro con IS NULL:**
   - Restituisci le righe dove la colonna "Note" è NULL.

   ```sql
   SELECT *
   FROM Ordini
   WHERE Note IS NULL;
   ```

---

7. **Filtro con BETWEEN:**
   - Restituisci le righe dove la colonna "Punteggio" è compresa tra 70 e 90 inclusi.

   ```sql
   SELECT *
   FROM Studenti
   WHERE Punteggio BETWEEN 70 AND 90;
   ```

---

8. **Filtro con LIKE e ESCAPE:**
   - Restituisci le righe che iniziano con 'A' e contengono una seconda lettera che può essere 'r' o 't'.

   ```sql
   SELECT *
   FROM Parole
   WHERE Parola LIKE 'A%[rt]%';
   ```

Sperimenta con questi esempi per comprendere come la clausola WHERE può essere utilizzata per filtrare dati in base a diverse condizioni.
