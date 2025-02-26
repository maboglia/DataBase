### **📌 Uso delle Variabili in SQL**  

Le variabili in SQL sono utili per memorizzare valori temporanei e riutilizzarli all'interno delle query.  
Le variabili possono essere usate in **MySQL, SQL Server e PostgreSQL**, ma con sintassi diverse.  

---

## **1️⃣ Dichiarazione e Assegnazione delle Variabili in MySQL**

In **MySQL**, ci sono due tipi principali di variabili:  

- **Variabili utente** (`@nome_variabile`)  
- **Variabili locali** (`DECLARE nome_variabile`)  

### **🔹 Variabili Utente (`@`)**

Le variabili utente sono globali per la sessione e non richiedono dichiarazione esplicita.  

```sql
-- Assegnazione di una variabile utente
SET @prezzo_minimo = 100;

-- Uso in una query
SELECT * FROM Prodotti WHERE prezzo > @prezzo_minimo;
```

💡 **Nota:** Il valore rimane disponibile finché la sessione è attiva.  

### **🔹 Variabili Locali (`DECLARE`)**

Le variabili locali vengono usate **solo all'interno di stored procedure o blocchi di codice**.

```sql
DELIMITER $$

CREATE PROCEDURE EsaminaProdotti()
BEGIN
    DECLARE prezzo_massimo DECIMAL(10,2);
    SET prezzo_massimo = 500;

    SELECT * FROM Prodotti WHERE prezzo < prezzo_massimo;
END$$

DELIMITER ;
```

💡 **Nota:** Le variabili locali esistono solo all'interno della procedura.

---

## **2️⃣ Variabili in SQL Server (`DECLARE`)**

In **SQL Server**, le variabili devono essere dichiarate con `DECLARE` e assegnate con `SET` o `SELECT`:

```sql
DECLARE @NomeProdotto VARCHAR(50);
SET @NomeProdotto = 'Laptop';

SELECT * FROM Prodotti WHERE nome = @NomeProdotto;
```

💡 **Nota:** SQL Server usa il prefisso `@` anche per le variabili locali.  

---

## **3️⃣ Variabili in PostgreSQL (`DO $$ DECLARE`)**

PostgreSQL usa `DO $$ DECLARE` per dichiarare variabili nei blocchi anonimi o nelle funzioni:

```sql
DO $$ 
DECLARE prezzo_max DECIMAL := 500;
BEGIN
    RAISE NOTICE 'Il prezzo massimo è %', prezzo_max;
END $$;
```

💡 **Nota:** Per usare variabili in query dirette, bisogna dichiararle in funzioni PL/pgSQL.

---

## **4️⃣ Uso delle Variabili con Query**

### **🔹 Assegnazione diretta da una query**

```sql
SET @cliente_id = (SELECT id_cliente FROM Clienti WHERE nome = 'Mario Rossi');

SELECT * FROM Ordini WHERE id_cliente = @cliente_id;
```

### **🔹 Uso con `PREPARE` per query dinamiche**

```sql
SET @tabella = 'Clienti';
SET @query = CONCAT('SELECT * FROM ', @tabella);

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
```

---

## **📝 Riepilogo**

| Database      | Dichiarazione | Assegnazione | Uso |
|--------------|--------------|--------------|-----|
| **MySQL**    | `SET @var = valore`  | `@var` per sessione | Query e stored procedure |
| **SQL Server** | `DECLARE @var tipo` | `SET @var = valore` | Query e procedure |
| **PostgreSQL** | `DECLARE var tipo` | `var := valore` | PL/pgSQL |

---

🔹 **Quando usare le variabili?**  
✔ Per memorizzare dati temporanei  
✔ Per evitare ripetizioni in query complesse  
✔ Per eseguire query dinamiche  

---

### **📌 Uso delle Variabili nelle Funzioni in MySQL**  

