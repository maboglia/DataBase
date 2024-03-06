---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

## Sicurezza nei Database Relazionali

---

Parliamo ora della "Sicurezza nei Database Relazionali". La sicurezza è una componente critica in un sistema di gestione di database per proteggere i dati sensibili e garantire che solo utenti autorizzati possano accedere, modificare o eliminare informazioni.

---

### Autenticazione e Autorizzazione

1. **Autenticazione e Autorizzazione
   - **Autenticazione:** Il processo attraverso il quale il sistema di gestione di database verifica l'identità dell'utente. Può coinvolgere l'utilizzo di credenziali come nome utente e password.
   - **Autorizzazione:** Il processo di assegnazione dei diritti e dei privilegi a un utente o a un ruolo specifico. Gli utenti devono avere i permessi necessari per eseguire operazioni specifiche sul database.

---

### Livelli di Accesso

2. **Livelli di Accesso
   - **Livello del Sistema:** Riguarda l'accesso globale al sistema di gestione di database. Gli amministratori di database gestiscono i privilegi a questo livello.
   - **Livello del Database:** Riguarda l'accesso alle specifiche basi di dati. Gli utenti possono avere privilegi diversi su diverse basi di dati.
   - **Livello dell'Oggetto:** Riguarda l'accesso a tabelle, viste, stored procedure e altri oggetti all'interno di una base di dati.

---

### Gestione delle Password

3. **Gestione delle Password
   - Le password devono essere gestite in modo sicuro. Ciò include l'uso di algoritmi di hash per la memorizzazione delle password e la richiesta di password complesse.

---

### Ruoli e Gruppi

4. **Ruoli e Gruppi
   - L'uso di ruoli e gruppi semplifica la gestione dei privilegi. Gli utenti possono essere assegnati a ruoli, e i ruoli possono avere determinati privilegi su oggetti specifici.

   ```sql
   -- Creazione di un ruolo e assegnazione di privilegi
   CREATE ROLE RuoloEsempio;
   GRANT SELECT ON TabellaEsempio TO RuoloEsempio;
   ```

---

### Crittografia dei Dati

5. **Crittografia dei Dati
   - La crittografia dei dati è fondamentale per proteggere le informazioni sensibili. Ciò può coinvolgere la crittografia di colonne specifiche, l'utilizzo di certificati e chiavi di crittografia.

   ```sql
   -- Esempio di crittografia di una colonna
   CREATE TABLE TabellaCrittografata (
       ID INT PRIMARY KEY,
       DatoCrittografato VARBINARY(MAX)
   );
   ```

---

### Log delle Attività

6. **Log delle Attività e Auditing
   - La registrazione delle attività (logging) e l'auditing sono essenziali per monitorare l'accesso al database e le operazioni eseguite. Questi registri possono essere utilizzati per l'analisi delle violazioni della sicurezza.

---

### Firewall e Protezione

7. **Firewall e Protezione della Rete
   - L'implementazione di firewall e altre misure di sicurezza della rete è fondamentale per proteggere il database da accessi non autorizzati e attacchi esterni.

---

### SQL Injection e

8. **SQL Injection e Altre Vulnerabilità
   - Le applicazioni devono essere scritte in modo sicuro per prevenire attacchi come SQL injection. L'utilizzo di parametri nelle query, la validazione dei dati di input e l'adozione di best practices di programmazione sicura sono essenziali.

---

### Aggiornamenti e Patching

9. **Aggiornamenti e Patching
   - Mantenere il sistema di gestione di database e il sistema operativo aggiornati con gli ultimi aggiornamenti di sicurezza è cruciale per proteggere il sistema da vulnerabilità note.

---

### Backup e Ripristino

10. **Backup e Ripristino
    - Eseguire regolarmente backup dei dati e dei log delle transazioni è essenziale per garantire la disponibilità dei dati e facilitare il ripristino in caso di perdita o danneggiamento.

---

### Gestione delle Sessioni

11. **Gestione delle Sessioni e Timeout
    - Impostare timeout appropriati per le sessioni e le connessioni al database per prevenire attacchi di session hijacking o accessi non autorizzati mantenuti in modo indefinito.

