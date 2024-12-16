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

### Tipi di Dato in MySQL

#### **Tipi di Dato Testo in MySQL**

| **Tipo**         | **Descrizione**                                                                                     | **Spazio di Archiviazione**                   |
|-------------------|-----------------------------------------------------------------------------------------------------|-----------------------------------------------|
| **`CHAR(size)`**  | Stringa con lunghezza definita (numeri, caratteri speciali, lettere). Definita tra parentesi.        | Fino a 255 caratteri.                         |
| **`VARCHAR(size)`**| Stringa con lunghezza definita. Convertita a tipo `TEXT` se supera 255 caratteri.                  | Fino a 255 caratteri.                         |
| **`TINYTEXT`**    | Stringa di piccole dimensioni.                                                                      | Fino a 255 caratteri.                         |
| **`TEXT`**        | Stringa di dimensioni medie.                                                                       | Fino a 65.535 caratteri.                      |
| **`BLOB`**        | Dati binari di dimensioni medie.                                                                    | Fino a 65.535 byte.                           |
| **`MEDIUMTEXT`**  | Stringa di grandi dimensioni.                                                                       | Fino a 16.777.215 caratteri.                  |
| **`MEDIUMBLOB`**  | Dati binari di grandi dimensioni.                                                                   | Fino a 16.777.215 byte.                       |
| **`LONGTEXT`**    | Stringa di dimensioni molto grandi.                                                                 | Fino a 4.294.967.295 caratteri.               |
| **`LONGBLOB`**    | Dati binari di dimensioni molto grandi.                                                             | Fino a 4.294.967.295 byte.                    |
| **`ENUM(x,y,z,etc.)`**| Lista di valori predefiniti; se non viene specificato un valore, sarà vuoto.                     | Fino a 65.535 byte.                           |
| **`SET`**         | Lista di valori multipli selezionabili da un massimo di 64 opzioni.                                 | Fino a 64 elementi.                           |

---

#### **Tipi di Dato Numerico in MySQL**

| **Tipo**           | **Descrizione**                                                                                   |
|---------------------|---------------------------------------------------------------------------------------------------|
| **`TINYINT(size)`** | Numeri da -128 a 127 o da 0 a 255 (UNSIGNED). Lunghezza definita tra parentesi.                   |
| **`SMALLINT(size)`**| Numeri da -32.768 a 32.767 o da 0 a 65.535 (UNSIGNED). Lunghezza definita tra parentesi.          |
| **`MEDIUMINT(size)`**| Numeri da -8.388.608 a 8.388.607 o da 0 a 16.777.215 (UNSIGNED). Lunghezza definita tra parentesi.|
| **`INT(size)`**     | Numeri da -2.147.483.648 a 2.147.483.647 o da 0 a 4.294.967.295 (UNSIGNED).                       |
| **`BIGINT(size)`**  | Numeri da -9.223.372.036.854.775.808 a 9.223.372.036.854.775.807 o da 0 a 18.446.744.073.709.551.615 (UNSIGNED). |
| **`FLOAT(size,d)`** | Numeri a virgola mobile. Lunghezza e precisione definite da `size` e `d`.                        |
| **`DOUBLE(size,d)`**| Numeri a virgola mobile di grandi dimensioni. Lunghezza e precisione definite da `size` e `d`.   |
| **`DECIMAL(size,d)`**| Numeri decimali a precisione fissa. Definito da `size` e `d`.                                   |

---

#### **Tipi di Dato Data e Ora in MySQL**

| **Tipo**           | **Descrizione**                                                                                   | **Formato**            | **Range**                                   |
|---------------------|---------------------------------------------------------------------------------------------------|-------------------------|---------------------------------------------|
| **`DATE`**          | Contiene una data.                                                                               | `YYYY-MM-DD`            | Dal 1 gennaio 1000 al 31 dicembre 9999.     |
| **`DATETIME`**      | Contiene una data e un'ora.                                                                      | `YYYY-MM-DD HH:MM:SS`   | Dal 1 gennaio 1000 al 31 dicembre 9999.     |
| **`TIMESTAMP`**     | Timestamp come secondi dall'inizio dell'epoca Unix (1 gennaio 1970 UTC).                          | `YYYY-MM-DD HH:MM:SS`   | Dal 1 gennaio 1970 al 9 gennaio 2038 UTC.   |
| **`TIME`**          | Contiene solo l'ora.                                                                             | `HH:MM:SS`              | Da -838:59:59 a 838:59:59.                  |
| **`YEAR`**          | Anno in formato a due o quattro cifre.                                                           | `YYYY` o `YY`           | 1901-2155 (quattro cifre) o 1970-2069 (due cifre). |

---

Questi tipi di dato di MySQL consentono la creazione di database ottimizzati per varie esigenze, come gestione di stringhe, numeri, dati binari e temporali.