Le **funzioni** in MySQL permettono di eseguire operazioni e restituire un valore.  
Le variabili **locali** in una funzione vengono dichiarate con `DECLARE` e sono utilizzabili solo all'interno della funzione stessa.

---

## **🔹 1. Funzione che Calcola il Prezzo Medio di una Categoria**

Questa funzione riceve l'`id` di una categoria e restituisce il prezzo medio dei prodotti in essa contenuti.

```sql
DELIMITER $$

CREATE FUNCTION PrezzoMedioCategoria(cat_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE prezzo_medio DECIMAL(10,2);

    -- Calcoliamo il prezzo medio dei prodotti della categoria specificata
    SELECT AVG(prezzo) INTO prezzo_medio 
    FROM Prodotti 
    WHERE categoria_id = cat_id;

    -- Restituiamo il valore calcolato
    RETURN prezzo_medio;
END $$

DELIMITER ;
```

### **🔹 Uso della Funzione**

```sql
SELECT PrezzoMedioCategoria(3) AS PrezzoMedio;
```

✅ Questa funzione prende in ingresso un `categoria_id` e restituisce il prezzo medio dei prodotti appartenenti a quella categoria.

---

## **🔹 2. Funzione per Contare il Numero di Ordini di un Cliente**

Questa funzione prende l'ID di un cliente e restituisce il numero di ordini effettuati.

```sql
DELIMITER $$

CREATE FUNCTION ContatoreOrdini(cliente_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE totale_ordini INT;

    -- Conta gli ordini del cliente specificato
    SELECT COUNT(*) INTO totale_ordini 
    FROM Ordini 
    WHERE cliente_id = cliente_id;

    RETURN totale_ordini;
END $$

DELIMITER ;
```

### **🔹 Uso della Funzione**

```sql
SELECT ContatoreOrdini(5) AS NumeroOrdini;
```

✅ Questa funzione può essere usata per sapere quanti ordini ha effettuato un determinato cliente.

---

## **🔹 3. Funzione per Determinare se un Cliente è VIP**

Questa funzione restituisce `"VIP"` se un cliente ha speso più di 5000€, altrimenti `"REGOLARE"`.

```sql
DELIMITER $$

CREATE FUNCTION TipoCliente(cliente_id INT) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE totale_speso DECIMAL(10,2);
    DECLARE tipo VARCHAR(10);

    -- Calcoliamo il totale speso dal cliente
    SELECT SUM(totale) INTO totale_speso 
    FROM Ordini 
    WHERE cliente_id = cliente_id;

    -- Determiniamo il tipo di cliente
    IF totale_speso >= 5000 THEN
        SET tipo = 'VIP';
    ELSE
        SET tipo = 'REGOLARE';
    END IF;

    RETURN tipo;
END $$

DELIMITER ;
```

### **🔹 Uso della Funzione**

```sql
SELECT TipoCliente(10) AS CategoriaCliente;
```

✅ Questa funzione aiuta a categorizzare i clienti in base alla loro spesa totale.

---

## **🔹 4. Funzione che Calcola il Prezzo Totale di un Ordine**

Questa funzione restituisce il totale di un ordine dato il suo `ordine_id`.

```sql
DELIMITER $$

CREATE FUNCTION TotaleOrdine(ordine_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE totale DECIMAL(10,2);

    -- Somma i prezzi di tutti i prodotti in un ordine
    SELECT SUM(prezzo * quantita) INTO totale 
    FROM DettagliOrdine
    WHERE ordine_id = ordine_id;

    RETURN totale;
END $$

DELIMITER ;
```

### **🔹 Uso della Funzione**

```sql
SELECT TotaleOrdine(15) AS TotaleOrdine;
```

✅ Questo permette di ottenere rapidamente il costo totale di un ordine.

---

## **🔹 5. Funzione per Ottenere lo Sconto su un Ordine**

Questa funzione calcola lo sconto applicato in base al valore dell'ordine.

