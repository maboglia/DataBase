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

---

### Tipi di Dato in SQL Server

#### **Tipi di Dato Stringa in SQL Server**

| **Tipo**          | **Descrizione**                                                                                   | **Spazio di Archiviazione**                     |
|--------------------|---------------------------------------------------------------------------------------------------|------------------------------------------------|
| **`char(n)`**      | Stringa di caratteri con lunghezza definita.                                                      | Fino a 8.000 caratteri.                        |
| **`varchar(n)`**   | Stringa di lunghezza variabile con lunghezza definita.                                            | Fino a 8.000 caratteri.                        |
| **`varchar(max)`** | Stringa di lunghezza variabile con lunghezza massima definita.                                    | Fino a 1.073.741.824 caratteri.               |
| **`text`**         | Stringa variabile per memorizzare grandi quantità di testo.                                       | Fino a 2GB di dati di testo.                   |
| **`nchar`**        | Stringa Unicode con lunghezza definita.                                                           | Fino a 4.000 caratteri.                        |
| **`nvarchar(n)`**  | Stringa Unicode con lunghezza variabile e massima definita.                                       | Fino a 4.000 caratteri.                        |
| **`nvarchar(max)`**| Stringa Unicode con lunghezza variabile e massima definita.                                       | Fino a 536.870.912 caratteri.                 |
| **`ntext`**        | Stringa Unicode variabile per grandi quantità di testo.                                           | Fino a 2GB di testo.                           |
| **`binary(n)`**    | Stringa binaria con lunghezza definita.                                                           | Fino a 8.000 byte.                             |
| **`varbinary(n)`** | Stringa binaria con lunghezza variabile.                                                          | Fino a 8.000 byte.                             |
| **`varbinary(max)`**| Stringa binaria con lunghezza variabile.                                                         | Fino a 2GB.                                    |
| **`image`**        | Stringa binaria variabile per memorizzare immagini o file binari.                                 | Fino a 2GB.                                    |

---

#### **Tipi di Dato Numerico in SQL Server**

| **Tipo**         | **Descrizione**                                                                                  | **Spazio di Archiviazione**                   |
|-------------------|--------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **`bit`**         | Può contenere i valori 0, 1 o NULL.                                                              | 1 bit.                                        |
| **`tinyint`**     | Numeri interi nel range 0-255.                                                                   | 1 byte.                                       |
| **`smallint`**    | Numeri interi nel range -32.768 a 32.767.                                                        | 2 byte.                                       |
| **`int`**         | Numeri interi nel range -2.147.483.648 a 2.147.483.647.                                          | 4 byte.                                       |
| **`bigint`**      | Numeri interi nel range -9.223.372.036.854.775.808 a 9.223.372.036.854.775.807.                  | 8 byte.                                       |
| **`decimal(p,s)`**| Numeri decimali con precisione `p` e scala `s`.                                                 | 5-17 byte.                                   |
| **`numeric(p,s)`**| Simile a `decimal`, definisce precisione e scala dei numeri.                                     | 5-17 byte.                                   |
| **`smallmoney`**  | Dati fiscali nel range -214.748,3648 a 214.748,3647.                                             | 4 byte.                                       |
| **`money`**       | Dati fiscali nel range -922.337.203.685.477,5808 a 922.337.203.685.477,5807.                     | 8 byte.                                       |
| **`float(n)`**    | Numeri a virgola mobile con precisione. `n` definisce 4 o 8 byte.                                | 4 o 8 byte.                                   |
| **`real`**        | Numeri a virgola mobile a precisione singola. Range -3.40E+38 a 3.40E+38.                        | 4 byte.                                       |

---

#### **Tipi di Dato Data e Ora in SQL Server**

| **Tipo**          | **Descrizione**                                                                                   | **Spazio di Archiviazione**                   |
|--------------------|---------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **`datetime`**     | Date dal 1 gennaio 1753 al 31 dicembre 9999 con precisione di 3.33 millisecondi.                  | 8 byte.                                       |
| **`datetime2`**    | Date dal 1 gennaio 0001 al 31 dicembre 9999 con precisione di 100 nanosecondi.                    | 6-8 byte.                                     |
| **`smalldatetime`**| Date dal 1 gennaio 1900 al 6 giugno 2079 con precisione di 1 minuto.                              | 4 byte.                                       |
| **`date`**         | Memorizza solo la data senza ora. Range: dal 1 gennaio 0001 al 31 dicembre 9999.                  | 3 byte.                                       |
| **`time`**         | Memorizza solo l'ora. Precisione: 100 nanosecondi.                                               | 3-5 byte.                                     |
| **`datetimeoffset`**| Simile a `datetime2` ma include anche un fuso orario.                                            | 8-10 byte.                                    |
| **`timestamp`**    | Numero unico che si aggiorna a ogni nuova riga. Non legato al tempo reale.                        | Variabile.                                    |

---

#### **Altri Tipi di Dato in SQL Server**

| **Tipo**             | **Descrizione**                                                                               |
|-----------------------|-----------------------------------------------------------------------------------------------|
| **`sql_variant`**     | Può contenere fino a 8.000 byte di tipi di dati diversi (eccetto timestamp, ntext e text).    |
| **`uniqueidentifier`**| Memorizza un GUID (Globally Unique Identifier).                                              |
| **`xml`**             | Contiene fino a 2GB di dati formattati come XML.                                             |
| **`cursor`**          | Riferimento a un cursore di operazione del database.                                         |
| **`table`**           | Contiene un set di risultati per elaborazioni successive.                                    |

---

Questi tipi di dato coprono una vasta gamma di scenari, rendendo SQL Server un sistema altamente versatile per applicazioni diverse.
