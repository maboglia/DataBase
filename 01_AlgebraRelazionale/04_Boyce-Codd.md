# Le regole di Boyce-Codd

---

Edgar F. Codd ha definito 12 regole, notevolmente influenti nello sviluppo e nell'implementazione dei database relazionali. Queste regole sono state progettate per garantire l'integrità, la coerenza e l'efficacia delle basi di dati relazionali. Ecco un elenco sintetico delle 12 regole di Codd:

1. **Informazioni Tutte in Tabelle:** Tutte le informazioni in un database devono essere rappresentate in tabelle.

2. **Accesso Garantito:** Ogni dato specifico deve essere accessibile mediante una combinazione di nome della tabella, chiave primaria e valore.

3. **Integrità Delle Informazioni:** Ogni valore in una tabella deve rispettare un dominio dichiarato e le regole di integrità.

4. **Manipolazione Dichiarativa dei Dati:** Le operazioni sulle informazioni devono essere dichiarative, cioè specificate senza indicare il "come" vengono ottenute.

5. **Vista Logica Indipendente:** La vista logica dei dati deve essere indipendente dalla loro implementazione fisica.

6. **Modifiche Strutturali Online:** Le modifiche alla struttura del database (aggiunta, eliminazione, modifica di colonne) possono essere effettuate online senza interrompere l'accesso ai dati.

7. **Indipendenza dai Programmi:** Le applicazioni e i programmi che accedono al database non devono essere influenzati dalle modifiche nella struttura logica dei dati.

8. **Indipendenza dai Cambiamenti Fisici:** Le modifiche nella struttura fisica dei dati (come l'uso di un diverso tipo di archiviazione) non devono influenzare le applicazioni o i programmi.

9. **Gestione Automatica delle Transazioni:** Le transazioni devono essere gestite automaticamente dal sistema, garantendo la consistenza dei dati.

10. **Architettura Distribuita:** Il sistema deve supportare la distribuzione delle informazioni su diverse località.

11. **Indipendenza dalle Rappresentazioni Casuali:** La rappresentazione fisica dei dati non dovrebbe influire sull'accesso alle informazioni.

12. **Accesso Diretto da Parte degli Utenti Finali:** Gli utenti finali devono poter accedere direttamente ai dati nel modo più semplice possibile.

Queste regole sono state fondamentali per lo sviluppo dei moderni database relazionali e hanno fornito una guida per garantire l'efficacia e l'integrità dei sistemi di gestione dei database.

---

Le regole di Boyce-Codd sono un'estensione delle regole di Codd, specificamente progettate per eliminare le anomalie di decomposizione nei database relazionali. Queste regole sono state proposte da Raymond F. Boyce e Edgar F. Codd, e sono spesso menzionate insieme alle regole originali di Codd. Le regole di Boyce-Codd sono orientate verso la decomposizione delle tabelle per migliorare la progettazione e l'efficienza dei database. Ecco una sintesi delle regole di Boyce-Codd:

1. **Forma Normale di Boyce-Codd (BCNF):** Questa regola stabilisce che ogni dipendenza tra colonne in una tabella deve essere basata su una chiave candidata, che è un insieme di colonne che univocamente identifica ogni riga nella tabella. In termini più semplici, le informazioni in una tabella devono essere organizzate in modo che non ci siano dipendenze complesse tra le colonne, garantendo che ogni colonna sia strettamente legata a una chiave identificativa.

2. **Applicazione delle Regole di Codd:**  Oltre a soddisfare la Forma Normale di Boyce-Codd, questa regola afferma che un database deve rispettare anche tutte le regole di Codd. Le regole di Codd, proposte da Edgar F. Codd, sono un insieme più generale di principi progettuali per i database relazionali che coprono aspetti come la rappresentazione dei dati e l'integrità delle informazioni.

La Forma Normale di Boyce-Codd è un criterio più rigoroso rispetto alla Terza Forma Normale (3NF) e aiuta a garantire che le relazioni siano più efficienti in termini di spazio di archiviazione e facilita le operazioni di query. La regola BCNF elimina le possibili anomalie di decomposizione che possono verificarsi nelle tabelle che soddisfano solo la 3NF.

In sostanza, le regole di Boyce-Codd mirano a garantire che le tabelle siano progettate in modo efficiente, evitando dipendenze complesse tra colonne e mantenendo l'integrità delle informazioni. L'adesione a queste regole migliora la qualità del database e facilita le operazioni di gestione e interrogazione dei dati.
