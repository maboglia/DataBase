---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

## installazione di SQL Server

---

Ecco una guida semplificata per l'installazione di SQL Server su sistemi Windows tramite la riga di comando (CLI) e l'utilizzo di un client SQL Server Management Studio (SSMS).

### Installazione di SQL Server su Windows tramite CLI

---

### Scarica SQL Server

1. **Scarica SQL Server Express
   - Visita la [pagina di download di SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) e scarica la versione appropriata per Windows.

---

### Esegui il File

2. **Esegui il File di Installazione
   - Dopo il download, esegui il file di installazione di SQL Server Express.

---

### Selezione dei Componenti

3. **Selezione dei Componenti
   - Durante l'installazione, seleziona i componenti che desideri installare. Puoi optare per l'installazione di SQL Server Database Engine e SQL Server Management Studio (SSMS).

---

### Configurazione

4. **Configurazione
   - Configura SQL Server Database Engine inserendo la password per l'utente `sa` (system administrator). Puoi anche configurare altre opzioni come l'autenticazione e la modalità di autenticazione.

---

### Porta di Ascolto

5. **Porta di Ascolto
   - Specifica la porta di ascolto per SQL Server. La porta predefinita è 1433, ma puoi sceglierne un'altra se necessario.

---

### Completa l'Installazione

6. **Completa l'Installazione
   - Completa il processo di installazione seguendo le istruzioni guidate. Assicurati di abilitare l'accesso remoto se desideri connetterti da client esterni.

### Utilizzo di SQL Server tramite CLI (SQLCMD)

---

### Accesso a SQL Server

1. **Accesso a SQL Server da CLI
   - Apri una finestra del prompt dei comandi (Command Prompt) o PowerShell e accedi a SQL Server utilizzando il comando SQLCMD:

     ```bash
     sqlcmd -S localhost -U sa -P password
     ```

     Sostituisci `password` con la password che hai impostato durante l'installazione.

---

### Utilizzo di SQL Server tramite SQL Server Management Studio (SSMS)

---

### Esegui SQL Server

1. **Esegui SQL Server Management Studio (SSMS)
   - Dopo l'installazione, avvia SQL Server Management Studio.

---

### Crea una Nuova

2. **Crea una Nuova Connessione
   - Nella finestra di connessione, inserisci i dettagli necessari come nome del server (localhost), nome utente (`sa` di solito), e la password.

---

### Esplora il Database

3. **Esplora il Database
   - Dopo aver stabilito la connessione, puoi esplorare il database, visualizzare tabelle, eseguire query e utilizzare le funzionalità di amministrazione offerte da SSMS.

### Esempi di Comandi SQLCMD

---

### Visualizza i Database

1. **Visualizza i Database
   - Puoi visualizzare i database disponibili con il comando SQLCMD:

     ```sql
     SELECT name FROM sys.databases;
     ```

---

### Esegui una Query

2. **Esegui una Query
   - Esegui una query su una tabella specifica:

     ```sql
     USE nome_database;
     SELECT * FROM nome_tabella;
     ```

---

### Crea un Nuovo

3. **Crea un Nuovo Utente
   - Puoi creare un nuovo utente con privilegi specifici:

     ```sql
     CREATE LOGIN nuovo_utente WITH PASSWORD = 'nuova_password';
     CREATE USER nuovo_utente FOR LOGIN nuovo_utente;
     ```

Ricorda che SQL Server è un sistema complesso con numerose opzioni avanzate e considerazioni di sicurezza. Consulta la documentazione ufficiale di Microsoft per informazioni dettagliate e approfondimenti specifici.
