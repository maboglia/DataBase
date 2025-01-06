# Storage Engine in SQL

Uno **storage engine** è il componente di un sistema di gestione di database (DBMS) che gestisce come i dati sono archiviati, letti e scritti su disco. In SQL, soprattutto in sistemi come **MySQL**, puoi scegliere tra diversi storage engine in base alle esigenze di prestazioni, affidabilità e funzionalità specifiche.

---

## Storage Engine in MySQL

Alcuni dei principali storage engine supportati da MySQL includono:

1. **InnoDB**
   - **Caratteristiche**:
     - Supporta le transazioni (ACID).
     - Fornisce integrità referenziale con chiavi esterne.
     - Utilizza un'architettura basata su tabelle clustered per migliorare le prestazioni.
   - **Uso**:
     - Ideale per applicazioni che richiedono un'elevata affidabilità e transazioni.
   - **Esempio**:
     ```sql
     CREATE TABLE Example (
         id INT PRIMARY KEY,
         name VARCHAR(50)
     ) ENGINE=InnoDB;
     ```

2. **MyISAM**
   - **Caratteristiche**:
     - Non supporta le transazioni.
     - Fornisce tabelle più leggere e veloci rispetto a InnoDB.
     - Supporta la compressione delle tabelle per ridurre lo spazio.
   - **Uso**:
     - Adatto per applicazioni che leggono molto più di quanto scrivano.
   - **Esempio**:
     ```sql
     CREATE TABLE Example (
         id INT PRIMARY KEY,
         name VARCHAR(50)
     ) ENGINE=MyISAM;
     ```

3. **Memory (HEAP)**
   - **Caratteristiche**:
     - I dati vengono archiviati in memoria (RAM) anziché su disco.
     - Velocissimo, ma i dati vengono persi quando il server si spegne.
   - **Uso**:
     - Perfetto per tabelle temporanee o dati di sessione.
   - **Esempio**:
     ```sql
     CREATE TABLE Example (
         id INT PRIMARY KEY,
         name VARCHAR(50)
     ) ENGINE=MEMORY;
     ```

4. **CSV**
   - **Caratteristiche**:
     - Archivia i dati in file di testo CSV leggibili.
     - Non supporta indici o transazioni.
   - **Uso**:
     - Ideale per scambiare dati tra diversi sistemi.
   - **Esempio**:
     ```sql
     CREATE TABLE Example (
         id INT PRIMARY KEY,
         name VARCHAR(50)
     ) ENGINE=CSV;
     ```

5. **Archive**
   - **Caratteristiche**:
     - Ottimizzato per archiviare grandi quantità di dati storici.
     - Scrive velocemente, ma ha letture lente.
   - **Uso**:
     - Adatto per dati storici o di audit.
   - **Esempio**:
     ```sql
     CREATE TABLE Example (
         id INT PRIMARY KEY,
         name VARCHAR(50)
     ) ENGINE=ARCHIVE;
     ```

6. **NDB (Clustered)**
   - **Caratteristiche**:
     - Progettato per database distribuiti.
     - Consente alta disponibilità e tolleranza ai guasti.
   - **Uso**:
     - Utilizzato in MySQL Cluster per applicazioni distribuite.
   - **Esempio**:
     ```sql
     CREATE TABLE Example (
         id INT PRIMARY KEY,
         name VARCHAR(50)
     ) ENGINE=NDBCLUSTER;
     ```

---

## Come Verificare lo Storage Engine Corrente
Per verificare quale storage engine utilizza una tabella:

```sql
SHOW TABLE STATUS WHERE Name = 'Example';
```

---

## Impostare uno Storage Engine di Default
Puoi configurare uno storage engine di default nel file di configurazione MySQL o dinamicamente:

- **Configurazione permanente**:
  Modifica `my.cnf` o `my.ini`:
  ```ini
  default-storage-engine=InnoDB
  ```

- **Configurazione dinamica**:
  ```sql
  SET default_storage_engine = InnoDB;
  ```

---

## Confronto tra InnoDB e MyISAM

| Caratteristica       | **InnoDB**                      | **MyISAM**                      |
|----------------------|----------------------------------|----------------------------------|
| Supporto Transazioni | Sì                              | No                               |
| Performance Lettura  | Buona                          | Migliore per letture intensive   |
| Integrità Referenziale| Sì                              | No                               |
| Spazio su Disco      | Più elevato                    | Minore                           |
| Concorrenza          | Ottimizzata per alta concorrenza| Meno efficace                   |

---

## Quando Scegliere uno Storage Engine?
- **InnoDB**: Applicazioni critiche che richiedono transazioni, integrità dei dati e alta concorrenza.
- **MyISAM**: Applicazioni di sola lettura o analisi, con pochi aggiornamenti.
- **Memory**: Dati temporanei o caching.
- **CSV**: Importazione/esportazione di dati tra sistemi.
- **Archive**: Archiviazione di dati storici o di log.

Lo storage engine corretto dipende dalle esigenze dell'applicazione e dal carico di lavoro previsto.