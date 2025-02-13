---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# **Stored Functions in SQL**

Le **Stored Functions** (funzioni memorizzate) sono blocchi di codice SQL predefiniti che possono essere richiamati per eseguire calcoli o elaborazioni complesse e restituire un singolo valore. Sono simili alle **Stored Procedures**, ma con una differenza importante: le funzioni restituiscono sempre un valore e possono essere utilizzate direttamente in query SQL.

---

```sql
mysql> CREATE FUNCTION hello (s CHAR(20))
mysql> RETURNS CHAR(50) DETERMINISTIC
    -> RETURN CONCAT('Hello, ',s,'!');
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT hello('world');
+----------------+
| hello('world') |
+----------------+
| Hello, world!  |
+----------------+
1 row in set (0.00 sec)
```

---

## **Caratteristiche principali**

- **Restituiscono un valore unico:** Le Stored Functions sono progettate per restituire un risultato, come un numero, una stringa o una data.
- **Riutilizzabili:** Una volta definite, possono essere richiamate più volte.
- **Integrabili nelle query:** Possono essere usate in selezioni (`SELECT`), condizioni (`WHERE`, `HAVING`), o altri contesti.
- **Definizione personalizzata:** Permettono di creare logiche complesse usando SQL.

---

## **Sintassi di creazione**

```sql
CREATE FUNCTION NomeFunzione (parametri)
RETURNS TipoDato
DETERMINISTIC
BEGIN
    -- Corpo della funzione
    RETURN Valore;
END;
```

- **`NomeFunzione`:** Il nome della funzione.
- **`parametri`:** I parametri di input (opzionali) con il loro tipo di dato.
- **`RETURNS TipoDato`:** Specifica il tipo di dato restituito dalla funzione.
- **`DETERMINISTIC`/`NOT DETERMINISTIC`:** Indica se la funzione restituisce sempre lo stesso valore per lo stesso input.
- **`RETURN`:** Specifica il valore da restituire.

---

### **Scenario: Calcolo dell'IVA su un prezzo**

Supponiamo di avere una tabella `Prodotti` con una colonna `Prezzo`. Creiamo una funzione per calcolare il prezzo con IVA al 22%.

**Creazione della funzione:**

```sql
CREATE FUNCTION CalcolaIVA(Prezzo DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN Prezzo * 1.22;
END;
```

---

**Uso della funzione:**

```sql
SELECT Nome, Prezzo, CalcolaIVA(Prezzo) AS PrezzoConIVA
FROM Prodotti;
```

---

### **Scenario: Calcolo del salario annuale con un bonus**

Tabella: `Dipendenti`  

| ID | Nome   | SalarioMensile | Bonus |
|----|--------|----------------|-------|
| 1  | Mario  | 3000           | 200   |
| 2  | Laura  | 4000           | 300   |

---

**Creazione della funzione:**

```sql
CREATE FUNCTION CalcolaSalarioAnnuale(SalarioMensile DECIMAL(10,2), Bonus DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN (SalarioMensile * 12) + Bonus;
END;
```

---

**Uso della funzione:**

```sql
SELECT Nome, CalcolaSalarioAnnuale(SalarioMensile, Bonus) AS SalarioAnnuale
FROM Dipendenti;
```

---

**Risultato:**

| Nome   | SalarioAnnuale |
|--------|----------------|
| Mario  | 36200          |
| Laura  | 48300          |

---

## **Utilizzo in condizioni**

Le Stored Functions possono essere usate in clausole come `WHERE` o `HAVING`.

**Esempio:**  
Filtrare i prodotti che costano meno di 50€ con IVA.  

```sql
SELECT Nome, Prezzo, CalcolaIVA(Prezzo) AS PrezzoConIVA
FROM Prodotti
WHERE CalcolaIVA(Prezzo) < 50;
```

---

## **Gestione di errore nelle Stored Functions**

È possibile gestire errori usando controlli condizionali nel corpo della funzione.

**Esempio: Funzione con validazione**

```sql
CREATE FUNCTION CalcolaSconto(Prezzo DECIMAL(10,2), PercentualeSconto DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    IF PercentualeSconto < 0 OR PercentualeSconto > 100 THEN
        RETURN NULL; -- Percentuale non valida
    ELSE
        RETURN Prezzo - (Prezzo * PercentualeSconto / 100);
    END IF;
END;
```

---

**Uso della funzione:**

```sql
SELECT Nome, Prezzo, CalcolaSconto(Prezzo, 20) AS PrezzoScontato
FROM Prodotti;
```

---

## **Vantaggi delle Stored Functions**

