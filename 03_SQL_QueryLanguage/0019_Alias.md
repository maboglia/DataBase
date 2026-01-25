# Alias

Gli alias sono utili per rinominare temporaneamente una tabella o un'intestazione di campo all'interno di una query. Possono essere utilizzati per rendere più leggibile il risultato della query o per riferirsi più facilmente a una colonna con un nome più intuitivo.

Per creare un alias per una colonna, si utilizza l'istruzione AS seguita dal nuovo nome desiderato per la colonna. Tuttavia, l'uso di AS è facoltativo e può essere omesso.

---

Ecco un esempio di utilizzo di alias per rinominare una colonna nella query:

```sql
SELECT data_nascita AS `Data di nascita`
FROM studente;
```

In questo caso, la colonna `data_nascita` viene rinominata temporaneamente come `Data di nascita` utilizzando l'alias. L'uso del backtick (`) attorno al nuovo nome è opzionale, ma può essere utile se il nome contiene spazi o caratteri speciali.

---

Gli alias possono essere utilizzati anche per creare un alias per una formula o un'espressione calcolata. Ad esempio:

```sql
SELECT (campo1 - campo2) AS risultato
FROM nome_tabella
[WHERE condizione];
```

Qui l'espressione `(campo1 - campo2)` viene calcolata e rinominata come `risultato` utilizzando l'alias.

Ricorda che gli alias possono essere utilizzati anche con altre clausole come GROUP BY, ORDER BY o HAVING per riferirsi più facilmente alle colonne nei risultati della query.

---

## alias per le tabelle

Gli alias per le tabelle sono utilizzati per abbreviare i nomi delle tabelle all'interno di una query, rendendo così la query più semplice da scrivere e leggere.

Per definire un alias per una tabella, si utilizza l'istruzione AS seguita dal nuovo nome desiderato per la tabella. Tuttavia, anche in questo caso, l'uso di AS è facoltativo e può essere omesso.

---

Ecco un esempio di utilizzo degli alias per le tabelle in una query:

```sql
SELECT d.nome, d.cognome, d.email, c.titolo AS `Titolo Corso`
FROM docenti AS d, corsi AS c
WHERE d.id = c.docente_id
ORDER BY `Titolo Corso`;
```

In questo esempio, le tabelle `docenti` e `corsi` vengono rinominate rispettivamente come `d` e `c` utilizzando gli alias. L'alias `d` viene utilizzato per riferirsi alla tabella `docenti`, mentre l'alias `c` viene utilizzato per riferirsi alla tabella `corsi`.

---

L'uso degli alias per le tabelle diventa particolarmente utile quando si devono scrivere query complesse che coinvolgono più tabelle, rendendo la query più concisa e leggibile. 

È importante notare che **quando si utilizzano alias** per le tabelle e **ci sono attributi** con lo stesso nome in diverse tabelle coinvolte nella query, è **necessario utilizzare** il nuovo nome della tabella definito come alias per richiamare i campi in modo non ambiguo nella clausola SELECT.

---

Questa query estrae l'elenco completo delle informazioni sui corsi utilizzando alias per le tabelle coinvolte. Le informazioni richieste sono ottenute dalle tabelle `studenti`, `docenti`, `corsi` e `iscrizioni`. Ecco la query:

```sql
SELECT
   s.nome AS `Nome studente`,
   s.cognome AS `Cognome studente`,
   s.email AS `Contatto studente`,
   c.titolo AS `Corso`,
   d.cognome AS `Cognome docente`,
   d.nome AS `Nome docente`
FROM studenti AS s, corsi AS c, iscrizioni AS i, docenti AS d
WHERE s.id = i.studente_id
AND c.id = i.corso_id
AND d.id = c.docente_id;
```

---

### utilizzando gli alias

In questa query:

- Le tabelle `studenti`, `corsi`, `iscrizioni` e `docenti` vengono rinominate rispettivamente come `s`, `c`, `i` e `d` utilizzando gli alias.
- Viene selezionato il nome, il cognome e l'email dello studente dalla tabella `studenti` utilizzando l'alias `s`.
- Viene selezionato il titolo del corso dalla tabella `corsi` utilizzando l'alias `c`.
- Viene selezionato il cognome e il nome del docente dalla tabella `docenti` utilizzando l'alias `d`.
- La clausola WHERE specifica le condizioni di join tra le tabelle `studenti`, `corsi`, `iscrizioni` e `docenti` utilizzando gli alias definiti.
