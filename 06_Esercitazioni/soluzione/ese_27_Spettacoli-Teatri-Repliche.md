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

---

## **10 query SQL** per il **filtraggio dei dati** dalle tabelle `Spettacoli`, `Teatri` e `Repliche`

---

### **1️⃣ Elenco degli spettacoli di genere "Opera"**

```sql
SELECT * 
FROM Spettacoli 
WHERE genere = 'Opera';
```

---

### **2️⃣ Spettacoli con durata superiore a 150 minuti**

```sql
SELECT * 
FROM Spettacoli 
WHERE durata > 150;
```

---

### **3️⃣ Tutti i teatri di Napoli**

```sql
SELECT * 
FROM Teatri 
WHERE città = 'Napoli';
```

---

### **4️⃣ Tutte le repliche che si terranno nel "Teatro alla Scala"**

```sql
SELECT R.*
FROM Repliche R
JOIN Teatri T ON R.id_teatro = T.id
WHERE T.nome = 'Teatro alla Scala';
```

---

### **5️⃣ Elenco delle repliche con il titolo dello spettacolo e il nome del teatro**

```sql
SELECT S.titolo, T.nome AS teatro, R.data_ora
FROM Repliche R
JOIN Spettacoli S ON R.id_spettacolo = S.id
JOIN Teatri T ON R.id_teatro = T.id
ORDER BY R.data_ora;
```

---

### **6️⃣ Spettacoli programmati tra il 3 e il 7 aprile 2024**

```sql
SELECT S.titolo, R.data_ora
FROM Repliche R
JOIN Spettacoli S ON R.id_spettacolo = S.id
WHERE R.data_ora BETWEEN '2024-04-03' AND '2024-04-07 23:59:59';
```

---

### **7️⃣ Numero di repliche per ciascuno spettacolo**

```sql
SELECT S.titolo, COUNT(R.id) AS numero_repliche
FROM Spettacoli S
LEFT JOIN Repliche R ON S.id = R.id_spettacolo
GROUP BY S.titolo
ORDER BY numero_repliche DESC;
```

---

### **8️⃣ Numero di repliche in ogni teatro**

```sql
SELECT T.nome AS teatro, COUNT(R.id) AS numero_repliche
FROM Teatri T
LEFT JOIN Repliche R ON T.id = R.id_teatro
GROUP BY T.nome
ORDER BY numero_repliche DESC;
```

---

### **9️⃣ Spettacoli che si terranno in più di un teatro**

```sql
SELECT S.titolo, COUNT(DISTINCT R.id_teatro) AS numero_teatri
FROM Spettacoli S
JOIN Repliche R ON S.id = R.id_spettacolo
GROUP BY S.titolo
HAVING COUNT(DISTINCT R.id_teatro) > 1;
```

---

### **🔟 Prossima replica di ogni spettacolo**

```sql
SELECT S.titolo, MIN(R.data_ora) AS prossima_replica
FROM Spettacoli S
JOIN Repliche R ON S.id = R.id_spettacolo
WHERE R.data_ora > NOW()
GROUP BY S.titolo
ORDER BY prossima_replica;
```

---

## **10 query SQL con subquery** per il filtraggio dei dati dalle tabelle `Spettacoli`, `Teatri` e `Repliche`

---

### **1️⃣ Spettacoli con almeno una replica programmata**

```sql
SELECT * 
FROM Spettacoli 
WHERE id IN (SELECT DISTINCT id_spettacolo FROM Repliche);
```

✅ *Seleziona tutti gli spettacoli che hanno almeno una replica programmata.*

---

### **2️⃣ Teatri che ospitano almeno una replica di un'opera**

```sql
SELECT * 
FROM Teatri 
WHERE id IN (
    SELECT DISTINCT id_teatro 
    FROM Repliche 
    WHERE id_spettacolo IN (
        SELECT id FROM Spettacoli WHERE genere = 'Opera'
    )
);
```

✅ *Seleziona i teatri che ospitano almeno una replica di spettacoli di genere "Opera".*

---

### **3️⃣ Spettacoli con la durata maggiore della durata media di tutti gli spettacoli**

```sql
SELECT * 
FROM Spettacoli 
WHERE durata > (
    SELECT AVG(durata) FROM Spettacoli
);
```

✅ *Restituisce gli spettacoli la cui durata è superiore alla durata media di tutti gli spettacoli.*

---

### **4️⃣ Replica più recente di ciascuno spettacolo**

```sql
SELECT * 
FROM Repliche 
WHERE data_ora = (
    SELECT MAX(data_ora) 
    FROM Repliche 
    WHERE id_spettacolo = Repliche.id_spettacolo
);
```

