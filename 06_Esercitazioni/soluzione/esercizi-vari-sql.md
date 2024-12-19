# Esercizi

## 1. Esercizio

**Tabelle:**

- **CORSO** (CodCorso, NomeC, Anno, Semestre)  
- **ORARIO-LEZIONI** (CodCorso, GiornoSettimana, OraInizio, OraFine, Aula)  

**Richiesta:**  
Trovare le aule in cui non si tengono mai lezioni di corsi del primo anno.

---

## 2. Esercizio

**Tabelle:**

- **CORSO** (CodCorso, NomeC, Anno, Semestre)  
- **ORARIO-LEZIONI** (CodCorso, GiornoSettimana, OraInizio, OraFine, Aula)  

**Richiesta:**  
Trovare codice corso, nome corso e numero totale di ore di lezione settimanali per i corsi del terzo anno per cui il numero complessivo di ore di lezione settimanali è superiore a 10 e le lezioni sono in più di tre giorni diversi della settimana.

---

## 3. Esercizio

**Tabelle:**

- **ALLOGGIO** (CodA, Indirizzo, Città, Superficie, CostoAffittoMensile)  
- **CONTRATTO-AFFITTO** (CodC, DataInizio, DataFine, NomePersona, CodA)  

**Nota Bene:**  
Superficie espressa in metri quadri. Per i contratti in corso, `DataFine` è `NULL`.  

**Richiesta:**  
Trovare, per le città in cui sono stati stipulati almeno 100 contratti:  
- La città  
- Il costo mensile massimo degli affitti  
- Il costo mensile medio degli affitti  
- La durata massima dei contratti  
- La durata media dei contratti  
- Il numero totale di contratti stipulati.  

---

## 4. Esercizio

**Tabelle:**

- **ALLOGGIO** (CodA, Indirizzo, Città, Superficie, CostoAffittoMensile)  
- **CONTRATTO-AFFITTO** (CodC, DataInizio, DataFine, NomePersona, CodA)  

**Nota Bene:**  
Superficie espressa in metri quadri. Per i contratti in corso, `DataFine` è `NULL`.  

**Richiesta:**  
Trovare il nome delle persone che non hanno mai affittato alloggi con superficie superiore a 80 metri quadri.

---

## 5. Esercizio

**Tabelle:**

- **AEREI** (Matr, Modello, NumPosti)  
- **ORARIO** (Sigla, ParteDa, Destinaz, OraPart, OraArr)  
- **VOLI** (Sigla, Matr, Data, PostiPren)  

**Richiesta:**  
Trovare la sigla e l’ora di partenza dei voli in partenza da Milano per Napoli il 1 ottobre 1993, che dispongono ancora di posti liberi la cui durata (differenza tra l’ora di arrivo e l’ora di partenza) è inferiore alla durata media dei voli da Milano a Napoli.

---

## 6. Esercizio

**Tabelle:**

- **ORCHESTRA** (CodO, NomeO, NomrDirettore, numElementi)  
- **CONCERTI** (CodC, Data, CodO, CodS, PrezzoBiglietto)  
- **SALE** (CodS, NomeS, Città, Capienza)  

**Richiesta:**  
Trovare il codice e il nome delle orchestre con più di 30 elementi che hanno tenuto concerti sia a Torino, sia a Milano, e non hanno mai tenuto concerti a Bologna.

---

## 7. Esercizio

**Tabelle:**

- **CLIENTE** (Cod-Cli, Nome)  
- **CONTO** (Cod-Conto, Saldo, Agenzia, Stato)  
- **CONTO-CLIENTE** (Cod-Conto, Cod-Cli)  

**Richiesta:**  
Trovare tutte le agenzie che hanno almeno un cliente titolare da solo (senza cointestatari) di un unico conto corrente (cliente a cui non è intestato nessun altro conto corrente).

---

## 8. Esercizio

**Tabelle:**

- **CONTRIBUENTE** (CodFiscale, Nome, Via, Città)  
- **DICHIARAZIONE** (CodDichiarazione, Tipo, Reddito)  
- **PRESENTA** (CodFiscale, CodDichiarazione, Data)  

**Richiesta:**  
Visualizzare codice, nome e media dei redditi dichiarati dal 1990 in poi per i contribuenti tali che il massimo reddito da loro dichiarato dal 1990 in poi sia superiore alla media dei redditi calcolata su tutte le dichiarazioni nel database.

---

## 9. Esercizio

**Tabelle:**

- **PERSONA** (Nome, Sesso, Età)  
- **GENITORE** (Nome-Gen, Nome-Figlio)  

**Richiesta:**  
Trovare il nome di tutte le persone con età inferiore a 10 anni che sono figli unici.

