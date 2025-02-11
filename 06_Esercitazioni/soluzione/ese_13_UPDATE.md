# Esercizi di UPDATE

[tabelle](../testo/ese_10_tabelle_esercizi.md)

---

Esegui 10 esercizi di `UPDATE` in SQL per esercitarsi con la sintassi e i concetti. 

---

### **1. Aggiornare il colore dei prodotti con il codice "P001" in "rosso"**
```sql
UPDATE Prodotti
SET Colore = 'rosso'
WHERE CodP = 'P001';
```

---

### **2. Incrementare il numero di soci di tutti i fornitori con sede a "Milano" di 2**
```sql
UPDATE Fornitori
SET NSoci = NSoci + 2
WHERE Sede = 'Milano';
```

---

### **3. Aggiornare il magazzino del prodotto "P002" a "MZ002"**
```sql
UPDATE Prodotti
SET Magazzino = 'MZ002'
WHERE CodP = 'P002';
```

---

### **4. Ridurre del 10% la quantità disponibile per tutti i prodotti forniti da "F001"**
```sql
UPDATE FornitoriProdotti
SET Qta = Qta * 0.9
WHERE CodF = 'F001';
```

---

### **5. Impostare il colore dei prodotti senza un colore definito a "bianco"**
```sql
UPDATE Prodotti
SET Colore = 'bianco'
WHERE Colore IS NULL;
```

---

### **6. Cambiare l'indirizzo di tutti i fornitori con codice "F002" in "Via Roma, 10"**
```sql
UPDATE Fornitori
SET Sede = 'Via Roma, 10'
WHERE CodF = 'F002';
```

---

### **7. Impostare la quantità a 0 per i prodotti mai forniti da alcun fornitore**
```sql
UPDATE Prodotti
SET Magazzino = 'Non fornito'
WHERE CodP NOT IN (SELECT DISTINCT CodP FROM FornitoriProdotti);
```

---

### **8. Aggiornare la sede dei fornitori con meno di 3 soci a "Sede Sconosciuta"**
```sql
UPDATE Fornitori
SET Sede = 'Sede Sconosciuta'
WHERE NSoci < 3;
```

---

### **9. Cambiare la taglia di tutti i prodotti di colore "verde" a "L"**
```sql
UPDATE Prodotti
SET Taglia = 'L'
WHERE Colore = 'verde';
```

---

### **10. Aggiornare il nome dei fornitori che hanno fornito almeno un prodotto con quantità superiore a 100 in "Fornitore Premium"**
```sql
UPDATE Fornitori
SET NomeF = 'Fornitore Premium'
WHERE CodF IN (
    SELECT CodF
    FROM FornitoriProdotti
    WHERE Qta > 100
);
```

