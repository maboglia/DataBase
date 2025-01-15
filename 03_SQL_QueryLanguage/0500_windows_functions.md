# **Windows Function in SQL**

Le **Windows Function** (funzioni di finestra) in SQL sono funzioni avanzate utilizzate per eseguire calcoli su un insieme specifico di righe correlate a una riga corrente, chiamato *window* (finestra). A differenza delle funzioni aggregate, che restituiscono un singolo valore per un gruppo di righe, le funzioni di finestra restituiscono un valore per ogni riga.

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
