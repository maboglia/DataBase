# Esercizi con JOIN

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

Esegui 10 esercizi di `JOIN` in SQL per esercitarsi con la sintassi e i concetti.

---

Questi esercizi coprono i seguenti tipi di **JOIN**: 
- **INNER JOIN**: restituisce solo le righe con corrispondenze tra le tabelle.
- **LEFT JOIN**: restituisce tutte le righe della tabella sinistra, con valori `NULL` per la destra dove non c'è corrispondenza.
- **Condizioni e aggregazioni**: integrano logiche con `GROUP BY`, `HAVING` e funzioni di aggregazione.

---

### **1. Mostrare il nome dei prodotti e i nomi dei fornitori che li forniscono**
```sql
SELECT P.NomeP, F.NomeF
FROM Prodotti P
JOIN FornitoriProdotti FP ON P.CodP = FP.CodP
JOIN Fornitori F ON FP.CodF = F.CodF;
```

---

### **2. Trovare i fornitori che non forniscono alcun prodotto (LEFT JOIN con condizione NULL)**
```sql
SELECT F.NomeF
FROM Fornitori F
LEFT JOIN FornitoriProdotti FP ON F.CodF = FP.CodF
WHERE FP.CodP IS NULL;
```

---

### **3. Calcolare la quantità totale fornita per ogni prodotto e visualizzare anche i prodotti che non sono forniti (LEFT JOIN)**
```sql
SELECT P.NomeP, COALESCE(SUM(FP.Qta), 0) AS TotaleQuantita
FROM Prodotti P
LEFT JOIN FornitoriProdotti FP ON P.CodP = FP.CodP
GROUP BY P.CodP, P.NomeP;
```

Ecco il commento al codice SQL:

```sql
-- Seleziona il nome del prodotto e il totale della quantità fornita per ciascun prodotto.
SELECT P.NomeP, 
       COALESCE(SUM(FP.Qta), 0) AS TotaleQuantita
       
-- Dalla tabella "Prodotti" (P) effettua un join con la tabella "FornitoriProdotti" (FP)
-- utilizzando la colonna comune "CodP" per associare ogni prodotto ai fornitori che lo hanno fornito.
FROM Prodotti P
LEFT JOIN FornitoriProdotti FP ON P.CodP = FP.CodP

-- Raggruppa i risultati per il codice e il nome del prodotto.
-- Questo assicura che ogni prodotto sia rappresentato da una riga unica nei risultati.
GROUP BY P.CodP, P.NomeP;
```

### Spiegazione dettagliata:

1. **`SELECT P.NomeP`**:  
   Estrae il nome del prodotto dalla tabella `Prodotti`.

2. **`COALESCE(SUM(FP.Qta), 0) AS TotaleQuantita`**:  
   - Calcola la somma (`SUM`) della quantità (`Qta`) per ogni prodotto fornito.
   - Usa `COALESCE` per sostituire eventuali valori NULL con `0`. Questo è utile per i prodotti che non hanno fornitori registrati nella tabella `FornitoriProdotti`.

3. **`FROM Prodotti P`**:  
   Specifica la tabella principale `Prodotti`, abbreviata come `P`.

4. **`LEFT JOIN FornitoriProdotti FP ON P.CodP = FP.CodP`**:  
   - Utilizza un `LEFT JOIN` per mantenere tutti i prodotti dalla tabella `Prodotti`, anche se non ci sono corrispondenze nella tabella `FornitoriProdotti`.
   - La condizione `ON P.CodP = FP.CodP` associa le righe delle due tabelle in base alla colonna `CodP`, che rappresenta il codice del prodotto.

5. **`GROUP BY P.CodP, P.NomeP`**:  
   - Raggruppa i risultati per prodotto utilizzando le colonne `CodP` (codice prodotto) e `NomeP` (nome prodotto).
   - Necessario per utilizzare la funzione aggregata `SUM` in modo corretto.

### Risultato della Query:
- Ogni riga rappresenta un prodotto.
- Se un prodotto ha fornitori registrati, viene mostrata la somma delle quantità fornite.
- Se un prodotto non ha fornitori registrati, il totale sarà `0` grazie alla funzione `COALESCE`.

---

### **4. Visualizzare i fornitori che forniscono prodotti con quantità maggiore di 50**
```sql
SELECT F.NomeF, P.NomeP, FP.Qta
FROM FornitoriProdotti FP
JOIN Fornitori F ON FP.CodF = F.CodF
JOIN Prodotti P ON FP.CodP = P.CodP
WHERE FP.Qta > 50;
```

---

### **5. Trovare i prodotti non forniti da nessun fornitore**
```sql
SELECT P.NomeP
FROM Prodotti P
LEFT JOIN FornitoriProdotti FP ON P.CodP = FP.CodP
WHERE FP.CodF IS NULL;
```

---

### **6. Trovare i fornitori che forniscono solo prodotti di colore "rosso"**
```sql
SELECT DISTINCT F.NomeF
FROM Fornitori F
JOIN FornitoriProdotti FP ON F.CodF = FP.CodF
JOIN Prodotti P ON FP.CodP = P.CodP
WHERE P.Colore = 'rosso'
  AND F.CodF NOT IN (
      SELECT FP2.CodF
      FROM FornitoriProdotti FP2
      JOIN Prodotti P2 ON FP2.CodP = P2.CodP
      WHERE P2.Colore <> 'rosso'
  );
```

---

### **7. Visualizzare i fornitori che forniscono almeno due prodotti diversi**
```sql
SELECT F.NomeF
FROM Fornitori F
JOIN FornitoriProdotti FP ON F.CodF = FP.CodF
GROUP BY F.CodF, F.NomeF
HAVING COUNT(DISTINCT FP.CodP) >= 2;
```

---

### **8. Trovare i prodotti forniti solo da un unico fornitore**
```sql
SELECT P.NomeP
FROM Prodotti P
JOIN FornitoriProdotti FP ON P.CodP = FP.CodP
GROUP BY P.CodP, P.NomeP
HAVING COUNT(DISTINCT FP.CodF) = 1;
```

---

### **9. Trovare i fornitori che forniscono prodotti con quantità media superiore a 30**
```sql
SELECT F.NomeF
FROM Fornitori F
JOIN FornitoriProdotti FP ON F.CodF = FP.CodF
GROUP BY F.CodF, F.NomeF
HAVING AVG(FP.Qta) > 30;
```

---

### **10. Visualizzare i prodotti e il numero di fornitori che li forniscono**
```sql
SELECT P.NomeP, COUNT(DISTINCT FP.CodF) AS NumeroFornitori
FROM Prodotti P
LEFT JOIN FornitoriProdotti FP ON P.CodP = FP.CodP
GROUP BY P.CodP, P.NomeP;
```

