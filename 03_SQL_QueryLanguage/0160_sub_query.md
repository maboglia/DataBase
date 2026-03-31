# 📌 SCHEDA: SUBQUERY (Sottoquery) in SQL

## 1) Cos’è una Subquery

Una **subquery** è una query SQL inserita dentro un’altra query.

📌 In pratica: una query “interna” che produce un risultato usato dalla query “esterna”.

Esempio generale:

```sql
SELECT ...
FROM ...
WHERE colonna = (SELECT ...);
```

---

## 2) Perché si usano le Subquery

Le subquery servono per:

✅ confrontare un valore con un risultato calcolato
✅ filtrare righe in base ad altri dati
✅ calcolare aggregazioni e usarle come condizioni
✅ evitare join complessi (in alcuni casi)
✅ scrivere query più compatte

---

# 3) Tipi di Subquery

## A) Subquery scalare (ritorna un solo valore)

Esempio: trovare studenti con età maggiore della media.

```sql
SELECT *
FROM studenti
WHERE eta > (SELECT AVG(eta) FROM studenti);
```

📌 La subquery restituisce un solo valore (la media).

---

## B) Subquery che ritorna più righe (lista di valori)

Esempio: studenti che appartengono alle classi che hanno almeno un ripetente.

```sql
SELECT *
FROM studenti
WHERE classe IN (SELECT classe FROM studenti WHERE eta > 18);
```

📌 Qui la subquery restituisce più righe.

---

## C) Subquery correlata (correlated subquery)

La subquery dipende dalla query esterna.

Esempio: trovare studenti che hanno voto massimo nella propria classe.

```sql
SELECT s1.*
FROM studenti s1
WHERE s1.voto = (
    SELECT MAX(s2.voto)
    FROM studenti s2
    WHERE s2.classe = s1.classe
);
```

📌 La subquery viene eseguita per ogni riga della query esterna.

---

## D) Subquery in FROM (derived table)

La subquery diventa una tabella temporanea.

```sql
SELECT classe, media_eta
FROM (
    SELECT classe, AVG(eta) AS media_eta
    FROM studenti
    GROUP BY classe
) AS t
WHERE media_eta > 18;
```

---

## E) Subquery in SELECT

Serve per calcolare un valore “colonna per colonna”.

```sql
SELECT nome,
       (SELECT COUNT(*) 
        FROM esami e
        WHERE e.id_studente = s.id) AS numero_esami
FROM studenti s;
```

---

# 4) Operatori usati con le Subquery

## IN

Controlla appartenenza a un insieme.

```sql
WHERE id IN (SELECT ...)
```

## NOT IN

```sql
WHERE id NOT IN (SELECT ...)
```

⚠️ Attenzione: se la subquery restituisce NULL, NOT IN può dare risultati strani.

---

## EXISTS

Controlla se la subquery restituisce almeno una riga.

```sql
SELECT *
FROM studenti s
WHERE EXISTS (
    SELECT 1
    FROM esami e
    WHERE e.id_studente = s.id
);
```

📌 `EXISTS` spesso è più efficiente di `IN`.

---

## ANY / ALL (meno usati ma importanti)

### ANY

Vero se la condizione è vera per almeno un valore.

```sql
WHERE voto > ANY (SELECT voto FROM studenti WHERE classe='3A')
```

### ALL

Vero se la condizione è vera per tutti i valori.

```sql
WHERE voto > ALL (SELECT voto FROM studenti WHERE classe='3A')
```

---

# 5) Differenza tra JOIN e Subquery

## JOIN

* combina tabelle in righe e colonne
* spesso più veloce
* utile quando servono dati di più tabelle

## SUBQUERY

* utile per confronti con aggregazioni
* più leggibile in certi casi
* le correlate possono essere più lente

📌 In molti casi, una subquery può essere riscritta con JOIN.

---

# 6) Schema di database di esempio

Useremo queste tabelle:

```sql
CREATE TABLE studenti(
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    classe VARCHAR(10)
);

CREATE TABLE esami(
    id INT PRIMARY KEY,
    id_studente INT,
    materia VARCHAR(50),
    voto INT,
    FOREIGN KEY(id_studente) REFERENCES studenti(id)
);
```

---

# 7) Esempi classici di Subquery

---

## Esempio 1: studenti con voto sopra la media

```sql
SELECT DISTINCT s.nome
FROM studenti s
JOIN esami e ON s.id = e.id_studente
WHERE e.voto > (SELECT AVG(voto) FROM esami);
```

---

## Esempio 2: studenti che hanno fatto almeno un esame

```sql
SELECT *
FROM studenti s
WHERE EXISTS (
    SELECT 1
    FROM esami e
    WHERE e.id_studente = s.id
);
```

---

## Esempio 3: studenti che NON hanno fatto esami

