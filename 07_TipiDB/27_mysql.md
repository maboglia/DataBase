---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

## installazione di MySQL

---

Ecco una guida passo-passo per l'installazione di MySQL su sistemi Windows tramite la riga di comando (CLI) e l'utilizzo di un client MySQL (ad esempio, MySQL Command-Line Client). Assicurati di scaricare l'ultima versione di MySQL dal sito ufficiale prima di iniziare.

### Installazione di MySQL su Windows tramite CLI

---

### Scarica MySQL Installer

1. **Scarica MySQL Installer
   - Visita il [sito ufficiale di MySQL](https://dev.mysql.com/downloads/installer/) e scarica l'ultima versione di MySQL Installer per Windows.

---

### Esegui il File

2. **Esegui il File di Installazione
   - Dopo il download, esegui il file di installazione di MySQL Installer (ad esempio, `mysql-installer-web-community-x.x.xx.x.msi`).

---

### Selezione dei Prodotti

3. **Selezione dei Prodotti
   - Durante l'installazione, seleziona il prodotto MySQL Server. Puoi anche scegliere di installare altri componenti come MySQL Workbench (un client grafico) o MySQL Shell.

---

### Configurazione

4. **Configurazione
   - Durante la configurazione, imposta la password per l'utente root di MySQL e segui le istruzioni per completare il processo di installazione.

---

### Avvio del Servizio

5. **Avvio del Servizio
   - Dopo l'installazione, avvia il servizio MySQL. Puoi farlo tramite il Pannello di Controllo di Windows o utilizzando il comando:

     ```bash
     net start mysql
     ```

---

### Accesso a MySQL

6. **Accesso a MySQL da CLI
   - Apri una finestra del prompt dei comandi (Command Prompt) o PowerShell e accedi a MySQL utilizzando il comando:

     ```bash
     mysql -u root -p
     ```

     Inserisci la password che hai configurato durante l'installazione.

---

## Utilizzo di MySQL tramite CLI

---

### Visualizza i Database

1. **Visualizza i Database
   - Dopo l'accesso a MySQL, puoi visualizzare i database disponibili con il comando:

     ```sql
     SHOW DATABASES;
     ```

---

### Crea un Nuovo

2. **Crea un Nuovo Database
   - Puoi creare un nuovo database con il comando:

     ```sql
     CREATE DATABASE NomedelDatabase;
     ```

---

### Seleziona un Database

3. **Seleziona un Database
   - Scegli il database su cui lavorare con il comando:

     ```sql
     USE NomedelDatabase;
     ```

---

### Visualizza le Tabelle

4. **Visualizza le Tabelle
   - Visualizza le tabelle nel database corrente con il comando:

     ```sql
     SHOW TABLES;
     ```

---

### Esegui Query

5. **Esegui Query
   - Esegui le tue query SQL normalmente. Ad esempio:

     ```sql
     SELECT * FROM NomeTabella;
     ```

---

### Utilizzo di MySQL tramite MySQL Workbench

Se preferisci utilizzare un client grafico come MySQL Workbench, puoi seguirne i passaggi di installazione e utilizzo dopo aver installato MySQL Server.

---

### Esegui MySQL Workbench

1. **Esegui MySQL Workbench
   - Dopo l'installazione di MySQL Workbench, aprilo e crea una nuova connessione inserendo le informazioni necessarie (hostname, nome utente, password).

---

### Visualizza e Modifica

2. **Visualizza e Modifica Dati
   - Una volta connesso, puoi visualizzare le tabelle, eseguire query, modificare dati e sfruttare le funzionalità grafiche offerte da MySQL Workbench.

Questi sono solo passaggi di base, e ci sono molte altre funzionalità avanzate che puoi esplorare man mano che diventi più familiare con MySQL e MySQL Workbench.

---
