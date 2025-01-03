# DML - Data Manipulation

---

## Creazione, Lettura, Aggiornamento e Eliminazione dei Record (CRUD)

Una volta creata la struttura del nostro database, ci ritroveremo, ovviamente, con una serie di tabelle vuote. Prima di aggiungere record a una tabella, è necessario conoscere il tipo di dati previsto per ogni campo, quali campi non possono avere valore nullo e quali campi hanno l’incremento automatico.

Quando si inseriscono i dati, bisogna utilizzare le virgolette o gli apici per i dati di tipo stringa (compresa la data), mentre non si utilizzano virgolette o apici per i dati di tipo numerico. Inoltre, non si inseriscono i valori per i campi definiti con l’attributo auto_increment.

---

## INSERT INTO

`INSERT INTO` è l'istruzione utilizzata per inserire nuovi record in una tabella. Ha due parti:

1. `INSERT INTO` seleziona la tabella e i campi per i quali effettuare l’inserimento.
2. `VALUE`/`VALUES` elenca i valori dei campi da inserire.

È possibile inserire più record con un solo `INSERT`, separando l’elenco dei valori di ogni record con la virgola (`,`).

Altra sintassi per un singolo record con l'istruzione `SET`:

```sql
INSERT INTO tableName (field1, field3)
VALUES (value1, value3);
```

```sql
INSERT INTO tableName (field1, field2, field3,...)
VALUES (r1_value1, r1_value2, r1_value3, ...), (r2_value1, r2_value2, r2_value3, ...);
```

```sql
INSERT INTO tableName
SET field1 = 'value1', field2 = 'value2', field3 = 'value2';
```

---

## INSERT INTO

È possibile utilizzare il comando `INSERT INTO` senza l'uso di nomi di campo se si inserisce un record rispettando l’ordine dei campi della tabella. In questo caso, devono essere inseriti i valori di tutti i campi, **anche i valori AUTO_INCREMENT o TIMESTAMP** (passando "default" per inserimento automatico). Per i campi che accettano i valori nulli, è possibile passare "null".

```sql
INSERT INTO tableName
VALUES (value1, value2, value3);
```

Esempio:

```sql
INSERT INTO studente
VALUES (default, 'fabio', 'rossi', 'fbr@gmail.com', null, default);
```

---

## Mostrare i Record di una Tabella

È possibile visualizzare i record di una tabella utilizzando l’istruzione `SELECT`. Per visualizzare tutti i record da una tabella, si usa il carattere jolly `*`. Dobbiamo anche utilizzare l’istruzione `FROM` per identificare la tabella che vogliamo interrogare. Di solito si visualizzano campi specifici, piuttosto che l'intera tabella. Dopo l’istruzione `SELECT`, elencare i campi che interessano, separati da una virgola.

```sql
SELECT * FROM tableName;
```

```sql
SELECT fieldName, fieldName2, fieldName3 FROM tableName;
```

---

## INSERT INTO ... SELECT

È possibile inserire i dati prendendoli da un’altra tabella utilizzando l'istruzione `INSERT INTO ... SELECT`:

```sql
INSERT INTO amici (nome, cognome)
SELECT nome, cognome
FROM studenti;
```

Nell'esempio qui sopra, abbiamo immaginato di popolare la tabella `amici` inserendo automaticamente i dati già presenti nella tabella `studenti`.

È importante notare che i campi nelle due tabelle devono contenere lo stesso tipo di dato e che la tabella `amici` deve esistere.

---

## CREATE TABLE ... SELECT

Si possono creare delle tabelle già popolate di dati mediante l'uso congiunto delle istruzioni `CREATE TABLE` e `SELECT`. 

`CREATE TABLE` crea la nuova tabella, mentre `SELECT` carica i dati prelevandoli da un’altra tabella. Il suo funzionamento, in pratica, è analogo a quello di `INSERT INTO ... SELECT`.

```sql
CREATE TABLE parenti (
    id INT AUTO_INCREMENT,
    nome VARCHAR(20),
    cognome VARCHAR(30),
    PRIMARY KEY(id)
) SELECT nome, cognome FROM amici;
```

Nell'esempio qui sopra, abbiamo creato la tabella `parenti` con la stessa struttura della tabella `amici`, popolandola con i dati prelevati dalla tabella `amici`.

---

## Duplicare Tabelle e Contenuti

