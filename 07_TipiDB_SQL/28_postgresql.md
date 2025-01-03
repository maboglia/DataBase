---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

## installazione di PostgreSQL

---

Ecco una guida passo-passo per l'installazione di PostgreSQL su sistemi Windows tramite la riga di comando (CLI) e l'utilizzo di un client PostgreSQL (ad esempio, pgAdmin). Assicurati di scaricare l'ultima versione di PostgreSQL dal sito ufficiale prima di iniziare.

---

### Installazione di PostgreSQL su Windows tramite CLI

---

### Scarica PostgreSQL

1. **Scarica PostgreSQL
   - Visita il [sito ufficiale di PostgreSQL](https://www.postgresql.org/download/windows/) e scarica l'ultima versione di PostgreSQL per Windows.

---

### Esegui il File

2. **Esegui il File di Installazione
   - Dopo il download, esegui il file di installazione di PostgreSQL (ad esempio, `postgresql-x.x.x-x-windows-x64.exe`).

---

### Configurazione

3. **Configurazione
   - Durante l'installazione, imposta la password per l'utente `postgres` e seleziona la directory di installazione.

---

### Porta di Ascolto

4. **Porta di Ascolto
   - Puoi mantenere la porta di default 5432 o sceglierne una diversa durante l'installazione.

---

### Strumenti Aggiuntivi

5. **Strumenti Aggiuntivi
   - Puoi scegliere di installare strumenti aggiuntivi come pgAdmin durante il processo di installazione.

---

### Completa l'Installazione

6. **Completa l'Installazione
   - Segui le istruzioni per completare l'installazione. Assicurati di selezionare l'opzione per avviare il servizio PostgreSQL al termine dell'installazione.

---

### Utilizzo di PostgreSQL tramite CLI

---

### Avvio del Servizio

1. **Avvio del Servizio
   - Dopo l'installazione, avvia il servizio PostgreSQL. Puoi farlo tramite il Pannello di Controllo di Windows o utilizzando il comando:

     ```bash
     net start postgresql-x64-x.x
     ```

---

### Accesso a PostgreSQL

2. **Accesso a PostgreSQL da CLI
   - Apri una finestra del prompt dei comandi (Command Prompt) o PowerShell e accedi a PostgreSQL utilizzando il comando:

     ```bash
     psql -U postgres
     ```

     Inserisci la password che hai configurato durante l'installazione.

---

### Utilizzo di PostgreSQL tramite pgAdmin

---

### Esegui pgAdmin

1. **Esegui pgAdmin
   - Dopo l'installazione di pgAdmin, eseguilo. Puoi trovarlo nel menu Start o cercarlo nel menu di ricerca di Windows.

---

### Crea una Nuova

2. **Crea una Nuova Connessione
   - Nella finestra principale di pgAdmin, fai clic su "Add New Server" e compila i dettagli necessari, inclusi nome host, nome utente, password, e porta.

---

### Esplora il Database

3. **Esplora il Database
   - Dopo aver stabilito la connessione, puoi esplorare il database, visualizzare tabelle, eseguire query e utilizzare le funzionalità di amministrazione offerte da pgAdmin.

---

### Esempi di Comandi PostgreSQL da CLI

---

### Visualizza i Database

1. **Visualizza i Database
   - Dopo l'accesso a PostgreSQL, puoi visualizzare i database disponibili con il comando:

     ```sql
     \l
     ```

---

### Crea un Nuovo

2. **Crea un Nuovo Database
   - Puoi creare un nuovo database con il comando:

     ```sql
     CREATE DATABASE nomedeldatabase;
     ```

---

### Seleziona un Database

3. **Seleziona un Database
   - Scegli il database su cui lavorare con il comando:

     ```sql
     \c nomedeldatabase;
     ```

---

### Visualizza le Tabelle

4. **Visualizza le Tabelle
   - Visualizza le tabelle nel database corrente con il comando:

     ```sql
     \dt
     ```

---

### Esegui Query

5. **Esegui Query
   - Esegui le tue query SQL normalmente. Ad esempio:

     ```sql
     SELECT * FROM nomedellatabella;
     ```

Questi sono solo passaggi di base, e ci sono molte altre funzionalità avanzate che puoi esplorare man mano che diventi più familiare con PostgreSQL e pgAdmin.

---
