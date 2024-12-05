### **Programma del Corso: Fondamenti di Basi di Dati**  

#### **Obiettivi del corso:**  

1. Comprendere i concetti fondamentali delle basi di dati.  
2. Apprendere i principi della modellazione e progettazione di basi di dati relazionali.  
3. Imparare le basi del linguaggio SQL per interrogazioni e manipolazione dei dati.  

---

### **Modulo 1: Introduzione alle basi di dati**  

- **Durata:** 3 ore  
- **Contenuti:**  
  1. Definizione di basi di dati e sistemi di gestione (DBMS).  
  2. Tipologie di basi di dati: relazionali, NoSQL, gerarchiche, a grafo.  
  3. Componenti di un database: tabelle, righe, colonne, chiavi primarie e chiavi esterne.  
  4. Vantaggi delle basi di dati rispetto ai file tradizionali.  

---

### **Modulo 2: Modellazione dei dati e progettazione**  

- **Durata:** 6 ore  
- **Contenuti:**  
  1. Concetti di modello ER (Entity-Relationship).  
  2. Entità, attributi e relazioni.  
  3. Cardinalità e associazioni.  
  4. Progettazione logica e trasformazione in schema relazionale.  
  5. Normalizzazione: forme normali (1NF, 2NF, 3NF).  

---

### **Modulo 3: Linguaggio SQL: Concetti base**  

- **Durata:** 8 ore  
- **Contenuti:**  
  1. Introduzione a SQL: struttura e sintassi.  
  2. Creazione e modifica di tabelle (DDL - Data Definition Language):  
      - `CREATE`, `ALTER`, `DROP`.  
  3. Inserimento, aggiornamento e cancellazione di dati (DML - Data Manipulation Language):  
      - `INSERT`, `UPDATE`, `DELETE`.  
  4. Lettura dei dati (Query):  
      - `SELECT`, utilizzo di `WHERE`, `ORDER BY`, `GROUP BY`, `HAVING`.  

---

### **Modulo 4: Interrogazioni avanzate in SQL**  

