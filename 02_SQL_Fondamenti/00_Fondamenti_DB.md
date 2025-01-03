---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
theme: Gaia
---

# Fondamenti di basi di dati

---

## Il concetto di "database"

Il concetto di "database" o "base di dati" rappresenta una componente fondamentale nel campo dell'informatica. In termini semplici, un database è una collezione organizzata di dati che viene memorizzata e gestita elettronicamente. 

Questi dati possono variare in natura e possono includere informazioni su persone, oggetti, transazioni, o qualsiasi altra entità di interesse. 

L'obiettivo principale di un database è fornire un metodo efficace per archiviare, organizzare e recuperare dati in modo da poter essere facilmente accessibili e gestiti.

---

## Un database è strutturato in tabelle

Un database è strutturato utilizzando **tabelle**, che possono essere paragonate a fogli di calcolo, con righe e colonne. 

Ogni tabella contiene **record**, che rappresentano istanze specifiche di dati, e colonne, che definiscono gli attributi o le caratteristiche dei dati. 

Ad esempio, in una tabella di database che gestisce informazioni sugli studenti, ogni riga potrebbe rappresentare uno studente specifico, mentre le colonne potrebbero includere nome, cognome, numero di matricola e altri attributi relativi agli studenti.

---

## DBMS

Un altro elemento chiave è il concetto di "Sistema di Gestione di Database" (DBMS). Il DBMS è un software che fornisce un'interfaccia tra gli utenti e il database sottostante. Gestisce operazioni come l'inserimento, la modifica, la cancellazione e il recupero dei dati, garantendo al contempo la sicurezza e l'integrità dei dati. 

Un esempio comune di DBMS è MySQL, PostgreSQL o Microsoft SQL Server, ognuno con le proprie caratteristiche e funzionalità.

In breve, il concetto di database e il suo gestore sono fondamentali nell'organizzazione e nella gestione dei dati nell'ambito informatico, fornendo un mezzo efficace per archiviare, recuperare e manipolare dati in modo efficiente e sicuro.

---

### le funzioni principali

Il "Sistema di Gestione di Database" (DBMS) svolge un ruolo cruciale nell'interazione tra gli utenti e il database. Questo software offre un'interfaccia che consente agli utenti di definire, creare, mantenere e controllare l'accesso al database. Alcune delle principali funzioni svolte da un DBMS includono:

1. **Gestione dell'accesso ai dati:** 
2. **Query e Recupero dei Dati:** 
3. **Gestione delle Transazioni:** 
4. **Backup e Ripristino:** 
5. **Integrità dei Dati:** 
6. **Gestione della Concorrenza:** 

---

### Gestione dell'accesso

Il DBMS controlla chi può accedere ai dati e quali operazioni possono essere eseguite su di essi. Ciò contribuisce a garantire la sicurezza e l'integrità dei dati.

---

### Query e Recupero

Gli utenti possono utilizzare il linguaggio di query (solitamente SQL) per interrogare il database e recuperare informazioni specifiche. Le query consentono di filtrare, ordinare e presentare i dati in modi diversi.

---

### Gestione delle Transazioni

Una transazione rappresenta una serie di operazioni eseguite come un'unità atomica. Il DBMS garantisce che le transazioni siano eseguite completamente o annullate completamente per mantenere la coerenza dei dati.

---

### Backup e Ripristino

Il DBMS fornisce strumenti per eseguire regolarmente il backup dei dati, preservando una copia sicura del database. In caso di perdita di dati o problemi, è possibile ripristinare il database utilizzando i dati di backup.

---

### Integrità dei Dati

I DBMS implementano vincoli di integrità per garantire che i dati soddisfino determinate regole o standard. Ad esempio, una chiave primaria deve essere univoca, o una chiave esterna deve fare riferimento a un record esistente in un'altra tabella.

---

### Gestione della Concorrenza

Nei sistemi in cui più utenti accedono contemporaneamente al database, il DBMS gestisce la concorrenza, evitando che le operazioni interferiscano tra loro e mantenendo la coerenza dei dati.

---

### La scelta del DBMS

La scelta del DBMS dipende spesso dai requisiti specifici del progetto, compresi fattori come la complessità dei dati, il volume di dati, i requisiti di prestazioni e le esigenze di sicurezza.

Il DBMS costituisce l'interfaccia critica tra gli utenti e il database, offrendo funzionalità fondamentali per la gestione, la sicurezza e la manipolazione efficace dei dati.

1. **Record:** 
2. **Campi o Colonne:** 
3. **Chiavi:** 
4. **Relazioni tra Tabelle:** 
5. **Attributi e Tipi di Dati:** 

---

## Tabelle

