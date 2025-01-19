# AND, OR, NOT

Gli **operatori logici** in SQL (AND, OR, NOT) vengono utilizzati per combinare più condizioni nei comandi di filtraggio delle query, solitamente nella clausola **WHERE**. Ecco una spiegazione con esempi chiari:

---

### **1. Operatore AND**

L'operatore **AND** filtra i risultati restituendo solo le righe che soddisfano **tutte** le condizioni specificate.

#### Esempio

Tabella `dipendenti`:

| Nome     | Età | Dipartimento | Stipendio |
|----------|-----|--------------|-----------|
| Anna     | 30  | HR           | 3000      |
| Luca     | 35  | IT           | 4000      |
| Marco    | 28  | IT           | 3500      |
| Sara     | 40  | HR           | 4500      |

Query:

```sql
SELECT * 
FROM dipendenti
WHERE Dipartimento = 'IT' AND Stipendio > 3500;
```

**Risultato**:

| Nome  | Età | Dipartimento | Stipendio |
|-------|-----|--------------|-----------|
| Luca  | 35  | IT           | 4000      |

**Spiegazione**: La riga di Luca è l'unica che soddisfa entrambe le condizioni:

- Il Dipartimento è 'IT'.
- Lo Stipendio è maggiore di 3500.

---

### **2. Operatore OR**

L'operatore **OR** filtra i risultati restituendo le righe che soddisfano **almeno una** delle condizioni specificate.

#### Esempio

Query:

```sql
SELECT * 
FROM dipendenti
WHERE Dipartimento = 'IT' OR Stipendio > 4000;
```

**Risultato**:

| Nome   | Età | Dipartimento | Stipendio |
|--------|-----|--------------|-----------|
| Luca   | 35  | IT           | 4000      |
| Marco  | 28  | IT           | 3500      |
| Sara   | 40  | HR           | 4500      |

**Spiegazione**: Le righe incluse soddisfano almeno una delle condizioni:

- Dipartimento = 'IT'.
- Stipendio > 4000.

---

### **3. Operatore NOT**

L'operatore **NOT** nega una condizione, restituendo le righe che **non soddisfano** la condizione specificata.

#### Esempio

Query:

```sql
SELECT * 
FROM dipendenti
WHERE NOT Dipartimento = 'IT';
```

**Risultato**:

| Nome   | Età | Dipartimento | Stipendio |
|--------|-----|--------------|-----------|
| Anna   | 30  | HR           | 3000      |
| Sara   | 40  | HR           | 4500      |

**Spiegazione**: Le righe incluse hanno Dipartimento diverso da 'IT'.

---

### **4. Combinazione di Operatori**

Gli operatori logici possono essere combinati tra loro. Le condizioni sono valutate seguendo la **precedenza**:  

1. **NOT**
2. **AND**
3. **OR**

#### Esempio

Query:

```sql
SELECT * 
FROM dipendenti
WHERE (Dipartimento = 'IT' AND Stipendio > 3500) OR Età > 40;
```

**Risultato**:

| Nome   | Età | Dipartimento | Stipendio |
|--------|-----|--------------|-----------|
| Luca   | 35  | IT           | 4000      |

**Spiegazione**:

- La condizione `(Dipartimento = 'IT' AND Stipendio > 3500)` è vera per Luca.
- Nessuna riga soddisfa `Età > 40`.

---

### **5. Alias per Chiarezza**

Si possono usare **alias** per rendere il codice più leggibile:

```sql
SELECT Nome, Età, Dipartimento, Stipendio
FROM dipendenti AS d
WHERE (d.Dipartimento = 'IT' AND d.Stipendio > 3500) OR d.Età > 40;
```

---

**Nota Importante**:

- **Uso delle parentesi**: Quando si combinano più operatori, usa parentesi per rendere esplicita la priorità delle operazioni ed evitare ambiguità.