- **Durata:** 6 ore  
- **Contenuti:**  
  1. Operatori di unione e intersezione (`UNION`, `INTERSECT`, `EXCEPT`).  
  2. Funzioni di aggregazione (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`).  
  3. Join (interni, esterni, cross join).  
  4. Sottoquery (subquery): correlate e non correlate.  
  5. Creazione e utilizzo di viste.  

---

### **Modulo 5: Introduzione alla gestione delle basi di dati**  

- **Durata:** 4 ore  
- **Contenuti:**  
  1. Concetti di backup e ripristino dei dati.  
  2. Controllo degli accessi: ruoli e permessi.  
  3. Indici e ottimizzazione delle query.  
  4. Introduzione alla transazionalità: ACID, commit e rollback.  

---

### **Modulo 6: Esercitazioni pratiche e progetto finale**  

- **Durata:** 6 ore  
- **Contenuti:**  
  1. Creazione di un database relazionale basato su un caso di studio.  
  2. Scrittura di query SQL per estrarre e manipolare i dati.  
  3. Ottimizzazione delle interrogazioni e analisi delle prestazioni.  
  4. Presentazione del progetto finale.

---

#### **Metodologia didattica:**  

- Lezioni frontali con teoria e spiegazioni.  
- Esercitazioni pratiche su database reali (es. MySQL, PostgreSQL).  
- Discussione di casi studio e problemi reali.  

#### **Materiali forniti:**  

- Slide del corso.  
- Esercizi pratici con database preconfigurati.  
- Accesso a piattaforme di simulazione per basi di dati.  

#### **Durata complessiva:**  

33 ore (variabili in base alle esigenze).  

#### **Prerequisiti:**  

- Conoscenze di base di informatica.  
- Familiarità con un editor di testo e comandi base del terminale (opzionale).  

---

Ecco un'articolazione più dettagliata del **Modulo 1: Introduzione alle basi di dati**.  

---

### **Modulo 1: Introduzione alle basi di dati**  

#### **Durata complessiva:** 3 ore  

#### **Obiettivi del modulo:**  

1. Comprendere il ruolo delle basi di dati e dei sistemi di gestione dei dati (DBMS).  
2. Familiarizzare con la terminologia e i concetti fondamentali.  
3. Esplorare le principali tipologie di basi di dati e i contesti di utilizzo.  

---

#### **1.1 Definizione di basi di dati e DBMS**  

- **Durata:** 30 minuti  
- **Contenuti:**  
  - Cosa si intende per base di dati?  
    - Definizione formale: insieme strutturato di dati persistenti utilizzati per supportare processi aziendali o applicativi.  
    - Esempi pratici: registro di una biblioteca, sistemi di e-commerce, database di social media.  
  - Differenza tra dati e informazioni: trasformazione dei dati grezzi in informazioni utili.  
  - Definizione di DBMS (Database Management System):  
    - Strumento software per la gestione di basi di dati.  
    - Funzioni principali: archiviazione, organizzazione, interrogazione, sicurezza e backup.  
    - Esempi di DBMS popolari: MySQL, PostgreSQL, Oracle, SQL Server, MongoDB.  

#### **1.2 Differenze tra basi di dati e file system tradizionali**  

- **Durata:** 30 minuti  
- **Contenuti:**  
  - Limiti dei file tradizionali:  
    - Ridondanza e inconsistenza dei dati.  
    - Difficoltà di accesso e mancanza di standardizzazione.  
    - Mancanza di controllo degli accessi e difficoltà di aggiornamento.  
  - Vantaggi delle basi di dati:  
    - Eliminazione della ridondanza.  
    - Maggiore integrità e consistenza dei dati.  
    - Accesso simultaneo e controllato per più utenti.  
    - Capacità di eseguire query e analisi avanzate.  

#### **1.3 Componenti di una base di dati**  

- **Durata:** 45 minuti  
- **Contenuti:**  
  - Struttura logica:  
    - Tabelle (entità): insieme di dati organizzati in righe e colonne.  
    - Colonne (attributi): caratteristiche o proprietà di un'entità.  
    - Righe (record): istanze o occorrenze di un'entità.  
  - Concetti chiave:  
    - **Chiave primaria (Primary Key):** identificatore univoco per ogni record.  
    - **Chiave esterna (Foreign Key):** collegamento tra due tabelle per stabilire relazioni.  
  - Esempio pratico:  
    - Tabella "Studenti" con colonne come `ID_Studente`, `Nome`, `Cognome`, `Corso`.  
    - Tabella "Corsi" collegata tramite una chiave esterna `ID_Corso`.  

#### **1.4 Tipologie di basi di dati**  

- **Durata:** 45 minuti  
- **Contenuti:**  
  - Introduzione ai diversi tipi di basi di dati:  
    1. **Relazionali (RDBMS):** basate su tabelle e utilizzano SQL.  
    2. **NoSQL:** orientate a documenti, chiave-valore, colonne o grafi.  
    3. **Gerarchiche:** struttura ad albero, ad esempio nei sistemi legacy.  
    4. **A grafo:** utilizzate per rappresentare reti complesse, ad esempio social network (Neo4j).  
  - Vantaggi e svantaggi di ciascun tipo:  
    - Relazionali: standardizzate, ottime per dati strutturati.  
    - NoSQL: flessibili, ideali per grandi volumi di dati non strutturati.  
  - Esempi reali di utilizzo:  
    - Relazionali: gestionali aziendali.  
    - NoSQL: analisi big data, e-commerce, applicazioni mobili.  

#### **1.5 Introduzione a SQL e NoSQL (panoramica)**  

- **Durata:** 30 minuti  
- **Contenuti:**  
  - Differenza tra linguaggio SQL e approcci NoSQL.  
  - Concetti base di SQL:  
    - Linguaggio dichiarativo per interrogazioni.  
    - Sintassi semplice per operazioni CRUD (Create, Read, Update, Delete).  
  - Concetti base di NoSQL:  
    - Maggiore flessibilità nello schema dei dati.  
    - Adatto a sistemi distribuiti e scalabili.  

#### **1.6 Quiz e discussione interattiva**  

- **Durata:** 30 minuti  
- **Attività:**  
  - Breve quiz per valutare l’apprendimento dei concetti trattati.  
  - Discussione interattiva:  
    - Analisi di un caso reale per identificare vantaggi e limiti di una base di dati rispetto a un file system.  
    - Domande aperte e brainstorming sui possibili usi di basi di dati nei contesti quotidiani.  

---

#### **Risultati attesi al termine del modulo:**  

- Conoscenza dei concetti base delle basi di dati e dei DBMS.  
- Capacità di identificare scenari in cui utilizzare una base di dati.  
- Comprensione delle differenze tra approcci relazionali e non relazionali.  

---

### **Breve Quiz - Modulo 1: Introduzione alle basi di dati**  

#### **Domande a scelta multipla (MCQ)**  

1. **Qual è la funzione principale di un DBMS (Database Management System)?**  
   - a) Creare report grafici  
   - b) Gestire, organizzare e interrogare basi di dati  
   - c) Fornire software di analisi avanzata  
   - d) Archiviare dati in formato non strutturato  
   - **Risposta corretta:** b  

2. **Quale delle seguenti è una caratteristica di una chiave primaria?**  
   - a) Può contenere valori duplicati  
   - b) È un identificatore univoco per ogni record  
   - c) È utilizzata solo in database NoSQL  
   - d) Deve essere sempre un numero intero  
   - **Risposta corretta:** b  

3. **Quale dei seguenti esempi è un DBMS relazionale?**  
   - a) MySQL  
   - b) MongoDB  
   - c) Neo4j  
   - d) Apache Kafka  
   - **Risposta corretta:** a  

4. **Qual è uno svantaggio del file system tradizionale rispetto a un DBMS?**  
   - a) Facilità di accesso simultaneo ai dati  
   - b) Presenza di ridondanza e inconsistenza nei dati  
   - c) Maggiore sicurezza e controllo degli accessi  
   - d) Maggiore velocità di ricerca dei dati  
   - **Risposta corretta:** b  

5. **Quale delle seguenti NON è una tipologia di base di dati?**  
   - a) Relazionale  
   - b) Documentale  
   - c) Colonna di dati  
   - d) Foglio elettronico  
   - **Risposta corretta:** d  

---

#### **Domande vero/falso**  

6. **Un database relazionale è sempre più adatto rispetto a un database NoSQL.**  
   - **Risposta:** Falso  

7. **La normalizzazione è un processo che aiuta a ridurre la ridondanza nei dati.**  
   - **Risposta:** Vero  

8. **In una tabella, una chiave esterna è utilizzata per collegare due tabelle tra loro.**  
   - **Risposta:** Vero  

---

#### **Domande aperte**  

9. **Descrivi brevemente la differenza tra una chiave primaria e una chiave esterna in un database.**  
   - **Risposta attesa:** La chiave primaria è un identificatore univoco per i record in una tabella. La chiave esterna è un attributo che crea una relazione tra due tabelle facendo riferimento alla chiave primaria di un'altra tabella.  

10. **Elenca due vantaggi principali di utilizzare un DBMS rispetto a un file system tradizionale.**  

- **Risposta attesa:**  
     1. Riduzione della ridondanza e maggiore consistenza dei dati.  
     2. Controllo degli accessi e supporto per utenti multipli simultaneamente.  

11. **Fornisci un esempio pratico di come un database potrebbe essere utilizzato in un'applicazione quotidiana.**  

- **Risposta attesa:** Un database potrebbe essere utilizzato in un sistema di gestione di una biblioteca per tenere traccia dei libri disponibili, dei prestiti e delle scadenze per i ritorni.  

---

#### **Punteggio e feedback:**  

- **0-5 risposte corrette:** Approfondisci i concetti base del modulo.  
- **6-8 risposte corrette:** Buona comprensione dei concetti fondamentali!  
- **9-11 risposte corrette:** Ottima padronanza dei contenuti del modulo!  

---

Ecco un'articolazione dettagliata per il **Modulo 2: Modellazione dei dati e progettazione**.  

---

### **Modulo 2: Modellazione dei dati e progettazione**  

#### **Durata complessiva:** 6 ore  

#### **Obiettivi del modulo:**  

1. Apprendere i concetti fondamentali della modellazione concettuale e logica dei dati.  
2. Creare diagrammi Entity-Relationship (ER) per rappresentare un dominio applicativo.  
3. Trasformare un modello ER in uno schema relazionale.  
4. Comprendere l'importanza della normalizzazione per migliorare l'integrità e l'efficienza del database.  

---

### **Struttura del modulo**  

---

#### **2.1 Introduzione alla modellazione concettuale**  

- **Durata:** 45 minuti  
- **Contenuti:**  
  - Cos'è la modellazione concettuale?  
    - Rappresentazione astratta di un dominio applicativo.  
    - Scopo: catturare i requisiti di dati senza entrare nei dettagli implementativi.  
  - Concetto di entità, attributi e relazioni:  
    - **Entità:** oggetti del mondo reale che si vogliono rappresentare (es. Studenti, Corsi).  
    - **Attributi:** proprietà delle entità (es. Nome, Età).  
    - **Relazioni:** associazioni tra entità (es. uno studente si iscrive a un corso).  
  - Casi d'uso comuni per la modellazione concettuale:  
    - Sistemi aziendali (CRM, ERP).  
    - Applicazioni web e mobile.  

---

#### **2.2 Diagrammi Entity-Relationship (ER)**  

- **Durata:** 1 ora e 30 minuti  
- **Contenuti:**  
  - Elementi principali di un diagramma ER:  
    - Rettangoli per le entità.  
    - Ovali per gli attributi.  
    - Losanghe per le relazioni.  
  - Cardinalità e molteplicità delle relazioni:  
    - Uno-a-uno (1:1), uno-a-molti (1:N), molti-a-molti (N:M).  
  - Attributi chiave:  
    - Attributi univoci (chiavi primarie).  
    - Attributi derivati (calcolabili da altri dati).  
  - Relazioni deboli e forti:  
    - Relazioni che dipendono o meno da un'entità principale.  
  - Esempi pratici:  
    - Creazione di un diagramma ER per un sistema di biblioteca o di gestione aziendale.  

---

#### **2.3 Dal modello concettuale allo schema relazionale**  

- **Durata:** 1 ora  
- **Contenuti:**  
  - Trasformazione di entità in tabelle:  
    - Ogni entità diventa una tabella.  
    - Gli attributi diventano colonne.  
  - Trasformazione di relazioni:  
    - Le relazioni uno-a-uno possono essere incorporate in una delle due tabelle.  
    - Le relazioni uno-a-molti introducono chiavi esterne.  
    - Le relazioni molti-a-molti richiedono l’introduzione di tabelle di associazione.  
  - Esempio pratico:  
    - Conversione di un diagramma ER in uno schema relazionale completo.  

---

#### **2.4 Normalizzazione delle basi di dati**  

- **Durata:** 2 ore  
- **Contenuti:**  
  - Concetto di normalizzazione:  
    - Processo di organizzazione dei dati per ridurre la ridondanza e migliorare l’integrità.  
  - Forme normali:  
    1. **Prima forma normale (1NF):** eliminare i gruppi ripetuti; ogni valore deve essere atomico.  
    2. **Seconda forma normale (2NF):** eliminare dipendenze parziali dalle chiavi primarie.  
    3. **Terza forma normale (3NF):** eliminare dipendenze transitive dalle chiavi primarie.  
  - Vantaggi e svantaggi della normalizzazione:  
    - Vantaggi: riduzione della ridondanza, maggiore integrità.  
    - Svantaggi: potenziale aumento della complessità delle query.  
  - Esempi pratici:  
    - Applicazione della normalizzazione a una tabella "Ordini" con colonne ridondanti.  

---

#### **2.5 Discussione di casi studio ed esercitazioni pratiche**  

- **Durata:** 1 ora e 30 minuti  
- **Contenuti:**  
  - Casi studio:  
    1. Modellazione e progettazione di un database per un sistema di gestione di una scuola.  
    2. Progettazione di un database per un sistema di e-commerce.  
  - Attività pratica:  
    - Creare un diagramma ER basato su un caso fornito.  
    - Trasformare il diagramma ER in uno schema relazionale.  
    - Applicare la normalizzazione alle tabelle progettate.  

---

### **Risultati attesi al termine del modulo:**  

1. Capacità di rappresentare un dominio applicativo tramite diagrammi ER.  
2. Comprensione delle relazioni tra entità e delle loro cardinalità.  
3. Abilità nel trasformare un modello concettuale in uno schema relazionale.  
4. Competenza nell'applicare i principi di normalizzazione per migliorare l'integrità dei dati.  

---

### **Materiali forniti:**  

- Slide teoriche e esempi pratici.  
- Strumenti per creare diagrammi ER (es. Lucidchart, Draw.io, o software specifici come MySQL Workbench).  
- Set di esercizi con casi studio dettagliati.  

---

Ecco una proposta di contenuti per le **slide teoriche** e gli **esempi pratici** relativi al **Modulo 2: Modellazione dei dati e progettazione**.  

---

### **Slide Teoriche**

#### **1. Introduzione alla modellazione concettuale**  

**Slide 1: Cos’è la modellazione concettuale?**  

- Definizione: Rappresentazione astratta del dominio applicativo.  
- Obiettivo: Identificare entità, attributi e relazioni senza dettagli tecnici.  
- Importanza: Pianificazione strutturata per database efficaci.  

**Slide 2: Concetti chiave**  

- **Entità:** oggetti del mondo reale (es. Studente, Corso).  
- **Attributi:** proprietà dell’entità (es. Nome, Cognome).  
- **Relazioni:** associazioni tra entità (es. uno Studente segue un Corso).  

#### **2. Diagrammi Entity-Relationship (ER)**  

**Slide 3: Componenti del diagramma ER**  

- Rettangoli: Entità.  
- Ovali: Attributi.  
- Losanghe: Relazioni.  

**Slide 4: Cardinalità e molteplicità**  

- Definizione: Numero di occorrenze di un’entità associate a un’altra.  
  - Uno-a-uno (1:1).  
  - Uno-a-molti (1:N).  
  - Molti-a-molti (N:M).  
- Rappresentazione grafica nei diagrammi ER.  

**Slide 5: Tipi di attributi**  

- Attributi semplici e composti.  
- Attributi univoci (chiave primaria).  
- Attributi derivati.  

**Slide 6: Relazioni deboli e forti**  

- **Relazioni forti:** entrambe le entità possono esistere indipendentemente.  
- **Relazioni deboli:** una dipende dall’esistenza dell’altra.  

#### **3. Dal modello ER allo schema relazionale**  

**Slide 7: Processo di trasformazione**  

- Ogni entità diventa una tabella.  
- Gli attributi diventano colonne.  
- Relazioni uno-a-uno e uno-a-molti: chiavi esterne.  
- Relazioni molti-a-molti: creazione di una tabella di associazione.  

#### **4. Normalizzazione**  

**Slide 8: Concetto di normalizzazione**  

- Definizione: Processo di ottimizzazione delle tabelle per ridurre la ridondanza.  
- Vantaggi: integrità e minore rischio di inconsistenza.  

**Slide 9: Le forme normali**  

- **1NF:** Eliminare gruppi ripetuti; valori atomici.  
- **2NF:** Eliminare dipendenze parziali dalla chiave primaria.  
- **3NF:** Eliminare dipendenze transitive dalla chiave primaria.  

**Slide 10: Esempi di normalizzazione**  

- Tabella originale con ridondanza.  
- Applicazione delle regole di normalizzazione.  

---

### **Esempi Pratici**

#### **Esempio 1: Creazione di un diagramma ER**  

**Scenario:** Sistema di gestione di una biblioteca.  

- **Entità principali:**  
  - Libri (Attributi: ISBN, Titolo, Autore).  
  - Utenti (Attributi: ID_Utente, Nome, Email).  
  - Prestiti (Attributi: Data_Prestito, Data_Restituzione).  
- **Relazioni:**  
  - Gli utenti prendono in prestito i libri.  
  - Un libro può essere preso in prestito da più utenti in momenti diversi.  
  - Cardinalità: 1:N tra Libri e Prestiti; 1:N tra Utenti e Prestiti.  

**Attività:** Disegnare il diagramma ER con rettangoli, ovali e losanghe.  

---

#### **Esempio 2: Trasformazione di un diagramma ER in schema relazionale**  

**Scenario:** Dal diagramma ER della biblioteca:  

- **Entità trasformate in tabelle:**  
  1. **Tabella Libri:**  
     - Colonne: ISBN (PK), Titolo, Autore.  
  2. **Tabella Utenti:**  
     - Colonne: ID_Utente (PK), Nome, Email.  
  3. **Tabella Prestiti:**  
     - Colonne: ID_Prestito (PK), ISBN (FK), ID_Utente (FK), Data_Prestito, Data_Restituzione.  

**Attività:** Scrivere SQL per creare queste tabelle.  

```sql
CREATE TABLE Libri (
    ISBN VARCHAR(13) PRIMARY KEY,
    Titolo VARCHAR(100),
    Autore VARCHAR(50)
);

CREATE TABLE Utenti (
    ID_Utente INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(50)
);

CREATE TABLE Prestiti (
    ID_Prestito INT PRIMARY KEY,
    ISBN VARCHAR(13),
    ID_Utente INT,
    Data_Prestito DATE,
    Data_Restituzione DATE,
    FOREIGN KEY (ISBN) REFERENCES Libri(ISBN),
    FOREIGN KEY (ID_Utente) REFERENCES Utenti(ID_Utente)
);
```

---

#### **Esempio 3: Applicazione della normalizzazione**  

**Scenario:** Tabella iniziale "Ordini":  

| ID_Ordine | Cliente | Prodotto1 | Quantità1 | Prodotto2 | Quantità2 |  
|-----------|---------|-----------|-----------|-----------|-----------|  

**Problema:** Ridondanza e difficoltà di aggiornamento.  

**Passi di normalizzazione:**  

1. **1NF:** Eliminare gruppi ripetuti, creando una riga per ogni prodotto.  
2. **2NF:** Creare tabelle separate per "Ordini" e "Prodotti".  
3. **3NF:** Separare i dati del cliente in una tabella distinta.  

**Risultato finale:**  

- **Tabella Ordini:** ID_Ordine, Data_Ordine, ID_Cliente.  
- **Tabella Clienti:** ID_Cliente, Nome_Cliente.  
- **Tabella Prodotti_Ordine:** ID_Ordine, ID_Prodotto, Quantità.  

---

Ecco i contenuti per le **slide teoriche** e gli **esempi pratici** relativi al **Modulo 3: Linguaggio SQL - Fondamenti**.

---

### **Slide Teoriche**

#### **1. Introduzione a SQL**

**Slide 1: Cos’è SQL?**

- Definizione: Structured Query Language.  
- Scopo: Comunicare con i database relazionali.  
- Funzionalità principali:  
  - **DDL (Data Definition Language):** Creare e gestire la struttura dei database.  
  - **DML (Data Manipulation Language):** Inserire, modificare ed eliminare dati.  
  - **DQL (Data Query Language):** Estrarre dati tramite query.  

**Slide 2: I principali comandi SQL**

- **DDL:** `CREATE`, `ALTER`, `DROP`.  
- **DML:** `INSERT`, `UPDATE`, `DELETE`.  
- **DQL:** `SELECT`.  
- **DCL (Data Control Language):** `GRANT`, `REVOKE` (gestione permessi).  

---

#### **2. Creazione e gestione delle tabelle**

**Slide 3: Sintassi del comando `CREATE TABLE`**

- Struttura base:  

  ```sql
  CREATE TABLE Nome_Tabella (
      Colonna1 Tipo_Dato [Constraints],
      Colonna2 Tipo_Dato [Constraints],
      ...
  );
  ```

- Tipi di dati comuni:  
  - **Numerici:** `INT`, `FLOAT`, `DECIMAL`.  
  - **Testuali:** `VARCHAR`, `CHAR`, `TEXT`.  
  - **Date/ora:** `DATE`, `DATETIME`, `TIMESTAMP`.  

**Slide 4: Vincoli (Constraints)**

- **Chiave primaria:** `PRIMARY KEY`.  
- **Chiave esterna:** `FOREIGN KEY`.  
- **Non null:** `NOT NULL`.  
- **Unicità:** `UNIQUE`.  
- **Vincolo di verifica:** `CHECK`.  
- **Default:** `DEFAULT`.  

---

#### **3. Manipolazione dei dati**

**Slide 5: Inserimento dati con `INSERT`**

- Sintassi base:  

  ```sql
  INSERT INTO Nome_Tabella (Colonna1, Colonna2, ...)
  VALUES (Valore1, Valore2, ...);
  ```

**Slide 6: Aggiornamento dati con `UPDATE`**

- Sintassi base:  

  ```sql
  UPDATE Nome_Tabella
  SET Colonna = Valore
  WHERE Condizione;
  ```

**Slide 7: Eliminazione dati con `DELETE`**

- Sintassi base:  

  ```sql
  DELETE FROM Nome_Tabella
  WHERE Condizione;
  ```

---

#### **4. Interrogazione dei dati**

**Slide 8: Estrarre dati con `SELECT`**

- Sintassi base:  

  ```sql
  SELECT Colonna1, Colonna2
  FROM Nome_Tabella
  WHERE Condizione
  ORDER BY Colonna ASC/DESC;
  ```

- Clausole principali:  
  - **`WHERE`:** Filtro dei dati.  
  - **`ORDER BY`:** Ordinamento.  
  - **`LIMIT`:** Limitare il numero di risultati.  

**Slide 9: Operatori e funzioni**

- **Operatori logici:** `AND`, `OR`, `NOT`.  
- **Operatori di confronto:** `=`, `<>`, `<`, `>`, `BETWEEN`, `IN`, `LIKE`.  
- **Funzioni aggregate:** `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`.  

---

### **Esempi Pratici**

#### **Esempio 1: Creazione di una tabella**

**Scenario:** Creare una tabella per un sistema di gestione di ordini.  

```sql
CREATE TABLE Ordini (
    ID_Ordine INT PRIMARY KEY,
    Data_Ordine DATE NOT NULL,
    ID_Cliente INT,
    Totale DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Clienti(ID_Cliente)
);
```

---

#### **Esempio 2: Inserimento e aggiornamento dati**

**Scenario:** Inserire ordini e aggiornare il totale.  

```sql
INSERT INTO Ordini (ID_Ordine, Data_Ordine, ID_Cliente, Totale)
VALUES (1, '2024-12-01', 101, 250.50);

UPDATE Ordini
SET Totale = 300.00
WHERE ID_Ordine = 1;
```

---

#### **Esempio 3: Estrazione dei dati**

**Scenario:** Recuperare ordini di un cliente specifico e ordinarli per data.  

```sql
SELECT ID_Ordine, Data_Ordine, Totale
FROM Ordini
WHERE ID_Cliente = 101
ORDER BY Data_Ordine DESC;
```

---

#### **Esempio 4: Utilizzo di funzioni aggregate**

**Scenario:** Calcolare il totale degli ordini per un cliente.  

```sql
SELECT ID_Cliente, SUM(Totale) AS Totale_Ordini
FROM Ordini
GROUP BY ID_Cliente;
```

---

#### **Esempio 5: Tabelle collegate**

**Scenario:** Collegare le tabelle `Ordini` e `Clienti` per visualizzare i dettagli del cliente.  

```sql
SELECT C.Nome, C.Email, O.ID_Ordine, O.Totale
FROM Clienti C
JOIN Ordini O ON C.ID_Cliente = O.ID_Cliente
WHERE O.Totale > 200.00;
```

---

### **Attività Pratica**

- Creare uno schema relazionale con 3 tabelle: `Clienti`, `Prodotti`, `Ordini`.  
- Popolare le tabelle con dati significativi usando `INSERT`.  
- Estrarre informazioni utili con query SQL:  
  - Ordini di un cliente specifico.  
  - Prodotti più venduti.  
  - Totale speso da ciascun cliente.  

---

Ecco la traduzione e una spiegazione dei punti elencati nella schermata:

---

### **Traduzione**

1. **Un database è qualsiasi raccolta di informazioni correlate.**  
2. **I computer sono ottimi per archiviare database.**  
3. **I sistemi di gestione di database (DBMS) semplificano la creazione, manutenzione e sicurezza di un database.**  
4. **I DBMS ti permettono di eseguire operazioni C.R.U.D. e altre attività amministrative.**  
5. **Esistono due tipi di database: relazionali e non relazionali.**  
6. **I database relazionali utilizzano SQL e memorizzano i dati in tabelle con righe e colonne.**  
7. **I database non relazionali memorizzano i dati utilizzando altre strutture dati.**

---

### **Spiegazione**

1. **Database**  
   Un database è una raccolta organizzata di dati correlati, progettata per essere facilmente accessibile e gestibile. Esempio: un elenco di clienti con nomi, indirizzi e ordini.

2. **Utilità dei computer**  
   I computer sono strumenti ideali per gestire database, poiché permettono di elaborare grandi quantità di dati in modo rapido e accurato.

3. **DBMS (Database Management System)**  
   Un DBMS è un software che funge da intermediario tra l'utente e il database. Consente di:
   - Creare nuove strutture di dati (tabelle, indici).  
   - Aggiornare, eliminare e recuperare informazioni.  
   - Assicurare che i dati siano protetti e accessibili solo a utenti autorizzati.

4. **Operazioni C.R.U.D.**  
   Le operazioni principali gestite da un DBMS sono:
   - **Create:** Creare nuovi dati o strutture.  
   - **Read:** Leggere o recuperare dati.  
   - **Update:** Modificare dati esistenti.  
   - **Delete:** Eliminare dati non più necessari.

5. **Tipologie di database**  
   - **Relazionali:** Si basano su tabelle che organizzano i dati in righe e colonne e utilizzano il linguaggio SQL per interagire con essi. Esempio: MySQL, PostgreSQL.  
   - **Non relazionali (NoSQL):** Usano strutture alternative (come documenti, grafi, chiave-valore) per memorizzare i dati. Esempio: MongoDB, Redis.

6. **Database relazionali**  
   - Utilizzano un approccio tabellare: i dati vengono suddivisi in righe (record) e colonne (attributi).  
   - Si focalizzano su integrità e relazioni tra i dati (chiavi primarie ed esterne).  

7. **Database non relazionali**  
   - Ideali per dati non strutturati o semi-strutturati, come JSON, XML, o grandi volumi di dati.  
   - Possono gestire dati più flessibili rispetto ai database relazionali, ma non garantiscono sempre relazioni forti tra i dati.

---
