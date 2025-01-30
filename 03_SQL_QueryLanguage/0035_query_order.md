# Ordine delle istruzioni SQL

**Perché non puoi usare gli alias nella clausola WHERE di una query SQL?**  

L'elaborazione di una query SQL segue un ordine preciso, e questo è il motivo per cui gli alias definiti in `SELECT` non sono disponibili in `WHERE`.  

## **Ordine di esecuzione di una query SQL:**  

- **FROM** → Si identificano le tabelle e si applicano eventuali operazioni di `JOIN`.  
- **WHERE** → Si filtrano i dati *prima* che vengano definiti gli alias in `SELECT`.  
- **SELECT** → Si calcolano i valori e si assegnano gli alias.  
- **ORDER BY** → Qui puoi usare gli alias perché viene eseguito *dopo* `SELECT`.  

## **Esempio errato:**  

```sql
SELECT prezzo * 0.9 AS prezzo_scontato  
FROM prodotti  
WHERE prezzo_scontato > 100; -- Errore! L'alias non è ancora stato definito  
```  

**Soluzioni:**  

---

### **1. Ripetere l'espressione nel `WHERE`**  

```sql
SELECT prezzo * 0.9 AS prezzo_scontato  
FROM prodotti  
WHERE prezzo * 0.9 > 100;  
```  

---

### **2. Usare una subquery**  

```sql
SELECT *  
FROM (SELECT prezzo, prezzo * 0.9 AS prezzo_scontato FROM prodotti) AS sub  
WHERE prezzo_scontato > 100;  
```  

---

### **3. Usare una CTE (Common Table Expression)**  

```sql
WITH sconti AS (  
    SELECT prezzo, prezzo * 0.9 AS prezzo_scontato FROM prodotti  
)  
SELECT *  
FROM sconti  
WHERE prezzo_scontato > 100;  
```  

💡 *Le subquery e le CTE sono particolarmente utili per espressioni complesse o per migliorare la leggibilità del codice.*  
