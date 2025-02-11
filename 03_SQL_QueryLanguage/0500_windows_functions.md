# **Windows Function in SQL**

Le **Windows Function** (funzioni di finestra) in SQL sono funzioni avanzate utilizzate per eseguire calcoli su un insieme specifico di righe correlate a una riga corrente, chiamato *window* (finestra). A differenza delle funzioni aggregate, che restituiscono un singolo valore per un gruppo di righe, le funzioni finestra **restituiscono un valore per ogni riga**.

---

## **Caratteristiche principali**

- Le Windows Function lavorano su un *window frame* definito da clausole come `OVER()`.
- Non riducono il numero di righe restituite, a differenza delle funzioni aggregate.
- Consentono calcoli avanzati, come ranking, calcoli cumulativi, e operazioni di partizionamento.

---

## **Sintassi generale**

```sql
<window_function> (<expression>)
OVER (
    [PARTITION BY <columns>]
    [ORDER BY <columns>]
    [ROWS or RANGE <frame_clause>]
)
```

- **`<window_function>`**: La funzione di finestra da applicare (es. `SUM`, `AVG`, `ROW_NUMBER`, ecc.).
- **`PARTITION BY`**: Divide il set di righe in sottoinsiemi su cui applicare la funzione.
- **`ORDER BY`**: Ordina le righe all'interno della finestra.
- **`ROWS` o `RANGE`**: Definiscono un sottoinsieme di righe relativo a ogni riga.

---

## **Principali Windows Function**

1. **Funzioni di aggregazione**  
   Calcolano aggregati su una finestra.  
   - **Esempio:**

     ```sql
     SELECT Nome, Dipartimento, 
            SUM(Salario) OVER (PARTITION BY Dipartimento) AS TotaleSalario
     FROM Dipendenti;
     ```

     - **Descrizione:** Calcola il totale dei salari per ogni dipartimento.

2. **Ranking Functions**  
   Generano un valore di classifica per ogni riga.  
   - **ROW_NUMBER():** Restituisce il numero progressivo di ogni riga nella finestra.
   - **RANK():** Assegna una posizione con possibilità di "salti" in caso di parità.
   - **DENSE_RANK():** Come `RANK()`, ma senza salti.  
   - **Esempio:**

     ```sql
     SELECT Nome, Salario,
            RANK() OVER (ORDER BY Salario DESC) AS Posizione
     FROM Dipendenti;
     ```

     - **Descrizione:** Classifica i dipendenti in base al salario, dal più alto al più basso.

3. **Funzioni cumulative e di scorrimento**  
   - **`LAG()` / `LEAD()`:** Recuperano il valore di una riga precedente o successiva.  
   - **Esempio:**

     ```sql
     SELECT Nome, Salario,
            LAG(Salario) OVER (ORDER BY Salario) AS SalarioPrecedente
     FROM Dipendenti;
     ```

     - **Descrizione:** Recupera il salario del dipendente precedente nella classifica.

4. **Cumulative Totals**  
   Calcolano totali cumulativi o medie.  
   - **Esempio:**

     ```sql
     SELECT Nome, Salario,
            SUM(Salario) OVER (ORDER BY Salario) AS SalarioCumulativo
     FROM Dipendenti;
     ```

     - **Descrizione:** Calcola il totale cumulativo dei salari ordinati.

---

### **Scenario: Analisi dei dipendenti in un'azienda**

Tabella: `Dipendenti`  

| ID | Nome       | Dipartimento | Salario |
|----|------------|--------------|---------|
| 1  | Mario      | IT           | 3000    |
| 2  | Laura      | HR           | 4000    |
| 3  | Francesco  | IT           | 2000    |
| 4  | Giulia     | HR           | 3500    |
| 5  | Antonio    | IT           | 2500    |

- **Query con Windows Function:**

  ```sql
  SELECT Nome, Dipartimento, Salario,
         SUM(Salario) OVER (PARTITION BY Dipartimento) AS TotaleDipartimento,
         ROW_NUMBER() OVER (PARTITION BY Dipartimento ORDER BY Salario DESC) AS Posizione
  FROM Dipendenti;
  ```

