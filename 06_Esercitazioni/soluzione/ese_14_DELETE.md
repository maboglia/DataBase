
# Esercizi di DELETE

[tabelle](../testo/ese_10_tabelle_esercizi.md)

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