1. **Riutilizzabilità:** Le funzioni possono essere richiamate ovunque, riducendo la ripetizione di codice.
2. **Manutenibilità:** La logica complessa può essere centralizzata in una funzione, semplificando le query.
3. **Efficienza:** Le Stored Functions sono eseguite lato server, riducendo il carico sul client.

---

## **Limiti delle Stored Functions**

- Non possono eseguire operazioni che modificano i dati (come `INSERT`, `UPDATE`, o `DELETE`).
- In alcuni DBMS, le funzioni possono essere meno efficienti rispetto a query ottimizzate direttamente.
- Devono essere usate con cautela per evitare problemi di performance quando sono applicate a grandi dataset.

---

## Definizione di Funzioni

- Una funzione è un blocco di codice che esegue un'operazione specifica e restituisce un valore. Le funzioni nei database possono essere incorporare (come funzioni di aggregazione) o definite dall'utente.

---

## Funzioni Incorporate

- I database relazionali forniscono numerose funzioni incorporate che possono essere utilizzate per eseguire operazioni comuni sui dati. Esempi includono funzioni di aggregazione come SUM, AVG, COUNT e funzioni di manipolazione delle stringhe come CONCAT, SUBSTRING, ecc.

   ```sql
   SELECT AVG(Voto) FROM Esami;
   ```

   Questa query utilizza la funzione AVG per calcolare la media dei voti nella tabella degli esami.

---

## Creazione di Funzioni Definite dall'Utente

- Alcuni database consentono agli utenti di definire le proprie funzioni per eseguire operazioni personalizzate sui dati.
- Esempio di creazione di una funzione in **SQL Server**:

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

Ecco la versione corretta della funzione `CalcolaIva` in **MySQL**. In MySQL, le funzioni non utilizzano il prefisso `@` per i parametri e il `DECLARE` va all'interno del corpo della funzione.  

---

### **Versione MySQL Corretta**

```sql
DELIMITER $$

CREATE FUNCTION CalcolaIva(prezzo DECIMAL(10,2)) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE iva DECIMAL(10,2);
    SET iva = prezzo * 0.22;
    RETURN iva;
END $$

DELIMITER ;
```

---

### **Spiegazione**

1. **`DELIMITER $$`** → Cambia il delimitatore temporaneamente per evitare problemi con il `BEGIN...END`.
2. **`CREATE FUNCTION CalcolaIva(prezzo DECIMAL(10,2))`** → Definisce la funzione con un parametro `prezzo`.
3. **`RETURNS DECIMAL(10,2)`** → Specifica il tipo di dato restituito.
4. **`DETERMINISTIC`** → Indica che la funzione restituisce sempre lo stesso output per lo stesso input (necessario per alcune configurazioni di sicurezza).
5. **`DECLARE iva DECIMAL(10,2);`** → Dichiarazione della variabile locale.
6. **`SET iva = prezzo * 0.22;`** → Calcola l'IVA del prezzo dato.
7. **`RETURN iva;`** → Restituisce il valore calcolato.
8. **`DELIMITER ;`** → Ripristina il delimitatore standard `;`.

---

### **Esempio di utilizzo**

```sql
SELECT CalcolaIva(100.00) AS IVA;
```

🔹 *Output: `22.00`*  

Questa funzione può essere usata all'interno di query per calcolare automaticamente l'IVA sui prezzi. 🚀

---

## Chiamata di Funzioni

- Le funzioni possono essere chiamate in una query SQL per eseguire operazioni sui dati. Le funzioni definite dall'utente o le funzioni incorporate possono essere utilizzate in questo modo.

   ```sql
   SELECT Nome, CalcolaIva(Prezzo) AS PrezzoIva
   FROM Prodotti;
   ```

   Questa query utilizza la funzione CalcolaIva per ottenere il prezzo con l'IVA per ogni prodotto nella tabella Prodotti.

---

## Parametri delle Funzioni

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

## Funzioni con Effetti Collaterali

- Le funzioni possono avere o meno effetti collaterali, ovvero modificare o accedere a dati al di fuori della funzione stessa. Le funzioni senza effetti collaterali sono spesso preferite per garantire una progettazione più prevedibile e mantenibile.

---

## Funzioni Aggregate

- Le funzioni aggregate operano su un insieme di valori restituendo un singolo valore aggregato. Esempi comuni includono **SUM, AVG, MIN, MAX e COUNT**.

   ```sql
   SELECT COUNT(*) FROM Ordini;
   ```

   Questa query utilizza la funzione COUNT per contare il numero totale di ordini nella tabella Ordini.

---

Le funzioni nei database relazionali sono uno strumento potente per eseguire operazioni specifiche sui dati. La loro corretta progettazione e utilizzo contribuiscono a una gestione efficace e flessibile delle informazioni nel contesto di un sistema di gestione di database.