Le tabelle costituiscono uno degli elementi chiave in un database, fornendo una struttura organizzata per immagazzinare i dati. 

Ogni tabella è composta da righe e colonne, dove ogni riga rappresenta un record e ogni colonna rappresenta un attributo o una caratteristica specifica dei dati.

---

## Record

Un record è un'istanza di dati rappresentata da una singola riga all'interno di una tabella. Ad esempio, in una tabella che gestisce informazioni sugli studenti, ogni record potrebbe contenere i dettagli specifici di uno studente, come il nome, il cognome, il numero di matricola e altre informazioni.

---

### Campi o Colonne

Le colonne di una tabella rappresentano gli attributi o le proprietà dei dati. Ad esempio, in una tabella degli studenti, potrebbero esserci colonne come "Nome", "Cognome", "Numero di Matricola", "Corso di Studi", ecc. Ogni colonna contiene dati di un tipo specifico, come stringhe di testo, numeri o date.

---

### Chiavi

Le chiavi sono elementi cruciali nella progettazione di una tabella. La chiave primaria identifica in modo univoco ogni record nella tabella. Ad esempio, un numero di matricola potrebbe essere utilizzato come chiave primaria in una tabella degli studenti. Le chiavi esterne sono usate per stabilire relazioni tra tabelle.

---

### Relazioni tra Tabelle

Nei database relazionali, le tabelle sono spesso collegate attraverso relazioni. Ad esempio, una tabella degli studenti potrebbe essere collegata a una tabella dei corsi tramite una chiave esterna, indicando quali studenti sono iscritti a quali corsi.

---

### Attributi e Tipi

Ogni colonna di una tabella ha un tipo di dato associato, come VARCHAR per stringhe di testo, INTEGER per numeri interi, DATE per date, ecc. La definizione accurata degli attributi e dei tipi di dati è essenziale per garantire la coerenza dei dati.

---

## Progettazione

La progettazione delle tabelle è un aspetto critico nella creazione di un database efficiente. Una buona progettazione delle tabelle contribuisce a garantire l'integrità dei dati, la facilità di interrogazione e una gestione efficiente dei dati all'interno del sistema di gestione di database.

---

## Chiavi" e "Relazioni

Continuiamo con il concetto di "Chiavi" e "Relazioni". Le chiavi sono fondamentali per la strutturazione e l'organizzazione dei dati in un database relazionale, e le relazioni tra tabelle permettono di collegare informazioni tra loro in modo significativo.

1. **Chiavi Primarie (Primary Keys):** 
2. **Chiavi Esterne (Foreign Keys):** 
3. **Relazioni Uno a Uno, Uno a Molti, Molti a Uno, Molti a Molti:** 
4. **Vincoli di Integrità Referenziale:** 
5. **Indici:** 

---

### Chiavi Primarie

Ogni tabella deve avere una chiave primaria, che è un attributo (o insieme di attributi) che identifica in modo univoco ogni record nella tabella. La chiave primaria garantisce l'unicità e l'identificazione senza ambiguità dei dati in una tabella.

---

### Chiavi Esterne

Le chiavi esterne sono utilizzate per stabilire relazioni tra tabelle. Una chiave esterna in una tabella fa riferimento alla chiave primaria di un'altra tabella, creando così una connessione tra i dati nelle due tabelle. Questo è essenziale per rappresentare relazioni complesse tra diverse entità.

---

### Relazioni 

Le relazioni tra tabelle possono assumere diverse forme. Ad esempio, una relazione uno a uno significa che ogni record in una tabella è collegato a esattamente un record nell'altra tabella. Una relazione uno a molti indica che un record in una tabella può essere collegato a molti record nell'altra tabella, ma ogni record in quest'ultima può essere collegato a un solo record nella prima tabella.

---

### Vincoli di Integrità Referenziale

I sistemi di gestione di database consentono di definire vincoli di integrità referenziale tra le chiavi primarie e le chiavi esterne. Questi vincoli assicurano che le relazioni tra le tabelle siano coerenti e che non vi siano riferimenti a dati inesistenti.

---

### Indici

Gli indici vengono utilizzati per migliorare le prestazioni nelle query che coinvolgono le chiavi. Creando un indice su una colonna, il DBMS può accedere più rapidamente ai dati in base a quella colonna, accelerando le operazioni di ricerca.

---

### garantire l'integrità dei dati

La corretta gestione delle chiavi e delle relazioni è essenziale per garantire l'integrità dei dati e consentire una progettazione del database che rifletta accuratamente le relazioni tra le diverse entità del dominio di interesse. Un'appropriata comprensione di questi concetti è cruciale nella progettazione e nell'implementazione di basi di dati relazionali.
