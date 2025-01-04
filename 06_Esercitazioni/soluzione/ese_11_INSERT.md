# Esercizi di INSERT

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

Esegui 10 esercizi di `INSERT` in SQL per esercitarsi con la sintassi e i concetti. 

---

### **1. Inserire un singolo record**
Inserire un prodotto nella tabella `Prodotti`:
```sql
INSERT INTO Prodotti (CodP, NomeP, Colore, Taglia, Magazzino)
VALUES ('P001', 'Maglietta', 'Rosso', 'M', 'MZ001');
```

---

### **2. Inserire più record in una sola istruzione**
Inserire più fornitori nella tabella `Fornitori`:
```sql
INSERT INTO Fornitori (CodF, NomeF, NSoci, Sede)
VALUES 
    ('F001', 'Fornitore A', 3, 'Torino'),
    ('F002', 'Fornitore B', 5, 'Milano'),
    ('F003', 'Fornitore C', 2, 'Roma');
```

---

### **3. Inserire un record parziale**
Inserire un cliente con alcuni campi lasciati nulli:
```sql
INSERT INTO Clienti (CodCliente, Nome, Email)
VALUES ('C001', 'Mario Rossi', NULL);
```

---

### **4. Inserire un record calcolato da un'altra tabella**
Copiare un prodotto dalla tabella `Prodotti` alla tabella `ProdottiArchivio`:
```sql
INSERT INTO ProdottiArchivio (CodP, NomeP, Colore, Taglia)
SELECT CodP, NomeP, Colore, Taglia FROM Prodotti WHERE CodP = 'P001';
```

---

### **5. Inserire una riga con una sottoquery**
Inserire un ordine per il cliente più recente:
```sql
INSERT INTO Ordini (CodOrdine, CodCliente, DataOrdine)
SELECT 'O001', CodCliente, GETDATE()
FROM Clienti
WHERE DataRegistrazione = (SELECT MAX(DataRegistrazione) FROM Clienti);
```

---

### **6. Inserire un record con valori default**
Inserire un fornitore con i valori predefiniti per alcuni campi:
```sql
INSERT INTO Fornitori (CodF, NomeF)
VALUES ('F004', 'Fornitore D');
```

---

### **7. Inserire dati con valori calcolati**
Inserire un record nella tabella `Vendite` calcolando il totale:
```sql
INSERT INTO Vendite (CodVendita, CodProdotto, Quantita, PrezzoUnitario, Totale)
VALUES ('V001', 'P002', 5, 20, 5 * 20);
```

---

### **8. Inserire dati duplicati con modifiche**
Duplicare un prodotto con un nuovo codice e colore:
```sql
INSERT INTO Prodotti (CodP, NomeP, Colore, Taglia, Magazzino)
SELECT 'P002', NomeP, 'Blu', Taglia, Magazzino
FROM Prodotti WHERE CodP = 'P001';
```

---

### **9. Inserire dati nella tabella di associazione**
Aggiungere una relazione tra fornitori e prodotti:
```sql
INSERT INTO FornitoriProdotti (CodF, CodP, Qta)
VALUES ('F001', 'P003', 100);
```

---

### **10. Inserire dati provenienti da una tabella di log**
Inserire tutti i record da una tabella temporanea a una tabella definitiva:
```sql
INSERT INTO Ordini (CodOrdine, CodCliente, DataOrdine)
SELECT CodOrdine, CodCliente, DataOrdine FROM OrdiniTemp;
```

