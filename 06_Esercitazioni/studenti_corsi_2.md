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
(1004, 'Sara', 'Neri', '1999-04-04', 103),
(1005, 'Giovanni', 'Gialli', '2000-05-05', 104),
(1006, 'Chiara', 'Rosa', '1999-06-06', 105),
(1007, 'Alessandro', 'Marroni', '2000-07-07', 102),
(1008, 'Elisa', 'Viola', '1999-08-08', 101);


INSERT INTO Corsi VALUES
(101, 'Matematica', 6, 201),
(102, 'Informatica', 9, 202),
(103, 'Fisica', 6, 203),
(104, 'Chimica', 9, 204),
(105, 'Biologia', 7, 201),
(106, 'Storia dell''arte', 8, 202),
(107, 'Letteratura', 10, 203),
(108, 'Economia', 7, 204);

INSERT INTO Esami VALUES
(1001, 101, '2020-01-10', 28),
(1001, 102, '2020-01-15', 30),
(1002, 101, '2020-01-10', 25),
(1002, 103, '2020-01-20', 27),
(1003, 101, '2020-01-10', 30),
(1003, 104, '2020-01-25', 26),
(1004, 102, '2020-01-15', 24),
(1004, 103, '2020-01-20', 29),
(1005, 101, '2020-01-10', 26),
(1006, 102, '2020-01-15', 28),
(1007, 101, '2020-01-10', 29),
(1008, 103, '2020-01-20', 30),
(1009, 102, '2020-01-15', 27),
(1010, 104, '2020-01-20', 28),
(1011, 101, '2020-01-10', 25),
(1012, 104, '2020-01-25', 26);

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

---

## 10 domande SQL fondamentali su questa base dati:

1. **Quali sono i nomi completi degli studenti?**

```sql
SELECT CONCAT(Nome, ' ', Cognome) AS NomeCompleto
FROM Studenti;
```

2. **Quali corsi sono disponibili e quanti crediti offrono ciascuno?**

```sql
SELECT NomeCorso, Crediti
FROM Corsi;
```

3. **Chi sono i docenti e qual è la loro email?**

```sql
SELECT Nome, Cognome, Email
FROM Docenti;
```

4. **Quali esami sono stati sostenuti da uno specifico studente?**

```sql
SELECT *
FROM Esami
WHERE Matricola = <MatricolaDesiderata>;
```

5. **Quali sono i voti ottenuti dagli studenti in un corso specifico?**

```sql
SELECT Voto
FROM Esami
WHERE CodCorso = <CodCorsoDesiderato>;
```

6. **Quali studenti hanno superato un determinato corso con un voto superiore a 25?**

```sql
SELECT s.*
FROM Studenti s
JOIN Esami e ON s.Matricola = e.Matricola
WHERE e.CodCorso = <CodCorsoDesiderato> AND e.Voto > 25;
```

7. **Qual è la media dei voti ottenuti dagli studenti in tutti i corsi?**

```sql
SELECT AVG(Voto) AS MediaVoti
FROM Esami;
```

8. **Quali corsi hanno ottenuto la media dei voti più alta?**

```sql
SELECT c.NomeCorso, AVG(e.Voto) AS MediaVoti
FROM Corsi c
JOIN Esami e ON c.CodCorso = e.CodCorso
GROUP BY c.NomeCorso
ORDER BY AVG(e.Voto) DESC;
```

9. **Quali sono i corsi che nessuno ha ancora sostenuto?**

```sql
SELECT c.NomeCorso
FROM Corsi c
LEFT JOIN Esami e ON c.CodCorso = e.CodCorso
WHERE e.Matricola IS NULL;
```

10. **Quali sono i corsi tenuti da un docente specifico?**

```sql
SELECT c.NomeCorso
FROM Corsi c
JOIN Docenti d ON c.CodDocente = d.CodDocente
WHERE d.Nome = '<NomeDocenteDesiderato>';
```

---

## 10 domande SQL leggermente più complesse:

1. **Quali sono gli studenti che hanno sostenuto tutti i corsi offerti?**

```sql
SELECT Matricola
FROM Studenti
GROUP BY Matricola
HAVING COUNT(DISTINCT CodCorso) = (SELECT COUNT(*) FROM Corsi);
```

2. **Quali sono i corsi con il numero massimo di crediti?**

```sql
SELECT *
FROM Corsi
WHERE Crediti = (SELECT MAX(Crediti) FROM Corsi);
```

3. **Qual è il docente che ha tenuto il maggior numero di corsi?**

```sql
SELECT d.Nome, d.Cognome, COUNT(*) AS NumeroCorsi
FROM Docenti d
JOIN Corsi c ON d.CodDocente = c.CodDocente
GROUP BY d.Nome, d.Cognome
ORDER BY NumeroCorsi DESC
LIMIT 1;
```

4. **Quali sono gli studenti che non hanno ancora sostenuto esami?**

```sql
SELECT Matricola
FROM Studenti
WHERE Matricola NOT IN (SELECT DISTINCT Matricola FROM Esami);
```

5. **Quali sono i corsi che hanno una media di voti superiore a 27?**

```sql
SELECT c.NomeCorso
FROM Corsi c
JOIN Esami e ON c.CodCorso = e.CodCorso
GROUP BY c.NomeCorso
HAVING AVG(e.Voto) > 27;
```

6. **Quali sono gli studenti che hanno sostenuto almeno un esame con un voto inferiore a 18?**

