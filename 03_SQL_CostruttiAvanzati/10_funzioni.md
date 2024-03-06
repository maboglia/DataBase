---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# Funzioni nei Database Relazionali

---

Parliamo ora delle "Funzioni nei Database Relazionali". Le funzioni sono un concetto essenziale nei database relazionali e forniscono un modo per eseguire operazioni specifiche sui dati e restituire risultati. Le funzioni possono essere incorporate nel linguaggio SQL o definite dall'utente.

---

### Definizione di Funzioni

1. **Definizione di Funzioni
   - Una funzione è un blocco di codice che esegue un'operazione specifica e restituisce un valore. Le funzioni nei database possono essere incorporare (come funzioni di aggregazione) o definite dall'utente.

---

### Funzioni Incorporate

2. **Funzioni Incorporate
   - I database relazionali forniscono numerose funzioni incorporate che possono essere utilizzate per eseguire operazioni comuni sui dati. Esempi includono funzioni di aggregazione come SUM, AVG, COUNT e funzioni di manipolazione delle stringhe come CONCAT, SUBSTRING, ecc.

   ```sql
   SELECT AVG(Voto) FROM Esami;
   ```

   Questa query utilizza la funzione AVG per calcolare la media dei voti nella tabella degli esami.

---

### Creazione di Funzioni

3. **Creazione di Funzioni Definite dall'Utente
   - Alcuni database consentono agli utenti di definire le proprie funzioni per eseguire operazioni personalizzate sui dati.
   - Esempio di creazione di una funzione in SQL Server:

   ```sql
   CREATE FUNCTION CalcolaIva(@prezzo DECIMAL(10, 2)) 
   RETURNS DECIMAL(10, 2)
   AS
   BEGIN
       DECLARE @iva DECIMAL(10, 2);
       SET @iva = @prezzo * 0.22;
       RETURN @iva;
   END;
   ```

   Questa funzione calcola l'IVA per un dato importo di prezzo.

---

### Chiamata di Funzioni

4. **Chiamata di Funzioni
   - Le funzioni possono essere chiamate in una query SQL per eseguire operazioni sui dati. Le funzioni definite dall'utente o le funzioni incorporate possono essere utilizzate in questo modo.

   ```sql
   SELECT Nome, CalcolaIva(Prezzo) AS PrezzoIva
   FROM Prodotti;
   ```

   Questa query utilizza la funzione CalcolaIva per ottenere il prezzo con l'IVA per ogni prodotto nella tabella Prodotti.

---

### Parametri delle Funzioni

5. **Parametri delle Funzioni
   - Le funzioni possono accettare parametri che fungono da input per il calcolo o la manipolazione dei dati.

   ```sql
   CREATE FUNCTION ConcatenaNomi(@nome1 VARCHAR(50), @nome2 VARCHAR(50)) 
   RETURNS VARCHAR(100)
   AS
   BEGIN
       DECLARE @nomeCompleto VARCHAR(100);
       SET @nomeCompleto = @nome1 + ' ' + @nome2;
       RETURN @nomeCompleto;
   END;
   ```

   Questa funzione accetta due nomi come parametri e restituisce il loro concatenamento.

---

### Funzioni con Effetti

6. **Funzioni con Effetti Collaterali
   - Le funzioni possono avere o meno effetti collaterali, ovvero modificare o accedere a dati al di fuori della funzione stessa. Le funzioni senza effetti collaterali sono spesso preferite per garantire una progettazione più prevedibile e mantenibile.

---

### Funzioni Aggregate

7. **Funzioni Aggregate
   - Le funzioni aggregate operano su un insieme di valori restituendo un singolo valore aggregato. Esempi comuni includono SUM, AVG, MIN, MAX e COUNT.

   ```sql
   SELECT COUNT(*) FROM Ordini;
   ```

   Questa query utilizza la funzione COUNT per contare il numero totale di ordini nella tabella Ordini.

Le funzioni nei database relazionali sono uno strumento potente per eseguire operazioni specifiche sui dati. La loro corretta progettazione e utilizzo contribuiscono a una gestione efficace e flessibile delle informazioni nel contesto di un sistema di gestione di database.

