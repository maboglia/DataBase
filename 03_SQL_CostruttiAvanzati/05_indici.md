---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

## Indici in un Database

Parliamo ora degli "Indici" in un database. Gli indici sono strumenti critici per migliorare le prestazioni delle query e accelerare l'accesso ai dati all'interno di un database relazionale.

---

### Indici in un Database

1. **Indici in un Database
   - Un indice è una struttura dati che fornisce un meccanismo efficiente per la ricerca di dati all'interno di una tabella.
   - Gli indici vengono creati su una o più colonne di una tabella e contengono coppie di valori della colonna indicizzata e il riferimento alla posizione fisica dei dati associati.
   - Quando si esegue una query che coinvolge la colonna indicizzata, il database può utilizzare l'indice per individuare rapidamente i dati desiderati anziché scorrere l'intera tabella.

---

### Vantaggi degli Indici

2. **Vantaggi degli Indici
   - **Riduzione del Tempo di Ricerca:** Gli indici accelerano la ricerca di dati, specialmente in grandi tabelle, riducendo il tempo necessario per recuperare informazioni specifiche.
   - **Miglioramento delle Prestazioni delle Query:** Le query che coinvolgono colonne indicizzate possono beneficiare di prestazioni migliori, poiché l'uso di indici riduce il numero di operazioni di lettura necessarie.
   - **Ordinamento e Raggruppamento:** Gli indici possono migliorare le prestazioni di operazioni di ordinamento e raggruppamento di dati.

---

### Tipi di Indici

3. **Tipi di Indici
   - **Indice Clustered:** Nell'indice clusterizzato, le righe della tabella sono organizzate fisicamente sulla base dell'ordine dell'indice. Ogni tabella può avere al massimo un indice clusterizzato.
   - **Indice Non Clustered:** In un indice non clusterizzato, le righe della tabella non sono organizzate fisicamente nell'ordine dell'indice. La tabella può avere più indici non clusterizzati.

---

### Scelta e Progettazione

4. **Scelta e Progettazione degli Indici
   - La scelta di quali colonne indicizzare dipende dalle query più frequenti e dalle esigenze di prestazioni specifiche del sistema.
   - Gli indici devono essere bilanciati: troppi indici possono rallentare le operazioni di scrittura e aumentare lo spazio su disco, mentre troppo pochi indici possono influire negativamente sulle prestazioni delle query.

   **Esempio di creazione di un indice

   ```sql
   CREATE INDEX idx_NomeStudente ON Studenti (Nome);
   ```

   Questa query crea un indice sulla colonna "Nome" della tabella "Studenti".

---

### Aggiornamento degli Indici

5. **Aggiornamento degli Indici
   - Gli indici devono essere mantenuti e aggiornati durante le operazioni di inserimento, aggiornamento e cancellazione dei dati per garantire l'accuratezza delle informazioni indicizzate.

Gli indici sono uno strumento potente per ottimizzare le prestazioni delle query, ma la loro progettazione e gestione richiedono una valutazione attenta delle esigenze specifiche del sistema e delle query frequenti. Una progettazione degli indici ben eseguita può contribuire in modo significativo a migliorare l'efficienza complessiva del sistema di gestione di database.

---