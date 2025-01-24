# Tabelle per esercitazione ESE

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

## Dati fake

Ecco le istruzioni SQL per inserire 10 record fittizi in ciascuna delle tabelle descritte:

---

### **1. Inserire record nella tabella `Prodotti`**

```sql
INSERT INTO Prodotti (CodP, NomeP, Colore, Taglia, Magazzino) VALUES
('P001', 'Maglietta', 'Rosso', 'M', 'MZ01'),
('P002', 'Pantaloni', 'Blu', 'L', 'MZ02'),
('P003', 'Scarpe', 'Nero', '42', 'MZ03'),
('P004', 'Cappello', 'Verde', 'Unica', 'MZ01'),
('P005', 'Giacca', 'Grigio', 'XL', 'MZ02'),
('P006', 'Zaino', 'Rosso', NULL, 'MZ03'),
('P007', 'Occhiali', 'Nero', 'Unica', 'MZ01'),
('P008', 'Guanti', 'Bianco', 'M', 'MZ02'),
('P009', 'Cintura', 'Marrone', 'L', 'MZ03'),
('P010', 'Orologio', 'Oro', 'Unica', 'MZ01');
```

---

### **2. Inserire record nella tabella `Fornitori`**

```sql
INSERT INTO Fornitori (CodF, NomeF, NSoci, Sede) VALUES
('F001', 'Forniture Srl', 10, 'Milano'),
('F002', 'Prodotti Spa', 15, 'Roma'),
('F003', 'Servizi & Co.', 8, 'Napoli'),
('F004', 'Global Supply', 20, 'Torino'),
('F005', 'Tech Parts', 5, 'Bologna'),
('F006', 'Fashion Line', 12, 'Firenze'),
('F007', 'Home Goods', 6, 'Verona'),
('F008', 'Quick Deliver', 9, 'Genova'),
('F009', 'Market Solutions', 7, 'Palermo'),
('F010', 'Green Supply', 4, 'Venezia');
```

---

### **3. Inserire record nella tabella `Clienti`**

```sql
INSERT INTO Clienti (CodCliente, Nome, Email, DataRegistrazione) VALUES
('C001', 'Mario Rossi', 'mario.rossi@example.com', '2024-01-01'),
('C002', 'Anna Bianchi', 'anna.bianchi@example.com', '2024-01-02'),
('C003', 'Luca Verdi', 'luca.verdi@example.com', '2024-01-03'),
('C004', 'Giulia Neri', 'giulia.neri@example.com', '2024-01-04'),
('C005', 'Marco Gialli', 'marco.gialli@example.com', '2024-01-05'),
('C006', 'Elisa Blu', 'elisa.blu@example.com', '2024-01-06'),
('C007', 'Francesco Viola', 'francesco.viola@example.com', '2024-01-07'),
('C008', 'Chiara Marrone', 'chiara.marrone@example.com', '2024-01-08'),
('C009', 'Alessio Rosa', 'alessio.rosa@example.com', '2024-01-09'),
('C010', 'Sara Arancio', 'sara.arancio@example.com', '2024-01-10');
```

---

### **4. Inserire record nella tabella `ProdottiArchivio`**

```sql
INSERT INTO ProdottiArchivio (CodP, NomeP, Colore, Taglia) VALUES
('A001', 'Maglietta Vintage', 'Rosso', 'M'),
('A002', 'Pantaloni Retrò', 'Blu', 'L'),
('A003', 'Scarpe Classiche', 'Nero', '42'),
('A004', 'Cappello d\'Epoca', 'Verde', 'Unica'),
('A005', 'Giacca Pesante', 'Grigio', 'XL'),
('A006', 'Zaino Montagna', 'Rosso', NULL),
('A007', 'Occhiali Retrò', 'Nero', 'Unica'),
('A008', 'Guanti Termici', 'Bianco', 'M'),
('A009', 'Cintura di Cuoio', 'Marrone', 'L'),
('A010', 'Orologio Vintage', 'Oro', 'Unica');
```

---

### **5. Inserire record nella tabella `Ordini`**

```sql
INSERT INTO Ordini (CodOrdine, CodCliente, DataOrdine) VALUES
('O001', 'C001', '2024-01-11'),
('O002', 'C002', '2024-01-12'),
('O003', 'C003', '2024-01-13'),
('O004', 'C004', '2024-01-14'),
('O005', 'C005', '2024-01-15'),
('O006', 'C006', '2024-01-16'),
('O007', 'C007', '2024-01-17'),
('O008', 'C008', '2024-01-18'),
('O009', 'C009', '2024-01-19'),
('O010', 'C010', '2024-01-20');
```

---

### **6. Inserire record nella tabella `Vendite`**

```sql
INSERT INTO Vendite (CodVendita, CodProdotto, Quantita, PrezzoUnitario, Totale) VALUES
('V001', 'P001', 10, 15.99, 159.90),
('V002', 'P002', 5, 29.99, 149.95),
('V003', 'P003', 8, 49.99, 399.92),
('V004', 'P004', 12, 9.99, 119.88),
('V005', 'P005', 6, 89.99, 539.94),
('V006', 'P006', 3, 59.99, 179.97),
('V007', 'P007', 15, 19.99, 299.85),
('V008', 'P008', 10, 12.99, 129.90),
('V009', 'P009', 4, 24.99, 99.96),
('V010', 'P010', 2, 199.99, 399.98);
```

---

### **7. Inserire record nella tabella `FornitoriProdotti`**

```sql
INSERT INTO FornitoriProdotti (CodF, CodP, Qta) VALUES
('F001', 'P001', 100),
('F002', 'P002', 200),
('F003', 'P003', 150),
('F004', 'P004', 250),
('F005', 'P005', 300),
('F006', 'P006', 50),
('F007', 'P007', 80),
('F008', 'P008', 70),
('F009', 'P009', 90),
('F010', 'P010', 60);
```

---

### **8. Inserire record nella tabella `OrdiniTemp`**

```sql
INSERT INTO OrdiniTemp (CodOrdine, CodCliente, DataOrdine) VALUES
('T001', 'C001', '2024-01-21'),
('T002', 'C002', '2024-01-22'),
('T003', 'C003', '2024-01-23'),
('T004', 'C004', '2024-01-24'),
('T005', 'C005', '2024-01-25'),
('T006', 'C006', '2024-01-26'),
('T007', 'C007', '2024-01-27'),
('T008', 'C008', '2024-01-28'),
('T009', 'C009', '2024-01-29'),
('T010', 'C010', '2024-01-30');
```
