Gli **operatori di stringa** in SQL vengono utilizzati per filtrare i risultati basandosi sui valori di tipo testo. Questi operatori permettono di cercare, confrontare o analizzare le stringhe nelle tabelle, spesso nella clausola **WHERE**. I principali operatori includono **LIKE**, **NOT LIKE**, **IN**, **NOT IN**, e **=**.

Ecco una spiegazione con esempi:

---

### **1. Operatore =**

Il simbolo `=` confronta due stringhe e restituisce le righe che corrispondono esattamente al valore specificato.

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
WHERE Categoria = 'Casa';
```

**Risultato**:

| Nome   | Categoria | Prezzo |
|--------|-----------|--------|
| Tazza  | Casa      | 15     |
| Tavolo | Casa      | 150    |

---

### **2. Operatore LIKE**

L'operatore **LIKE** viene utilizzato per confrontare stringhe con caratteri jolly:

- `%` sostituisce zero o più caratteri.
- `_` sostituisce un singolo carattere.

#### Esempio 1: Uso di `%`

Query:

```sql
SELECT * 
FROM prodotti
WHERE Nome LIKE 'T%';
```

**Risultato**:

| Nome   | Categoria | Prezzo |
|--------|-----------|--------|
| Tazza  | Casa      | 15     |
| Tavolo | Casa      | 150    |

**Spiegazione**: Vengono restituite tutte le righe in cui il campo `Nome` inizia con la lettera 'T'.

#### Esempio 2: Uso di `_`

Query:

```sql
SELECT * 
FROM prodotti
WHERE Nome LIKE '_a__o';
```

**Risultato**:

| Nome   | Categoria | Prezzo |
|--------|-----------|--------|
| Tavolo | Casa      | 150    |

**Spiegazione**: La stringa `_a__o` rappresenta valori con:

- Un qualsiasi carattere al primo posto (`_`).
- La lettera 'a' come secondo carattere.
- Qualsiasi terzo e quarto carattere.
- La lettera 'o' come quinto carattere.

---

### **3. Operatore NOT LIKE**

L'operatore **NOT LIKE** restituisce le righe che **non corrispondono** a un modello specificato.

#### Esempio

Query:

```sql
SELECT * 
FROM prodotti
WHERE Nome NOT LIKE 'T%';
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Laptop     | Elettronica| 1000   |
| Smartphone | Elettronica| 700    |

**Spiegazione**: Vengono escluse le righe in cui `Nome` inizia con la lettera 'T'.

---

### **4. Operatore IN**

L'operatore **IN** filtra le righe che corrispondono a un **elenco di valori** specifici.

#### Esempio

Query:

```sql
SELECT * 
FROM prodotti
WHERE Categoria IN ('Casa', 'Elettronica');
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Laptop     | Elettronica| 1000   |
| Smartphone | Elettronica| 700    |
| Tazza      | Casa       | 15     |
| Tavolo     | Casa       | 150    |

**Spiegazione**: Sono incluse tutte le righe con `Categoria` uguale a 'Casa' o 'Elettronica'.

---

### **5. Operatore NOT IN**

L'operatore **NOT IN** restituisce le righe che **non corrispondono** a nessun valore nell'elenco.

#### Esempio

Query:

```sql
SELECT * 
FROM prodotti
WHERE Categoria NOT IN ('Elettronica');
```

**Risultato**:

| Nome   | Categoria | Prezzo |
|--------|-----------|--------|
| Tazza  | Casa      | 15     |
| Tavolo | Casa      | 150    |

---

### **6. Filtro combinato con Operatori di Stringa**

Gli operatori di stringa possono essere combinati con **AND** e **OR** per definire filtri complessi.

#### Esempio

Query:

```sql
SELECT * 
FROM prodotti
WHERE Categoria = 'Casa' AND Nome LIKE 'T%';
```

**Risultato**:

| Nome   | Categoria | Prezzo |
|--------|-----------|--------|
| Tazza  | Casa      | 15     |
| Tavolo | Casa      | 150    |

**Spiegazione**: Filtra le righe con `Categoria` uguale a 'Casa' e `Nome` che inizia con la lettera 'T'.

---

### **Nota: Sensibilità alle Maiuscole**

In SQL, la sensibilità alle maiuscole/minuscole dipende dal database. Per rendere il confronto case-insensitive, si può usare:

- **UPPER()** o **LOWER()** per uniformare le stringhe.
  
Esempio:

```sql
SELECT * 
FROM prodotti
WHERE UPPER(Categoria) = 'CASA';
```

Questo assicura che il filtro funzioni indipendentemente dalle maiuscole.
