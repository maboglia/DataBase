---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# Fondamenti di basi di dati

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

---

## Il concetto di "database"

Il concetto di "database" o "base di dati" rappresenta una componente fondamentale nel campo dell'informatica. In termini semplici, un database è una collezione organizzata di dati che viene memorizzata e gestita elettronicamente. 


---

Questi dati possono variare in natura e possono includere informazioni su persone, oggetti, transazioni, o qualsiasi altra entità di interesse. 

---

L'obiettivo principale di un database è fornire un metodo efficace per archiviare, organizzare e recuperare dati in modo da poter essere facilmente accessibili e gestiti.

---

## Un database è strutturato in tabelle

Un database è strutturato utilizzando **tabelle**, che possono essere paragonate a fogli di calcolo, con righe e colonne. 

---

Ogni tabella contiene **record**, che rappresentano istanze specifiche di dati, e colonne, che definiscono gli attributi o le caratteristiche dei dati. 

---

Ad esempio, in una tabella di database che gestisce informazioni sugli studenti, ogni riga potrebbe rappresentare uno studente specifico, mentre le colonne potrebbero includere nome, cognome, numero di matricola e altri attributi relativi agli studenti.

---

## DBMS

---


Un altro elemento chiave è il concetto di "Sistema di Gestione di Database" (DBMS). Il DBMS è un software che fornisce un'interfaccia tra gli utenti e il database sottostante. Gestisce operazioni come l'inserimento, la modifica, la cancellazione e il recupero dei dati, garantendo al contempo la sicurezza e l'integrità dei dati. 

---

Un esempio comune di DBMS è MySQL, PostgreSQL o Microsoft SQL Server, ognuno con le proprie caratteristiche e funzionalità.


---

In breve, il concetto di database e il suo gestore sono fondamentali nell'organizzazione e nella gestione dei dati nell'ambito informatico, fornendo un mezzo efficace per archiviare, recuperare e manipolare dati in modo efficiente e sicuro.

---

### le funzioni principali

Il "Sistema di Gestione di Database" (DBMS) svolge un ruolo cruciale nell'interazione tra gli utenti e il database. Questo software offre un'interfaccia che consente agli utenti di definire, creare, mantenere e controllare l'accesso al database. Alcune delle principali funzioni svolte da un DBMS includono:

---

### Gestione dell'accesso

1. **Gestione dell'accesso ai dati:** Il DBMS controlla chi può accedere ai dati e quali operazioni possono essere eseguite su di essi. Ciò contribuisce a garantire la sicurezza e l'integrità dei dati.

---

### Query e Recupero

2. **Query e Recupero dei Dati:** Gli utenti possono utilizzare il linguaggio di query (solitamente SQL) per interrogare il database e recuperare informazioni specifiche. Le query consentono di filtrare, ordinare e presentare i dati in modi diversi.

---

### Gestione delle Transazioni

3. **Gestione delle Transazioni:** Una transazione rappresenta una serie di operazioni eseguite come un'unità atomica. Il DBMS garantisce che le transazioni siano eseguite completamente o annullate completamente per mantenere la coerenza dei dati.

---

### Backup e Ripristino

4. **Backup e Ripristino:** Il DBMS fornisce strumenti per eseguire regolarmente il backup dei dati, preservando una copia sicura del database. In caso di perdita di dati o problemi, è possibile ripristinare il database utilizzando i dati di backup.

---

### Integrità dei Dati

5. **Integrità dei Dati:** I DBMS implementano vincoli di integrità per garantire che i dati soddisfino determinate regole o standard. Ad esempio, una chiave primaria deve essere univoca, o una chiave esterna deve fare riferimento a un record esistente in un'altra tabella.

---

### Gestione della Concorrenza

6. **Gestione della Concorrenza:** Nei sistemi in cui più utenti accedono contemporaneamente al database, il DBMS gestisce la concorrenza, evitando che le operazioni interferiscano tra loro e mantenendo la coerenza dei dati.

---

### La scelta del DBMS

La scelta del DBMS dipende spesso dai requisiti specifici del progetto, compresi fattori come la complessità dei dati, il volume di dati, i requisiti di prestazioni e le esigenze di sicurezza.


---

In conclusione, il DBMS costituisce l'interfaccia critica tra gli utenti e il database, offrendo funzionalità fondamentali per la gestione, la sicurezza e la manipolazione efficace dei dati.
