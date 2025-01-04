# Esercizi di SELECT

Data la struttura delle tabelle utilizzate negli esercizi:

---

### **1. Tabella `Prodotti`**
Rappresenta i prodotti disponibili.

```sql
CREATE TABLE Prodotti (
    CodP VARCHAR(10) PRIMARY KEY,       -- Codice prodotto
    NomeP VARCHAR(100) NOT NULL,        -- Nome del prodotto
    Colore VARCHAR(50),                 -- Colore del prodotto
    Taglia VARCHAR(10),                 -- Taglia del prodotto
    Magazzino VARCHAR(10)               -- Codice magazzino
);
```

---

### **2. Tabella `Fornitori`**
Contiene informazioni sui fornitori.

```sql
CREATE TABLE Fornitori (
    CodF VARCHAR(10) PRIMARY KEY,       -- Codice fornitore
    NomeF VARCHAR(100) NOT NULL,        -- Nome del fornitore
    NSoci INT,                          -- Numero di soci
    Sede VARCHAR(100)                   -- Sede del fornitore
);
```

---

### **3. Tabella `Clienti`**
Raccoglie i dettagli dei clienti.

```sql
CREATE TABLE Clienti (
    CodCliente VARCHAR(10) PRIMARY KEY, -- Codice cliente
    Nome VARCHAR(100) NOT NULL,         -- Nome del cliente
    Email VARCHAR(100),                 -- Email del cliente
    DataRegistrazione DATE DEFAULT CURRENT_DATE -- Data di registrazione
);
```

---

### **4. Tabella `ProdottiArchivio`**
Archivia i prodotti obsoleti o meno utilizzati.

```sql
CREATE TABLE ProdottiArchivio (
    CodP VARCHAR(10) PRIMARY KEY,       -- Codice prodotto
    NomeP VARCHAR(100) NOT NULL,        -- Nome del prodotto
    Colore VARCHAR(50),                 -- Colore del prodotto
    Taglia VARCHAR(10)                  -- Taglia del prodotto
);
```

---

### **5. Tabella `Ordini`**
Memorizza gli ordini dei clienti.

```sql
CREATE TABLE Ordini (
    CodOrdine VARCHAR(10) PRIMARY KEY,  -- Codice ordine
    CodCliente VARCHAR(10) NOT NULL,    -- Codice cliente
    DataOrdine DATE NOT NULL,           -- Data dell'ordine
    FOREIGN KEY (CodCliente) REFERENCES Clienti(CodCliente)
);
```

---

### **6. Tabella `Vendite`**
Registra le vendite dei prodotti.

```sql
CREATE TABLE Vendite (
    CodVendita VARCHAR(10) PRIMARY KEY, -- Codice vendita
    CodProdotto VARCHAR(10) NOT NULL,  -- Codice prodotto
    Quantita INT NOT NULL,             -- Quantità venduta
    PrezzoUnitario DECIMAL(10, 2),     -- Prezzo per unità
    Totale DECIMAL(10, 2),             -- Totale della vendita
    FOREIGN KEY (CodProdotto) REFERENCES Prodotti(CodP)
);
```

---

### **7. Tabella `FornitoriProdotti`**
Gestisce l'associazione tra fornitori e prodotti.

```sql
CREATE TABLE FornitoriProdotti (
    CodF VARCHAR(10) NOT NULL,          -- Codice fornitore
    CodP VARCHAR(10) NOT NULL,          -- Codice prodotto
    Qta INT NOT NULL,                   -- Quantità fornita
    PRIMARY KEY (CodF, CodP),           -- Chiave primaria composita
    FOREIGN KEY (CodF) REFERENCES Fornitori(CodF),
    FOREIGN KEY (CodP) REFERENCES Prodotti(CodP)
);
```

---

### **8. Tabella `OrdiniTemp`**
Una tabella temporanea per gestire dati prima di inserirli in `Ordini`.

```sql
CREATE TABLE OrdiniTemp (
    CodOrdine VARCHAR(10) PRIMARY KEY,  -- Codice ordine temporaneo
    CodCliente VARCHAR(10) NOT NULL,    -- Codice cliente
    DataOrdine DATE NOT NULL            -- Data dell'ordine
);
```

---

Esegui 10 esercizi di `SELECT` in SQL per esercitarsi con la sintassi e i concetti. 

---

### **1. Selezionare tutti i dettagli dei prodotti di colore rosso**
```sql
SELECT * 
FROM Prodotti
WHERE Colore = 'rosso';
```

---

### **2. Trovare i nomi e le sedi dei fornitori con più di 5 soci**
```sql
SELECT NomeF, Sede
FROM Fornitori
WHERE NSoci > 5;
```

---

### **3. Trovare il nome e l'email dei clienti registrati negli ultimi 30 giorni**
```sql
SELECT Nome, Email
FROM Clienti
WHERE DataRegistrazione >= CURRENT_DATE - INTERVAL '30 days';
```

---

### **4. Calcolare il totale delle vendite per ogni prodotto**
```sql
SELECT CodProdotto, SUM(Totale) AS TotaleVendite
FROM Vendite
GROUP BY CodProdotto;
```

---

### **5. Recuperare i dettagli dei fornitori che forniscono almeno un prodotto di colore "verde"**
```sql
SELECT DISTINCT F.CodF, F.NomeF, F.Sede
FROM Fornitori F
JOIN FornitoriProdotti FP ON F.CodF = FP.CodF
JOIN Prodotti P ON FP.CodP = P.CodP
WHERE P.Colore = 'verde';
```

---

### **6. Trovare i nomi dei clienti che hanno effettuato ordini**
```sql
SELECT DISTINCT C.Nome
FROM Clienti C
JOIN Ordini O ON C.CodCliente = O.CodCliente;
```

---

### **7. Visualizzare i prodotti mai forniti da alcun fornitore**
```sql
SELECT P.NomeP
FROM Prodotti P
LEFT JOIN FornitoriProdotti FP ON P.CodP = FP.CodP
WHERE FP.CodP IS NULL;
```

---

### **8. Trovare i fornitori che forniscono almeno due prodotti diversi**
```sql
SELECT CodF
FROM FornitoriProdotti
GROUP BY CodF
HAVING COUNT(DISTINCT CodP) >= 2;
```

---

### **9. Recuperare i dettagli delle vendite per prodotti il cui prezzo unitario è maggiore della media**
```sql
SELECT *
FROM Vendite
WHERE PrezzoUnitario > (SELECT AVG(PrezzoUnitario) FROM Vendite);
```

---

### **10. Trovare i prodotti venduti esclusivamente nel magazzino "MZ001"**
```sql
SELECT P.NomeP
FROM Prodotti P
WHERE P.Magazzino = 'MZ001'
AND NOT EXISTS (
    SELECT 1
    FROM Vendite V
    WHERE V.CodProdotto = P.CodP AND P.Magazzino != 'MZ001'
);
```

