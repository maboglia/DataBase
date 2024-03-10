# Studenti, Esami e Corsi


Di seguito trovi un esempio di database studenti corsi esami usando il linguaggio SQL. Il database contiene quattro tabelle: Studenti, Corsi, Esami e Docenti. Ogni tabella ha alcuni attributi che descrivono le entità e le relazioni tra di esse. 


```sql
-- Creazione delle tabelle
CREATE TABLE Studenti (
  Matricola INT PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL,
  Cognome VARCHAR(50) NOT NULL,
  DataNascita DATE NOT NULL,
  CodCorso INT NOT NULL,
  FOREIGN KEY (CodCorso) REFERENCES Corsi(CodCorso)
);

CREATE TABLE Corsi (
  CodCorso INT PRIMARY KEY,
  NomeCorso VARCHAR(100) NOT NULL,
  Crediti INT NOT NULL,
  CodDocente INT NOT NULL,
  FOREIGN KEY (CodDocente) REFERENCES Docenti(CodDocente)
);

CREATE TABLE Esami (
  Matricola INT NOT NULL,
  CodCorso INT NOT NULL,
  Data DATE NOT NULL,
  Voto INT NOT NULL,
  PRIMARY KEY (Matricola, CodCorso),
  FOREIGN KEY (Matricola) REFERENCES Studenti(Matricola),
  FOREIGN KEY (CodCorso) REFERENCES Corsi(CodCorso)
);

CREATE TABLE Docenti (
  CodDocente INT PRIMARY KEY,
  Nome VARCHAR(50) NOT NULL,
  Cognome VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL
);

-- Inserimento di alcuni dati di esempio
INSERT INTO Studenti VALUES
(1001, 'Mario', 'Rossi', '2000-01-01', 101),
(1002, 'Luca', 'Verdi', '1999-02-02', 102),
(1003, 'Anna', 'Bianchi', '2000-03-03', 101),
(1004, 'Sara', 'Neri', '1999-04-04', 103);

INSERT INTO Corsi VALUES
(101, 'Matematica', 6, 201),
(102, 'Informatica', 9, 202),
(103, 'Fisica', 6, 203),
(104, 'Chimica', 9, 204);

INSERT INTO Esami VALUES
(1001, 101, '2020-01-10', 28),
(1001, 102, '2020-01-15', 30),
(1002, 101, '2020-01-10', 25),
(1002, 103, '2020-01-20', 27),
(1003, 101, '2020-01-10', 30),
(1003, 104, '2020-01-25', 26),
(1004, 102, '2020-01-15', 24),
(1004, 103, '2020-01-20', 29);

INSERT INTO Docenti VALUES
(201, 'Paolo', 'Mazzoni', 'paolo.mazzoni@universita.it'),
(202, 'Laura', 'Ferrari', 'laura.ferrari@universita.it'),
(203, 'Marco', 'Ricci', 'marco.ricci@universita.it'),
(204, 'Elena', 'Galli', 'elena.galli@universita.it');
```

---

### Esercizi

**Esercizio 1**: Trova il nome e il cognome degli studenti che hanno superato l'esame di informatica con un voto maggiore o uguale a 28.

```sql
-- Soluzione
SELECT Nome, Cognome
FROM Studenti
WHERE Matricola IN (
  SELECT Matricola
  FROM Esami
  WHERE CodCorso = 102 AND Voto >= 28
);

-- Spiegazione
Questa query usa una subquery per selezionare le matricole degli studenti che hanno superato l'esame di informatica con un voto maggiore o uguale a 28. Poi, usa la clausola IN per filtrare i record della tabella Studenti che corrispondono a queste matricole. Infine, restituisce il nome e il cognome degli studenti selezionati.
```

**Esercizio 2**: Trova il nome del corso e il numero di crediti dei corsi che sono stati insegnati da docenti il cui cognome inizia per F.

```sql
-- Soluzione
SELECT NomeCorso, Crediti
FROM Corsi
WHERE CodDocente IN (
  SELECT CodDocente
  FROM Docenti
  WHERE Cognome LIKE 'F%'
);

-- Spiegazione
Questa query usa una subquery per selezionare i codici dei docenti il cui cognome inizia per F. Poi, usa la clausola IN per filtrare i record della tabella Corsi che corrispondono a questi codici. Infine, restituisce il nome del corso e il numero di crediti dei corsi selezionati.
```

**Esercizio 3**: Trova il nome e il cognome dei docenti che hanno insegnato almeno un corso a cui ha partecipato lo studente Mario Rossi.

```sql
-- Soluzione
SELECT Nome, Cognome
FROM Docenti
WHERE CodDocente IN (
  SELECT CodDocente
  FROM Corsi
  WHERE CodCorso IN (
    SELECT CodCorso
    FROM Esami
    WHERE Matricola = (
      SELECT Matricola
      FROM Studenti
      WHERE Nome = 'Mario' AND Cognome = 'Rossi'
    )
  )
);

-- Spiegazione
Questa query usa una serie di subquery per selezionare i codici dei corsi a cui ha partecipato lo studente Mario Rossi, i codici dei docenti che hanno insegnato questi corsi, e infine i nomi e i cognomi dei docenti selezionati. Si noti che le subquery sono annidate in modo da usare i risultati delle subquery precedenti come condizioni per le subquery successive.
```

