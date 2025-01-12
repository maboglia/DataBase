# 9 esercizi per sperimentare le principali funzioni di date e tempo in SQL 

---

### **Esercizio 1: Estrarre la data corrente**

**Descrizione:** Visualizza la data corrente per ogni ordine.  
**Query:**

```sql
SELECT id, data_ordine, CURRENT_DATE AS data_corrente 
FROM ordini;
```

---

### **Esercizio 2: Calcolare l'età di un cliente**

**Descrizione:** Calcola l'età in anni di ogni cliente in base alla data di nascita.  
**Query:**

```sql
SELECT nome, cognome, YEAR(CURRENT_DATE) - YEAR(data_nascita) AS eta 
FROM clienti;
```

---

### **Esercizio 3: Estrarre anno, mese e giorno**

**Descrizione:** Estrai l'anno, il mese e il giorno dalla data di un ordine.  
**Query:**

```sql
SELECT id, data_ordine, YEAR(data_ordine) AS anno, MONTH(data_ordine) AS mese, DAY(data_ordine) AS giorno 
FROM ordini;
```

---

### **Esercizio 4: Calcolare la differenza tra date**

**Descrizione:** Calcola il numero di giorni trascorsi tra la data dell'ordine e oggi.  
**Query:**

```sql
SELECT id, data_ordine, DATEDIFF(CURRENT_DATE, data_ordine) AS giorni_trascorsi 
FROM ordini;
```

---

### **Esercizio 5: Aggiungere giorni a una data**

**Descrizione:** Aggiungi 10 giorni alla data di ogni ordine.  
**Query:**

```sql
SELECT id, data_ordine, DATE_ADD(data_ordine, INTERVAL 10 DAY) AS data_modificata 
FROM ordini;
```

---

### **Esercizio 6: Sottrarre mesi da una data**

**Descrizione:** Sottrai 3 mesi alla data di ogni ordine.  
**Query:**

```sql
SELECT id, data_ordine, DATE_SUB(data_ordine, INTERVAL 3 MONTH) AS data_modificata 
FROM ordini;
```

---

### **Esercizio 7: Estrarre il giorno della settimana**

**Descrizione:** Mostra il giorno della settimana per ogni ordine (1 = Domenica, 7 = Sabato).  
**Query:**

```sql
SELECT id, data_ordine, DAYOFWEEK(data_ordine) AS giorno_settimana 
FROM ordini;
```

---

### **Esercizio 8: Formattare una data**

**Descrizione:** Formatta la data degli ordini nel formato "GG/MM/AAAA".  
**Query:**

```sql
SELECT id, data_ordine, DATE_FORMAT(data_ordine, '%d/%m/%Y') AS data_formattata 
FROM ordini;
```

---

### **Esercizio 9: Calcolare il numero di mesi tra due date**

**Descrizione:** Calcola il numero di mesi tra la data dell'ordine e oggi.  
**Query:**

```sql
SELECT id, data_ordine, TIMESTAMPDIFF(MONTH, data_ordine, CURRENT_DATE) AS mesi_trascorsi 
FROM ordini;
```
