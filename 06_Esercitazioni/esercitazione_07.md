# Esercitazione 07

## Esercitazione SQL sull'argomento "Spettacoli, Teatri, Repliche":

Scenario:
Immagina di essere responsabile di un'azienda che gestisce spettacoli teatrali. Hai un database relazionale per gestire gli spettacoli, i teatri e le repliche. Il database contiene le seguenti tabelle:

1. `Spettacoli`:
   - `id` (identificatore unico)
   - `titolo` (titolo dello spettacolo)
   - `genere` (genere dello spettacolo)
   - `durata` (durata dello spettacolo in minuti)

2. `Teatri`:
   - `id` (identificatore unico)
   - `nome` (nome del teatro)
   - `indirizzo` (indirizzo del teatro)
   - `città` (città del teatro)

3. `Repliche`:
   - `id` (identificatore unico)
   - `id_spettacolo` (chiave esterna che fa riferimento all'id dello spettacolo)
   - `id_teatro` (chiave esterna che fa riferimento all'id del teatro)
   - `data_ora` (data e ora della replica)

**Obiettivo dell'esercizio:** Scrivere query SQL per estrarre informazioni utili relative agli spettacoli, ai teatri e alle repliche.

---

### dati prova

Ecco degli esempi di istruzioni `INSERT` per inserire dati di prova nelle tabelle `Spettacoli`, `Teatri`, e `Repliche`:

```sql
-- Inserimento dati di prova per la tabella Teatri
INSERT INTO Teatri (nome, indirizzo, città)
VALUES 
    ('Teatro alla Scala', 'Via Filodrammatici, 2', 'Milano'),
    ('Teatro San Carlo', 'Via San Carlo, 98', 'Napoli'),
    ('Teatro La Fenice', 'Campo San Fantin, 1965', 'Venezia'),
    ('Teatro di San Carlo', 'Piazza del Plebiscito, 1', 'Napoli');

-- Inserimento dati di prova per la tabella Spettacoli
INSERT INTO Spettacoli (titolo, genere, durata)
VALUES 
    ('Il Barbiere di Siviglia', 'Commedia Musicale', 150),
    ('La Traviata', 'Opera', 180),
    ('Romeo e Giulietta', 'Dramma', 120),
    ('Il lago dei cigni', 'Balletto', 135),
    ('La Bohème', 'Opera', 165);

-- Inserimento dati di prova per la tabella Repliche
INSERT INTO Repliche (id_spettacolo, id_teatro, data_ora)
VALUES 
    (1, 1, '2024-04-01 19:00:00'),
    (2, 2, '2024-04-02 20:30:00'),
    (3, 3, '2024-04-03 18:00:00'),
    (4, 4, '2024-04-04 17:30:00'),
    (5, 1, '2024-04-05 19:30:00'),
    (1, 2, '2024-04-06 20:00:00'),
    (2, 3, '2024-04-07 19:15:00'),
    (3, 4, '2024-04-08 18:45:00'),
    (4, 1, '2024-04-09 20:20:00'),
    (5, 2, '2024-04-10 19:45:00');
```

Queste istruzioni `INSERT` inseriscono dati di prova nelle tabelle `Teatri`, `Spettacoli`, e `Repliche`, creando un piccolo set di dati per eseguire query di esempio. Assicurati di adattare questi dati di prova alle tue esigenze specifiche se necessario.

---
Esercitazione:

1. Trova tutti i teatri situati a Milano.

2. Mostra l'elenco di tutti gli spettacoli ordinati per durata decrescente.

3. Calcola il numero totale di repliche per ciascun teatro.

4. Trova lo spettacolo con il maggior numero di repliche.

5. Aggiorna la durata di uno spettacolo.

6. Trova il teatro che ospita il maggior numero di spettacoli.

7. Conta quanti spettacoli diversi sono stati rappresentati in totale.

Soluzione:

1. 
```sql
SELECT * FROM Teatri WHERE città = 'Milano';
```

2. 
```sql
SELECT * FROM Spettacoli ORDER BY durata DESC;
```

3. 
```sql
SELECT 
    id_teatro, 
    COUNT(*) AS num_repliche
FROM 
    Repliche
GROUP BY 
    id_teatro;
```

4. 
```sql
SELECT 
    id_spettacolo,
    COUNT(*) AS num_repliche
FROM 
    Repliche
GROUP BY 
    id_spettacolo
ORDER BY 
    num_repliche DESC
LIMIT 1;
```

5. 
```sql
UPDATE Spettacoli
SET durata = [nuova_durata]
WHERE id = [id_spettacolo];
```

6. 
```sql
SELECT 
    id_teatro, 
    COUNT(*) AS num_spettacoli
FROM 
    Repliche
GROUP BY 
    id_teatro
ORDER BY 
    num_spettacoli DESC
LIMIT 1;
```

7. 
```sql
SELECT COUNT(DISTINCT id_spettacolo) AS num_spettacoli_totali FROM Repliche;
```

Questi esempi di query SQL ti aiuteranno a esercitarti nell'utilizzo delle operazioni di base del linguaggio SQL applicate al contesto di un'azienda che gestisce spettacoli teatrali.