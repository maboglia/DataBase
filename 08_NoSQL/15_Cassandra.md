# **Apache Cassandra: Approfondimento**

**Apache Cassandra** è un database NoSQL distribuito e open-source progettato per gestire grandi quantità di dati su molti server, garantendo alta disponibilità e nessun punto di guasto. È particolarmente adatto per applicazioni che richiedono una scalabilità orizzontale su vasta scala e un'elevata tolleranza ai guasti.

---

### **Caratteristiche principali di Cassandra**

1. **Architettura Distribuita e Peer-to-Peer:**
   - Ogni nodo in un cluster ha lo stesso ruolo, eliminando la distinzione tra master e slave.
   - I dati sono distribuiti uniformemente su tutti i nodi del cluster, evitando colli di bottiglia.

2. **Alta Disponibilità e Fault Tolerance:**
   - Cassandra è progettato per tollerare guasti di nodi e datacenter senza interrompere il servizio.
   - Utilizza il **replication factor** per memorizzare copie dei dati su più nodi.

3. **Scalabilità Orizzontale:**
   - Consente di aggiungere o rimuovere nodi senza downtime.
   - La scalabilità è lineare: il throughput aumenta con l'aggiunta di nodi.

4. **Modello di Dati Basato su Colonne:**
   - I dati sono organizzati in tabelle, ma le colonne possono variare da riga a riga.
   - È ottimizzato per letture e scritture rapide, anche su grandi volumi di dati.

5. **Consistenza Configurabile:**
   - Gli sviluppatori possono scegliere il livello di consistenza richiesto per le operazioni (es. eventuale, forte).
   - La configurazione si basa sui **fattori di replica** e sui nodi coinvolti nelle operazioni di lettura/scrittura.

6. **Supporto per Query con CQL (Cassandra Query Language):**
   - Un linguaggio simile a SQL che facilita l'interazione con il database.
   - Permette operazioni CRUD e gestione di tabelle.

---

### **Architettura di Cassandra**

1. **Nodi e Cluster:**
   - Un **nodo** è un'istanza di Cassandra.
   - Un **cluster** è un insieme di nodi che lavorano insieme.

2. **Keyspaces:**
   - Simili ai database nei sistemi relazionali.
   - Un keyspace contiene tabelle e definisce parametri come il fattore di replica.

3. **Tabelle:**
   - I dati sono organizzati in tabelle, con righe identificate da una chiave primaria.

4. **Replica e Consistenza:**
   - I dati sono replicati su più nodi per garantire affidabilità.
   - Il livello di consistenza (quorum, all, one) può essere configurato per ogni query.

5. **Partizionamento e Token Ring:**
   - I dati sono distribuiti utilizzando un algoritmo di partizionamento basato su hash.
   - Ogni nodo è responsabile di un intervallo di token.

---

### **Modello di Dati in Cassandra**

- **Tabelle e Colonne:**
  - Ogni tabella ha una chiave primaria, composta da una **partizione key** e opzionalmente da una **clustering key**.
  - Le righe possono avere un numero variabile di colonne.

- **Denormalizzazione:**
  - Cassandra privilegia la denormalizzazione per ottimizzare le query, evitando join costosi.

- **Esempio di Tabella:**

  ```sql
  CREATE TABLE utenti (
      id UUID PRIMARY KEY,
      nome TEXT,
      cognome TEXT,
      email TEXT,
      data_creazione TIMESTAMP
  );
  ```

---

### **Operazioni Principali in Cassandra**

1. **Inserimento di Dati:**

   ```sql
   INSERT INTO utenti (id, nome, cognome, email, data_creazione)
   VALUES (uuid(), 'Mario', 'Rossi', 'mario.rossi@example.com', toTimestamp(now()));
   ```

2. **Lettura di Dati:**

   ```sql
   SELECT * FROM utenti WHERE id = 12345;
   ```

3. **Aggiornamento di Dati:**

   ```sql
   UPDATE utenti SET email = 'nuova.email@example.com' WHERE id = 12345;
   ```

4. **Cancellazione di Dati:**

   ```sql
   DELETE FROM utenti WHERE id = 12345;
   ```

---

### **Vantaggi di Cassandra**

1. **Elevata Scalabilità:**
   - Perfetto per applicazioni che gestiscono petabyte di dati distribuiti su più datacenter.

2. **Affidabilità:**
   - Resistente a guasti hardware grazie alla replica automatica.

3. **Prestazioni Elevate:**
   - Ottimizzato per scritture e letture rapide.

4. **Consistenza Configurabile:**
   - Permette di bilanciare coerenza e disponibilità in base alle esigenze.

5. **Modello di Dati Flessibile:**
   - Ideale per applicazioni che richiedono strutture di dati dinamiche.

---

### **Svantaggi di Cassandra**

1. **Curva di Apprendimento:**
   - La progettazione del modello di dati richiede un'approfondita comprensione dell'architettura.

2. **Denormalizzazione Obbligatoria:**
   - L'assenza di join e transazioni può complicare l'organizzazione dei dati.

3. **Gestione Complessa:**
   - La configurazione, il monitoraggio e l'ottimizzazione possono essere impegnativi.

4. **Consumo di Risorse:**
   - Cassandra richiede una quantità significativa di memoria e spazio su disco.

---

### **Caso d'Uso Tipici di Cassandra**

1. **Social Media e Comunicazione:**
   - Archiviazione di feed di attività, messaggi, o dati di interazione in tempo reale.

2. **IoT e Telemetria:**
   - Raccolta e analisi di grandi volumi di dati da dispositivi connessi.

3. **E-commerce:**
   - Gestione di cataloghi di prodotti e carrelli degli acquisti.

4. **Applicazioni Finanziarie:**
   - Monitoraggio di transazioni e analisi di dati storici.

5. **Log Management:**
   - Archiviazione e analisi di log di sistema su larga scala.

---

### **Confronto tra Cassandra e MongoDB**

| **Caratteristica**           | **Cassandra**                          | **MongoDB**                        |
|-------------------------------|----------------------------------------|------------------------------------|
| **Modello di Dati**           | Basato su colonne                     | Documentale                       |
| **Schema**                   | Flessibile                            | Flessibile                        |
| **Scalabilità**              | Orizzontale (ottimizzata per scritture) | Orizzontale                      |
| **Transazioni**              | Supporto limitato                     | Multi-documento (dal 4.0)         |
| **Consistenza**              | Configurabile                         | Configurabile                     |
| **Architettura**             | Peer-to-peer                          | Master-slave/Replica Set          |
| **Caso d'uso tipico**        | Grandi volumi di dati distribuiti      | Applicazioni flessibili            |

---

### **Conclusioni**

Apache Cassandra è ideale per applicazioni distribuite su larga scala che richiedono alta disponibilità, scalabilità e tolleranza ai guasti. Tuttavia, è più adatto a scenari in cui le operazioni di scrittura sono predominanti rispetto alle letture. Per un'applicazione specifica, la scelta tra Cassandra e altri database dipenderà dalle esigenze del progetto, come modello di dati, consistenza e scalabilità.