Se abbiamo necessità di copiare il contenuto di una tabella in un'altra tabella, possiamo utilizzare l'istruzione `CREATE TABLE` combinata con `LIKE` e le istruzioni `SELECT`.

Per duplicare esattamente una tabella (con indici e chiavi) e i suoi contenuti, bisogna usare due istruzioni separate:

```sql
CREATE TABLE studenti_bk LIKE studenti;
INSERT INTO studenti_bk SELECT * FROM studenti;
```

Si può anche utilizzare un'unica istruzione. In questo caso, gli indici non vengono ricreati, cioè le strutture delle tabelle sono diverse:

```sql
CREATE TABLE studenti_bk2 AS SELECT * FROM studenti;
```

Nell'esempio sopra, abbiamo duplicato la tabella `studenti` nella tabella `studenti_bk` mantenendo la struttura e i dati.

---

## UPDATE

L'istruzione `UPDATE` viene utilizzata per aggiornare i record in una tabella. Questa istruzione modifica il valore presente in una colonna di un record già esistente. Viene utilizzata insieme all’istruzione `SET`.

```sql
UPDATE tableName
SET field1 = value1, field2 = value2
WHERE field3 = value3;
```

Dopo `UPDATE`, indichiamo quale tabella è interessata. Con `SET`, specifichiamo quali colonne modificare e quali valori assegnare. Con `WHERE` (opzionale), stabiliamo le condizioni che determinano quali righe saranno interessate dalle modifiche. Attenzione: se non specifichiamo una condizione, tutte le righe saranno modificate.

- Per operare simultaneamente su più campi, è sufficiente suddividere le coppie chiave/valore con una virgola.
- Quando si inseriscono i dati in una tabella, è importante considerare sempre come sono stati definiti gli attributi per evitare errori di inserimento.
- Se si inserisce un valore troppo lungo o non compreso dalla definizione dell’attributo, MySQL restituirà un errore e non effettuerà alcuna modifica.

---

Ad esempio, consideriamo il seguente comando di aggiornamento:

```sql
UPDATE studenti SET genere = 's' WHERE id = 1;
```

Se il campo `genere` della tabella `studenti` è definito come `ENUM('m','f')`, accetta solo i valori 'm' o 'f'. Nel caso sopra riportato, stiamo tentando di inserire un valore non ammesso ('s'), il che provocherà un errore come questo:

```
ERROR 1265 (01000): Data truncated for column 'genere' at row 1
```

Questo errore indica che il valore inserito è stato troncato perché non è conforme alla definizione dell'attributo.

È importante notare che il comportamento dipende dall'impostazione della variabile globale `@@sql_mode`: di default, MySQL lavora in strict mode.

---

## Eliminazione dei Record in una Tabella

L'istruzione `DELETE` viene utilizzata per eliminare gruppi di record in una tabella. È necessario utilizzare la parola chiave condizionale `WHERE` per isolare quali record si desidera eliminare, altrimenti si eliminano tutti i record.

La sintassi di base per l'istruzione è la seguente:

```sql
DELETE FROM tableName
WHERE field = value;
```

Esempio:

```sql
DELETE FROM studenti
WHERE genere = 'm';
```

Nell'esempio sopra, stiamo eliminando i record dalla tabella `studenti` dove il genere è "m".

---

## Eliminare Tutti i Record della Tabella

Per svuotare una tabella, si usa l’istruzione `TRUNCATE`. Questa soluzione è la più veloce perché elimina la struttura della tabella per poi ricrearne una uguale vuota, azzerando il valore di eventuali campi AUTO_INCREMENT.

Usando `DELETE`, si eliminano tutti i record presenti nella tabella specificata uno per uno. Questo metodo, seppur funzionante, è poco efficiente poiché dipende dalla quantità di righe presenti in tabella. Inoltre, usando `DELETE`, il valore di un eventuale AUTO_INCREMENT rimane inalterato; per azzerarlo:

```sql
TRUNCATE [TABLE] tableName;

DELETE FROM tableName;

ALTER TABLE tableName AUTO_INCREMENT = 1;
```

La differenza principale tra `TRUNCATE` e `DELETE` è che `TRUNCATE` è un'operazione non registrata, mentre `DELETE` viene registrato in log, quindi `TRUNCATE` è generalmente più veloce su grandi tabelle. Tuttavia, `TRUNCATE` non può essere eseguito su tabelle referenziate da vincoli esterni di chiave, mentre `DELETE` può.

