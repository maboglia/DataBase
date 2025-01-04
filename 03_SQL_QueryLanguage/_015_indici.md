# Indici

Gli indici sono strumenti critici per migliorare le prestazioni delle query e accelerare l'accesso ai dati all'interno di un database relazionale.

---

## Indici in un Database

- Un indice è una struttura dati che fornisce un meccanismo efficiente per la ricerca di dati all'interno di una tabella.
- Gli indici vengono creati su una o più colonne di una tabella e contengono coppie di valori della colonna indicizzata e il riferimento alla posizione fisica dei dati associati.
- Quando si esegue una query che coinvolge la colonna indicizzata, il database può utilizzare l'indice per individuare rapidamente i dati desiderati anziché scorrere l'intera tabella.

---

## Vantaggi degli Indici

- **Riduzione del Tempo di Ricerca:** Gli indici accelerano la ricerca di dati, specialmente in grandi tabelle, riducendo il tempo necessario per recuperare informazioni specifiche.
- **Miglioramento delle Prestazioni delle Query:** Le query che coinvolgono colonne indicizzate possono beneficiare di prestazioni migliori, poiché l'uso di indici riduce il numero di operazioni di lettura necessarie.
- **Ordinamento e Raggruppamento:** Gli indici possono migliorare le prestazioni di operazioni di ordinamento e raggruppamento di dati.

---

## Tipi di Indici

- **Indice Clustered:** Nell'indice clusterizzato, le righe della tabella sono organizzate fisicamente sulla base dell'ordine dell'indice. Ogni tabella può avere al massimo un indice clusterizzato.
- **Indice Non Clustered:** In un indice non clusterizzato, le righe della tabella non sono organizzate fisicamente nell'ordine dell'indice. La tabella può avere più indici non clusterizzati.
- **Indice Unico:** Un indice unico impedisce l'inserimento di valori duplicati nelle colonne indicizzate, garantendo che ogni valore sia univoco.

---

## Scelta e Progettazione

- La scelta di quali colonne indicizzare dipende dalle query più frequenti e dalle esigenze di prestazioni specifiche del sistema.
- Gli indici devono essere bilanciati: troppi indici possono rallentare le operazioni di scrittura e aumentare lo spazio su disco, mentre troppo pochi indici possono influire negativamente sulle prestazioni delle query.

   **Esempio di creazione di un indice

   ```sql
   CREATE INDEX idx_NomeStudente ON Studenti (Nome);
   ```

   Questa query crea un indice sulla colonna "Nome" della tabella "Studenti".

---

## Aggiornamento degli Indici

- Gli indici devono essere mantenuti e aggiornati durante le operazioni di inserimento, aggiornamento e cancellazione dei dati per garantire l'accuratezza delle informazioni indicizzate.

---

## Definizione di Indice

- Un indice è una struttura dati che migliora la velocità delle operazioni di ricerca, ordinamento e accesso ai dati di una tabella. Gli indici sono costruiti su una o più colonne della tabella.

---

## Scopi degli Indici

- **Miglioramento delle Prestazioni delle Query:** Gli indici accelerano le operazioni di ricerca, rendendo più efficienti le query che coinvolgono le colonne indicizzate.
- **Ottimizzazione dell'Ordinamento:** Gli indici facilitano l'ordinamento dei dati, migliorando le prestazioni delle query che richiedono risultati ordinati.
- **Accelerazione delle Operazioni di Join:** Gli indici possono migliorare le prestazioni delle operazioni di join, riducendo il tempo necessario per cercare corrispondenze tra tabelle.
- **Riduzione del Carico sul Sistema:** Un uso strategico degli indici può ridurre il tempo di esecuzione delle query, diminuendo così il carico complessivo sul sistema del database.

---

## Tipi di Indici: composto, su espressione, full-text

- I database relazionali supportano vari tipi di indici, tra cui:

- **Indice Composto:** Un indice composto coinvolge più colonne e viene utilizzato quando la ricerca coinvolge più di una colonna.
- **Indice su Espressione:** Gli indici su espressione coinvolgono una o più colonne con operazioni o funzioni, ad esempio un indice su `UPPER(Nome)` per una ricerca case-insensitive.
- **Indice Full-Text:** Gli indici full-text supportano ricerche di testo libero, consentendo la ricerca di parole chiave all'interno di colonne di testo.

---

## Creazione di Indici

- Gli indici possono essere creati durante la definizione della tabella o successivamente mediante l'istruzione `CREATE INDEX`. Ad esempio:

   ```sql
   -- Creazione di un indice su una colonna
   CREATE INDEX idx_NomeCliente ON Clienti(Nome);

   -- Creazione di un indice unico composto
   CREATE UNIQUE INDEX idx_CodiceProdottoFornitore ON Prodotti(CodiceProdotto, FornitoreID);
   ```

---

## Eliminazione di Indici

- Gli indici possono essere eliminati quando non sono più necessari. La creazione o l'eliminazione di indici deve essere bilanciata per ottimizzare le prestazioni senza aggiungere eccessivamente al carico di manutenzione.

   ```sql
   -- Eliminazione di un indice
   DROP INDEX idx_NomeCliente ON Clienti;
   ```

---

## Considerazioni sull'Impatto delle Modifiche

- Le modifiche alla struttura di una tabella, come l'inserimento, l'aggiornamento o la cancellazione di dati, possono influire sugli indici. Bisogna bilanciare l'ottimizzazione delle query con l'impatto delle modifiche sulle prestazioni degli indici.

---

## Monitoraggio degli Indici

- Il monitoraggio delle prestazioni degli indici è importante per garantire che continuino a fornire benefici. Gli strumenti di gestione del database spesso forniscono informazioni sulle statistiche degli indici, che possono essere utili per l'ottimizzazione.

---

Gli indici sono uno strumento essenziale per migliorare le prestazioni delle query nei database relazionali. La loro progettazione e gestione richiedono un equilibrio attento tra le esigenze delle query e l'impatto sulle prestazioni globali del database.

Una progettazione degli indici ben eseguita può contribuire in modo significativo a migliorare l'efficienza complessiva del sistema di gestione di database.
