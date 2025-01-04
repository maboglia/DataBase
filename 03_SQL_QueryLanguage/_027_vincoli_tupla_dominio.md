# I vincoli di tupla e di dominio

I vincoli di tupla e di dominio sono concetti importanti nei database relazionali per garantire l'integrità dei dati e per definire regole che le tuple (righe) devono seguire.

---

1. **Vincolo di Tupla (Tuple Constraint):**
   - Il vincolo di tupla è una regola che specifica le condizioni che devono essere soddisfatte da ciascuna tupla (riga) in una tabella.
   - Ad esempio, un vincolo di tupla potrebbe richiedere che il valore di un certo attributo sia compreso in un determinato intervallo o che soddisfi una condizione specifica.
   - Un esempio di SQL per un vincolo di tupla potrebbe essere il seguente:

     ```sql
     CREATE TABLE Studenti (
         Matricola INT,
         Nome VARCHAR(50),
         Voto INT CHECK (Voto >= 0 AND Voto <= 100)
     );
     ```

     In questo esempio, il vincolo `CHECK` sulla colonna `Voto` assicura che il voto sia compreso tra 0 e 100.

---

2. **Vincolo di Dominio (Domain Constraint):**
   - Il vincolo di dominio è una regola che specifica il dominio di valori validi per un attributo in una tabella.
   - Indica quali valori possono essere assegnati a un attributo in una tupla.
   - Ad esempio, se si ha un attributo "Genere" che deve contenere solo valori 'Maschio' o 'Femmina', si può utilizzare un vincolo di dominio.
   - Esempio di SQL per un vincolo di dominio:

---

     ```sql
     CREATE TABLE Dipendenti (
         ID INT,
         Nome VARCHAR(50),
         Genere VARCHAR(10) CHECK (Genere IN ('Maschio', 'Femmina'))
     );
     ```

     In questo esempio, il vincolo `CHECK` sul campo `Genere` assicura che possa contenere solo i valori specificati ('Maschio' o 'Femmina').

---

In sintesi, i vincoli di tupla e di dominio forniscono un modo per specificare le regole che le tuple e gli attributi devono seguire per garantire l'integrità e la validità dei dati in un database relazionale.
