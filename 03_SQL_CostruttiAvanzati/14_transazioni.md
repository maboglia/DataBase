---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# Gestione delle Transazioni

Le transazioni sono un concetto fondamentale per garantire la coerenza e l'integrità dei dati in un database, consentendo l'esecuzione di più operazioni come un'unica unità atomica.

---

## Definizione di Transazione

1. **Definizione di Transazione
   - Una transazione rappresenta una sequenza di uno o più comandi SQL eseguiti come un'unica operazione. Le transazioni sono progettate per garantire l'integrità e la coerenza dei dati, garantendo che un insieme di operazioni sia eseguito completamente o non affatto.

---

## Proprietà ACID

2. **Proprietà ACID
   - Le transazioni devono rispettare le proprietà ACID per garantire la coerenza e la durabilità dei dati:
      - **Atomicity (Atomicità):** Una transazione è un'unità atomica; o tutte le sue operazioni vengono eseguite con successo, o nessuna di esse viene eseguita.
      - **Consistency (Coerenza):** Una transazione deve portare il database da uno stato consistente a un altro, rispettando le regole di integrità.
      - **Isolation (Isolamento):** Le transazioni in esecuzione contemporaneamente non devono interferire l'una con l'altra, garantendo un ambiente isolato.
      - **Durability (Durabilità):** Una volta che una transazione è completata con successo, le sue modifiche ai dati devono essere permanenti e resistenti a eventuali guasti del sistema.

---

## Inizio e Fine

3. **Inizio e Fine di una Transazione
   - Una transazione inizia con l'istruzione `BEGIN TRANSACTION` e può terminare con `COMMIT` se tutte le operazioni sono state eseguite con successo, o con `ROLLBACK` se si verifica un errore o se è necessario annullare la transazione.

   ```sql
   BEGIN TRANSACTION;

   -- Serie di operazioni SQL

   COMMIT; -- o ROLLBACK in caso di errore o annullamento
   ```

---

## Commit e Rollback

4. **Commit e Rollback
   - `COMMIT` conferma tutte le modifiche apportate dalla transazione e le rende permanenti nel database.
   - `ROLLBACK` annulla tutte le modifiche apportate dalla transazione, ripristinando il database allo stato iniziale prima dell'inizio della transazione.

---

## Punti di Salvataggio

5. **Punti di Salvataggio (Savepoints)
   - I punti di salvataggio consentono di creare punti intermedi all'interno di una transazione. In caso di errore, è possibile eseguire un `ROLLBACK` solo fino a un certo punto anziché annullare l'intera transazione.

   ```sql
   SAVEPOINT PuntoIntermedio;

   -- Operazioni SQL

   ROLLBACK TO PuntoIntermedio; -- Annulla solo fino a questo punto
   ```

---

## Isolamento delle Transazioni

6. **Isolamento delle Transazioni
   - L'isolamento delle transazioni assicura che le operazioni di una transazione non siano visibili ad altre transazioni fino al termine della prima. Questo è gestito attraverso il concetto di livelli di isolamento, come `READ COMMITTED`, `REPEATABLE READ`, o `SERIALIZABLE`.

   ```sql
   SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

   BEGIN TRANSACTION;

   -- Operazioni SQL

   COMMIT;
   ```

---

## Gestione degli Errori

7. **Gestione degli Errori
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

8. **Transazioni Distribuite
   - In un ambiente distribuito, le transazioni possono coinvolgere più database o sistemi. La gestione delle transazioni distribuite richiede protocolli specifici, come il protocollo Two-Phase Commit (2PC).

   ```sql
   -- Esempio di Transazione Distribuita
   BEGIN DISTRIBUTED TRANSACTION;

   -- Operazioni SQL su diversi server

   COMMIT;
   ```

La gestione delle transazioni è essenziale per garantire l'integrità e la coerenza dei dati in un database. L'uso corretto delle transazioni, insieme alla gestione degli errori, contribuisce a mantenere un ambiente di database affidabile e duraturo.

## Recap

---


## le "Transazioni"

Parliamo ora delle "Transazioni" e della "Gestione della Concorrenza". Le transazioni sono un aspetto cruciale nei database relazionali, mentre la gestione della concorrenza si occupa della coordinazione di più utenti che accedono contemporaneamente ai dati per garantire coerenza e integrità.

---

## Transazioni

1. **Transazioni
   - Una transazione rappresenta un'unità atomica di lavoro in un database. Questo significa che tutte le operazioni all'interno di una transazione vengono eseguite con successo o, in caso di errore, vengono annullate completamente.

---

   - Le transazioni sono caratterizzate dalle proprietà ACID:
- **Atomicità:** Una transazione è atomica, ovvero viene eseguita completamente o annullata completamente in caso di errore, senza uno stato intermedio.

---

- **Coerenza:** Una transazione porta il database da uno stato coerente a un altro stato coerente. Tutte le regole di integrità devono essere rispettate.

---

- **Isolamento:** Le transazioni vengono eseguite in modo isolato l'una dall'altra, il che significa che i cambiamenti apportati da una transazione non sono visibili ad altre transazioni fino al termine della prima.

---

- **Durabilità:** Una volta completata con successo, una transazione deve essere permanente e resistere a eventuali guasti del sistema.

---

## Gestione della Concorrenza

2. **Gestione della Concorrenza
   - In ambienti in cui più utenti accedono contemporaneamente al database, la gestione della concorrenza diventa essenziale per evitare problemi come la perdita di dati o la lettura di dati non consistenti.
   - I sistemi di gestione di database utilizzano tecniche come il locking, il controllo delle transazioni e l'isolamento per gestire la concorrenza.
   - **Locking:** Consiste nel bloccare temporaneamente una risorsa, come una riga o una tabella, in modo che altri utenti non possano modificarla fino al termine della transazione che detiene il blocco.
   - **Controllo delle Transazioni:** I meccanismi di controllo delle transazioni coordinano l'inizio, la fine e il commit delle transazioni, garantendo che avvengano in modo coerente e senza interferenze con altre transazioni.
   - **Isolamento:** L'isolamento garantisce che le transazioni vengano eseguite in modo indipendente, senza influenzare l'output delle altre transazioni fino al momento del commit.
   - **Deadlock:** Un deadlock si verifica quando due o più transazioni sono bloccate tra loro, impedendo il progresso. I sistemi di gestione di database implementano strategie per rilevare e risolvere deadlock.

---

La corretta gestione delle transazioni e della concorrenza è essenziale per garantire la coerenza e l'integrità dei dati in ambienti multiutente. Gli sviluppatori e gli amministratori di database devono essere consapevoli di queste sfide e utilizzare pratiche e strumenti appropriati per gestire efficacemente le transazioni in un ambiente di database relazionale.
