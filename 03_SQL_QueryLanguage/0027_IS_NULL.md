# Utilizzo di **`IS NULL`** e **`IS NOT NULL`** in SQL

In SQL, i valori **NULL** rappresentano dati mancanti o sconosciuti. Per lavorare con questi valori, vengono utilizzati gli operatori **`IS NULL`** e **`IS NOT NULL`**, che consentono di verificare rispettivamente se un campo è vuoto o contiene un valore.

---

### **Sintassi Base**

- **`IS NULL`**: Verifica se un campo non contiene alcun valore.

  ```sql
  SELECT colonne
  FROM tabella
  WHERE colonna IS NULL;
  ```

- **`IS NOT NULL`**: Verifica se un campo contiene un valore.

  ```sql
  SELECT colonne
  FROM tabella
  WHERE colonna IS NOT NULL;
  ```

---

### **Esempi**

#### **1. Selezione dei Valori Mancanti**

Ottenere i clienti che non hanno indicato un numero di telefono:

```sql
SELECT Nome, Cognome
FROM clienti
WHERE Telefono IS NULL;
```

#### **2. Selezione dei Valori Presenti**

Ottenere i prodotti con un prezzo definito:

```sql
SELECT Nome, Prezzo
FROM prodotti
WHERE Prezzo IS NOT NULL;
```

#### **3. Aggiornamento dei Valori Mancanti**

Assegnare un valore predefinito ai campi NULL:

```sql
UPDATE ordini
SET Stato = 'In elaborazione'
WHERE Stato IS NULL;
```

#### **4. Cancellazione di Righe con Valori Mancanti**

Eliminare tutti i record che non hanno una data di scadenza:

```sql
DELETE FROM prodotti
WHERE DataScadenza IS NULL;
```

---

### **Note Importanti**

1. **NULL ≠ Zero o Stringa Vuota**: NULL è un valore speciale che indica "nessun dato", diverso da zero (`0`) o stringhe vuote (`''`).
2. **Condizioni Dirette**: Non puoi usare operatori come `=` o `!=` per confrontare NULL, devi utilizzare **`IS NULL`** o **`IS NOT NULL`**.
3. **Indicizzazione e Prestazioni**: Verificare valori NULL può essere meno performante su grandi tabelle. Considera l'uso di indici appropriati.

Gli operatori **`IS NULL`** e **`IS NOT NULL`** sono fondamentali per gestire correttamente i dati mancanti nei database, evitando errori e garantendo integrità nelle query.
