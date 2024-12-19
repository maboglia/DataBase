Ecco 10 query base che puoi utilizzare per esercitarti con SQL sulla [tabella `automobili`](../09_data/automobili.sql):

---

### 1. **Selezionare tutte le auto nella tabella**

```sql
SELECT * 
FROM automobili;
```

---

### 2. **Visualizzare solo marca, modello e prezzo di tutte le auto**

```sql
SELECT marca, modello, prezzo 
FROM automobili;
```

---

### 3. **Trovare tutte le auto con un prezzo inferiore a 20.000 euro**

```sql
SELECT * 
FROM automobili 
WHERE prezzo < 20000;
```

---

### 4. **Selezionare tutte le auto con 5 posti**

```sql
SELECT * 
FROM automobili 
WHERE posti = 5;
```

---

### 5. **Ordinare le auto in base al prezzo in ordine decrescente**

```sql
SELECT * 
FROM automobili 
ORDER BY prezzo DESC;
```

---

### 6. **Calcolare la media del prezzo delle auto**

```sql
SELECT AVG(prezzo) AS media_prezzo 
FROM automobili;
```

---

### 7. **Contare quante auto hanno una cilindrata superiore a 1600cc**

```sql
SELECT COUNT(*) AS auto_grandi_cilindrata 
FROM automobili 
WHERE cilindrata > 1600;
```

---

### 8. **Elencare tutte le marche presenti nella tabella senza duplicati**

```sql
SELECT DISTINCT marca 
FROM automobili;
```

---

### 9. **Trovare la marca e il modello dell'auto più costosa**

```sql
SELECT marca, modello, prezzo 
FROM automobili 
ORDER BY prezzo DESC 
LIMIT 1;
```

---

### 10. **Trovare tutte le auto con un prezzo tra 20.000 e 30.000 euro**

```sql
SELECT * 
FROM automobili 
WHERE prezzo BETWEEN 20000 AND 30000;
```

---

### Approfondimento

Queste query coprono diversi aspetti dell'SQL, come:

- **Filtrare i dati** (con `WHERE` e `BETWEEN`)
- **Ordinare i risultati** (con `ORDER BY`)
- **Funzioni aggregate** (es. `AVG`, `COUNT`)
- **Selezione di colonne specifiche** (per ottimizzare l'output)
- **Rimuovere duplicati** (con `DISTINCT`).

