# DDL - Data definition Language

---

Le istruzioni DDL (Data Definition Language) in SQL sono utilizzate per definire, modificare e cancellare strutture di database e oggetti ad alto livello come tabelle, indici, viste, e altro. Le principali istruzioni DDL includono `CREATE`, `ALTER`, e `DROP`. Ecco una descrizione di ciascuna:

---

## CREATE

1. **CREATE:** L'istruzione `CREATE` è utilizzata per creare nuovi oggetti nel database, come tabelle, viste, indici, procedure, e così via.

   Esempio:

   ```sql
   CREATE TABLE Nomi (
       ID INT PRIMARY KEY,
       Nome VARCHAR(50),
       Cognome VARCHAR(50)
   );
   ```

   Questa query crea una nuova tabella chiamata "Nomi" con tre colonne: "ID", "Nome", e "Cognome".

---

## ALTER

2. **ALTER:** L'istruzione `ALTER` è utilizzata per modificare la struttura degli oggetti esistenti nel database, come aggiungere o eliminare colonne da una tabella, modificare il tipo di dati di una colonna, o aggiungere vincoli.

   Esempio:

   ```sql
   ALTER TABLE Nomi
   ADD Età INT;
   ```

   Questa query modifica la tabella "Nomi" aggiungendo una nuova colonna chiamata "Età".

---

## DROP

3. **DROP:** L'istruzione `DROP` è utilizzata per eliminare oggetti dal database, come tabelle, viste o indici. L'eliminazione di un oggetto comporta la perdita permanente di tutti i dati associati a quell'oggetto.

   Esempio:

   ```sql
   DROP TABLE Nomi;
   ```

   Questa query elimina completamente la tabella "Nomi" dal database.

Le istruzioni DDL sono fondamentali per la progettazione e la gestione della struttura di un database. Possono essere utilizzate per creare, modificare o eliminare oggetti in modo da adattarsi alle esigenze del sistema o dell'applicazione.

---

### Creare un Database

Una volta effettuato l'accesso, possiamo eseguire l’istruzione `CREATE DATABASE` seguita dal nome del database da creare. Se il database è già presente, MySQL lo segnalerà attraverso un messaggio di errore:

```
ERROR 1007 (HY000): Can't create database 'nomedatabase'; database exists
```

Utilizzando la seguente sintassi, MySQL verifica l'esistenza del database: se non esiste, lo crea; se esiste, restituirà un messaggio di conferma ma segnalerà un avviso.

```sql
CREATE DATABASE databaseName;
CREATE DATABASE IF NOT EXISTS databaseName;
```

---

## CHARSET

In fase di creazione di un database con MySQL è anche possibile specificare charset e collation; ad esempio:

Specificando questi valori è possibile "sovrascrivere" quelli impostati di default a livello server. Per visualizzare come è stato creato il database e per elencare rispettivamente i set di caratteri disponibili e le "collezioni" disponibili, si utilizzano le seguenti istruzioni:

```sql
CREATE DATABASE IF NOT EXISTS databaseName
 CHARACTER SET utf8
 COLLATE utf8_general_ci;

SHOW CREATE DATABASE databaseName;
SHOW CHARACTER SET;
SHOW COLLATION;
```

---

### Cancellare un Database

Per eliminare un database, basta scrivere l’istruzione `DROP DATABASE` seguita dal nome del database da rimuovere.

```sql
DROP DATABASE databaseName;
```

Se si desidera evitare di ricevere un errore nel caso in cui il database sia già stato eliminato, è possibile utilizzare l'istruzione opzionale `IF EXISTS`.

```sql
DROP DATABASE IF EXISTS databaseName;
```

---

## Creazione delle Tabelle in MySQL

Per creare una tabella in MySQL, si utilizza il comando `CREATE TABLE`. Ogni tabella deve essere definita insieme ai suoi campi e alle relative proprietà.

---

Esempio di creazione di una tabella denominata "studenti", con il campo "id" come chiave primaria:

```sql
CREATE TABLE IF NOT EXISTS studenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20),
    cognome VARCHAR(30) NOT NULL,
    genere ENUM('m','f'),
    indirizzo VARCHAR(100),
    citta VARCHAR(30),
    provincia CHAR(2) DEFAULT 'To',
    regione VARCHAR(30) DEFAULT 'Piemonte',
    email VARCHAR(100) NOT NULL UNIQUE,
    data_nascita DATE,
    ins TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

---

### Verifica della Struttura della Tabella

Per verificare la struttura della tabella, si utilizzano diverse istruzioni:

- `SHOW TABLES;` per mostrare le tabelle presenti nel database.
- `SHOW CREATE TABLE tableName;` per visualizzare come è stata creata una specifica tabella.
- `DESCRIBE tableName;` o `DESC tableName;` per visualizzare la struttura dei campi della tabella.

---

### Modifica delle Tabelle

L'istruzione `ALTER TABLE` viene utilizzata per modificare la struttura di una tabella esistente.

Esempi di modifiche che si possono apportare:

- Aggiungere un campo: `ALTER TABLE tableName ADD fieldName DATATYPE;`
- Rinominare un campo: `ALTER TABLE tableName RENAME COLUMN oldName TO newName;`
- Eliminare un campo: `ALTER TABLE tableName DROP fieldName;`

---

### Duplicazione e Eliminazione delle Tabelle

Per duplicare una tabella, si utilizza l'istruzione `CREATE TABLE ... LIKE ...`.

```sql
CREATE TABLE tableNameCopy LIKE tableName;
```

Per eliminare una tabella, si utilizza l'istruzione `DROP TABLE`.

```sql
DROP TABLE tableName;
```

---

È possibile eliminare più tabelle contemporaneamente separandole con una virgola.

```sql
DROP TABLE tableName1, tableName2, tableName3;
```

Ricorda che l'eliminazione di una tabella è un'operazione irreversibile.

---

### Informazioni sulle Tabelle

Per ottenere informazioni dettagliate sulle tabelle, si possono utilizzare le seguenti istruzioni:

- `DESCRIBE tableName;` o `DESC tableName;` per conoscere la struttura della tabella con tutte le colonne.
- `SHOW COLUMNS FROM tableName;` per visualizzare le colonne della tabella.
- `SHOW FULL COLUMNS FROM tableName;` per mostrare ulteriori informazioni come privilegi e commenti sulle colonne.
- `SHOW INDEX FROM tableName;` per ottenere informazioni sugli indici della tabella.
- `SHOW TABLE STATUS LIKE 'tableName';` per conoscere lo stato della tabella, inclusi il valore `AUTO_INCREMENT` e altre informazioni.

---

### Accesso alle Informazioni tramite INFORMATION_SCHEMA

Per accedere a informazioni dettagliate sulle tabelle tramite `INFORMATION_SCHEMA`, si possono utilizzare le seguenti query:

```sql
SELECT table_name, auto_increment
FROM information_schema.tables
WHERE table_schema = 'databaseName';
```

L'`INFORMATION_SCHEMA` fornisce accesso ai metadati del database, come il nome delle tabelle, il tipo di dati delle colonne e altri dettagli. Si tratta di un database di sola lettura che contiene informazioni sul server MySQL.

---

## Esercizi su Create Table

- [Esercizi](../02_SQL_Fondamenti/99_esempi_create_table.md)
- [Esercizi PDF](../02_SQL_Fondamenti/99_esempi_create_table.pdf)