```sql
DELIMITER $$

CREATE FUNCTION CalcolaSconto(ordine_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE totale DECIMAL(10,2);
    DECLARE sconto DECIMAL(10,2);

    -- Recuperiamo il totale dell'ordine
    SELECT SUM(prezzo * quantita) INTO totale 
    FROM DettagliOrdine
    WHERE ordine_id = ordine_id;

    -- Applichiamo lo sconto in base al totale
    IF totale >= 1000 THEN
        SET sconto = totale * 0.10; -- 10% di sconto
    ELSEIF totale >= 500 THEN
        SET sconto = totale * 0.05; -- 5% di sconto
    ELSE
        SET sconto = 0;
    END IF;

    RETURN sconto;
END $$

DELIMITER ;
```

### **🔹 Uso della Funzione**

```sql
SELECT CalcolaSconto(15) AS ScontoApplicato;
```

✅ Questa funzione aiuta a gestire automaticamente gli sconti sugli ordini.

---

## **📌 Conclusione**

| **Tipo di Funzione**   | **Descrizione** |
|-----------------------|----------------|
| `PrezzoMedioCategoria` | Calcola il prezzo medio dei prodotti in una categoria |
| `ContatoreOrdini` | Conta il numero di ordini di un cliente |
| `TipoCliente` | Determina se un cliente è **VIP** o **REGOLARE** |
| `TotaleOrdine` | Restituisce il totale di un ordine |
| `CalcolaSconto` | Applica uno sconto in base al valore dell'ordine |

---

### **📌 Esempi Avanzati di Uso delle Variabili in SQL**  

Vediamo ora esempi pratici di utilizzo delle variabili locali nelle query e nelle **stored procedure** e **funzioni** in MySQL, SQL Server e PostgreSQL.

---

## **1️⃣ Variabili Locali in Query**

Le variabili locali si usano per memorizzare valori temporanei da riutilizzare nella stessa query o in un blocco di codice.

### **🔹 Esempio 1: Uso di Variabili in MySQL**

```sql
SET @limitePrezzo = 1000;

SELECT nome, prezzo
FROM Prodotti
WHERE prezzo < @limitePrezzo;
```

✅ In questo caso, la variabile `@limitePrezzo` memorizza un valore e viene riutilizzata nel `WHERE`.

---

## **2️⃣ Uso delle Variabili nelle Stored Procedure**

Le **stored procedure** permettono di creare blocchi di codice SQL riutilizzabili.  

### **🔹 Esempio 2: Stored Procedure con Variabili in MySQL**

```sql
DELIMITER $$

CREATE PROCEDURE OttieniProdottiEconomici(IN maxPrezzo DECIMAL(10,2))
BEGIN
    DECLARE prodotti_trovati INT;
    
    -- Contiamo quanti prodotti ci sono sotto il prezzo massimo
    SELECT COUNT(*) INTO prodotti_trovati FROM Prodotti WHERE prezzo < maxPrezzo;
    
    -- Stampiamo il numero di prodotti trovati
    SELECT CONCAT('Trovati ', prodotti_trovati, ' prodotti sotto i ', maxPrezzo, '€') AS Messaggio;

    -- Restituiamo la lista dei prodotti economici
    SELECT nome, prezzo FROM Prodotti WHERE prezzo < maxPrezzo;
END$$

DELIMITER ;
```

✅ Qui la variabile **`prodotti_trovati`** viene usata per memorizzare un valore intermedio e restituire un messaggio all'utente.  

### **🔹 Chiamata della Stored Procedure**

```sql
CALL OttieniProdottiEconomici(500);
```

---

## **3️⃣ Uso delle Variabili nelle Funzioni**

Le **funzioni** in SQL restituiscono un valore e possono essere usate all'interno delle query.

### **🔹 Esempio 3: Funzione che Calcola il Prezzo Medio in MySQL**

