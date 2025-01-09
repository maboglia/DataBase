# Comandi relativi a **`COMMIT`**, **`ROLLBACK`** e **`SET autocommit = OFF`** in SQL:

---

### **1. SET autocommit = OFF**

#### **Cosa fa?**

Disabilita il comportamento predefinito di eseguire automaticamente un **`COMMIT`** dopo ogni istruzione SQL. Con **`autocommit`** disattivato, le modifiche rimangono in una transazione aperta finché non vengono confermate con un **`COMMIT`** o annullate con un **`ROLLBACK`**.

#### **Sintassi:**

```sql
SET autocommit = OFF;
```

#### **Scenario:**

- Viene usato quando si desidera avere un maggiore controllo sulle transazioni.
- Utile in applicazioni che devono confermare o annullare modifiche solo in base a determinate condizioni.

---

### **2. COMMIT**

#### **Cosa fa?**

Conferma in modo permanente tutte le modifiche fatte al database all'interno della transazione corrente. Una volta eseguito, le modifiche non possono essere annullate.

#### **Sintassi:**

```sql
COMMIT;
```

#### **Esempio:**

```sql
SET autocommit = OFF;

INSERT INTO prodotti (nome, prezzo) VALUES ('Laptop', 1200);
UPDATE prodotti SET prezzo = 1150 WHERE nome = 'Laptop';

COMMIT;
```

*Le modifiche apportate (inserimento e aggiornamento) vengono salvate definitivamente nel database.*

---

### **3. ROLLBACK**

#### **Cosa fa?**

Annulla tutte le modifiche fatte nella transazione corrente, ripristinando il database allo stato in cui si trovava prima dell'inizio della transazione.

#### **Sintassi:**

```sql
ROLLBACK;
```

#### **Esempio:**

```sql
SET autocommit = OFF;

INSERT INTO prodotti (nome, prezzo) VALUES ('Tablet', 300);
DELETE FROM prodotti WHERE nome = 'Laptop';

-- Qualcosa va storto, quindi annullo tutto:
ROLLBACK;
```

*Tutte le modifiche (inserimento e cancellazione) vengono annullate e il database ritorna allo stato precedente.*

---

### **4. Flusso Completo: Autocommit Off, Commit e Rollback**

#### **Esempio pratico:**

```sql
-- Disabilita autocommit
SET autocommit = OFF;

-- Avvia una transazione
INSERT INTO utenti (nome, email) VALUES ('Alice', 'alice@example.com');
UPDATE utenti SET email = 'alice_new@example.com' WHERE nome = 'Alice';

-- Conferma o annulla le modifiche in base a una condizione
IF @condizione_verificata THEN
    COMMIT; -- Conferma le modifiche
ELSE
    ROLLBACK; -- Annulla le modifiche
END IF;
```

---

### **Quando usarli?**

- **`COMMIT`**: Quando sei sicuro che tutte le modifiche apportate sono corrette e devono essere salvate.
- **`ROLLBACK`**: Quando si verifica un errore o una condizione che richiede l'annullamento delle modifiche.
- **`SET autocommit = OFF`**: Quando desideri maggiore controllo sulle transazioni, evitando che ogni istruzione venga automaticamente confermata.

