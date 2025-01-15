# le "Viste" in un database relazionale

Una **vista** è un'istanza virtualizzata di una tabella, ottenuta attraverso una query SQL, che può essere utilizzata come se fosse una tabella fisica. Le viste forniscono un modo per **astrarre e semplificare la complessità delle query**, migliorando la gestione e la sicurezza dei dati.

---

## Definizione di Vista

- Una vista è una tabella virtuale basata sui risultati di una query SQL. Non contiene fisicamente i dati, ma fornisce una visione organizzata e filtrata delle informazioni presenti nelle tabelle sottostanti.

---

## Creazione di Viste

- Le viste possono essere create utilizzando il comando CREATE VIEW. La definizione della vista è una query SQL che specifica quali colonne e righe includere nella vista.

   ```sql
   CREATE VIEW VistaStudenti AS
   SELECT StudenteID, Nome, CorsoDiStudi
   FROM Studenti
   WHERE AnnoIscrizione = 2022;
   ```

   Questa vista seleziona solo gli studenti iscritti nell'anno 2022.

---

## Utilizzo di Viste

- Una volta creata, una vista può essere utilizzata nelle query esattamente come una tabella fisica.

   ```sql
   SELECT * FROM VistaStudenti;
   ```

   Questa query restituisce tutti gli studenti iscritti nell'anno 2022 utilizzando la vista precedentemente creata.

---

## Aggiornamento di Viste

- Le viste possono essere aggiornate attraverso la modifica della query SQL alla base della vista. Le modifiche si rifletteranno automaticamente nelle query che utilizzano la vista.

   ```sql
   CREATE OR REPLACE VIEW VistaStudenti AS
   SELECT StudenteID, Nome, CorsoDiStudi
   FROM Studenti
   WHERE AnnoIscrizione = 2023;
   ```

   Questa modifica della vista cambia la condizione dell'anno di iscrizione da 2022 a 2023.

---

## Viste Aggregate

- Le viste possono includere operazioni aggregate per semplificare ulteriormente le query complesse.

   ```sql
   CREATE VIEW VistaMediaVoti AS
   SELECT CorsoDiStudi, AVG(Voto) AS MediaVoti
   FROM Esami
   GROUP BY CorsoDiStudi;
   ```

   Questa vista calcola la media dei voti per ciascun corso di studi.

---

## Viste Join

- Le viste possono essere utilizzate per semplificare le operazioni di join, consentendo di combinare dati da più tabelle in una vista unificata.

   ```sql
   CREATE VIEW VistaStudentiCorsi AS
   SELECT Studenti.Nome, Corsi.Nome AS Corso
   FROM Studenti
   INNER JOIN Corsi ON Studenti.CorsoID = Corsi.CorsoID;
   ```

   Questa vista combina informazioni sugli studenti e i corsi attraverso una join.

---

## Sicurezza e Controllo

- Le viste possono essere utilizzate per limitare l'accesso a determinate colonne o righe delle tabelle sottostanti, contribuendo così a una migliore sicurezza dei dati.

   ```sql
   CREATE VIEW VistaDatiSensibili AS
   SELECT Nome, Cognome, DataDiNascita
   FROM UtentiSensibili;
   ```

   Questa vista mostra solo colonne specifiche della tabella UtentiSensibili.

Le viste sono uno strumento potente per semplificare e organizzare l'accesso ai dati in un database relazionale. La loro corretta progettazione e utilizzo migliorano la manutenibilità e la sicurezza del sistema.
