---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

## Installazione di Oracle

---

Oracle Database è un sistema complesso e la sua installazione richiede più passaggi rispetto a database open-source come MySQL e PostgreSQL. Inoltre, Oracle fornisce il proprio client grafico chiamato Oracle SQL Developer per l'interazione con il database. Ecco una guida semplificata per l'installazione di Oracle Database Express Edition (XE) su sistemi Windows, seguita dall'uso di Oracle SQL Developer.

---

### Installazione di Oracle Database XE su Windows

---

### Scarica Oracle Database

1. **Scarica Oracle Database XE
   - Visita il [sito di download di Oracle Database XE](https://www.oracle.com/database/technologies/xe-downloads.html) e scarica la versione appropriata per Windows.

---

### Esegui il File

2. **Esegui il File di Installazione
   - Dopo il download, esegui il file di installazione di Oracle Database XE.

---

### Configurazione

3. **Configurazione
   - Segui le istruzioni guidate per configurare Oracle Database XE. Imposta la password per l'utente `SYSTEM` durante il processo di installazione.

---

### Completa l'Installazione

4. **Completa l'Installazione
   - Completato il processo di installazione, verrà avviato automaticamente il Database Control su una nuova finestra del browser.

---

### Accesso a Oracle

5. **Accesso a Oracle Database da CLI
   - Puoi accedere a Oracle Database utilizzando SQL*Plus da una finestra del prompt dei comandi o PowerShell:

     ```bash
     sqlplus system/password@localhost:1521/XE
     ```

     Sostituisci `password` con la password che hai impostato durante l'installazione.

---

### Utilizzo di Oracle SQL Developer

---

### Scarica Oracle SQL

1. **Scarica Oracle SQL Developer
   - Visita il [sito di download di Oracle SQL Developer](https://www.oracle.com/tools/downloads/sqldev-v192-downloads.html) e scarica la versione appropriata per Windows.

---

### Esegui Oracle SQL

2. **Esegui Oracle SQL Developer
   - Dopo il download, esegui il file di installazione di Oracle SQL Developer.

---

### Configurazione della Connessione

3. **Configurazione della Connessione
   - Al primo avvio, configurare una nuova connessione inserendo le informazioni necessarie come nome utente, password, hostname (localhost), e numero di porta (solitamente 1521).

---

### Esplora il Database

4. **Esplora il Database
   - Dopo aver stabilito la connessione, puoi esplorare il database, visualizzare tabelle, eseguire query e utilizzare le funzionalità di amministrazione offerte da Oracle SQL Developer.

---

### Esempi di Comandi SQL*Plus

---

### Visualizza le tabelle

1. **Visualizza le tabelle
   - Puoi visualizzare le tabelle disponibili nel database con il comando SQL*Plus:

     ```sql
     SELECT table_name FROM all_tables;
     ```

---

### Esegui una Query

2. **Esegui una Query
   - Esegui una query su una tabella specifica:

     ```sql
     SELECT * FROM nome_tabella;
     ```

---

### Crea un Nuovo

3. **Crea un Nuovo Utente
   - Puoi creare un nuovo utente con privilegi specifici:

     ```sql
     CREATE USER nuovo_utente IDENTIFIED BY "nuova_password";
     GRANT CONNECT, RESOURCE TO nuovo_utente;
     ```

Ricorda che Oracle Database è più complesso rispetto a MySQL e PostgreSQL, e queste istruzioni semplificate potrebbero non coprire tutte le opzioni avanzate. Si consiglia di consultare la documentazione ufficiale di Oracle per approfondimenti e dettagli specifici.

---