```sql
DELIMITER $$

CREATE FUNCTION PrezzoMedioCategoria(cat_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE prezzo_medio DECIMAL(10,2);

    -- Calcoliamo il prezzo medio dei prodotti di una certa categoria
    SELECT AVG(prezzo) INTO prezzo_medio 
    FROM Prodotti 
    WHERE categoria_id = cat_id;

    -- Restituiamo il valore calcolato
    RETURN prezzo_medio;
END$$

DELIMITER ;
```

✅ Questa funzione accetta un `categoria_id` come parametro e restituisce il prezzo medio dei prodotti in quella categoria.

### **🔹 Uso della Funzione in una Query**

```sql
SELECT PrezzoMedioCategoria(3) AS PrezzoMedio;
```

---

## **4️⃣ Variabili in SQL Server (`DECLARE`)**

SQL Server usa `DECLARE` per creare variabili all'interno di query e procedure.

### **🔹 Esempio 4: Query con Variabili in SQL Server**

```sql
DECLARE @PrezzoMassimo DECIMAL(10,2);
SET @PrezzoMassimo = 1000;

SELECT nome, prezzo
FROM Prodotti
WHERE prezzo < @PrezzoMassimo;
```

### **🔹 Esempio 5: Stored Procedure in SQL Server**

```sql
CREATE PROCEDURE ElencoClienti (@limiteAcquisti INT)
AS
BEGIN
    DECLARE @totaleClienti INT;
    
    SELECT @totaleClienti = COUNT(*) FROM Clienti WHERE acquisti >= @limiteAcquisti;

    PRINT 'Ci sono ' + CAST(@totaleClienti AS VARCHAR) + ' clienti con almeno ' + CAST(@limiteAcquisti AS VARCHAR) + ' acquisti.';
    
    SELECT * FROM Clienti WHERE acquisti >= @limiteAcquisti;
END;
```

💡 **Chiamata della Stored Procedure:**

```sql
EXEC ElencoClienti 5;
```

---

## **5️⃣ Uso delle Variabili in PostgreSQL**

In PostgreSQL, le variabili vengono dichiarate nei blocchi `DO $$` o nelle funzioni PL/pgSQL.

### **🔹 Esempio 6: Blocco Anonimo con Variabili in PostgreSQL**

```sql
DO $$ 
DECLARE prezzo_max DECIMAL := 500;
BEGIN
    RAISE NOTICE 'Il prezzo massimo è %', prezzo_max;
END $$;
```

### **🔹 Esempio 7: Funzione in PostgreSQL**

```sql
CREATE FUNCTION PrezzoMassimoCategoria(cat_id INT) RETURNS DECIMAL AS $$
DECLARE prezzo_max DECIMAL;
BEGIN
    SELECT MAX(prezzo) INTO prezzo_max 
    FROM Prodotti 
    WHERE categoria_id = cat_id;
    RETURN prezzo_max;
END $$ LANGUAGE plpgsql;
```

✅ Questa funzione calcola il prezzo massimo di una categoria.

### **🔹 Uso della Funzione in una Query**

```sql
SELECT PrezzoMassimoCategoria(2);
```

---

## **📝 Riepilogo**

| Database      | Tipo di Variabile | Dichiarazione | Uso |
|--------------|------------------|--------------|-----|
| **MySQL**    | Utente (`@var`) | `SET @var = valore` | Query dirette |
| **MySQL**    | Locale (`DECLARE var`) | `DECLARE var tipo; SET var = valore;` | Stored procedure |
| **SQL Server** | Locale (`@var`) | `DECLARE @var tipo; SET @var = valore;` | Query e stored procedure |
| **PostgreSQL** | Locale (`DECLARE var`) | `DECLARE var tipo; var := valore;` | Funzioni PL/pgSQL |

---

📌 **Quando usare le variabili?**  
✔ Per **riutilizzare valori** all'interno delle query  
✔ Per **calcoli temporanei** in stored procedure e funzioni  
✔ Per **evitare ripetizioni** nelle query complesse  

