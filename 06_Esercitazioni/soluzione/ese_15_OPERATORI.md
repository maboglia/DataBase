# Esercizi di DELETE

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

Esegui 10 esercizi di `DELETE` in SQL per esercitarsi con la sintassi e i concetti.

---

### **1. Eliminare i prodotti con magazzino "MZ003"**

```sql
DELETE FROM Prodotti
WHERE Magazzino = 'MZ003';
```

---

### **2. Rimuovere tutti i fornitori con sede a "Napoli"**
```sql
DELETE FROM Fornitori
WHERE Sede = 'Napoli';
```

---

### **3. Eliminare tutte le relazioni prodotto-fornitore per il prodotto con codice "P004"**
```sql
DELETE FROM FornitoriProdotti
WHERE CodP = 'P004';
```

---

### **4. Rimuovere tutti i prodotti con colore "nero"**
```sql
DELETE FROM Prodotti
WHERE Colore = 'nero';
```

---

### **5. Eliminare tutti i fornitori con meno di 5 soci**
```sql
DELETE FROM Fornitori
WHERE NSoci < 5;
```

---

### **6. Eliminare le relazioni prodotto-fornitore per i fornitori con codice "F003"**
```sql
DELETE FROM FornitoriProdotti
WHERE CodF = 'F003';
```

---

### **7. Eliminare tutti i prodotti mai forniti da alcun fornitore**
```sql
DELETE FROM Prodotti
WHERE CodP NOT IN (SELECT DISTINCT CodP FROM FornitoriProdotti);
```

---

### **8. Rimuovere tutti i fornitori che non hanno fornito prodotti**
```sql
DELETE FROM Fornitori
WHERE CodF NOT IN (SELECT DISTINCT CodF FROM FornitoriProdotti);
```

---

### **9. Eliminare tutti i prodotti con quantità inferiore a 10 in qualsiasi relazione prodotto-fornitore**
```sql
DELETE FROM FornitoriProdotti
WHERE Qta < 10;
```

---

### **10. Rimuovere tutti i prodotti di taglia "S" e colore "giallo"**
```sql
DELETE FROM Prodotti
WHERE Taglia = 'S' AND Colore = 'giallo';
```