---

Parliamo ora delle "Funzioni nei Database Relazionali". Le funzioni sono un concetto essenziale nei database relazionali e forniscono un modo per eseguire operazioni specifiche sui dati e restituire risultati. Le funzioni possono essere incorporate nel linguaggio SQL o definite dall'utente.

---

### Definizione di Funzioni

1. **Definizione di Funzioni
   - Una funzione è un blocco di codice che esegue un'operazione specifica e restituisce un valore. Le funzioni nei database possono essere incorporare (come funzioni di aggregazione) o definite dall'utente.

---

### Funzioni Incorporate

2. **Funzioni Incorporate
   - I database relazionali forniscono numerose funzioni incorporate che possono essere utilizzate per eseguire operazioni comuni sui dati. Esempi includono funzioni di aggregazione come SUM, AVG, COUNT e funzioni di manipolazione delle stringhe come CONCAT, SUBSTRING, ecc.

   ```sql
   SELECT AVG(Voto) FROM Esami;
   ```

   Questa query utilizza la funzione AVG per calcolare la media dei voti nella tabella degli esami.

---

### Creazione di Funzioni

3. **Creazione di Funzioni Definite dall'Utente
   - Alcuni database consentono agli utenti di definire le proprie funzioni per eseguire operazioni personalizzate sui dati.
   - Esempio di creazione di una funzione in SQL Server:

   ```sql
   CREATE FUNCTION CalcolaIva(@prezzo DECIMAL(10, 2)) 
   RETURNS DECIMAL(10, 2)
   AS
   BEGIN
       DECLARE @iva DECIMAL(10, 2);
       SET @iva = @prezzo * 0.22;
       RETURN @iva;
   END;
   ```

   Questa funzione calcola l'IVA per un dato importo di prezzo.

---

### Chiamata di Funzioni

4. **Chiamata di Funzioni
   - Le funzioni possono essere chiamate in una query SQL per eseguire operazioni sui dati. Le funzioni definite dall'utente o le funzioni incorporate possono essere utilizzate in questo modo.

   ```sql
   SELECT Nome, CalcolaIva(Prezzo) AS PrezzoIva
   FROM Prodotti;
   ```

   Questa query utilizza la funzione CalcolaIva per ottenere il prezzo con l'IVA per ogni prodotto nella tabella Prodotti.

---

### Parametri delle Funzioni

5. **Parametri delle Funzioni
   - Le funzioni possono accettare parametri che fungono da input per il calcolo o la manipolazione dei dati.

   ```sql
   CREATE FUNCTION ConcatenaNomi(@nome1 VARCHAR(50), @nome2 VARCHAR(50)) 
   RETURNS VARCHAR(100)
   AS
   BEGIN
       DECLARE @nomeCompleto VARCHAR(100);
       SET @nomeCompleto = @nome1 + ' ' + @nome2;
       RETURN @nomeCompleto;
   END;
   ```

   Questa funzione accetta due nomi come parametri e restituisce il loro concatenamento.

---

### Funzioni con Effetti

6. **Funzioni con Effetti Collaterali
   - Le funzioni possono avere o meno effetti collaterali, ovvero modificare o accedere a dati al di fuori della funzione stessa. Le funzioni senza effetti collaterali sono spesso preferite per garantire una progettazione più prevedibile e mantenibile.

---

### Funzioni Aggregate

7. **Funzioni Aggregate
   - Le funzioni aggregate operano su un insieme di valori restituendo un singolo valore aggregato. Esempi comuni includono SUM, AVG, MIN, MAX e COUNT.

   ```sql
   SELECT COUNT(*) FROM Ordini;
   ```

   Questa query utilizza la funzione COUNT per contare il numero totale di ordini nella tabella Ordini.

Le funzioni nei database relazionali sono uno strumento potente per eseguire operazioni specifiche sui dati. La loro corretta progettazione e utilizzo contribuiscono a una gestione efficace e flessibile delle informazioni nel contesto di un sistema di gestione di database.

---
