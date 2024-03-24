# Fondamenti di basi di dati

---

- [Algebra Relazionale](01_AlgebraRelazionale/01_alegbra_relazionale.md) 
- [Il Modello RELAZIONALE](./01_AlgebraRelazionale/02_modello_relazionale.md) 
- [DMNS](02_SQL_Fondamenti/00_Fondamenti_DB.md)
- [Normalizzazione](02_SQL_Fondamenti/03_normalizzazione.md)
- [SQL](02_SQL_Fondamenti/00_fondamenti-DB2.md)
- [Tipi di dato](02_SQL_Fondamenti/01_tipi_di_dato.md)
- [DDL](03_SQL_CostruttiAvanzati/01_DDL.md)
- [DCL](03_SQL_CostruttiAvanzati/01_DCL.md) 
- [DML](03_SQL_CostruttiAvanzati/01_DML.md) 
- [Query](03_SQL_CostruttiAvanzati/01_QueryLanguage.md)
- [Integrità referenziale](03_SQL_CostruttiAvanzati/08_vincoli_integrita.md) 
- [Union e JOIN](03_SQL_CostruttiAvanzati/05_Join.md) 
- [Funzioni](03_SQL_CostruttiAvanzati/11_funzioni.md)
- Raggruppamenti
- Funzioni finestra (Windows Function) 
- [Viste](03_SQL_CostruttiAvanzati/07_viste.md)
- [Sub Query](03_SQL_CostruttiAvanzati/04_Filtraggio.md)
- [Indici](03_SQL_CostruttiAvanzati/06_indici.md)
- [Triggers](03_SQL_CostruttiAvanzati/12_trigger.md)
- Stored Function
- Events
- [Stored Procedures](03_SQL_CostruttiAvanzati/13_stored_procedures.md)
- [Transaction](03_SQL_CostruttiAvanzati/14_transazioni.md)
- [Installazione MySQL](07_TipiDB/27_mysql.md)
- Accesso DBMS (DBA)
- Accesso DBMS (user) 
- Backup/Restoring

---

## Le basi di dati

Le basi di dati sono strumenti essenziali nell'ambito dell'informatica e vengono utilizzate per organizzare, archiviare e recuperare dati in modo efficiente. Ecco alcuni concetti fondamentali:

---

### Database

1. **Database (o Base di Dati):** Un database è una raccolta organizzata di dati, solitamente memorizzati e gestiti elettronicamente. Può comprendere tabelle, relazioni, viste, procedure e altro.

---

### Sistema di Gestione

2. **Sistema di Gestione di Database (DBMS):** Un DBMS è un software che fornisce un'interfaccia per interagire con il database. Gestisce le richieste di accesso, garantisce l'integrità dei dati e offre funzionalità di sicurezza.

---

### Tabelle e Record

3. **Tabelle e Record:** Una tabella è una struttura di base in un database e contiene dati organizzati in righe (record) e colonne (campi). Ogni record rappresenta un'istanza di dati, mentre le colonne definiscono i vari attributi.

---

### Chiavi

4. **Chiavi:** Una chiave è un attributo (o insieme di attributi) che identifica univocamente ogni record in una tabella. Le chiavi sono fondamentali per stabilire relazioni tra tabelle.

---

### Relazioni

5. **Relazioni:** Le relazioni sono connessioni tra le tabelle basate su chiavi. Ad esempio, una tabella di studenti potrebbe essere collegata a una tabella di corsi tramite una chiave esterna che indica quale studente è iscritto a quale corso.

---

### Query

6. **Query:** Le query sono istruzioni che permettono di recuperare, aggiornare o manipolare dati in un database. Un linguaggio di query comune è il SQL (Structured Query Language).

---

### Normalizzazione

7. **Normalizzazione:** La normalizzazione è un processo di progettazione del database che mira a organizzare i dati in modo efficiente, riducendo la duplicazione e garantendo l'integrità.

---

### Transazioni

8. **Transazioni:** Le transazioni sono operazioni atomiche eseguite su un database. Devono essere eseguite completamente o non affatto, garantendo la coerenza dei dati.

---

### Integrità dei Dati

9. **Integrità dei Dati:** La integrità dei dati assicura che i dati nel database siano accurati e coerenti. Ciò può essere garantito attraverso vincoli di integrità, come chiavi primarie e esterne.

---

### Backup e Ripristino

10. **Backup e Ripristino:** La creazione regolare di backup è essenziale per la sicurezza dei dati. Il ripristino consente di recuperare i dati in caso di perdita o danneggiamento.

---

Questi sono solo alcuni dei concetti di base relativi alle basi di dati. La progettazione e la gestione di basi di dati efficaci richiedono una comprensione approfondita di questi concetti e delle pratiche migliori.
