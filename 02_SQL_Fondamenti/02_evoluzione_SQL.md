# Evoluzione standard SQL

L'evoluzione dello standard **SQL (Structured Query Language)** si è sviluppata attraverso diverse fasi e versioni, ognuna delle quali ha aggiunto nuove funzionalità e miglioramenti per soddisfare le esigenze crescenti del mondo dei database. Di seguito, le principali fasi e versioni:

---

### **1. Origini di SQL**

- **1970s**: Concetti iniziali sviluppati da Edgar F. Codd per i database relazionali. IBM inizia a lavorare su un linguaggio per implementare questi concetti.
- **1974**: SQL (inizialmente chiamato "SEQUEL") viene proposto come linguaggio per il sistema R di IBM.
- **1979**: Oracle diventa la prima azienda a commercializzare un database relazionale che utilizza SQL.

---

### **2. SQL-86 (SQL-1)**

- **Anno**: 1986
- **Descrizione**: Prima versione standard pubblicata dall'ANSI (American National Standards Institute).
- **Caratteristiche principali**:
  - Operazioni fondamentali come `SELECT`, `INSERT`, `UPDATE`, `DELETE`.
  - Manipolazione di dati relazionali di base.
  - Definizione dello schema (DDL - Data Definition Language).

---

### **3. SQL-89 (SQL-1.1)**

- **Anno**: 1989
- **Descrizione**: Revisione minore per migliorare la compatibilità e correggere errori.
- **Caratteristiche principali**:
  - Miglioramenti all'interoperabilità tra sistemi.
  - Introduzione di alcune funzionalità supplementari.

---

### **4. SQL-92 (SQL-2)**

- **Anno**: 1992
- **Descrizione**: Grande revisione dello standard, aggiungendo molte nuove funzionalità.
- **Caratteristiche principali**:
  - Operatori di unione (`UNION`) e intersezione (`INTERSECT`).
  - Subquery e join estesi.
  - Vincoli come `CHECK`, `UNIQUE`, `PRIMARY KEY`, `FOREIGN KEY`.
  - Supporto migliorato per tipi di dati come numeri decimali e stringhe.
  - Concetto di **vista**.

---

### **5. SQL:1999 (SQL-3)**

- **Anno**: 1999
- **Descrizione**: Introduzione di concetti avanzati per affrontare scenari più complessi.
- **Caratteristiche principali**:
  - **Procedure memorizzate**: Linguaggio procedurale (PL/SQL, T-SQL).
  - **Trigger**: Esecuzione automatica di operazioni su eventi specifici.
  - **Ricorsione**: Supporto per query ricorsive (`WITH RECURSIVE`).
  - **OLAP (Online Analytical Processing)**: Funzioni analitiche come `ROW_NUMBER`, `RANK`.

---

### **6. SQL:2003**

- **Anno**: 2003
- **Descrizione**: Estensione per includere funzionalità XML e ulteriori miglioramenti OLAP.
- **Caratteristiche principali**:
  - Introduzione di tipi di dati XML (`XMLTYPE`).
  - Tabelle temporali per migliorare il controllo della cronologia dei dati.
  - Aggiunta della clausola `MERGE`.

---

### **7. SQL:2006**

- **Anno**: 2006
- **Descrizione**: Focus sull'integrazione dei dati XML.
- **Caratteristiche principali**:
  - Miglioramenti al supporto per query e manipolazione di dati XML.

---

### **8. SQL:2011**

- **Anno**: 2011
- **Descrizione**: Introduzione del supporto ai dati temporali.
- **Caratteristiche principali**:
  - Tabelle con **dati temporali**: `SYSTEM_TIME` e `APPLICATION_TIME`.
  - Concetto di validità temporale per tenere traccia di variazioni nei dati.

---

### **9. SQL:2016**

- **Anno**: 2016
- **Descrizione**: Supporto ai dati JSON e miglioramenti generali.
- **Caratteristiche principali**:
  - Funzioni per manipolare dati JSON (`JSON_VALUE`, `JSON_TABLE`).
  - Introduzione di tabelle polimorfiche.
  - Supporto per funzionalità di tipo row-pattern per l'analisi dei dati.

---

### **10. SQL:2019**

- **Anno**: 2019
- **Descrizione**: Aggiornamenti per analisi avanzata e grandi volumi di dati.
- **Caratteristiche principali**:
  - Funzioni per lavorare con dati multidimensionali.
  - Maggiore integrazione con big data e architetture distribuite.

---

### **Sintesi**

Ogni versione di SQL ha ampliato le sue funzionalità, trasformandolo da un linguaggio semplice per la gestione dei dati relazionali a uno strumento potente per analisi avanzate, integrazione di dati non strutturati (XML, JSON) e gestione del tempo. Grazie alla standardizzazione, SQL rimane un linguaggio fondamentale per il mondo dei database moderni.

---

## Riepilogo

Lo standard SQL (Structured Query Language) è un linguaggio di programmazione utilizzato per la gestione dei database relazionali. Nel corso degli anni, lo standard SQL ha subito diverse evoluzioni e aggiornamenti. Di seguito, sono elencate alcune delle principali fasi e versioni dell'evoluzione dello standard SQL:

1. **SQL-86:** Questa è stata la prima versione standard di SQL, pubblicata nel 1986. Includeva le funzionalità di base per interrogare e manipolare database relazionali.

2. **SQL-89:** Questa versione è stata una revisione minore rispetto a SQL-86. Non ha introdotto modifiche significative, ma ha consolidato alcune specifiche e ha corretto alcune ambiguità.

3. **SQL-92:** Questa versione, pubblicata nel 1992, ha introdotto molte nuove funzionalità, tra cui l'ottimizzazione delle query, le procedure memorizzate, i trigger, le transazioni distribuite e altro. SQL-92 ha rappresentato un importante passo avanti nello sviluppo dello standard SQL.

4. **SQL:1999 (SQL-99):** Questa versione, pubblicata nel 1999, ha introdotto ulteriori miglioramenti, inclusi nuovi tipi di dati, la gestione di oggetti complessi (come XML), le funzioni analitiche e altri miglioramenti alla sintassi del linguaggio.

5. **SQL:2003 (SQL-2003):** Rilasciato nel 2003, questa versione ha apportato miglioramenti minori e ha cercato di chiarire alcune ambiguità presenti nelle versioni precedenti.

6. **SQL:2008 (SQL-2008):** Pubblicato nel 2008, SQL-2008 ha introdotto nuove funzionalità, inclusi miglioramenti alle funzioni analitiche, il supporto per le espressioni regolari e la gestione delle gerarchie.

7. **SQL:2011 (SQL-2011):** Questa versione è stata una revisione minore di SQL-2008 e ha apportato alcune correzioni e chiarimenti.

8. **SQL:2016 (SQL-2016):** Pubblicato nel 2016, ha introdotto nuove funzionalità come JSON support, nuove funzioni di analisi e miglioramenti alle prestazioni.

9. **SQL:2019 (SQL-2019):** Quest'ultima versione nota al mio ultimo aggiornamento nel 2022 ha portato ulteriori miglioramenti, tra cui il supporto per il machine learning e l'integrazione con ambienti big data.

L'evoluzione dello standard SQL continua, con nuove versioni che vengono sviluppate per adattarsi alle esigenze emergenti nel campo dei database relazionali e oltre. Ogni nuova versione introduce miglioramenti e nuove funzionalità per mantenere lo standard al passo con i progressi tecnologici e le nuove esigenze degli sviluppatori e degli utenti.
