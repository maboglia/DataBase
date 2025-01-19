# **Right Join in SQL**

Un **`RIGHT JOIN`** restituisce tutte le righe della tabella a destra (la seconda tabella nella query), anche se non ci sono corrispondenze nella tabella a sinistra. Se non ci sono corrispondenze nella tabella a sinistra, i valori delle colonne della tabella sinistra saranno `NULL`.

---

### **Sintassi Base**

```sql
SELECT colonne
FROM tabella1
RIGHT JOIN tabella2
ON tabella1.colonna = tabella2.colonna;
```

---

### **Esempio Pratico**

#### **Tabelle di esempio**

1. **Clienti**:
| ClienteID | Nome     | Città      |
|-----------|----------|------------|
| 1         | Maria    | Milano     |
| 2         | Luca     | Roma       |
| 3         | Anna     | Napoli     |

2. **Ordini**:
| OrdineID | ClienteID | DataOrdine |
|----------|-----------|------------|
| 101      | 1         | 2025-01-10 |
| 102      | 3         | 2025-01-11 |
| 103      | 4         | 2025-01-12 |

---

#### **Query Right Join**

Ottenere tutti gli ordini, insieme ai nomi dei clienti (se disponibili):

```sql
SELECT Clienti.Nome, Ordini.OrdineID, Ordini.DataOrdine
FROM Clienti
RIGHT JOIN Ordini
ON Clienti.ClienteID = Ordini.ClienteID;
```

---

#### **Risultato**

| Nome     | OrdineID | DataOrdine |
|----------|----------|------------|
| Maria    | 101      | 2025-01-10 |
| Anna     | 102      | 2025-01-11 |
| NULL     | 103      | 2025-01-12 |

---

### **Spiegazione**

1. **Tutti gli ordini inclusi**: La tabella **Ordini** è a destra, quindi tutte le sue righe sono incluse nell'output, anche se non ci sono corrispondenze nella tabella **Clienti**.
2. **Valori `NULL` per corrispondenze mancanti**: L'ordine con **OrdineID 103** non ha un **ClienteID** corrispondente nella tabella **Clienti**, quindi il valore per il nome del cliente è `NULL`.
3. **Relazione definita**: La condizione `ON Clienti.ClienteID = Ordini.ClienteID` specifica il campo di collegamento tra le due tabelle.

---

### **Uso Comune**

I **RIGHT JOIN** sono utili quando:

- Si vogliono conservare tutti i dati da una tabella (la tabella a destra), indipendentemente dall'esistenza di corrispondenze in un'altra tabella.
- Si analizzano situazioni in cui la tabella a destra contiene tutti i dati principali, ma potrebbe avere valori mancanti o non corrispondenti nella tabella a sinistra.
  - Ad esempio, ottenere tutti gli ordini, anche quelli senza un cliente registrato.
  - Elencare tutte le transazioni anche se non ci sono dettagli relativi ai dipendenti associati.