---

## Soluzioni

---

### 1. **Trovare le aule in cui non si tengono mai lezioni di corsi del primo anno.**

```sql
SELECT DISTINCT Aula
FROM ORARIO_LEZIONI
WHERE Aula NOT IN (
    SELECT DISTINCT Aula
    FROM ORARIO_LEZIONI
    JOIN CORSO ON ORARIO_LEZIONI.CodCorso = CORSO.CodCorso
    WHERE CORSO.Anno = 1
);
```

---

### 2. **Trovare codice corso, nome corso e numero totale di ore di lezione settimanali per i corsi del terzo anno per cui il numero complessivo di ore è superiore a 10 e le lezioni sono in più di tre giorni.**

```sql
SELECT CORSO.CodCorso, CORSO.NomeC, 
       SUM(TIMESTAMPDIFF(HOUR, ORARIO_LEZIONI.OraInizio, ORARIO_LEZIONI.OraFine)) AS OreTotali
FROM CORSO
JOIN ORARIO_LEZIONI ON CORSO.CodCorso = ORARIO_LEZIONI.CodCorso
WHERE CORSO.Anno = 3
GROUP BY CORSO.CodCorso, CORSO.NomeC
HAVING OreTotali > 10 AND COUNT(DISTINCT ORARIO_LEZIONI.GiornoSettimana) > 3;
```

---

### 3. **Per le città con almeno 100 contratti, trovare informazioni sugli affitti e i contratti.**

```sql
SELECT Città, 
       MAX(CostoAffittoMensile) AS CostoMassimo,
       AVG(CostoAffittoMensile) AS CostoMedio,
       MAX(DATEDIFF(IFNULL(DataFine, CURDATE()), DataInizio)) AS DurataMassima,
       AVG(DATEDIFF(IFNULL(DataFine, CURDATE()), DataInizio)) AS DurataMedia,
       COUNT(*) AS NumeroContratti
FROM ALLOGGIO
JOIN CONTRATTO_AFFITTO ON ALLOGGIO.CodA = CONTRATTO_AFFITTO.CodA
GROUP BY Città
HAVING COUNT(*) >= 100;
```

---

### 4. **Trovare i nomi delle persone che non hanno mai affittato alloggi con superficie superiore a 80 metri quadri.**

```sql
SELECT DISTINCT NomePersona
FROM CONTRATTO_AFFITTO
WHERE NomePersona NOT IN (
    SELECT NomePersona
    FROM CONTRATTO_AFFITTO
    JOIN ALLOGGIO ON CONTRATTO_AFFITTO.CodA = ALLOGGIO.CodA
    WHERE ALLOGGIO.Superficie > 80
);
```

---

### 5. **Trovare voli da Milano a Napoli il 1 ottobre 1993 con posti liberi e durata inferiore alla media.**

```sql
SELECT Sigla, OraPart
FROM ORARIO
JOIN VOLI ON ORARIO.Sigla = VOLI.Sigla
WHERE ParteDa = 'Milano' AND Destinaz = 'Napoli' AND Data = '1993-10-01'
  AND (NumPosti - PostiPren) > 0
  AND TIMESTAMPDIFF(HOUR, OraPart, OraArr) < (
      SELECT AVG(TIMESTAMPDIFF(HOUR, OraPart, OraArr))
      FROM ORARIO
      WHERE ParteDa = 'Milano' AND Destinaz = 'Napoli'
  );
```

---

### 6. **Trovare orchestre con più di 30 elementi che hanno tenuto concerti a Torino e Milano, ma non a Bologna.**

```sql
SELECT CodO, NomeO
FROM ORCHESTRA
WHERE numElementi > 30
  AND CodO IN (
      SELECT CodO
      FROM CONCERTI
      JOIN SALE ON CONCERTI.CodS = SALE.CodS
      WHERE Città = 'Torino'
  )
  AND CodO IN (
      SELECT CodO
      FROM CONCERTI
      JOIN SALE ON CONCERTI.CodS = SALE.CodS
      WHERE Città = 'Milano'
  )
  AND CodO NOT IN (
      SELECT CodO
      FROM CONCERTI
      JOIN SALE ON CONCERTI.CodS = SALE.CodS
      WHERE Città = 'Bologna'
  );
```

---

### 7. **Trovare agenzie con almeno un cliente titolare di un unico conto senza cointestatari.**

