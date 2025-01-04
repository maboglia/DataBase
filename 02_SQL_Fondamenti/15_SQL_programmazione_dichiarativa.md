# SQL è un linguaggio a livello di `set`

Quando si afferma che il linguaggio SQL è **un linguaggio a livello di set**, si intende che SQL opera principalmente su **insiemi di dati** e non su singoli record o su dati trattati uno alla volta (come avviene nei linguaggi imperativi). Questo paradigma deriva dal modello relazionale, che rappresenta i dati come insiemi di tuple all'interno di tabelle.

### **Caratteristiche del livello di set in SQL**

1. **Operazioni su insiemi di righe**:
   - Le istruzioni SQL, come `SELECT`, `UPDATE`, `DELETE`, e `INSERT`, sono progettate per lavorare su interi insiemi di righe contemporaneamente.
   - Ad esempio:
     ```sql
     SELECT * FROM prodotti WHERE prezzo > 50;
     ```
     Questa query restituisce un **insieme** di righe (tutte quelle che soddisfano la condizione `prezzo > 50`), non una singola riga.

2. **Astrazione dai dettagli operativi**:
   - SQL specifica **cosa** deve essere fatto, non **come** farlo. Il sistema di gestione del database (DBMS) si occupa di trovare il modo più efficiente per eseguire l'operazione sull'insieme.
   - Non si scrivono cicli per elaborare ogni riga (come nei linguaggi procedurali), ma si scrivono condizioni che filtrano o manipolano i dati desiderati.

3. **Risultati sempre sotto forma di tabelle**:
   - Il risultato di ogni query SQL è sempre un insieme di tuple (o righe) rappresentato in una struttura tabellare.
   - Anche un risultato con una singola riga e colonna è concettualmente considerato una tabella.

4. **Operazioni basate su teoria degli insiemi**:
   - SQL implementa concetti della teoria degli insiemi, come **unioni**, **intersezioni**, e **differenze**.
   - Esempi:
     - `UNION` per unire due insiemi di dati.
     - `INTERSECT` per trovare elementi comuni tra due insiemi.
     - `EXCEPT` per calcolare la differenza tra due insiemi.

5. **Supporto per aggregazioni su insiemi**:
   - SQL consente di eseguire operazioni che aggregano i dati di un insieme, come sommare, contare o calcolare la media di un gruppo di righe.
   - Esempio:
     ```sql
     SELECT AVG(salario) FROM dipendenti WHERE dipartimento = 'IT';
     ```
     Questa query calcola la media dei salari per tutti i dipendenti dell'insieme che soddisfa la condizione.

---

### **Confronto con linguaggi a basso livello**

In un linguaggio procedurale (ad esempio Python, Java, o C), elaborare un insieme di dati potrebbe richiedere:
1. Iterare riga per riga su un dataset.
2. Applicare un filtro manualmente in ogni iterazione.
3. Aggregare o trasformare i risultati una riga alla volta.

In SQL, invece, tutto questo è espresso in una singola istruzione a livello di set, delegando al DBMS il compito di ottimizzare ed eseguire l'operazione.

---

### **Vantaggi del livello di set in SQL**
- **Semplicità**: Le query SQL sono più concise e leggibili rispetto a un approccio procedurale.
- **Efficienza**: Il DBMS ottimizza automaticamente le operazioni su insiemi di dati.
- **Parallelismo**: Operando su interi insiemi, SQL sfrutta il parallelismo interno del DBMS per velocizzare le operazioni.
- **Astrazione**: Lo sviluppatore si concentra sul risultato desiderato senza preoccuparsi dell'implementazione dettagliata.
