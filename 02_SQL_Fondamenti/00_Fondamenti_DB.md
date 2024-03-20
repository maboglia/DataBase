---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# Fondamenti di basi di dati

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
