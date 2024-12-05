# **Accesso al DBMS per gli Utenti (User)**

L'accesso al DBMS da parte degli utenti è gestito attraverso un sistema di autenticazione, autorizzazione e controllo dei privilegi, implementato dal DBA per garantire sicurezza e gestione efficiente dei dati. Gli **utenti (user)**, a differenza del DBA, hanno accesso limitato alle funzionalità e ai dati in base ai loro compiti e responsabilità.

---

### **Ruoli degli utenti in un DBMS**
1. **Utenti standard**:
   - Utilizzano il database per eseguire operazioni comuni come lettura, scrittura o aggiornamento dei dati.
   - Hanno privilegi specifici per accedere a tabelle, viste o funzioni predefinite.

2. **Utenti di sola lettura**:
   - Possono solo visualizzare i dati, senza modificarli.
   - Ideali per analisti o persone che devono consultare i dati senza influire sul database.

3. **Utenti applicativi**:
   - Accedono al database tramite applicazioni software.
   - Hanno privilegi definiti in base alle esigenze dell'applicazione (es. accesso a determinate tabelle o procedure).

---

### **Accesso al DBMS: Procedure per gli utenti**

#### **1. Creazione di un account utente**
Un utente può essere creato dal DBA per accedere al DBMS. Ecco come configurare un utente in diversi sistemi DBMS.

- **MySQL:**
   ```sql
   CREATE USER 'utente'@'localhost' IDENTIFIED BY 'password';
   GRANT SELECT, INSERT ON NomeDatabase.* TO 'utente'@'localhost';
   FLUSH PRIVILEGES;
   ```

- **PostgreSQL:**
   ```sql
   CREATE ROLE utente WITH LOGIN PASSWORD 'password';
   GRANT SELECT ON ALL TABLES IN SCHEMA public TO utente;
   ```

- **SQL Server:**
   ```sql
   CREATE LOGIN utente WITH PASSWORD = 'password123';
   CREATE USER utente FOR LOGIN utente;
   GRANT SELECT ON Schema.Tabella TO utente;
   ```

---

#### **2. Accesso tramite strumenti grafici**
Gli utenti possono accedere al DBMS utilizzando strumenti grafici per eseguire query o visualizzare dati.

- **MySQL Workbench**:
   - Consente agli utenti di accedere al database con un'interfaccia grafica per eseguire query e vedere dati.

- **pgAdmin (PostgreSQL)**:
   - Ideale per visualizzare tabelle e eseguire comandi SQL con una GUI.

- **SQL Server Management Studio (SSMS)**:
   - Gli utenti possono accedere al database per eseguire attività definite.

#### **3. Accesso tramite CLI**
Gli utenti possono accedere al DBMS tramite riga di comando per eseguire query e modificare i dati (se autorizzati).

- **MySQL CLI:**
   ```bash
   mysql -u utente -p NomeDatabase
   ```
   - **`-u utente`:** Specifica il nome utente.
   - **`-p`:** Chiede la password.

- **PostgreSQL CLI:**
   ```bash
   psql -U utente -d NomeDatabase
   ```

#### **4. Accesso remoto**
Gli utenti possono accedere al database da postazioni remote, se configurato.

- **Esempio MySQL:**
   ```bash
   mysql -h host_remoto -u utente -p
   ```

- **Esempio PostgreSQL:**
   Configurare il file `pg_hba.conf` per consentire connessioni da indirizzi IP specifici:
   ```conf
   host    NomeDatabase    utente    192.168.1.0/24    md5
   ```

---

### **Gestione dei privilegi degli utenti**

Gli utenti accedono al database in base ai privilegi assegnati dal DBA. Questi privilegi determinano le operazioni che possono eseguire, come:
- **SELECT:** Leggere i dati.
- **INSERT:** Aggiungere nuovi dati.
- **UPDATE:** Modificare i dati esistenti.
- **DELETE:** Eliminare i dati.
- **EXECUTE:** Eseguire funzioni o procedure memorizzate.

---

#### **Esempi di assegnazione di privilegi**

- **MySQL:**
   ```sql
   GRANT SELECT, INSERT ON NomeDatabase.NomeTabella TO 'utente'@'localhost';
   REVOKE DELETE ON NomeDatabase.NomeTabella FROM 'utente'@'localhost';
   ```

- **PostgreSQL:**
   ```sql
   GRANT SELECT, INSERT ON NomeTabella TO utente;
   REVOKE UPDATE ON NomeTabella FROM utente;
   ```

- **SQL Server:**
   ```sql
   GRANT SELECT ON Schema.Tabella TO utente;
   DENY DELETE ON Schema.Tabella TO utente;
   ```

---

### **Buone pratiche per l'accesso degli utenti**
1. **Principio del privilegio minimo:**
   - Assegnare agli utenti solo i privilegi necessari per svolgere le loro attività.

2. **Sicurezza delle password:**
   - Utilizzare password sicure e politiche di rotazione delle password.
   - Implementare autenticazione a due fattori (2FA) se supportato.

3. **Gestione degli account inattivi:**
   - Disattivare o eliminare gli account non utilizzati.

4. **Audit delle attività degli utenti:**
   - Monitorare e registrare le attività degli utenti per identificare accessi non autorizzati o comportamenti sospetti.

5. **Connessioni sicure:**
   - Utilizzare connessioni criptate (SSL/TLS) per proteggere i dati durante la trasmissione.

---

### **Esempio pratico di accesso utente:**

1. **Creazione di un utente di sola lettura (MySQL):**
   ```sql
   CREATE USER 'lettore'@'localhost' IDENTIFIED BY 'passwordSicura';
   GRANT SELECT ON NomeDatabase.* TO 'lettore'@'localhost';
   FLUSH PRIVILEGES;
   ```

2. **Connessione al database:**
   ```bash
   mysql -u lettore -p NomeDatabase
   ```

3. **Esecuzione di una query (CLI):**
   ```sql
   SELECT * FROM NomeTabella;
   ```
