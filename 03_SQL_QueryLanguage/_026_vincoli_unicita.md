# Vincoli di Unicità

I vincoli di unicità assicurano che i valori in una colonna o un insieme di colonne siano unici in tutta la tabella, impedendo la presenza di duplicati.

---

## Definizione di Vincoli di Unicità

- I vincoli di unicità sono regole che garantiscono che i valori in una colonna o un insieme di colonne siano unici all'interno di una tabella. Questo significa che non possono esistere duplicati di tali valori.

---

## Chiavi Uniche

- Un tipo comune di vincolo di unicità è la chiave unica. Una chiave unica è una colonna o un insieme di colonne che devono contenere valori unici in ogni riga della tabella.

   ```sql
   CREATE TABLE Dipartimenti (
       DipartimentoID INT PRIMARY KEY,
       NomeDipartimento VARCHAR(50) UNIQUE
   );
   ```

   In questo esempio, la colonna `NomeDipartimento` deve contenere valori unici in ogni riga della tabella `Dipartimenti`.

---

## Chiavi Uniche Composite

- Le chiavi uniche possono coinvolgere più di una colonna, creando così chiavi uniche composite.

   ```sql
   CREATE TABLE Dipendenti (
       DipendenteID INT PRIMARY KEY,
       NomeDipendente VARCHAR(50),
       CodiceFiscale VARCHAR(16) UNIQUE,
       CONSTRAINT UQ_CodiceDipendente UNIQUE (DipendenteID, CodiceFiscale)
   );
   ```

   In questo esempio, il vincolo di unicità coinvolge sia la colonna `DipendenteID` che la colonna `CodiceFiscale`, garantendo che ogni combinazione di questi valori sia unica nella tabella `Dipendenti`.

---

## Vincoli di Unicità e NULL

- I vincoli di unicità considerano NULL come un valore, ma un campo contrassegnato come NULL può contenere più di un valore NULL. Pertanto, è possibile avere più di una riga con valori NULL in una colonna contrassegnata come unica.

   ```sql
   CREATE TABLE Clienti (
       ClienteID INT PRIMARY KEY,
       Email VARCHAR(50) UNIQUE
   );

   INSERT INTO Clienti (ClienteID, Email) VALUES (1, 'cliente1@example.com');
   INSERT INTO Clienti (ClienteID, Email) VALUES (2, NULL); -- Ammessi perché NULL è considerato unico
   ```

---

## Vincoli di Unicità con Indici Unici

- Nei database relazionali, i vincoli di unicità sono spesso implementati attraverso indici unici. Gli indici unici accelerano la ricerca di valori unici e consentono una rapida verifica dell'univocità.

   ```sql
   CREATE TABLE Prodotti (
       ProdottoID INT PRIMARY KEY,
       NomeProdotto VARCHAR(50),
       CodiceProdotto VARCHAR(20)
   );

   CREATE UNIQUE INDEX UQ_CodiceProdotto ON Prodotti(CodiceProdotto);
   ```

   In questo esempio, viene creato un indice unico sulla colonna `CodiceProdotto` nella tabella `Prodotti`, implementando così il vincolo di unicità.

---

## Vincoli di Unicità e Controllo Automatico

- I DBMS eseguono automaticamente il controllo dei vincoli di unicità. Se si tenta di inserire o aggiornare una riga che viola il vincolo di unicità, il DBMS restituirà un errore e impedirà l'esecuzione dell'operazione.

---

## Eliminazione di Vincoli di Unicità

- I vincoli di unicità possono essere eliminati se necessario. L'eliminazione di un vincolo di unicità rimuoverà anche l'indice unico associato, se presente.

   ```sql
   ALTER TABLE Dipendenti
   DROP CONSTRAINT UQ_CodiceDipendente;
   ```

   Questo comando elimina il vincolo di unicità sulla combinazione di colonne `DipendenteID` e `CodiceFiscale` nella tabella `Dipendenti`.

