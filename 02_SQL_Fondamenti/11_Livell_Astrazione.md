# I livelli di astrazione

I livelli di astrazione in un Database Management System (DBMS) rappresentano diversi punti di vista o prospettive attraverso i quali gli utenti e gli sviluppatori possono interagire con il sistema. Questi livelli forniscono una separazione concettuale tra le varie parti del sistema, consentendo una gestione più efficace del database. I principali livelli di astrazione in un DBMS sono:

1. **Livello Esterno (o Utente):**
   - Questo è il livello più alto e rappresenta il punto di vista dell'utente finale o dell'applicazione.
   - Gli utenti a questo livello interagiscono con il database attraverso le viste esterne, che mostrano solo una parte specifica del database rilevante per l'utente.
   - Le viste esterne sono definite in termini di tabelle, relazioni e vincoli che sono significativi per l'utente o l'applicazione specifica.
   - Gli utenti a questo livello utilizzano linguaggi di accesso ai dati come SQL per eseguire query e manipolare dati.

2. **Livello Logico (o Schema Utente):**
   - A questo livello, si definisce lo schema logico del database, che rappresenta la struttura del database come lo vedono gli utenti a livello esterno.
   - Lo schema logico definisce tabelle, relazioni, chiavi primarie, chiavi esterne e vincoli di integrità referenziale.
   - Gli utenti a questo livello si concentrano sulla struttura logica del database, indipendentemente dalla sua implementazione fisica.

3. **Livello Intermedio (o Schema Concettuale):**
   - Questo livello rappresenta lo schema concettuale del database, che fornisce una visione unificata e astratta di tutti i dati e delle relazioni nel sistema.
   - Lo schema concettuale è indipendente da qualsiasi implementazione specifica e fornisce un'immagine coerente del dominio dell'applicazione.
   - A questo livello, vengono definiti i concetti come entità, relazioni e vincoli di integrità.

4. **Livello Interno (o Schema Interno):**
   - È il livello più basso e si occupa dell'implementazione fisica del database sul dispositivo di memorizzazione.
   - Definisce come i dati sono organizzati nei blocchi di memoria, le strutture degli indici, le tecniche di memorizzazione e altre considerazioni a livello di sistema.
   - Gli utenti a questo livello sono tipicamente amministratori di database e programmatori che lavorano direttamente con la struttura fisica del database.

Questi livelli di astrazione forniscono un'organizzazione gerarchica per la progettazione e la gestione dei database, consentendo a diversi utenti di interagire con il sistema a livelli di complessità appropriati per le loro responsabilità e competenze.

---

- Schema logico
    descrizione della base di dati mediante il modello
    logico del DBMS
- Schema interno
    rappresentazione dello schema logico mediante
    strutture fisiche di memorizzazione
- Schema esterno
    descrizione di parti della base di dati, denominate
    “viste”, che riflette il punto di vista di particolari
    utenti è definita sul modello logico
