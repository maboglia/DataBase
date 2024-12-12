# Le **transazioni ACID**

Le **transazioni ACID** rappresentano un insieme di proprietà fondamentali che garantiscono l'affidabilità delle transazioni nei sistemi di gestione dei database. Queste proprietà assicurano che le operazioni sui dati siano eseguite in modo corretto, anche in presenza di errori, guasti o interruzioni.

### Le proprietà ACID

1. **Atomicità (Atomicity)**:
   - Una transazione è un'unità indivisibile di lavoro: o tutte le operazioni contenute in essa vengono completate con successo, o nessuna viene applicata.
   - **Esempio**: Durante un trasferimento di denaro tra due conti bancari, sia l'addebito sul conto A sia l'accredito sul conto B devono avvenire. Se una delle due operazioni fallisce, l'intera transazione viene annullata.

2. **Coerenza (Consistency)**:
   - Una transazione porta il database da uno stato valido a un altro, rispettando tutte le regole definite, come vincoli di integrità o chiavi primarie.
   - **Esempio**: Se una transazione modifica un inventario, il totale degli articoli deve rimanere coerente con i calcoli delle quantità in magazzino.

3. **Isolamento (Isolation)**:
   - L'esecuzione simultanea di più transazioni non deve interferire con il risultato di ciascuna. È come se ogni transazione fosse eseguita in isolamento.
   - **Esempio**: Due utenti che aggiornano contemporaneamente lo stesso saldo bancario non devono influenzarsi a vicenda, evitando anomalie come il doppio addebito.

4. **Durabilità (Durability)**:
   - Una volta completata con successo, una transazione diventa permanente. Anche in caso di guasto del sistema, i dati rimangono salvati.
   - **Esempio**: Se una conferma di pagamento è stata inviata, il database deve registrarla in modo permanente, anche se il sistema si arresta subito dopo.

---

### Perché ACID è importante?

Le transazioni ACID sono cruciali in scenari dove i dati devono essere altamente affidabili e accurati, come:

- Sistemi bancari.
- Applicazioni di e-commerce.
- Sistemi di gestione delle prenotazioni.

Queste proprietà rendono i database relazionali ideali per applicazioni in cui la consistenza e l'affidabilità dei dati sono essenziali.