✅ *Trova la replica più recente per ciascuno spettacolo.*

---

### **5️⃣ Spettacoli rappresentati nel maggior numero di teatri**

```sql
SELECT titolo 
FROM Spettacoli 
WHERE id IN (
    SELECT id_spettacolo 
    FROM Repliche 
    GROUP BY id_spettacolo 
    HAVING COUNT(DISTINCT id_teatro) = (
        SELECT MAX(teatri_per_spettacolo) 
        FROM (
            SELECT COUNT(DISTINCT id_teatro) AS teatri_per_spettacolo 
            FROM Repliche 
            GROUP BY id_spettacolo
        ) AS subquery
    )
);
```

✅ *Restituisce il titolo degli spettacoli che sono stati rappresentati nel maggior numero di teatri.*

---

### **6️⃣ Teatri con il maggior numero di repliche**

```sql
SELECT * 
FROM Teatri 
WHERE id IN (
    SELECT id_teatro 
    FROM Repliche 
    GROUP BY id_teatro 
    HAVING COUNT(*) = (
        SELECT MAX(numero_repliche) 
        FROM (
            SELECT COUNT(*) AS numero_repliche 
            FROM Repliche 
            GROUP BY id_teatro
        ) AS subquery
    )
);
```

✅ *Trova i teatri che hanno ospitato il maggior numero di repliche.*

---

### **7️⃣ Trova lo spettacolo con la durata più lunga**

```sql
SELECT * 
FROM Spettacoli 
WHERE durata = (SELECT MAX(durata) FROM Spettacoli);
```

✅ *Seleziona lo spettacolo con la durata più lunga.*

---

### **8️⃣ Trova i teatri che non hanno ospitato nessuna replica**

```sql
SELECT * 
FROM Teatri 
WHERE id NOT IN (SELECT DISTINCT id_teatro FROM Repliche);
```

✅ *Seleziona i teatri che non hanno mai ospitato alcuno spettacolo.*

---

### **9️⃣ Trova il numero di repliche per ciascuno spettacolo e mostra solo quelli con più repliche della media**

```sql
SELECT titolo, 
       (SELECT COUNT(*) FROM Repliche WHERE Repliche.id_spettacolo = Spettacoli.id) AS numero_repliche
FROM Spettacoli
WHERE (SELECT COUNT(*) FROM Repliche WHERE Repliche.id_spettacolo = Spettacoli.id) > 
      (SELECT AVG(repliche_count) FROM (SELECT COUNT(*) AS repliche_count FROM Repliche GROUP BY id_spettacolo) AS subquery);
```

✅ *Restituisce gli spettacoli che hanno più repliche rispetto alla media di tutti gli spettacoli.*

---

### **🔟 Prossima replica per ogni spettacolo**

```sql
SELECT * 
FROM Repliche 
WHERE data_ora = (
    SELECT MIN(data_ora) 
    FROM Repliche 
    WHERE id_spettacolo = Repliche.id_spettacolo 
    AND data_ora > NOW()
);
```

✅ *Restituisce la prossima replica futura per ogni spettacolo.*

---

## **10 query SQL avanzate con subquery** per esercitarsi con interrogazioni più complesse sui dati delle tabelle `Spettacoli`, `Teatri` e `Repliche`

---

### **1️⃣ Spettacoli con più repliche del numero medio di repliche per spettacolo**

```sql
SELECT titolo, COUNT(Repliche.id) AS numero_repliche
FROM Spettacoli
JOIN Repliche ON Spettacoli.id = Repliche.id_spettacolo
GROUP BY titolo
HAVING COUNT(Repliche.id) > (
    SELECT AVG(repliche_count) 
    FROM (
        SELECT COUNT(*) AS repliche_count 
        FROM Repliche 
        GROUP BY id_spettacolo
    ) AS subquery
);
```

✅ *Restituisce gli spettacoli che hanno più repliche rispetto alla media di tutte le repliche per spettacolo.*

---

### **2️⃣ Teatri che hanno ospitato tutti i generi di spettacoli presenti nel database**

```sql
SELECT nome
FROM Teatri
WHERE id IN (
    SELECT id_teatro
    FROM Repliche
    GROUP BY id_teatro
    HAVING COUNT(DISTINCT id_spettacolo) = (
        SELECT COUNT(DISTINCT genere) FROM Spettacoli
    )
);
```

✅ *Restituisce i teatri che hanno ospitato almeno uno spettacolo per ogni genere esistente.*

---