```sql
SELECT DISTINCT Matricola
FROM Esami
WHERE Voto < 18;
```

7. **Quali sono i corsi in cui nessuno ha ottenuto un voto superiore a 20?**

```sql
SELECT NomeCorso
FROM Corsi
WHERE CodCorso NOT IN (SELECT CodCorso FROM Esami WHERE Voto > 20);
```

8. **Quali sono gli studenti che hanno sostenuto esami in tutti i corsi con un voto superiore a 25?**

```sql
SELECT Matricola
FROM Esami
WHERE Voto > 25
GROUP BY Matricola
HAVING COUNT(DISTINCT CodCorso) = (SELECT COUNT(*) FROM Corsi);
```

9. **Quali sono i docenti che non hanno tenuto alcun corso?**

```sql
SELECT d.Nome, d.Cognome
FROM Docenti d
LEFT JOIN Corsi c ON d.CodDocente = c.CodDocente
WHERE c.CodCorso IS NULL;
```

10. **Quali sono gli studenti che hanno sostenuto esami in tutti i corsi tenuti da un docente specifico?**

```sql
SELECT Matricola
FROM Esami
WHERE CodCorso IN (SELECT CodCorso FROM Corsi WHERE CodDocente = <CodiceDocente>)
GROUP BY Matricola
HAVING COUNT(DISTINCT CodCorso) = (SELECT COUNT(*) FROM Corsi WHERE CodDocente = <CodiceDocente>);
```

---

## 10 domande SQL di livello avanzato

1. **Qual è la percentuale di studenti che ha sostenuto esami in almeno tre corsi?**

```sql
SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Studenti) AS Percentuale
FROM (
    SELECT Matricola
    FROM Esami
    GROUP BY Matricola
    HAVING COUNT(DISTINCT CodCorso) >= 3
) AS StudentiTreCorsi;
```

2. **Quali sono gli studenti che hanno ottenuto la media più alta nei loro esami, e qual è la loro media?**

```sql
SELECT Matricola, AVG(Voto) AS MediaVoti
FROM Esami
GROUP BY Matricola
ORDER BY MediaVoti DESC
LIMIT 1;
```

3. **Quali sono i corsi in cui gli studenti hanno ottenuto un voto superiore alla media dei voti complessivi degli studenti in quel corso?**

```sql
SELECT c.NomeCorso
FROM Corsi c
JOIN (
    SELECT CodCorso, AVG(Voto) AS MediaVotiCorso
    FROM Esami
    GROUP BY CodCorso
) AS MediaPerCorso ON c.CodCorso = MediaPerCorso.CodCorso
JOIN Esami e ON c.CodCorso = e.CodCorso
GROUP BY c.NomeCorso
HAVING AVG(e.Voto) > MediaVotiCorso;
```

4. **Quali sono gli studenti che hanno ottenuto un voto superiore a tutti i voti degli altri studenti nello stesso corso?**

```sql
SELECT DISTINCT e.Matricola
FROM Esami e
WHERE NOT EXISTS (
    SELECT *
    FROM Esami
    WHERE CodCorso = e.CodCorso AND Voto < e.Voto AND Matricola != e.Matricola
);
```

5. **Qual è il numero medio di esami sostenuti dagli studenti per ogni corso?**

```sql
SELECT AVG(NumeroEsami) AS MediaEsamiPerCorso
FROM (
    SELECT CodCorso, COUNT(*) AS NumeroEsami
    FROM Esami
    GROUP BY CodCorso, Matricola
) AS EsamiPerCorso;
```

6. **Qual è il periodo in cui gli studenti hanno sostenuto più esami?**

```sql
SELECT EXTRACT(YEAR FROM Data) AS Anno, EXTRACT(MONTH FROM Data) AS Mese, COUNT(*) AS NumeroEsami
FROM Esami
GROUP BY Anno, Mese
ORDER BY NumeroEsami DESC
LIMIT 1;
```

7. **Qual è il docente che ha tenuto corsi in più anni?**

```sql
SELECT d.Nome, d.Cognome, COUNT(DISTINCT EXTRACT(YEAR FROM c.Anno)) AS AnniDiversi
FROM Docenti d
JOIN Corsi c ON d.CodDocente = c.CodDocente
GROUP BY d.Nome, d.Cognome
ORDER BY AnniDiversi DESC
LIMIT 1;
```

8. **Quali studenti hanno ottenuto un voto superiore a 25 in tutti i corsi del loro anno di immatricolazione?**

```sql
SELECT Matricola
FROM Studenti s
WHERE DataNascita >= 'Data di inizio anno di immatricolazione'
AND NOT EXISTS (
    SELECT CodCorso
    FROM Corsi
    WHERE CodCorso NOT IN (
        SELECT CodCorso
        FROM Esami
        WHERE Esami.Matricola = s.Matricola AND Voto > 25
    )
);
```

9. **Qual è il numero massimo di crediti totali che uno studente può ottenere iscrivendosi a tutti i corsi disponibili?**

```sql
SELECT SUM(Crediti) AS MassimoCrediti
FROM Corsi;
```

10. **Quali sono i corsi in cui tutti gli studenti hanno ottenuto un voto superiore a 18?**

```sql
SELECT NomeCorso
FROM Corsi
WHERE CodCorso NOT IN (
    SELECT CodCorso
    FROM Esami
    WHERE Voto <= 18
);
```
