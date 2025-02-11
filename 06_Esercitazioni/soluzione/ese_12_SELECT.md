# Esercizi di SELECT

[tabelle](../testo/ese_10_tabelle_esercizi.md)

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

