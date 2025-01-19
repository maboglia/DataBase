# **Inner Join in SQL**

Un **`INNER JOIN`** combina righe di due tabelle basandosi su una condizione che deve essere soddisfatta. L'output dell'operazione include solo le righe in cui i valori nelle colonne specificate coincidono in entrambe le tabelle.

---

### **Sintassi Base**

```sql
SELECT colonne
FROM tabella1
INNER JOIN tabella2
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
| 103      | 4         | 2025-01-12 |

---

#### **Query Inner Join**

Ottenere i nomi dei clienti e i loro ordini:

```sql
SELECT Clienti.Nome, Ordini.OrdineID, Ordini.DataOrdine
FROM Clienti
INNER JOIN Ordini
ON Clienti.ClienteID = Ordini.ClienteID;
```

---

#### **Risultato**

| Nome     | OrdineID | DataOrdine |
|----------|----------|------------|
| Maria    | 101      | 2025-01-10 |
| Anna     | 102      | 2025-01-11 |
| Marco    | 103      | 2025-01-12 |

---

### **Spiegazione**

1. **Chiave di unione**: La condizione `ON Clienti.ClienteID = Ordini.ClienteID` collega le due tabelle tramite il campo `ClienteID`.
2. **Output filtrato**: Solo i record presenti in entrambe le tabelle vengono inclusi. Ad esempio:
   - Luca (ClienteID = 2) non appare nell'output perché non ha ordini nella tabella **Ordini**.
3. **Nessuna riga vuota**: L'`INNER JOIN` esclude i record che non hanno corrispondenze in una delle due tabelle.

---

### **Uso Comune**

Gli **INNER JOIN** sono utili per:

- Collegare tabelle correlate.
- Estrarre dati basati su relazioni definite, ad esempio clienti con ordini, studenti iscritti a corsi, ecc.