I vincoli di unicità sono strumenti importanti per garantire l'integrità dei dati e la prevenzione dei duplicati nelle tabelle di un database relazionale. La loro corretta implementazione contribuisce a mantenere la coerenza e la qualità dei dati.

---

## Definizione di Vincoli di Unicità

- I vincoli di unicità sono regole che assicurano che i valori in una colonna o in un insieme di colonne siano univoci all'interno di una tabella. Questo significa che non possono esistere duplicati nei dati di una colonna o di un gruppo di colonne specifico.

---

## Chiavi Uniche

- Un tipo comune di vincolo di unicità è la chiave unica. Una chiave unica garantisce che i valori in una colonna o in un gruppo di colonne siano univoci. A differenza delle chiavi primarie, le chiavi uniche possono contenere valori NULL, ma ogni valore non NULL deve essere unico.

   ```sql
   CREATE TABLE Clienti (
       ClienteID INT PRIMARY KEY,
       CodiceCliente VARCHAR(10) UNIQUE,
       NomeCliente VARCHAR(50)
   );
   ```

   In questo esempio, la colonna `CodiceCliente` è una chiave unica, garantendo che ogni codice cliente sia univoco all'interno della tabella.

---

## Vincoli di Unicità su più Colonne

- È possibile applicare vincoli di unicità a più colonne, creando un'unicità basata sulla combinazione di valori in queste colonne.

   ```sql
   CREATE TABLE Dipendenti (
       DipendenteID INT PRIMARY KEY,
       CodiceDipendente VARCHAR(10),
       NomeDipendente VARCHAR(50),
       UNIQUE (DipendenteID, CodiceDipendente)
   );
   ```

   In questo esempio, la combinazione di valori nelle colonne `DipendenteID` e `CodiceDipendente` deve essere unica all'interno della tabella.

---

## Vincoli di Unicità e Indici

- I DBMS possono implementare i vincoli di unicità utilizzando gli indici per migliorare le prestazioni delle operazioni di ricerca. L'indice associato al vincolo di unicità accelera la verifica dell'unicità dei valori.

---

## Controllo dell'Integrità con Vincoli di Unicità

- I vincoli di unicità aiutano a garantire l'integrità dei dati, evitando la presenza di duplicati nelle colonne specificate. Il DBMS impedirà l'inserimento o l'aggiornamento di dati che violerebbero il vincolo.

   ```sql
   INSERT INTO Clienti (ClienteID, CodiceCliente, NomeCliente)
   VALUES (1, 'ABC123', 'Cliente A');

   -- Questo genererà un errore poiché il valore 'ABC123' viola il vincolo di unicità su CodiceCliente
   INSERT INTO Clienti (ClienteID, CodiceCliente, NomeCliente)
   VALUES (2, 'ABC123', 'Cliente B');
   ```

---

## Rimozione di Vincoli di Unicità

- È possibile rimuovere un vincolo di unicità se necessario. L'operazione può variare a seconda del DBMS utilizzato.

   ```sql
   -- Rimuove il vincolo di unicità sulla colonna CodiceCliente in SQL Server
   ALTER TABLE Clienti
   DROP CONSTRAINT UQ_CodiceCliente;
   ```

   La sintassi per rimuovere un vincolo di unicità può differire a seconda del sistema di gestione del database.

---

## Uso dei Vincoli di Unicità in Applicazioni

- I vincoli di unicità possono essere utilizzati nelle applicazioni per garantire che i dati siano coerenti e privi di duplicati. Quando si progetta il modello di dati, è importante considerare quali colonne richiedono unicità per soddisfare i requisiti dell'applicazione.

I vincoli di unicità giocano un ruolo chiave nella garanzia dell'integrità dei dati, assicurando che le informazioni siano corrette e non contengano duplicati indesiderati. La progettazione di un modello di dati con vincoli di unicità appropriati è fondamentale per la qualità e l'affidabilità del sistema di gestione di database.