### **3️⃣ Spettacoli che sono stati rappresentati in almeno due città diverse**

```sql
SELECT titolo
FROM Spettacoli
WHERE id IN (
    SELECT id_spettacolo
    FROM Repliche
    JOIN Teatri ON Repliche.id_teatro = Teatri.id
    GROUP BY id_spettacolo
    HAVING COUNT(DISTINCT città) >= 2
);
```

✅ *Trova gli spettacoli che sono stati rappresentati in almeno due città diverse.*

---

### **4️⃣ Città con il maggior numero di repliche totali**

```sql
SELECT città
FROM Teatri
WHERE id IN (
    SELECT id_teatro
    FROM Repliche
    GROUP BY id_teatro
    HAVING COUNT(*) = (
        SELECT MAX(numero_repliche)
        FROM (
            SELECT COUNT(*) AS numero_repliche
            FROM Repliche
            GROUP BY id_teatro
        ) AS subquery
    )
);
```

✅ *Trova la città in cui si sono tenute più repliche.*

---

### **5️⃣ Spettacolo con la durata massima per ciascun genere**

```sql
SELECT S.*
FROM Spettacoli S
WHERE durata = (
    SELECT MAX(durata)
    FROM Spettacoli
    WHERE genere = S.genere
);
```

✅ *Restituisce per ogni genere lo spettacolo con la durata maggiore.*

---

### **6️⃣ Teatri che hanno ospitato solo spettacoli di un unico genere**

```sql
SELECT nome
FROM Teatri
WHERE id IN (
    SELECT id_teatro
    FROM Repliche
    GROUP BY id_teatro
    HAVING COUNT(DISTINCT id_spettacolo) = 1
);
```

✅ *Trova i teatri che hanno ospitato solo spettacoli di un unico genere.*

---

### **7️⃣ Spettacolo più recente rappresentato in ogni teatro**

```sql
SELECT *
FROM Repliche R1
WHERE data_ora = (
    SELECT MAX(data_ora)
    FROM Repliche R2
    WHERE R1.id_teatro = R2.id_teatro
);
```

✅ *Restituisce l'ultima replica rappresentata in ogni teatro.*

---

### **8️⃣ Trova gli spettacoli rappresentati solo in un singolo teatro**

```sql
SELECT titolo
FROM Spettacoli
WHERE id IN (
    SELECT id_spettacolo
    FROM Repliche
    GROUP BY id_spettacolo
    HAVING COUNT(DISTINCT id_teatro) = 1
);
```

✅ *Mostra gli spettacoli che sono stati rappresentati in un solo teatro.*

---

### **9️⃣ Trova la prima replica per ogni spettacolo**

```sql
SELECT *
FROM Repliche R1
WHERE data_ora = (
    SELECT MIN(data_ora)
    FROM Repliche R2
    WHERE R1.id_spettacolo = R2.id_spettacolo
);
```

✅ *Restituisce la prima replica registrata per ogni spettacolo.*

---

### **🔟 Trova il teatro che ha ospitato il maggior numero di spettacoli diversi**

```sql
SELECT nome
FROM Teatri
WHERE id IN (
    SELECT id_teatro
    FROM Repliche
    GROUP BY id_teatro
    HAVING COUNT(DISTINCT id_spettacolo) = (
        SELECT MAX(spettacoli_count)
        FROM (
            SELECT COUNT(DISTINCT id_spettacolo) AS spettacoli_count
            FROM Repliche
            GROUP BY id_teatro
        ) AS subquery
    )
);
```

✅ *Trova il teatro che ha ospitato il maggior numero di spettacoli diversi.*

---

## **9 esercizi** per sperimentare le principali funzioni avanzate in SQL, tra cui **funzioni analitiche, funzioni di finestra, CTE (Common Table Expressions), e JSON/XML processing**

---

### **1️⃣ Classificare gli spettacoli in base alla durata (Ranking Function)**

📌 *Assegna un numero di classifica agli spettacoli ordinandoli per durata, dal più lungo al più corto.*  

```sql
SELECT titolo, durata,
       RANK() OVER (ORDER BY durata DESC) AS classifica
FROM Spettacoli;
```

✅ *Usa `RANK()` per assegnare un numero progressivo senza saltare valori in caso di parità.*

---

### **2️⃣ Trovare lo spettacolo con la durata massima per ogni genere (Partition By)**

📌 *Trova il titolo dello spettacolo più lungo per ogni genere.*  

```sql
SELECT titolo, genere, durata
FROM (
    SELECT titolo, genere, durata,
           RANK() OVER (PARTITION BY genere ORDER BY durata DESC) AS classifica
    FROM Spettacoli
) AS subquery
WHERE classifica = 1;
```