```sql
SELECT *
FROM studenti s
WHERE NOT EXISTS (
    SELECT 1
    FROM esami e
    WHERE e.id_studente = s.id
);
```

---

## Esempio 4: studenti con voto massimo assoluto

```sql
SELECT *
FROM esami
WHERE voto = (SELECT MAX(voto) FROM esami);
```

---

## Esempio 5: studenti con voto massimo per materia (subquery correlata)

```sql
SELECT e1.*
FROM esami e1
WHERE e1.voto = (
    SELECT MAX(e2.voto)
    FROM esami e2
    WHERE e2.materia = e1.materia
);
```

---

# 🧪 ESERCIZI SULLE SUBQUERY (Tracce)

---

## ESERCIZIO 1 (facile)

Visualizza gli studenti che appartengono alla classe dello studente chiamato `"Mario"`.

---

## ESERCIZIO 2 (facile)

Trova gli studenti che hanno fatto almeno un esame.

---

## ESERCIZIO 3 (facile)

Trova gli studenti che non hanno fatto nessun esame.

---

## ESERCIZIO 4 (medio)

Trova gli studenti che hanno preso almeno un voto pari al massimo voto ottenuto in tutti gli esami.

---

## ESERCIZIO 5 (medio)

Trova gli studenti che hanno una media voti superiore alla media generale di tutti gli studenti.

---

## ESERCIZIO 6 (medio)

Trova gli studenti che hanno sostenuto esami di `"Matematica"`.

---

## ESERCIZIO 7 (medio-avanzato)

Trova gli studenti che hanno sostenuto esami in tutte le materie presenti nella tabella esami.

---

## ESERCIZIO 8 (avanzato)

Trova, per ogni studente, il voto massimo ottenuto e mostrali in ordine decrescente.

📌 Deve usare una subquery in FROM.

---

## ESERCIZIO 9 (avanzato - correlata)

Trova gli studenti che hanno preso il voto massimo nella propria classe (considerando la media voti per classe).

---

## ESERCIZIO 10 (avanzato)

Trova gli studenti che hanno sostenuto più esami della media degli studenti.

---

# ✅ SOLUZIONI (per verifica)

---

## Soluzione Esercizio 1

```sql
SELECT *
FROM studenti
WHERE classe = (
    SELECT classe
    FROM studenti
    WHERE nome = 'Mario'
);
```

---

## Soluzione Esercizio 2

```sql
SELECT *
FROM studenti s
WHERE EXISTS (
    SELECT 1
    FROM esami e
    WHERE e.id_studente = s.id
);
```

---

## Soluzione Esercizio 3

```sql
SELECT *
FROM studenti s
WHERE NOT EXISTS (
    SELECT 1
    FROM esami e
    WHERE e.id_studente = s.id
);
```

---

## Soluzione Esercizio 4

```sql
SELECT DISTINCT s.*
FROM studenti s
JOIN esami e ON s.id = e.id_studente
WHERE e.voto = (SELECT MAX(voto) FROM esami);
```

---

## Soluzione Esercizio 5

```sql
SELECT s.id, s.nome
FROM studenti s
WHERE (
    SELECT AVG(e.voto)
    FROM esami e
    WHERE e.id_studente = s.id
) > (SELECT AVG(voto) FROM esami);
```

---

## Soluzione Esercizio 6

```sql
SELECT *
FROM studenti
WHERE id IN (
    SELECT id_studente
    FROM esami
    WHERE materia = 'Matematica'
);
```

---

## Soluzione Esercizio 7 (tutte le materie)

```sql
SELECT s.*
FROM studenti s
WHERE NOT EXISTS (
    SELECT DISTINCT materia
    FROM esami
    WHERE materia NOT IN (
        SELECT materia
        FROM esami e
        WHERE e.id_studente = s.id
    )
);
```

---

## Soluzione Esercizio 8 (subquery in FROM)

```sql
SELECT t.nome, t.voto_max
FROM (
    SELECT s.nome, MAX(e.voto) AS voto_max
    FROM studenti s
    JOIN esami e ON s.id = e.id_studente
    GROUP BY s.nome
) AS t
ORDER BY t.voto_max DESC;
```

---

## Soluzione Esercizio 10

```sql
SELECT s.*
FROM studenti s
WHERE (
    SELECT COUNT(*)
    FROM esami e
    WHERE e.id_studente = s.id
) > (
    SELECT AVG(num_esami)
    FROM (
        SELECT COUNT(*) AS num_esami
        FROM esami
        GROUP BY id_studente
    ) AS t
);
```

---

# 📌 DOMANDE TEORICHE (Ripasso)

1. Cos’è una subquery scalare?
2. Differenza tra `IN` ed `EXISTS`?
3. Cosa significa subquery correlata?
4. Perché `NOT IN` può dare risultati errati con valori NULL?
5. Qual è la differenza tra subquery in FROM e subquery in WHERE?

