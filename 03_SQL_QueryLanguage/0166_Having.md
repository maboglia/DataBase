# **Clausola `HAVING`: Introduzione e Funzionamento**

La clausola `HAVING` viene utilizzata in SQL per filtrare i risultati di una query **dopo** l'aggregazione. Mentre la clausola `WHERE` filtra i dati prima dell'aggregazione, `HAVING` agisce sui risultati aggregati creati da funzioni come `COUNT`, `SUM`, `AVG`, ecc.

#### **Sintassi Base**

```sql
SELECT colonna, funzione_aggregata(colonna)
FROM tabella
GROUP BY colonna
HAVING condizione;
```

### **Esempio Pratico**

Se hai una tabella `orders` e vuoi trovare i nomi che compaiono solo una volta:

```sql
SELECT name, COUNT(name)
FROM orders
GROUP BY name
HAVING COUNT(name) = 1;
```

- **`GROUP BY`**: Raggruppa i dati per `name`.
- **`COUNT(name)`**: Calcola quante volte ogni nome appare.
- **`HAVING COUNT(name) = 1`**: Filtra solo i gruppi in cui il conteggio è esattamente 1.

---

### **Estensione di MySQL: Alias nella Clausola `HAVING`**

MySQL consente l'uso di alias definiti nella lista `SELECT` all'interno della clausola `HAVING`. Questo non è permesso nello standard SQL.  
Esempio:

```sql
SELECT name, COUNT(name) AS c
FROM orders
GROUP BY name
HAVING c = 1;
```

In questo caso:

- **`AS c`**: L'alias `c` rappresenta `COUNT(name)`.
- **`HAVING c = 1`**: Usa l'alias per rendere il codice più leggibile.

---

### **Espressioni Non-Colonna nel `GROUP BY`**

Lo standard SQL consente solo colonne dirette nella clausola `GROUP BY`. Tuttavia, MySQL estende questa funzionalità permettendo espressioni non-colonna. Ad esempio:

```sql
SELECT id, FLOOR(value/100)
FROM tbl_name
GROUP BY id, FLOOR(value/100);
```

Qui:

- **`FLOOR(value/100)`**: Raggruppa i dati in base a intervalli di valore arrotondati.

---

### **Alias nel `GROUP BY`**

MySQL consente anche l'uso di alias definiti nella lista `SELECT` nella clausola `GROUP BY`. Questo rende il codice più leggibile e riutilizzabile:

```sql
SELECT id, FLOOR(value/100) AS val
FROM tbl_name
GROUP BY id, val;
```

In questo caso:

- **`AS val`**: Definisce un alias per `FLOOR(value/100)`.
- **`GROUP BY id, val`**: Utilizza l'alias `val` direttamente.

---

### **Confronto Standard SQL vs MySQL**

| **Caratteristica**             | **Standard SQL**                 | **MySQL**                                   |
|--------------------------------|----------------------------------|--------------------------------------------|
| Alias in `HAVING`              | Non consentito                  | Consentito                                 |
| Espressioni nel `GROUP BY`     | Solo colonne                    | Colonne e altre espressioni               |
| Alias in `GROUP BY`            | Non consentito                  | Consentito                                 |

### **Conclusione**

MySQL offre estensioni utili per semplificare la sintassi e rendere le query più leggibili, specialmente quando si lavora con aggregazioni complesse. Tuttavia, è importante sapere che queste estensioni potrebbero non essere portabili su altri database conformi esclusivamente allo standard SQL.