```sql
SELECT DISTINCT agenzia
FROM CONTO
WHERE Cod-Conto IN (
    SELECT Cod-Conto
    FROM CONTO_CLIENTE
    GROUP BY Cod-Conto
    HAVING COUNT(Cod-Cli) = 1
)
AND Cod-Cli IN (
    SELECT Cod-Cli
    FROM CONTO_CLIENTE
    GROUP BY Cod-Cli
    HAVING COUNT(Cod-Conto) = 1
);
```

---

### 8. **Visualizzare codice, nome e media dei redditi dichiarati per i contribuenti con massimo reddito superiore alla media generale.**

```sql
SELECT CONTRIBUENTE.CodFiscale, CONTRIBUENTE.Nome, AVG(DICHIARAZIONE.Reddito) AS MediaRedditi
FROM CONTRIBUENTE
JOIN PRESENTA ON CONTRIBUENTE.CodFiscale = PRESENTA.CodFiscale
JOIN DICHIARAZIONE ON PRESENTA.CodDichiarazione = DICHIARAZIONE.CodDichiarazione
WHERE Data >= '1990-01-01'
GROUP BY CONTRIBUENTE.CodFiscale, CONTRIBUENTE.Nome
HAVING MAX(DICHIARAZIONE.Reddito) > (
    SELECT AVG(Reddito)
    FROM DICHIARAZIONE
    WHERE Data >= '1990-01-01'
);
```

---

### 9. **Trovare nomi di persone con meno di 10 anni che sono figli unici.**

```sql
SELECT Nome
FROM PERSONA
WHERE Età < 10
  AND Nome NOT IN (
      SELECT Nome-Figlio
      FROM GENITORE
      WHERE Nome-Figlio IN (
          SELECT Nome-Figlio
          FROM GENITORE
          GROUP BY Nome-Figlio
          HAVING COUNT(Nome-Gen) > 1
      )
  );
```

---

### Esercizio 10  

**Relazioni:**

- **APPARTAMENTO(CodA, Superficie, Indirizzo, Città)**
- **CONTRATTO-AFFITTO(CodA, DataInizio, DataFine, NomePersona, RettaMensile)**  

(a) Trovare il nome delle persone che hanno stipulato più di due contratti di affitto per lo stesso appartamento (in tempi diversi).  
(b) Trovare il codice e l’indirizzo degli appartamenti di Torino in cui la retta mensile è sempre stata superiore a 500 euro e per cui sono stati stipulati al più 5 contratti.  
(c) Trovare il codice e l’indirizzo degli appartamenti di Torino per cui sono stati stipulati al più 5 contratti (un numero variabile tra 0 e 5).  

---

### Esercizio 11  

**Relazioni:**

- **GARA(CodG, Luogo, Data, Disciplina)**  
- **ATLETA(CodA, Nome, Nazione, DataNascita)**  
- **PARTECIPAZIONE(CodG, CodA, PosizioneArrivo, Tempo)**  

(a) Trovare il nome e la data di nascita degli atleti italiani che non hanno partecipato a nessuna gara di discesa libera.  
(b) Trovare le nazioni per cui concorrono almeno 5 atleti nati prima del 1980, ciascuno dei quali abbia partecipato ad almeno 10 gare di sci di fondo.  

---

### Esercizio 12  

**Relazioni:**

- **EDITORE(CodE, NomeEditore, Indirizzo, Città)**  
- **PUBBLICAZIONE(CodP, Titolo, NomeAutore, CodE)**  
- **LIBRERIA(CodL, NomeLibreria, Indirizzo, Città)**  
- **VENDITA(CodP, CodL, Data, CopieVendute)**  

(a) Trovare il nome delle librerie in cui non è stata venduta nessuna pubblicazione di editori con sede a Torino.  
(b) Trovare il nome degli editori per cui almeno 10 pubblicazioni sono state vendute nel 2002 nelle librerie di Roma in più di 2.000 copie.  

---

### Esercizio 13  

**Relazioni:**

- **QUIZ(CodQuiz, Argomento, Punteggio)**  
- **STUDENTE(Matricola, Nome, Indirizzo, Città)**  
- **RISULTATO-TEST(Matricola, CodQuiz, RispostaCorretta)**  

(a) Trovare il nome degli studenti che non hanno risposto correttamente a nessun quiz di matematica.  
(b) Trovare il nome degli studenti di Torino che hanno conseguito il punteggio massimo possibile nei quiz di matematica.  

---

### Esercizio 14  

**Relazioni:**

- **ALLOGGIO(CodA, Indirizzo, Città, Superficie, CostoAffittoMensile)**  
- **CONTRATTO-AFFITTO(CodC, DataInizio, DataFine, NomePersona, CodA)**  

(a) Trovare il codice, l’indirizzo e la città degli alloggi che hanno una superficie superiore alla superficie media degli alloggi delle città in cui si trovano.  

