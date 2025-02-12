# Esercizi con GROUP BY

[tabelle](../testo/ese_10_tabelle_esercizi.md)

---

Esegui 10 esercizi di `GROUP BY` in SQL per esercitarsi con la sintassi e i concetti.

---

Questi esercizi includono:
- **Funzioni aggregate**: `SUM`, `COUNT`, `AVG`, `MAX`.
- **GROUP BY**: per raggruppare i dati e calcolare metriche aggregate.
- **HAVING**: per filtrare i risultati basandosi sulle funzioni aggregate.
- **Ordinamento**: utilizzando `ORDER BY` e combinazioni con `LIMIT`.

---

### **1. Contare il numero totale di prodotti disponibili**
```sql
SELECT COUNT(*) AS NumeroProdotti
FROM Prodotti;
```

---

### **2. Calcolare la quantità totale fornita per ogni prodotto**
```sql
SELECT P.NomeP, SUM(FP.Qta) AS QuantitaTotale
FROM Prodotti P
JOIN FornitoriProdotti FP ON P.CodP = FP.CodP
GROUP BY P.CodP, P.NomeP;
```

---

### **3. Determinare la quantità media di prodotti forniti da ciascun fornitore**
```sql
SELECT F.NomeF, AVG(FP.Qta) AS QuantitaMedia
FROM Fornitori F
JOIN FornitoriProdotti FP ON F.CodF = FP.CodF
GROUP BY F.CodF, F.NomeF;
```

---

### **4. Calcolare il numero di fornitori per ciascun prodotto**
```sql
SELECT P.NomeP, COUNT(DISTINCT FP.CodF) AS NumeroFornitori
FROM Prodotti P
LEFT JOIN FornitoriProdotti FP ON P.CodP = FP.CodP
GROUP BY P.CodP, P.NomeP;
```

---

### **5. Trovare il prodotto con la quantità massima fornita**
```sql
SELECT P.NomeP, MAX(FP.Qta) AS QuantitaMassima
FROM Prodotti P
JOIN FornitoriProdotti FP ON P.CodP = FP.CodP
GROUP BY P.CodP, P.NomeP
ORDER BY QuantitaMassima DESC
LIMIT 1;
```

---

### **6. Determinare la quantità totale fornita per ciascun colore di prodotto**
```sql
SELECT P.Colore, SUM(FP.Qta) AS QuantitaTotale
FROM Prodotti P
JOIN FornitoriProdotti FP ON P.CodP = FP.CodP
GROUP BY P.Colore;
```

---

### **7. Contare il numero di prodotti forniti da ogni fornitore**
```sql
SELECT F.NomeF, COUNT(DISTINCT FP.CodP) AS NumeroProdotti
FROM Fornitori F
JOIN FornitoriProdotti FP ON F.CodF = FP.CodF
GROUP BY F.CodF, F.NomeF;
```

---

### **8. Calcolare il numero medio di soci dei fornitori per città**
```sql
SELECT F.Sede, AVG(F.NSoci) AS NumeroMedioSoci
FROM Fornitori F
GROUP BY F.Sede;
```

---

### **9. Trovare i prodotti con una quantità totale fornita superiore a 100**
```sql
SELECT P.NomeP, SUM(FP.Qta) AS QuantitaTotale
FROM Prodotti P
JOIN FornitoriProdotti FP ON P.CodP = FP.CodP
GROUP BY P.CodP, P.NomeP
HAVING SUM(FP.Qta) > 100;
```

---

### **10. Determinare il numero di prodotti forniti e la quantità totale fornita da fornitori con più di 5 soci**
```sql
SELECT F.NomeF, COUNT(DISTINCT FP.CodP) AS NumeroProdotti, SUM(FP.Qta) AS QuantitaTotale
FROM Fornitori F
JOIN FornitoriProdotti FP ON F.CodF = FP.CodF
WHERE F.NSoci > 5
GROUP BY F.CodF, F.NomeF;
```

---


### **11. Contare il numero di ordini effettuati da ciascun cliente**

```sql
SELECT C.Nome, COUNT(O.CodOrdine) AS NumeroOrdini
FROM Clienti C
LEFT JOIN Ordini O ON C.CodCliente = O.CodCliente
GROUP BY C.CodCliente, C.Nome;
```

---

### **12. Calcolare il totale delle vendite per ciascun prodotto**

```sql
SELECT P.NomeP, SUM(V.Quantita * V.PrezzoUnitario) AS TotaleVendite
FROM Prodotti P
JOIN Vendite V ON P.CodP = V.CodProdotto
GROUP BY P.CodP, P.NomeP;
```

---

### **13. Determinare la quantità media venduta per ciascun prodotto**

```sql
SELECT P.NomeP, AVG(V.Quantita) AS QuantitaMediaVenduta
FROM Prodotti P
JOIN Vendite V ON P.CodP = V.CodProdotto
GROUP BY P.CodP, P.NomeP;
```

---

### **14. Trovare i clienti che hanno effettuato più di 2 ordini**

```sql
SELECT C.Nome, COUNT(O.CodOrdine) AS NumeroOrdini
FROM Clienti C
JOIN Ordini O ON C.CodCliente = O.CodCliente
GROUP BY C.CodCliente, C.Nome
HAVING COUNT(O.CodOrdine) > 2;
```

---

### **15. Calcolare il numero totale di prodotti per ciascun magazzino**

```sql
SELECT P.Magazzino, COUNT(P.CodP) AS NumeroProdotti
FROM Prodotti P
GROUP BY P.Magazzino;
```

---

### **16. Determinare il massimo e il minimo totale di una vendita per ciascun prodotto**

```sql
SELECT P.NomeP, MAX(V.Totale) AS MaxTotaleVendita, MIN(V.Totale) AS MinTotaleVendita
FROM Prodotti P
JOIN Vendite V ON P.CodP = V.CodProdotto
GROUP BY P.CodP, P.NomeP;
```

---

### **17. Contare il numero di ordini effettuati per ciascun mese**

```sql
SELECT MONTH(O.DataOrdine) AS Mese, COUNT(O.CodOrdine) AS NumeroOrdini
FROM Ordini O
GROUP BY MONTH(O.DataOrdine)
ORDER BY Mese;
```

---

### **18. Determinare il totale delle vendite per ciascun cliente**

```sql
SELECT C.Nome, SUM(V.Totale) AS TotaleSpeso
FROM Clienti C
JOIN Ordini O ON C.CodCliente = O.CodCliente
JOIN Vendite V ON O.CodOrdine = V.CodVendita
GROUP BY C.CodCliente, C.Nome;
```

---

### **19. Trovare i fornitori che hanno fornito più di 50 unità di prodotti in totale**

```sql
SELECT F.NomeF, SUM(FP.Qta) AS QuantitaTotaleFornita
FROM Fornitori F
JOIN FornitoriProdotti FP ON F.CodF = FP.CodF
GROUP BY F.CodF, F.NomeF
HAVING SUM(FP.Qta) > 50;
```

---

### **20. Determinare il numero di prodotti venduti per ciascun giorno**

```sql
SELECT O.DataOrdine, SUM(V.Quantita) AS ProdottiVenduti
FROM Ordini O
JOIN Vendite V ON O.CodOrdine = V.CodVendita
GROUP BY O.DataOrdine
ORDER BY O.DataOrdine;
```
