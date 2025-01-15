---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# Gestione delle Transazioni

Le transazioni sono un concetto fondamentale per garantire la coerenza e l'integrità dei dati in un database, consentendo l'esecuzione di più operazioni come un'unica unità atomica.

---

## Definizione di Transazione

- Una transazione rappresenta una sequenza di uno o più comandi SQL eseguiti come un'unica operazione. Le transazioni sono progettate per garantire l'integrità e la coerenza dei dati, garantendo che un insieme di operazioni sia eseguito completamente o non affatto.
- Una transazione rappresenta un'unità atomica di lavoro in un database. Questo significa che tutte le operazioni all'interno di una transazione vengono eseguite con successo o, in caso di errore, vengono annullate completamente.
  
---

## Proprietà ACID

- Le transazioni devono rispettare le proprietà ACID per garantire la coerenza e la durabilità dei dati:
  
  - **Atomicity (Atomicità):** Una transazione è un'unità atomica; o tutte le sue operazioni vengono eseguite con successo, o nessuna di esse viene eseguita.
  - **Consistency (Coerenza):** Una transazione deve portare il database da uno stato consistente a un altro, rispettando le regole di integrità.
  - **Isolation (Isolamento):** Le transazioni in esecuzione contemporaneamente non devono interferire l'una con l'altra, garantendo un ambiente isolato.
  - **Durability (Durabilità):** Una volta che una transazione è completata con successo, le sue modifiche ai dati devono essere permanenti e resistenti a eventuali guasti del sistema.

---

## Inizio e Fine di una Transazione

- Una transazione inizia con l'istruzione `BEGIN TRANSACTION` e può terminare con `COMMIT` se tutte le operazioni sono state eseguite con successo, o con `ROLLBACK` se si verifica un errore o se è necessario annullare la transazione.

   ```sql
   BEGIN TRANSACTION;

   -- Serie di operazioni SQL

   COMMIT; -- o ROLLBACK in caso di errore o annullamento
   ```

---

## Commit e Rollback

- `COMMIT` conferma tutte le modifiche apportate dalla transazione e le rende permanenti nel database.
- `ROLLBACK` annulla tutte le modifiche apportate dalla transazione, ripristinando il database allo stato iniziale prima dell'inizio della transazione.

---

## Punti di Salvataggio (Savepoints)

- I punti di salvataggio consentono di creare punti intermedi all'interno di una transazione. In caso di errore, è possibile eseguire un `ROLLBACK` solo fino a un certo punto anziché annullare l'intera transazione.

   ```sql
   SAVEPOINT PuntoIntermedio;

   -- Operazioni SQL

   ROLLBACK TO PuntoIntermedio; -- Annulla solo fino a questo punto
   ```

---

## Isolamento delle Transazioni

- L'isolamento delle transazioni assicura che le operazioni di una transazione non siano visibili ad altre transazioni fino al termine della prima. Questo è gestito attraverso il concetto di livelli di isolamento, come `READ COMMITTED`, `REPEATABLE READ`, o `SERIALIZABLE`.

   ```sql
   SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

   BEGIN TRANSACTION;

   -- Operazioni SQL

   COMMIT;
   ```

---

## Gestione degli Errori

- La gestione degli errori è cruciale nella gestione delle transazioni. L'utilizzo di blocchi `TRY...CATCH` (o equivalenti) può catturare errori e gestirli in modo appropriato, ad esempio eseguendo un `ROLLBACK` in caso di fallimento.

   ```sql
   BEGIN TRY
       BEGIN TRANSACTION;

       -- Serie di operazioni SQL

       COMMIT;
   END TRY
   BEGIN CATCH
       ROLLBACK;
       -- Gestione dell'errore
   END CATCH;
   ```

---

## Transazioni Distribuite

- In un ambiente distribuito, le transazioni possono coinvolgere più database o sistemi. La gestione delle transazioni distribuite richiede protocolli specifici, come il protocollo Two-Phase Commit (2PC).

   ```sql
   -- Esempio di Transazione Distribuita
   BEGIN DISTRIBUTED TRANSACTION;

   -- Operazioni SQL su diversi server

   COMMIT;
   ```

La gestione delle transazioni è essenziale per garantire l'integrità e la coerenza dei dati in un database. L'uso corretto delle transazioni, insieme alla gestione degli errori, contribuisce a mantenere un ambiente di database affidabile e duraturo.