---

### Esercizio 15  

**Relazioni:**

- **AEREI(Matr, Modello, NumPosti)**  
- **ORARIO(Sigla, ParteDa, Destinaz, OraPart, OraArr)**  
- **VOLI(Sigla, Matr, Data, PostiPren)**  

(a) Trovare le tratte (città di partenza, città di arrivo) che non sono state mai effettuate con un aereo modello Boing-747.  

---

## Soluzioni  

### Esercizio 10  

**(a)**  
```sql
SELECT NomePersona  
FROM CONTRATTO_AFFITTO  
GROUP BY CodA, NomePersona  
HAVING COUNT(*) > 2;
```

**(b)**  
```sql
SELECT CodA, Indirizzo  
FROM APPARTAMENTO A  
WHERE Città = 'Torino'  
  AND CodA IN (SELECT CodA  
               FROM CONTRATTO_AFFITTO  
               GROUP BY CodA  
               HAVING MIN(RettaMensile) > 500 AND COUNT(*) <= 5);
```

**(c)**  
```sql
SELECT CodA, Indirizzo  
FROM APPARTAMENTO  
WHERE Città = 'Torino'  
  AND CodA IN (SELECT CodA  
               FROM CONTRATTO_AFFITTO  
               GROUP BY CodA  
               HAVING COUNT(*) <= 5);
```

---

### Esercizio 11  

**(a)**  
```sql
SELECT Nome, DataNascita  
FROM ATLETA  
WHERE Nazione = 'Italia'  
  AND CodA NOT IN (SELECT CodA  
                   FROM PARTECIPAZIONE P  
                   JOIN GARA G ON P.CodG = G.CodG  
                   WHERE Disciplina = 'Discesa Libera');
```

**(b)**  
```sql
SELECT Nazione  
FROM ATLETA A  
WHERE DataNascita < '1980-01-01'  
  AND (SELECT COUNT(*) FROM PARTECIPAZIONE WHERE CodA = A.CodA AND Disciplina = 'Sci di Fondo') >= 10  
GROUP BY Nazione  
HAVING COUNT(*) >= 5;
```

---

### Esercizio 12  

**(a)**  
```sql
SELECT NomeLibreria  
FROM LIBRERIA  
WHERE CodL NOT IN (SELECT CodL  
                   FROM VENDITA V  
                   JOIN PUBBLICAZIONE P ON V.CodP = P.CodP  
                   JOIN EDITORE E ON P.CodE = E.CodE  
                   WHERE E.Città = 'Torino');
```

**(b)**  
```sql
SELECT NomeEditore  
FROM EDITORE E  
JOIN PUBBLICAZIONE P ON E.CodE = P.CodE  
JOIN VENDITA V ON P.CodP = V.CodP  
JOIN LIBRERIA L ON V.CodL = L.CodL  
WHERE L.Città = 'Roma'  
  AND YEAR(V.Data) = 2002  
GROUP BY E.CodE, NomeEditore  
HAVING SUM(CopieVendute) > 2000 AND COUNT(P.CodP) >= 10;
```

---

### Esercizio 13  

**(a)**  
```sql
SELECT Nome  
FROM STUDENTE S  
WHERE NOT EXISTS (SELECT 1  
                  FROM RISULTATO_TEST R  
                  JOIN QUIZ Q ON R.CodQuiz = Q.CodQuiz  
                  WHERE S.Matricola = R.Matricola AND Q.Argomento = 'Matematica' AND R.RispostaCorretta = TRUE);
```

**(b)**  
```sql
SELECT Nome  
FROM STUDENTE S  
WHERE Città = 'Torino'  
  AND NOT EXISTS (SELECT 1  
                  FROM QUIZ Q  
                  WHERE Q.Argomento = 'Matematica'  
                    AND Q.Punteggio > (SELECT SUM(RispostaCorretta)  
                                       FROM RISULTATO_TEST R  
                                       WHERE R.Matricola = S.Matricola AND R.CodQuiz = Q.CodQuiz));
```

---

### Esercizio 14  

**(a)**  
```sql
SELECT CodA, Indirizzo, Città  
FROM ALLOGGIO A  
WHERE Superficie > (SELECT AVG(Superficie)  
                    FROM ALLOGGIO  
                    WHERE Città = A.Città);
```

---

### Esercizio 15  

**(a)**  
```sql
SELECT DISTINCT ParteDa, Destinaz  
FROM ORARIO  
WHERE Sigla NOT IN (SELECT O.Sigla  
                    FROM VOLI V  
                    JOIN AEREI A ON V.Matr = A.Matr  
                    WHERE A.Modello = 'Boing-747');
```
