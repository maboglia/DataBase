# **Left Join in SQL**

Un **`LEFT JOIN`** restituisce tutte le righe della tabella a sinistra (prima tabella nella query), anche se non ci sono corrispondenze nella tabella a destra. Per le righe della tabella a sinistra senza corrispondenza, i valori delle colonne della tabella destra saranno `NULL`.

---

### **Sintassi Base**

```sql
SELECT colonne
FROM tabella1
LEFT JOIN tabella2
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
| 4         | Marco    | Firenze    |

2. **Ordini**:
| OrdineID | ClienteID | DataOrdine |
|----------|-----------|------------|
| 101      | 1         | 2025-01-10 |
| 102      | 3         | 2025-01-11 |

---

#### **Query Left Join**

Ottenere i nomi di tutti i clienti e, se presenti, i loro ordini:

```sql
SELECT Clienti.Nome, Ordini.OrdineID, Ordini.DataOrdine
FROM Clienti
LEFT JOIN Ordini
ON Clienti.ClienteID = Ordini.ClienteID;
```

---

#### **Risultato**

| Nome     | OrdineID | DataOrdine |
|----------|----------|------------|
| Maria    | 101      | 2025-01-10 |
| Luca     | NULL     | NULL       |
| Anna     | 102      | 2025-01-11 |
| Marco    | NULL     | NULL       |

---

### **Spiegazione**

1. **Tutti i clienti inclusi**: La tabella **Clienti** è a sinistra, quindi tutte le sue righe sono incluse nell'output, anche se non hanno ordini associati.
2. **Valori `NULL` per corrispondenze mancanti**: Per i clienti Luca e Marco, che non hanno corrispondenze nella tabella **Ordini**, i valori delle colonne di questa tabella sono `NULL`.
3. **Relazione definita**: La condizione `ON Clienti.ClienteID = Ordini.ClienteID` specifica il campo di collegamento tra le due tabelle.

---

### **Uso Comune**

I **LEFT JOIN** sono utili quando:

- Si vogliono conservare tutti i dati da una tabella, indipendentemente dall'esistenza di corrispondenze in un'altra tabella.
- Si analizzano dati incompleti o si cerca di identificare valori mancanti. Ad esempio:
  - Clienti senza ordini.
  - Dipendenti non assegnati a progetti.
  - Studenti non iscritti a corsi.