---

### Politiche di Sicurezza

12. **Politiche di Sicurezza e Formazione
    - Implementare politiche di sicurezza e fornire formazione agli utenti e agli sviluppatori per garantire che comprendano le best practices e le procedure di sicurezza del database.

---

### Monitoraggio delle Attività

13. **Monitoraggio delle Attività Sospette
    - Implementare sistemi di monitoraggio per rilevare attività sospette, ad esempio tentativi di accesso non autorizzati o query anomale.

---

### Gestione delle Licenze

14. **Gestione delle Licenze e dei Privilegi
    - Assicurarsi che solo utenti autorizzati abbiano accesso al sistema e che le licenze siano gestite correttamente per evitare violazioni dei contratti di licenza.

La sicurezza dei database richiede una combinazione di politiche, procedure, strumenti e tecnologie. La progettazione e la gestione di un sistema sicuro devono essere considerate parte integrante della gestione di un database relazionale.

---

## Recap

---



## Sicurezza dei Dati

Parliamo ora della "Sicurezza dei Dati" in un database. La sicurezza è un aspetto critico per garantire che i dati siano protetti da accessi non autorizzati e che vengano mantenuti integri e riservati.

---

### Gestione degli Accessi

1. **Gestione degli Accessi
   - La gestione degli accessi riguarda il controllo di chi può accedere al database e a quali dati. Questo è spesso gestito attraverso l'uso di account utente con autorizzazioni specifiche.
   - Le autorizzazioni possono includere il diritto di eseguire operazioni di lettura, scrittura, modifica dello schema, e altro ancora.

---

### Ruoli e Privilegi

2. **Ruoli e Privilegi
   - L'assegnazione di ruoli e privilegi consente di semplificare la gestione degli accessi. Ad esempio, un ruolo di "Amministratore" potrebbe avere privilegi estesi, mentre un ruolo di "Utente" potrebbe avere accesso solo a determinate funzionalità.
   - Ciò riduce la complessità della gestione degli accessi e facilita la manutenzione della sicurezza.

---

### Crittografia

3. **Crittografia
   - La crittografia dei dati è utilizzata per proteggere i dati memorizzati e trasferiti tra il database e le applicazioni o tra il database e altri sistemi.
   - La crittografia può essere applicata a livello di colonna (cifrando solo dati sensibili) o a livello di intero database.

---

### Auditing

4. **Auditing
   - L'auditing traccia e registra le attività degli utenti nel database. Questo può includere registrazioni di accesso, modifiche ai dati e altre operazioni.
   - L'auditing è utile per la sicurezza, la conformità normativa e per individuare attività sospette.

---

### Backup e Ripristino

5. **Backup e Ripristino
   - La regolare esecuzione di backup è essenziale per proteggere i dati da perdite accidentali o attacchi dannosi. I backup consentono di ripristinare il database a uno stato precedente in caso di necessità.

---

### Gestione delle Password

6. **Gestione delle Password
   - La gestione delle password è fondamentale per garantire che le credenziali degli utenti siano sicure. Le password dovrebbero essere complesse e regolarmente aggiornate.
   - L'autenticazione a due fattori può essere implementata per un ulteriore livello di sicurezza.

---

### Protezione contro SQL

7. **Protezione contro SQL Injection
   - Le SQL injection sono attacchi in cui i malintenzionati inseriscono codice SQL dannoso nelle query per ottenere accesso non autorizzato al database.
   - L'uso di parametri nella costruzione delle query e la validazione dei dati in ingresso sono pratiche importanti per prevenire le SQL injection.

---

### Politiche di Sicurezza

8. **Politiche di Sicurezza
   - La definizione e l'applicazione di politiche di sicurezza, che includono procedure operative standard, protocolli di accesso e procedure di emergenza, sono essenziali per mantenere un ambiente sicuro.

La sicurezza dei dati è un processo continuo e deve essere considerata una priorità nella progettazione e nella gestione di un database. La combinazione di misure tecniche, processi operativi e formazione degli utenti contribuisce a creare un ambiente sicuro per i dati.

---
