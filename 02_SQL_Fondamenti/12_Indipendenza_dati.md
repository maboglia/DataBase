# L'indipendenza dei dati

L'indipendenza dei dati è un concetto fondamentale nei sistemi di gestione delle basi di dati (DBMS) e si riferisce alla capacità di separare le applicazioni o gli utenti dall'implementazione fisica e dalla struttura dei dati all'interno del database. Ci sono due aspetti principali dell'indipendenza dei dati:

1. **Indipendenza Fisica:**
   - Consente agli utenti di interagire con il database senza dover preoccuparsi di come i dati sono memorizzati fisicamente sul dispositivo di memorizzazione.
   - Gli utenti a livello logico (schema utente) possono definire, manipolare e interrogare i dati senza dover considerare i dettagli di implementazione come la disposizione fisica, la struttura degli indici o la tecnologia di archiviazione.
   - L'indipendenza fisica consente anche di modificare la struttura fisica del database senza influenzare le applicazioni o gli utenti a livello logico.

2. **Indipendenza Logica:**
   - Consente agli utenti di interagire con il database senza dover preoccuparsi di come i dati sono organizzati logicamente e collegati tra loro.
   - Gli utenti a livello esterno (utenti finali o applicazioni) possono definire viste esterne che rappresentano una porzione del database in modo significativo per loro, indipendentemente dalla struttura sottostante.
   - L'indipendenza logica consente di modificare lo schema logico del database (come la creazione o l'eliminazione di tabelle) senza influenzare gli utenti a livello esterno.

In sintesi, l'indipendenza dei dati mira a isolare gli utenti e le applicazioni dai dettagli di implementazione del database, consentendo una maggiore flessibilità nel mantenimento e nell'evoluzione del sistema. Ciò significa che le modifiche nella struttura fisica o logica del database non dovrebbero richiedere modifiche significative nelle applicazioni o negli utenti che interagiscono con i dati.
