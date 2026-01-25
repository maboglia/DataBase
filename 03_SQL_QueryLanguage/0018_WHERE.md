# Introduzione alla Clausola `WHERE` in SQL

La clausola **`WHERE`** viene utilizzata in SQL per filtrare i dati su cui operare. È applicabile non solo alle query di selezione (**`SELECT`**), ma anche alle operazioni di aggiornamento (**`UPDATE`**) e cancellazione (**`DELETE`**). Grazie a questa clausola, puoi specificare le condizioni che determinano quali righe includere o modificare.

---

### **Sintassi Base**

- **`SELECT`**:

  ```sql
  SELECT colonne
  FROM tabella
  WHERE condizione;
  ```

- **`UPDATE`**:

  ```sql
  UPDATE tabella
  SET colonna = valore
  WHERE condizione;
  ```

- **`DELETE`**:

  ```sql
  DELETE FROM tabella
  WHERE condizione;
  ```

---

### **Esempi**

#### **1. Selezione Condizionata**

Ottenere tutti i prodotti con prezzo superiore a 100:

```sql
SELECT * 
FROM prodotti
WHERE Prezzo > 100;
```

#### **2. Aggiornamento Condizionato**

Aggiornare il prezzo dei prodotti nella categoria "Casa":

```sql
UPDATE prodotti
SET Prezzo = Prezzo * 1.1
WHERE Categoria = 'Casa';
```

#### **3. Cancellazione Condizionata**

Eliminare prodotti con prezzo inferiore a 20:

```sql
DELETE FROM prodotti
WHERE Prezzo < 20;
```

---

### **Note Importanti**

1. **Condizioni Multiple**: Puoi combinare condizioni con **`AND`**, **`OR`** e parentesi per la priorità.
2. **Valori Null**: Usa **`IS NULL`** o **`IS NOT NULL`** per filtrare valori mancanti.
3. **Prestazioni**: Aggiungere indici sui campi usati in **`WHERE`** migliora le prestazioni delle query.

La clausola **`WHERE`** è essenziale per operare in modo mirato sui dati, evitando modifiche o selezioni su intere tabelle.

---

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
