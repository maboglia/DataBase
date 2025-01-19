L'uso delle espressioni regolari (o **REGEXP**) in SQL consente di effettuare filtri avanzati sui dati di tipo testo o numerico, permettendo di confrontare i valori con schemi complessi. Gli operatori REGEXP (o RLIKE in alcuni dialetti) sono utili per abbinare stringhe che seguono un determinato pattern.

---

### **Sintassi Base**

```sql
colonna REGEXP 'pattern'
```

- **`colonna`**: il campo su cui applicare la verifica.
- **`pattern`**: il pattern dell'espressione regolare.

---

### **Esempi Pratici**

#### **1. Trovare valori che iniziano con un carattere specifico**

##### Obiettivo

Trovare tutti i prodotti il cui nome inizia con la lettera "T".

Tabella `prodotti`:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Tazza      | Casa       | 15     |
| Tavolo     | Casa       | 150    |
| Laptop     | Elettronica| 1000   |
| Smartphone | Elettronica| 700    |

##### Query

```sql
SELECT * 
FROM prodotti
WHERE Nome REGEXP '^T';
```

**Risultato**:

| Nome   | Categoria | Prezzo |
|--------|-----------|--------|
| Tazza  | Casa      | 15     |
| Tavolo | Casa      | 150    |

**Spiegazione**:

- Il simbolo `^` indica che il pattern deve essere all'inizio del valore.

---

#### **2. Trovare valori che terminano con un carattere specifico**

##### Obiettivo

Trovare tutti i prodotti il cui nome termina con "o".

##### Query

```sql
SELECT * 
FROM prodotti
WHERE Nome REGEXP 'o$';
```

**Risultato**:

| Nome   | Categoria | Prezzo |
|--------|-----------|--------|
| Tavolo | Casa      | 150    |

**Spiegazione**:

- Il simbolo `$` indica che il pattern deve essere alla fine del valore.

---

#### **3. Trovare valori che contengono una determinata sequenza**

##### Obiettivo

Trovare tutti i prodotti che contengono "a" nella loro descrizione.

##### Query

```sql
SELECT * 
FROM prodotti
WHERE Nome REGEXP 'a';
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Tazza      | Casa       | 15     |
| Tavolo     | Casa       | 150    |

**Spiegazione**:

- Il pattern `a` verifica se la lettera "a" è presente in qualsiasi posizione.

---

#### **4. Trovare valori che contengono una sequenza specifica in una posizione**

##### Obiettivo

Trovare tutti i prodotti in cui la seconda lettera è "a".

##### Query

```sql
SELECT * 
FROM prodotti
WHERE Nome REGEXP '^.a';
```

**Risultato**:

| Nome   | Categoria | Prezzo |
|--------|-----------|--------|
| Tazza  | Casa      | 15     |
| Tavolo | Casa      | 150    |

**Spiegazione**:

- Il simbolo `.` rappresenta un singolo carattere.
- `^` indica che il pattern deve iniziare dalla prima posizione.

---

#### **5. Trovare valori che contengono uno di più caratteri specifici**

##### Obiettivo

Trovare tutti i prodotti il cui nome contiene "T" o "S".

##### Query

```sql
SELECT * 
FROM prodotti
WHERE Nome REGEXP '[TS]';
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Tazza      | Casa       | 15     |
| Tavolo     | Casa       | 150    |
| Smartphone | Elettronica| 700    |

**Spiegazione**:

- Il pattern `[TS]` verifica la presenza di **T** o **S** in qualsiasi posizione.

---

#### **6. Trovare valori che contengono una sequenza ripetuta**

##### Obiettivo

Trovare tutti i prodotti con una doppia "t" nel nome.

##### Query

```sql
SELECT * 
FROM prodotti
WHERE Nome REGEXP 'tt';
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Tazza      | Casa       | 15     |

---

#### **7. Trovare valori numerici con REGEXP**

Le espressioni regolari possono essere applicate anche a colonne numeriche trattate come stringhe.

##### Obiettivo

Trovare prodotti con un prezzo che termina con "0".

##### Query

```sql
SELECT * 
FROM prodotti
WHERE Prezzo REGEXP '0$';
```

**Risultato**:

| Nome   | Categoria  | Prezzo |
|--------|------------|--------|
| Tavolo | Casa       | 150    |

**Spiegazione**:

- Il pattern `0$` verifica se l'ultima cifra del prezzo è "0".

---

#### **8. Trovare valori che non corrispondono al pattern**

##### Obiettivo

Trovare prodotti i cui nomi **non** iniziano con "T".

##### Query

```sql
SELECT * 
FROM prodotti
WHERE Nome NOT REGEXP '^T';
```

**Risultato**:

| Nome       | Categoria  | Prezzo |
|------------|------------|--------|
| Laptop     | Elettronica| 1000   |
| Smartphone | Elettronica| 700    |

---

### **Caratteri Speciali Utili nelle Regexp**

1. **`^`**: Inizio del valore.
2. **`$`**: Fine del valore.
3. **`.`**: Qualsiasi singolo carattere.
4. **`[abc]`**: Uno qualsiasi dei caratteri specificati.
5. **`[a-z]`**: Un intervallo di caratteri.
6. **`*`**: Zero o più occorrenze.
7. **`+`**: Una o più occorrenze.
8. **`{n}`**: Esattamente **n** occorrenze.
9. **`{n,}`**: Almeno **n** occorrenze.
10. **`|`**: Operatore OR.

---

### **Nota**

Le funzionalità REGEXP possono variare leggermente a seconda del database. Ad esempio:

- MySQL utilizza **REGEXP**.
- SQL Server utilizza **LIKE** con caratteri jolly (simile ma meno potente).
- PostgreSQL offre **SIMILAR TO** per espressioni simili.
