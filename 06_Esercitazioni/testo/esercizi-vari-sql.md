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

### Esercizio 10  

**Relazioni:**

- **APPARTAMENTO(CodA, Superficie, Indirizzo, Città)**
- **CONTRATTO-AFFITTO(CodA, DataInizio, DataFine, NomePersona, RettaMensile)**  

(a) Trovare il nome delle persone che hanno stipulato più di due contratti di affitto per lo stesso appartamento (in tempi diversi).  
(b) Trovare il codice e l’indirizzo degli appartamenti di Torino in cui la retta mensile è sempre stata superiore a 500 euro e per cui sono stati stipulati al più 5 contratti.  
(c) Trovare il codice e l’indirizzo degli appartamenti di Torino per cui sono stati stipulati al più 5 contratti (un numero variabile tra 0 e 5).  

---

Questa è una bellissima collezione di esercizi tipici da esame universitario di **Basi di Dati**. Sono perfetti per allenarsi sulla logica degli operatori dell'algebra relazionale e sulle clausole `GROUP BY`, `HAVING` e le subquery.

Ecco le risoluzioni commentate. Ti consiglio di provare a scriverle prima su carta e poi confrontarle con queste soluzioni.

---

### Esercizio 1: Aule libere dal primo anno

L'approccio migliore qui è la **sottrazione** (tutte le aule meno quelle occupate dal primo anno).

```sql
SELECT DISTINCT Aula
FROM ORARIO-LEZIONI
WHERE Aula NOT IN (
    SELECT Aula
    FROM ORARIO-LEZIONI OL JOIN CORSO C ON OL.CodCorso = C.CodCorso
    WHERE C.Anno = 1
);

```

### Esercizio 2: Corsi intensivi del terzo anno

Qui servono funzioni aggregate e filtri sulle aggregazioni (`HAVING`).

```sql
SELECT C.CodCorso, C.NomeC, SUM(OL.OraFine - OL.OraInizio) AS TotOre
FROM CORSO C JOIN ORARIO-LEZIONI OL ON C.CodCorso = OL.CodCorso
WHERE C.Anno = 3
GROUP BY C.CodCorso, C.NomeC
HAVING SUM(OL.OraFine - OL.OraInizio) > 10 
   AND COUNT(DISTINCT OL.GiornoSettimana) > 3;

```

### Esercizio 3: Statistiche affitti per città

Un classico esercizio di reportistica con funzioni aggregate.

```sql
SELECT Città, 
       MAX(CostoAffittoMensile) AS MaxCosto, 
       AVG(CostoAffittoMensile) AS MediaCosto,
       MAX(DataFine - DataInizio) AS DurataMax,
       AVG(DataFine - DataInizio) AS DurataMedia,
       COUNT(*) AS TotContratti
FROM ALLOGGIO A JOIN CONTRATTO-AFFITTO C ON A.CodA = C.CodA
GROUP BY Città
HAVING COUNT(*) >= 100;

```

### Esercizio 4: Persone e limiti di superficie

Si risolve con un `NOT EXISTS` o `NOT IN`.

```sql
SELECT DISTINCT NomePersona
FROM CONTRATTO-AFFITTO
WHERE NomePersona NOT IN (
    SELECT C.NomePersona
    FROM CONTRATTO-AFFITTO C JOIN ALLOGGIO A ON C.CodA = A.CodA
    WHERE A.Superficie > 80
);

```

### Esercizio 5: Voli Milano-Napoli sotto la media

Richiede una subquery per calcolare la media globale della tratta specifica.

```sql
SELECT V.Sigla, O.OraPart
FROM VOLI V 
JOIN ORARIO O ON V.Sigla = O.Sigla
JOIN AEREI A ON V.Matr = A.Matr
WHERE O.ParteDa = 'Milano' AND O.Destinaz = 'Napoli'
  AND V.Data = '1993-10-01'
  AND V.PostiPren < A.NumPosti
  AND (O.OraArr - O.OraPart) < (
      SELECT AVG(OraArr - OraPart)
      FROM ORARIO
      WHERE ParteDa = 'Milano' AND Destinaz = 'Napoli'
  );

```

### Esercizio 6: Orchestre (Torino AND Milano NOT Bologna)

Questo esercizio testa l'operatore di **intersezione** e **differenza**.

```sql
SELECT CodO, NomeO
FROM ORCHESTRA
WHERE numElementi > 30
  AND CodO IN (SELECT CodO FROM CONCERTI C JOIN SALE S ON C.CodS = S.CodS WHERE S.Città = 'Torino')
  AND CodO IN (SELECT CodO FROM CONCERTI C JOIN SALE S ON C.CodS = S.CodS WHERE S.Città = 'Milano')
  AND CodO NOT IN (SELECT CodO FROM CONCERTI C JOIN SALE S ON C.CodS = S.CodS WHERE S.Città = 'Bologna');

```

### Esercizio 7: Clienti "fedeli" e solitari

Qui dobbiamo contare sia i cointestatari che il numero di conti per cliente.

```sql
SELECT DISTINCT Agenzia
FROM CONTO
WHERE Cod-Conto IN (
    -- Conti con un solo intestatario
    SELECT Cod-Conto
    FROM CONTO-CLIENTE
    GROUP BY Cod-Conto
    HAVING COUNT(Cod-Cli) = 1
) AND Cod-Conto IN (
    -- Il cui intestatario ha solo quel conto
    SELECT Cod-Conto
    FROM CONTO-CLIENTE
    WHERE Cod-Cli IN (
        SELECT Cod-Cli
        FROM CONTO-CLIENTE
        GROUP BY Cod-Cli
        HAVING COUNT(Cod-Conto) = 1
    )
);

```

### Esercizio 9: Figli unici < 10 anni

Logica: Trovare i figli che compaiono una sola volta nella tabella Genitore.

```sql
SELECT Nome
FROM PERSONA
WHERE Età < 10 
  AND Nome IN (
    SELECT Nome-Figlio
    FROM GENITORE
    GROUP BY Nome-Figlio
    HAVING COUNT(Nome-Gen) = 1 -- Assumendo che "unico" significhi no fratelli (stesso genitore)
);

```

### Esercizio 10 (b): Limiti contratti Torino

Esercizio interessante perché richiede di filtrare sia sul valore (`> 500`) che sul conteggio.

```sql
SELECT A.CodA, A.Indirizzo
FROM APPARTAMENTO A JOIN CONTRATTO-AFFITTO C ON A.CodA = C.CodA
WHERE A.Città = 'Torino'
GROUP BY A.CodA, A.Indirizzo
HAVING MIN(C.RettaMensile) > 500 
   AND COUNT(*) <= 5;

```

---

### Suggerimento per lo studio

Per l'**Esercizio 15**, ricorda che la "tratta" è una coppia di valori `(ParteDa, Destinaz)`. Quando scrivi la query, dovrai selezionare la coppia e usare la negazione sulla tabella `VOLI` collegata agli `AEREI`.

Prova a risolvere i seguenti esercizi partendo da questi esempi?

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

