# **BETWEEN**, **IN**, e **NOT IN**

Gli operatori numerici in SQL vengono utilizzati per filtrare i dati basandosi su valori numerici. Oltre agli operatori di confronto standard (`=`, `>`, `<`, `>=`, `<=`, `!=`), esistono operatori speciali come **BETWEEN**, **IN**, e **NOT IN** che permettono di definire filtri più complessi ed efficienti.

Ecco una spiegazione con esempi:

---

### **1. Operatore BETWEEN**

L'operatore **BETWEEN** consente di filtrare i valori numerici all'interno di un intervallo specifico (inclusi i limiti).

#### Esempio

Tabella `prodotti`:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Laptop     | Elettronica| 1000   |
| Smartphone | Elettronica| 700    |
| Tazza      | Casa       | 15     |
| Tavolo     | Casa       | 150    |

Query:

```sql
SELECT * 
FROM prodotti
WHERE Prezzo BETWEEN 100 AND 800;
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Smartphone | Elettronica| 700    |
| Tavolo     | Casa       | 150    |

**Spiegazione**: Sono incluse tutte le righe con un prezzo compreso tra 100 e 800 (inclusi i limiti 100 e 800).

---

### **2. Operatore NOT BETWEEN**

L'operatore **NOT BETWEEN** restituisce le righe in cui il valore è **fuori** dall'intervallo specificato.

#### Esempio

Query:

```sql
SELECT * 
FROM prodotti
WHERE Prezzo NOT BETWEEN 100 AND 800;
```

**Risultato**:

| Nome   | Categoria  | Prezzo |
|--------|-----------|--------|
| Laptop | Elettronica| 1000   |
| Tazza  | Casa       | 15     |

**Spiegazione**: Sono incluse tutte le righe con un prezzo minore di 100 o maggiore di 800.

---

### **3. Operatore IN**

L'operatore **IN** consente di confrontare i valori numerici con un elenco specifico.

#### Esempio

Query:

```sql
SELECT * 
FROM prodotti
WHERE Prezzo IN (15, 150, 700);
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Smartphone | Elettronica| 700    |
| Tazza      | Casa       | 15     |
| Tavolo     | Casa       | 150    |

**Spiegazione**: Sono incluse tutte le righe in cui il prezzo è uno dei valori nell'elenco specificato.

---

### **4. Operatore NOT IN**

L'operatore **NOT IN** restituisce le righe in cui il valore **non** corrisponde a nessuno dei valori specificati.

#### Esempio

Query:

```sql
SELECT * 
FROM prodotti
WHERE Prezzo NOT IN (15, 150, 700);
```

**Risultato**:

| Nome   | Categoria  | Prezzo |
|--------|-----------|--------|
| Laptop | Elettronica| 1000   |

**Spiegazione**: Sono incluse tutte le righe in cui il prezzo non corrisponde a 15, 150, o 700.

---

### **5. Operatori di Confronto Standard**

Questi operatori permettono di filtrare i dati in base a confronti diretti.

#### Esempi

1. **Prezzo maggiore di un valore specifico**:

```sql
SELECT * 
FROM prodotti
WHERE Prezzo > 500;
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Laptop     | Elettronica| 1000   |
| Smartphone | Elettronica| 700    |

2. **Prezzo minore o uguale a un valore specifico**:

```sql
SELECT * 
FROM prodotti
WHERE Prezzo <= 150;
```

**Risultato**:

| Nome   | Categoria | Prezzo |
|--------|-----------|--------|
| Tazza  | Casa      | 15     |
| Tavolo | Casa      | 150    |

---

### **6. Operatore di uguaglianza (=)**

Il simbolo `=` restituisce le righe in cui il valore è **uguale** a quello specificato.

#### Esempio

```sql
SELECT * 
FROM prodotti
WHERE Prezzo = 700;
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Smartphone | Elettronica| 700    |

---

### **7. Operatore di disuguaglianza (!= o <>)**

Il simbolo `!=` o `<>` restituisce le righe in cui il valore **non** corrisponde a quello specificato.

#### Esempio

```sql
SELECT * 
FROM prodotti
WHERE Prezzo != 700;
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Laptop     | Elettronica| 1000   |
| Tazza      | Casa       | 15     |
| Tavolo     | Casa       | 150    |

---

### **8. Filtro combinato con operatori numerici**

Gli operatori numerici possono essere combinati con **AND** e **OR** per creare filtri complessi.

#### Esempio

```sql
SELECT * 
FROM prodotti
WHERE Prezzo > 100 AND Prezzo < 800;
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Smartphone | Elettronica| 700    |
| Tavolo     | Casa       | 150    |

**Spiegazione**: Vengono filtrate le righe in cui il prezzo è maggiore di 100 **e** minore di 800.

---

### **9. Filtro con NULL**

SQL consente di filtrare i valori numerici che sono NULL utilizzando **IS NULL** o **IS NOT NULL**.

#### Esempio

Tabella `prodotti` con alcuni valori mancanti:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Laptop     | Elettronica| 1000   |
| Smartphone | Elettronica| 700    |
| Tazza      | Casa       | NULL   |
| Tavolo     | Casa       | 150    |

Query:

```sql
SELECT * 
FROM prodotti
WHERE Prezzo IS NULL;
```

**Risultato**:

| Nome  | Categoria | Prezzo |
|-------|-----------|--------|
| Tazza | Casa      | NULL   |

---

### **Nota**

- Gli operatori numerici sono fondamentali per analisi quantitative e interrogazioni mirate su dataset strutturati.
- La scelta degli operatori dipende dall'obiettivo della query e dalla struttura dei dati.
