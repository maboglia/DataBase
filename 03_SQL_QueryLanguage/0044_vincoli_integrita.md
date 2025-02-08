# Vincoli di Integrità Referenziale

I vincoli di integrità referenziale sono regole che assicurano che le relazioni tra le tabelle di un database siano coerenti e che i riferimenti tra chiavi esterne e chiavi primarie siano validi.

---

## Definizione di Vincoli di Integrità Referenziale

- I vincoli di integrità referenziale sono regole che definiscono le relazioni tra le tabelle di un database. Essi garantiscono che i riferimenti tra tabelle siano validi e che non si verifichino situazioni di "orfanità" o "padri multipli".

---

## Chiavi Primarie e Chiavi Esterne

- Un vincolo di integrità referenziale coinvolge comunemente due tipi di chiavi:

- **Chiave Primaria (Primary Key):** Una chiave primaria è una colonna o un insieme di colonne che identificano univocamente ogni riga in una tabella.
- **Chiave Esterna (Foreign Key):** Una chiave esterna è una colonna o un insieme di colonne in una tabella che fa riferimento alla chiave primaria di un'altra tabella. La chiave esterna stabilisce una relazione tra le tabelle.

---

## Obbligatorietà del Vincolo di Chiave Esterna

- Un vincolo di chiave esterna può essere definito come opzionale o obbligatorio. Se è obbligatorio, significa che ogni valore nella colonna esterna deve fare riferimento a un valore valido nella colonna primaria della tabella correlata.

---

## esempio FOREIGN KEY

   ```sql
   CREATE TABLE Dipartimenti (
       DipartimentoID INT PRIMARY KEY,
       NomeDipartimento VARCHAR(50)
   );

   CREATE TABLE Dipendenti (
       DipendenteID INT PRIMARY KEY,
       NomeDipendente VARCHAR(50),
       DipartimentoAppartenenza INT,
       FOREIGN KEY (DipartimentoAppartenenza) REFERENCES Dipartimenti(DipartimentoID)
   );
   ```

   In questo esempio, la colonna `DipartimentoAppartenenza` nella tabella `Dipendenti` è una chiave esterna che fa riferimento alla chiave primaria `DipartimentoID` nella tabella `Dipartimenti`.

---

## Azione sul Riferimento

- Cascade, Set Null, Set Default, No Action
- È possibile specificare l'azione da intraprendere quando si modifica o si cancella una riga nella tabella principale che è referenziata da una chiave esterna. Le opzioni comuni includono:

- **CASCADE:** Modifica o cancella automaticamente le righe correlate nelle tabelle figlio.
- **SET NULL:** Imposta a NULL i valori nelle colonne di chiave esterna nelle righe figlio.
- **SET DEFAULT:** Imposta i valori nelle colonne di chiave esterna nelle righe figlio ai valori predefiniti.
- **NO ACTION:** Impedisce l'azione se ci sono ancora righe figlio che fanno riferimento alla chiave primaria.

---

## esempio Azione

   ```sql
   CREATE TABLE Ordini (
       OrdineID INT PRIMARY KEY,
       ClienteID INT,
       TotaleOrdine DECIMAL(10, 2),
       FOREIGN KEY (ClienteID) REFERENCES Clienti(ClienteID) ON DELETE SET NULL
   );
   ```

   In questo esempio, se un cliente viene cancellato dalla tabella `Clienti`, i valori nella colonna `ClienteID` nella tabella `Ordini` saranno impostati a NULL.

---

## Controllo dell'Integrità Referenziale

- I DBMS eseguono automaticamente il controllo dell'integrità referenziale, garantendo che le regole definite nei vincoli siano rispettate.
- Se un'operazione viola un vincolo di integrità referenziale, il DBMS può restituire un errore e impedire l'esecuzione dell'operazione.

---

## Creazione di Vincoli di Integrità Referenziale

- I vincoli di integrità referenziale possono essere definiti durante la creazione della tabella o successivamente con l'istruzione `ALTER TABLE`.

   ```sql
   ALTER TABLE DettaglioOrdine
   ADD FOREIGN KEY (ProdottoID) REFERENCES Prodotti(ProdottoID) ON DELETE CASCADE;
   ```

   Questo comando aggiunge un vincolo di integrità referenziale alla tabella `DettaglioOrdine` che fa riferimento alla chiave primaria `Prodotto