- **Risultato:**

  | Nome      | Dipartimento | Salario | TotaleDipartimento | Posizione |
  |-----------|--------------|---------|---------------------|-----------|
  | Mario     | IT           | 3000    | 7500                | 1         |
  | Antonio   | IT           | 2500    | 7500                | 2         |
  | Francesco | IT           | 2000    | 7500                | 3         |
  | Laura     | HR           | 4000    | 7500                | 1         |
  | Giulia    | HR           | 3500    | 7500                | 2         |

---

## **Vantaggi delle Windows Function**

- Permettono di calcolare valori su subset di dati senza dover aggregare o eliminare righe.
- Facilitano analisi come trend, classifiche, e confronti temporali.
- Eliminano la necessità di query nidificate complesse.

---

## Esempio pokemon

Esempi di **window functions** che potrebbero essere utilizzate sulla tabella `pokemon`. Supponiamo che la tabella `pokemon` abbia la seguente struttura:

```sql
CREATE TABLE pokemon (
    id INT,
    nome VARCHAR(100),
    tipo VARCHAR(50),
    livello INT,
    attacco INT
);
```

### 1. **Esempio di `ROW_NUMBER()`**

Immaginiamo di voler assegnare un numero progressivo a ciascun Pokémon, ordinato per livello decrescente. La funzione `ROW_NUMBER()` restituisce un numero progressivo per ogni riga all'interno della finestra di partenza.

```sql
SELECT 
    id, 
    nome, 
    tipo, 
    livello,
    ROW_NUMBER() OVER (ORDER BY livello DESC) AS posizione
FROM pokemon;
```

#### Spiegazione

- **`ROW_NUMBER()`**: Restituisce un numero progressivo per ogni riga, basato sull'ordinamento fornito.
- **`OVER (ORDER BY livello DESC)`**: La funzione `ROW_NUMBER()` si applica su tutte le righe ordinate per il campo `livello` in ordine decrescente.
- La colonna `posizione` indica la posizione di ciascun Pokémon in base al livello.

### 2. **Esempio di `RANK()`**

Supponiamo di voler assegnare un rango ai Pokémon in base al loro livello, e di voler gestire i pareggi (due Pokémon con lo stesso livello dovrebbero ricevere lo stesso rango).

```sql
SELECT 
    id, 
    nome, 
    tipo, 
    livello,
    RANK() OVER (ORDER BY livello DESC) AS rango
FROM pokemon;
```

#### Spiegazione

- **`RANK()`**: Assegna un rango ai Pokémon. Se due Pokémon hanno lo stesso livello, entrambi ottengono lo stesso rango, ma il rango successivo salta (ad esempio, se due Pokémon sono al 1° posto, il successivo sarà al 3° posto).
- **`OVER (ORDER BY livello DESC)`**: Ordinamento per il campo `livello` in ordine decrescente.
- La colonna `rango` rappresenta il rango di ciascun Pokémon.

### 3. **Esempio di `AVG()` con finestra per tipo**

Ora, se vogliamo calcolare la media degli attacchi per ogni tipo di Pokémon, possiamo usare la funzione `AVG()` con la finestra `PARTITION BY`:

```sql
SELECT 
    id, 
    nome, 
    tipo, 
    attacco,
    AVG(attacco) OVER (PARTITION BY tipo) AS media_attacco_per_tipo
FROM pokemon;
```

#### Spiegazione

- **`AVG(attacco)`**: Calcola la media degli attacchi.
- **`PARTITION BY tipo`**: Calcola la media separatamente per ogni tipo di Pokémon. Ad esempio, se ci sono più Pokémon di tipo "Fuoco", la media degli attacchi sarà calcolata solo per i Pokémon di quel tipo.
- La colonna `media_attacco_per_tipo` mostra la media degli attacchi per ciascun tipo di Pokémon.

### Considerazioni

- **`ROW_NUMBER()`**: Utilizzato per ordinare e numerare le righe in modo progressivo.
- **`RANK()`**: Assegna un rango, gestendo correttamente i pareggi.
- **`AVG()`**: Utilizzata con `PARTITION BY` per calcolare aggregazioni come la media su gruppi specifici di dati.

Le funzioni di finestra ti permettono di ottenere risultati complessi senza dover fare operazioni di raggruppamento (`GROUP BY`), e possono essere molto utili quando si desidera calcolare aggregazioni mantenendo comunque i dati dettagliati delle singole righe.
