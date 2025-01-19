# **USING nelle JOIN in SQL**

Il termine **`USING`** viene utilizzato per semplificare la sintassi di una `JOIN` quando le colonne che si vogliono collegare nelle tabelle hanno lo stesso nome. Con **`USING`**, non è necessario specificare l'intero nome della tabella (come si fa con `ON`), ma si può semplicemente indicare il nome della colonna comune.

#### **Sintassi**

```sql
SELECT colonne
FROM tabella1
JOIN tabella2
USING (colonna_comune);
```

---

### **Esempio di JOIN con USING**

#### **Tabelle di esempio**

1. **Clienti**:
| ClienteID | Nome   | Città    |
|-----------|--------|----------|
| 1         | Maria  | Milano   |
| 2         | Luca   | Roma     |
| 3         | Anna   | Napoli   |

2. **Ordini**:
| OrdineID | ClienteID | DataOrdine |
|----------|-----------|------------|
| 101      | 1         | 2025-01-10 |
| 102      | 2         | 2025-01-11 |
| 103      | 3         | 2025-01-12 |

Entrambe le tabelle contengono la colonna **`ClienteID`**.

---

#### **Query con `USING`**

Supponiamo di voler ottenere una lista degli ordini con i nomi dei clienti associati. Poiché la colonna **`ClienteID`** appare in entrambe le tabelle, possiamo scrivere la query in questo modo:

```sql
SELECT Clienti.Nome, Ordini.OrdineID, Ordini.DataOrdine
FROM Clienti
JOIN Ordini
USING (ClienteID);
```

---

#### **Risultato**

| Nome  | OrdineID | DataOrdine |
|-------|----------|------------|
| Maria | 101      | 2025-01-10 |
| Luca  | 102      | 2025-01-11 |
| Anna  | 103      | 2025-01-12 |

---

### **Spiegazione**

1. **Colonne comuni**: Il `USING` è utilizzato per evitare di scrivere due volte il nome della colonna quando le colonne da unire hanno lo stesso nome nelle due tabelle. In questo caso, entrambe le tabelle hanno una colonna chiamata **`ClienteID`**.
2. **Semplificazione della sintassi**: Con **`USING`**, non è necessario scrivere `ON Clienti.ClienteID = Ordini.ClienteID`, ma si può semplicemente usare **`USING (ClienteID)`** per unire le tabelle.
3. **Associazione delle tabelle**: La query restituirà le righe combinate delle tabelle **Clienti** e **Ordini** dove il valore di **`ClienteID`** è lo stesso in entrambe le tabelle.

---

### **Vantaggi di `USING`**

- **Sintassi più semplice e concisa**: Quando le colonne di join hanno lo stesso nome, **`USING`** riduce la verbosità della query.
- **Chiarezza**: Rende la query più leggibile, poiché non è necessario ripetere il nome della colonna e della tabella.

### **Quando non usare `USING`**

Non è possibile utilizzare **`USING`** se le colonne da unire non hanno lo stesso nome nelle tabelle. In questo caso, si deve utilizzare **`ON`** per specificare la relazione tra le tabelle.

---

### **Esempio di JOIN con `USING` vs `ON`**

Se avessimo due tabelle con colonne di join con nomi diversi, non potremmo usare `USING`, e dovremmo utilizzare **`ON`**:

#### **Tabelle**

1. **Clienti**:
| ID_Client | Nome   |
|-----------|--------|
| 1         | Maria  |
| 2         | Luca   |

2. **Ordini**:
| OrdineID | ClientID | DataOrdine |
|----------|----------|------------|
| 101      | 1        | 2025-01-10 |
| 102      | 2        | 2025-01-11 |

In questo caso, il nome delle colonne da unire non è lo stesso (ad esempio, **`ID_Client`** e **`ClientID`**), quindi dobbiamo usare **`ON`**:

```sql
SELECT Clienti.Nome, Ordini.OrdineID
FROM Clienti
JOIN Ordini
ON Clienti.ID_Client = Ordini.ClientID;
```

In questo caso, **`USING`** non sarebbe possibile perché le colonne hanno nomi differenti.