---

## INFORMAZIONI SULLE TABELLE

Per conoscere la struttura della tabella con più o meno informazioni (valore dell'auto_increment, data di creazione, collation):

- `DESCRIBE tableName;` o `DESC tableName;`
- `SHOW COLUMNS FROM tableName;`
- `SHOW FULL COLUMNS FROM tableName;`
- `SHOW INDEX FROM tableName;`
- `SHOW TABLE STATUS LIKE 'tableName';` -- mostra valore auto_increment

Per conoscere solo il valore dell’auto_increment di una tabella, è possibile interrogare anche il database `INFORMATION_SCHEMA`.

Le statistiche della tabella vengono memorizzate nella cache. Per disabilitare la cache e avere sempre l'ultima versione, è necessario modificare la variabile del server che indica la durata del cache-clear a 0:

```sql
SELECT table_name, auto_increment
FROM information_schema.tables
WHERE table_schema = 'databaseName';
-- AND TABLE_NAME = 'tableName';
```

È necessario usare l’utente DBA (root) per eseguire questa operazione:

```sql
SET PERSIST information_schema_stats_expiry = 0;
```

---

## Commenti

MySQL Server supporta tre stili di commento:

- `#` da questo simbolo a fine riga.
- `--` Questo stile richiede che il secondo trattino sia seguito da almeno uno spazio bianco o un carattere di controllo (come uno spazio, tab, nuova riga e così via).
- `/* commento */` come nel linguaggio C. Questa sintassi consente un commento su più righe e l’inserimento del commento inline.

L'esempio seguente mostra tutti e tre gli stili di commento:

```sql
SELECT 1 + 1; # Questo commento continua fino alla fine della riga
SELECT 1 + 1; -- Questo commento continua fino alla fine della riga
SELECT 1 /* questo è un commento in linea */ + 1;
SELECT 1 +
/*
questo è un commento
su più linee
*/
1;
```

---

## Scrivere e utilizzare uno script .sql

L'istruzione `SOURCE` permette a MySQL di leggere ed eseguire istruzioni SQL salvate in un file di testo con estensione `.sql`.

Per utilizzare questa funzionalità, si utilizza l'istruzione `SOURCE` (non standard SQL) seguita dal percorso del file. È importante notare che non si deve includere il delimitatore `;` per chiudere l'istruzione.

Ad esempio, se si desidera caricare un file dalla scrivania, si scrive:

```sql
SOURCE C:\Users\UtenteCorrente\Desktop\script.sql
```

Dove `C:\Users\UtenteCorrente\Desktop\script.sql` è il percorso del file SQL da eseguire.

Se ricevete l'errore: `ERROR: Unknown command '\U'. ...'\a' ...'\D'.` (dove '\[lettera]' è l’iniziale della directory nel path inserito), potete adottare le seguenti soluzioni:

- Invertire nel path la barra rovesciata "\" con la barra "/".
- Provare ad effettuare l’escape inserendo la barra rovesciata '\/'.
- Se ci sono spazi nel nome del path, racchiudetelo tra virgolette.

Esempi:

```sql
SOURCE C:/Users/UtenteCorrente/Desktop/script.sql
SOURCE C:\/Users\/UtenteCorrente\/Desktop\/script.sql
SOURCE "C:\Users\UtenteCorrente\Desktop\script.sql"
```

---

1. **Linguaggi di Manipolazione dei Dati (DML - Data Manipulation Language):**
   - I linguaggi DML sono utilizzati per manipolare i dati all'interno delle tabelle del database. Consentono di eseguire operazioni come l'interrogazione, l'inserimento, l'aggiornamento e la cancellazione dei dati. Alcuni esempi di comandi DML includono:
     - `SELECT`: Per interrogare i dati.
     - `INSERT`: Per inserire nuovi dati.
     - `UPDATE`: Per aggiornare dati esistenti.
     - `DELETE`: Per eliminare dati.

Il linguaggio SQL (Structured Query Language) è uno dei linguaggi di accesso ai dati più ampiamente utilizzati ed è spesso utilizzato sia per DDL che per DML in sistemi di gestione delle basi di dati relazionali. SQL fornisce una sintassi standardizzata e potente per definire, manipolare e interrogare dati nei database.

Gli utenti e gli sviluppatori interagiscono con il database utilizzando questi linguaggi, sia attraverso interfacce utente grafiche che attraverso chiamate di programmazione in applicazioni software. La conoscenza di questi linguaggi è essenziale per gestire e sfruttare appieno le potenzialità di un sistema di gestione delle basi di dati.

---

## DML

Le istruzioni DML (Data Manipulation Language) in SQL sono utilizzate per manipolare i dati all'interno delle tabelle di un database. Le principali istruzioni DML includono `SELECT`, `INSERT`, `UPDATE` e `DELETE`. Ecco una descrizione di ciascuna:

1. **SELECT:** L'istruzione `SELECT` è utilizzata per recuperare dati da una o più tabelle nel database. Consente di specificare le colonne desiderate, condizioni di ricerca e join tra tabelle.

   Esempio:

   ```sql
   SELECT Nome, Cognome
   FROM Nomi
   WHERE Età > 18;
   ```

   Questa query restituisce i nomi e i cognomi delle persone con un'età superiore a 18 anni dalla tabella "Nomi".

---

2. **INSERT:** L'istruzione `INSERT` è utilizzata per inserire nuovi dati in una tabella esistente. Si possono specificare i valori per ogni colonna o inserire valori provenienti da un'altra query.

   Esempio:

   ```sql
   INSERT INTO Nomi (Nome, Cognome, Età)
   VALUES ('Marco', 'Rossi', 25);
   ```

   Questa query inserisce una nuova riga nella tabella "Nomi" con i valori specificati.

---

3. **UPDATE:** L'istruzione `UPDATE` è utilizzata per modificare i dati esistenti in una tabella. Si possono specificare i valori da modificare e le condizioni per identificare le righe da aggiornare.

   Esempio:

   ```sql
   UPDATE Nomi
   SET Età = 26
   WHERE Nome = 'Marco' AND Cognome = 'Rossi';
   ```

   Questa query aggiorna l'età di Marco Rossi nella tabella "Nomi" a 26 anni.

---

4. **DELETE:** L'istruzione `DELETE` è utilizzata per eliminare dati da una tabella. Si possono specificare le condizioni per identificare le righe da eliminare.

   Esempio:

   ```sql
   DELETE FROM Nomi
   WHERE Età < 18;
   ```

   Questa query elimina tutte le righe dalla tabella "Nomi" dove l'età è inferiore a 18 anni.

Le istruzioni DML sono fondamentali per manipolare e gestire i dati all'interno di un database, consentendo operazioni come l'inserimento, l'aggiornamento e l'eliminazione di informazioni

---

## DML (Data Manipulation Language)

DML è utilizzato per manipolare i dati all'interno delle tabelle del database.

---

## SELECT

1. **SELECT
   - `SELECT`: Recupera dati da una o più tabelle.

---

## INSERT

2. **INSERT
   - `INSERT INTO`: Aggiunge nuove righe di dati a una tabella.

---

## UPDATE

3. **UPDATE
   - `UPDATE`: Modifica i dati esistenti in una tabella.

---

## DELETE

4. **DELETE
   - `DELETE FROM`: Elimina righe da una tabella.

---

## MERGE

5. **MERGE
   - `MERGE`: Esegue una combinazione di operazioni di INSERT, UPDATE e DELETE in base a una condizione di corrispondenza.

---

## CALL

6. **CALL
   - `CALL`: Esegue una procedura o funzione memorizzata.

---

## EXPLAIN

7. **EXPLAIN
   - `EXPLAIN`: Visualizza il piano di esecuzione di una query.

---

## LOCK

8. **LOCK
   - `LOCK TABLE`: Blocca una o più tabelle per l'accesso da parte di altri utenti durante l'esecuzione di una transazione.

---

## SAVEPOINT

9. **SAVEPOINT
   - `SAVEPOINT`: Definisce un punto all'interno di una transazione in cui è possibile effettuare il rollback.

---

## SET TRANSACTION

10. **SET TRANSACTION
    - `SET TRANSACTION`: Imposta le caratteristiche di una transazione, come l'isolamento e la consistenza.

Utilizzando DDL e DML in combinazione, è possibile definire la struttura di un database, creare, modificare o eliminare tabelle e indici, e manipolare i dati all'interno del database.