✅ *Usa `PARTITION BY` per dividere i dati per genere e trova il più lungo.*

---

### **3️⃣ Calcolare la durata media delle repliche per ogni teatro (Aggregate + Window Function)**

📌 *Calcola la durata media degli spettacoli per ogni teatro usando funzioni di finestra.*  

```sql
SELECT T.nome AS teatro, 
       S.titolo, 
       S.durata, 
       AVG(S.durata) OVER (PARTITION BY T.id) AS durata_media_teatro
FROM Repliche R
JOIN Spettacoli S ON R.id_spettacolo = S.id
JOIN Teatri T ON R.id_teatro = T.id;
```

✅ *Mostra la durata di ogni spettacolo con la media delle durate nel teatro.*

---

### **4️⃣ Mostrare la data della replica precedente per ogni spettacolo (LAG Function)**

📌 *Per ogni replica, mostra la data della replica precedente per lo stesso spettacolo.*  

```sql
SELECT id_spettacolo, data_ora,
       LAG(data_ora) OVER (PARTITION BY id_spettacolo ORDER BY data_ora) AS replica_precedente
FROM Repliche;
```

✅ *Usa `LAG()` per ottenere il valore della riga precedente nella stessa partizione.*

---

### **5️⃣ Calcolare il numero di repliche cumulative per ogni spettacolo (Cumulative SUM)**

📌 *Conta il numero cumulativo di repliche per ogni spettacolo nel tempo.*  

```sql
SELECT id_spettacolo, data_ora,
       COUNT(*) OVER (PARTITION BY id_spettacolo ORDER BY data_ora ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS repliche_cumulative
FROM Repliche;
```

✅ *Usa `COUNT() OVER` per ottenere un conteggio progressivo delle repliche per ogni spettacolo.*

---

### **6️⃣ Identificare il teatro con più spettacoli unici (CTE + Aggregate)**

📌 *Trova il teatro che ha ospitato il maggior numero di spettacoli diversi.*  

```sql
WITH TeatroSpettacoli AS (
    SELECT id_teatro, COUNT(DISTINCT id_spettacolo) AS num_spettacoli
    FROM Repliche
    GROUP BY id_teatro
)
SELECT T.nome, TS.num_spettacoli
FROM TeatroSpettacoli TS
JOIN Teatri T ON TS.id_teatro = T.id
ORDER BY num_spettacoli DESC
LIMIT 1;
```

✅ *Usa una `WITH` CTE per contare il numero di spettacoli per ogni teatro e seleziona il migliore.*

---

### **7️⃣ Convertire l'elenco delle repliche di uno spettacolo in formato JSON**

📌 *Restituisce tutte le repliche di un determinato spettacolo in formato JSON.*  

```sql
SELECT JSON_ARRAYAGG(JSON_OBJECT(
    'teatro', T.nome, 
    'data_ora', R.data_ora
)) AS repliche_json
FROM Repliche R
JOIN Teatri T ON R.id_teatro = T.id
WHERE id_spettacolo = 1;
```

✅ *Utilizza `JSON_ARRAYAGG()` e `JSON_OBJECT()` per generare una lista JSON delle repliche.*

---

### **8️⃣ Trovare il tempo medio tra una replica e l'altra per ogni spettacolo**

📌 *Calcola l'intervallo medio di tempo tra le repliche di ogni spettacolo.*  

```sql
SELECT id_spettacolo,
       AVG(TIMESTAMPDIFF(HOUR, replica_precedente, data_ora)) AS media_ore_intervallo
FROM (
    SELECT id_spettacolo, data_ora,
           LAG(data_ora) OVER (PARTITION BY id_spettacolo ORDER BY data_ora) AS replica_precedente
    FROM Repliche
) AS subquery
WHERE replica_precedente IS NOT NULL
GROUP BY id_spettacolo;
```

✅ *Usa `LAG()` e `TIMESTAMPDIFF()` per calcolare l'intervallo tra repliche.*

---

### **9️⃣ Trovare il numero massimo di spettacoli in scena contemporaneamente**

📌 *Trova il massimo numero di spettacoli attivi nello stesso momento.*  

```sql
SELECT MAX(num_spettacoli) AS max_contemporanei
FROM (
    SELECT data_ora, COUNT(*) AS num_spettacoli
    FROM Repliche
    GROUP BY data_ora
) AS subquery;
```

✅ *Conta il numero di spettacoli attivi per ogni orario e trova il massimo.*

