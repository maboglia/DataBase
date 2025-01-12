# 9 esercizi per sperimentare le principali funzioni numeriche in SQL  

---

### **Esercizio 1: Arrotondare un numero**

**Descrizione:** Arrotonda il prezzo dei prodotti a due decimali.  
**Query:**

```sql
SELECT nome, prezzo, ROUND(prezzo, 2) AS prezzo_arrotondato 
FROM prodotti;
```

---

### **Esercizio 2: Trovare il valore assoluto**

**Descrizione:** Calcola il valore assoluto della differenza tra quantità e 50.  
**Query:**

```sql
SELECT nome, quantita, ABS(quantita - 50) AS differenza_assoluta 
FROM prodotti;
```

---

### **Esercizio 3: Calcolare la potenza**

**Descrizione:** Calcola il quadrato della quantità dei prodotti.  
**Query:**

```sql
SELECT nome, quantita, POWER(quantita, 2) AS quantita_al_quadrato 
FROM prodotti;
```

---

### **Esercizio 4: Calcolare la radice quadrata**

**Descrizione:** Trova la radice quadrata del prezzo di ogni prodotto.  
**Query:**

```sql
SELECT nome, prezzo, SQRT(prezzo) AS radice_prezzo 
FROM prodotti;
```

---

### **Esercizio 5: Generare numeri casuali**

**Descrizione:** Associa un numero casuale a ogni cliente.  
**Query:**

```sql
SELECT nome, cognome, RAND() AS numero_casuale 
FROM clienti;
```

---

### **Esercizio 6: Trovare il valore massimo e minimo**

**Descrizione:** Mostra il prezzo massimo e minimo dei prodotti.  
**Query:**

```sql
SELECT MAX(prezzo) AS prezzo_massimo, MIN(prezzo) AS prezzo_minimo 
FROM prodotti;
```

---

### **Esercizio 7: Arrotondare per eccesso e per difetto**

**Descrizione:** Mostra il prezzo arrotondato per eccesso e per difetto.  
**Query:**

```sql
SELECT nome, prezzo, CEIL(prezzo) AS arrotondato_eccesso, FLOOR(prezzo) AS arrotondato_difetto 
FROM prodotti;
```

---

### **Esercizio 8: Calcolare il resto della divisione (MOD)**

**Descrizione:** Trova il resto della divisione tra quantità e 3 per ogni prodotto.  
**Query:**

```sql
SELECT nome, quantita, MOD(quantita, 3) AS resto_divisione 
FROM prodotti;
```

---

### **Esercizio 9: Calcolare una media**

**Descrizione:** Calcola la media dei prezzi dei prodotti.  
**Query:**

```sql
SELECT AVG(prezzo) AS prezzo_medio 
FROM prodotti;
```

