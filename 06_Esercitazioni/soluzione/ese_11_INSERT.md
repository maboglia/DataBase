# Esercizi di INSERT

[tabelle](../testo/ese_10_tabelle_esercizi.md)

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

