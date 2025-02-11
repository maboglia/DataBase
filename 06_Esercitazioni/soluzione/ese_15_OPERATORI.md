# Esercizi con OPERATORI

[tabelle](../testo/ese_10_tabelle_esercizi.md)

---

Esegui 10 esercizi di `OPERATORI` in SQL per esercitarsi con la sintassi e i concetti.

---

Questi esercizi coprono diversi tipi di operatori: 
- **Aritmetici** (`+`, `*`, `/`)
- **Logici** (`AND`, `OR`, `NOT`)
- **Di confronto** (`=`, `<>`, `>=`, `BETWEEN`)
- **Speciali** (`LIKE`, `IN`).

---

### **1. Selezionare il nome e il prezzo aumentato del 10% per tutti i prodotti**
```sql
SELECT NomeP, Prezzo * 1.1 AS NuovoPrezzo
FROM Prodotti;
```

---

### **2. Trovare i prodotti con un prezzo tra 50 e 100 (inclusi)**
```sql
SELECT NomeP, Prezzo
FROM Prodotti
WHERE Prezzo BETWEEN 50 AND 100;
```

---

### **3. Visualizzare i fornitori con un numero di soci maggiore o uguale a 10**
```sql
SELECT NomeF, NSoci
FROM Fornitori
WHERE NSoci >= 10;
```

---

### **4. Calcolare la quantità totale fornita per ogni prodotto**
```sql
SELECT CodP, SUM(Qta) AS TotaleQuantita
FROM FornitoriProdotti
GROUP BY CodP;
```

---

### **5. Trovare i fornitori con il nome che inizia con "A"**
```sql
SELECT NomeF
FROM Fornitori
WHERE NomeF LIKE 'A%';
```

---

### **6. Mostrare tutti i prodotti che non sono né rossi né gialli**
```sql
SELECT NomeP, Colore
FROM Prodotti
WHERE Colore NOT IN ('rosso', 'giallo');
```

---

### **7. Trovare i fornitori che si trovano in città diverse da "Milano"**
```sql
SELECT NomeF, Sede
FROM Fornitori
WHERE Sede <> 'Milano';
```

---

### **8. Calcolare la media delle quantità fornite da ciascun fornitore**
```sql
SELECT CodF, AVG(Qta) AS MediaQuantita
FROM FornitoriProdotti
GROUP BY CodF;
```

---

### **9. Selezionare tutti i fornitori che forniscono almeno un prodotto in quantità superiore a 50**
```sql
SELECT DISTINCT CodF
FROM FornitoriProdotti
WHERE Qta > 50;
```

---

### **10. Visualizzare i prodotti con prezzo maggiore di 20 e in magazzini diversi da "MZ001"**
```sql
SELECT NomeP, Prezzo, Magazzino
FROM Prodotti
WHERE Prezzo > 20 AND Magazzino <> 'MZ001';
```

