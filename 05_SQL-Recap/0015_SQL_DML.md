# **SQL come linguaggio di manipolazione dei dati**

## **Evoluzione dello standard SQL**

SQL ha subito diverse revisioni e miglioramenti nel tempo, con l'introduzione di nuove funzionalità e una maggiore aderenza agli standard. Le principali versioni sono:

- **SQL-89 (o SQL-1)**: introduce il concetto di **foreign key** (chiavi esterne).
- **SQL-92 (o SQL-2)**: definisce livelli crescenti di aderenza allo standard (**entry, intermediate, full**) e viene implementato nei sistemi RDBMS.
- **SQL-99 (o SQL-3)**: introduce nuovi tipi di dati (**BLOB, CLOB, dati spaziali e temporali**) e supporta concetti di programmazione orientata agli oggetti (ORDBMS e OODBMS). Consente la definizione di array di tipi elementari.
- **SQL-2003**: espande SQL-99 con il supporto per la gestione di dati **XML** tramite il tipo di dato `XMLType`.

---

## **SQL come DML**

SQL è anche un **Data Manipulation Language (DML)**, utilizzato per:

- **Interrogare i dati** (`SELECT`)
- **Inserire dati** (`INSERT`)
- **Aggiornare dati** (`UPDATE`)
- **Eliminare dati** (`DELETE`)

---

## **Query Semplici - Sintassi Base**

L'interrogazione SQL è **dichiarativa**: si specifica il risultato desiderato, non il metodo di esecuzione.

```sql
SELECT AttrExpr [[AS] Alias], ...
FROM TableName [[AS] Alias], ...
[WHERE condition]
```

Le principali componenti sono:

- **Target list** → Colonne da selezionare (`SELECT`)
- **From clause** → Tabelle coinvolte (`FROM`)
- **Where clause** → Condizioni sui dati (`WHERE`)

### **Esempi di interrogazioni**

Tabella di riferimento:  
**IMPIEGATO** *(nome, cognome, dipartimento, stipendio_mensile, extra_mensile)*  

1️⃣ **Selezionare nome e cognome di tutti i dipendenti**

```sql
SELECT nome AS nome_di_battesimo, cognome AS cognome_di_battesimo
FROM Impiegato;
```

2️⃣ **Estrarre tutte le informazioni dei dipendenti**

```sql
SELECT * FROM Impiegato;
```

---

## **Target List - Operatori Aritmetici**

Gli operatori aritmetici `+`, `-`, `*`, `/` possono essere applicati a:

- Campi numerici di una tabella
- Valori costanti
- Funzioni aggregate

3️⃣ **Calcolare lo stipendio annuale di tutti i dipendenti**

```sql
SELECT nome, cognome, stipendio_mensile * 12 AS stipendio_annuale
FROM Impiegato;
```

4️⃣ **Calcolare il reddito mensile totale (stipendio + extra)**

```sql
SELECT nome, cognome, stipendio_mensile + COALESCE(extra_mensile, 0) AS stipendio_totale
FROM Impiegato;
```

🔹 **Nota**: `COALESCE(extra_mensile, 0)` evita problemi con valori `NULL`.

---

## **ALL e DISTINCT**

Per controllare i duplicati:

- `ALL` (default) → seleziona tutti i record, inclusi i duplicati.
- `DISTINCT` → elimina i duplicati.

5️⃣ **Elencare i cognomi univoci dei dipendenti**

```sql
SELECT DISTINCT cognome FROM Impiegato;
```

Se volessimo eliminare duplicati considerando più campi (es. cognome e stipendio):

```sql
SELECT DISTINCT cognome, stipendio_mensile FROM Impiegato;
```

---

## **Clausola WHERE - Operatori di Confronto**

- `=`, `<>`, `>`, `>=`, `<`, `<=` per confrontare numeri e stringhe.
- `IS NULL` / `IS NOT NULL` per verificare valori `NULL`.
- `AND`, `OR` per combinare condizioni.
- `LIKE` per confronti con pattern (`%` per più caratteri, `_` per uno solo).

6️⃣ **Selezionare i dipendenti con cognome "De Paperis"**

```sql
SELECT * FROM Impiegato WHERE cognome = 'De Paperis';
```

7️⃣ **Selezionare chi guadagna più di 30.000 euro l'anno**

```sql
SELECT nome, cognome
FROM Impiegato
WHERE stipendio_mensile * 12 > 30000;
```

8️⃣ **Selezionare dipendenti con `extra_mensile` sconosciuto**

```sql
SELECT nome, cognome
FROM Impiegato
WHERE extra_mensile IS NULL;
```

---

## **LIKE e Operatori Logici**

9️⃣ **Dipendenti con cognome contenente almeno due "o" (la prima come terzo carattere)**

```sql
SELECT * FROM Impiegato
WHERE cognome LIKE '__o%o%';
```

🔹 **Nota**:  

- `__` → Qualsiasi due caratteri iniziali  
- `o` → Terzo carattere  
- `%o%` → Un’altra "o" in qualsiasi posizione successiva.

---

## **IN e BETWEEN**

10️⃣ **Dipendenti con nome tra un elenco specifico**

```sql
SELECT * FROM Impiegato
WHERE nome IN ('Marco', 'Maria', 'Marta', 'Francesco');
```

11️⃣ **Dipendenti del DEE con stipendio fuori dall'intervallo [1000, 3000]**

```sql
SELECT nome, cognome
FROM Impiegato
WHERE dipartimento = 'DEE' AND stipendio_mensile NOT BETWEEN 1000 AND 3000;
```

---

## **Subquery nella clausola WHERE**

12️⃣ **Dipendenti che lavorano nello stesso dipartimento di Mario Rossi**

```sql
SELECT * FROM Impiegato
WHERE dipartimento = (
    SELECT dipartimento FROM Impiegato
    WHERE nome = 'Mario' AND cognome = 'Rossi'
);
```

13️⃣ **Dipendenti che lavorano in dipartimenti situati a Firenze**

```sql
SELECT * FROM Impiegato
WHERE dipartimento IN (
    SELECT nome FROM Dipartimento
    WHERE città = 'Firenze'
);
```

---

## **JOIN - Combinazione di Tabelle**

**Inner Join (default)**

```sql
SELECT I.nome, I.cognome, I.dipartimento, A.data_nascita, A.tel
FROM Impiegato I
JOIN Anagrafe_Aziendale A ON I.nome = A.nome AND I.cognome = A.cognome;
```

**Left Outer Join (mantiene tutti i record della prima tabella)**

```sql
SELECT * 
FROM Impiegato 
LEFT JOIN Dipartimento ON Impiegato.dipartimento = Dipartimento.codice;
```

**Right Outer Join (mantiene tutti i record della seconda tabella)**

```sql
SELECT * 
FROM Impiegato 
RIGHT JOIN Dipartimento ON Impiegato.dipartimento = Dipartimento.codice;
```

**Full Outer Join (mantiene tutti i record di entrambe le tabelle)**

```sql
SELECT * 
FROM Impiegato 
FULL JOIN Dipartimento ON Impiegato.dipartimento = Dipartimento.codice;
```

---

## **Self Join e Alias**

14️⃣ **Dipendenti che hanno lo stesso nome del nonno paterno**

```sql
SELECT Figlio.*
FROM Persona AS Figlio
JOIN Persona AS Padre ON Figlio.CF_padre = Padre.CF
JOIN Persona AS Nonno ON Padre.CF_padre = Nonno.CF
WHERE Figlio.nome = Nonno.nome AND Figlio.sesso = 'M';
```

---
Ecco la revisione della seconda parte, con esempi di codice migliorati per maggiore chiarezza e leggibilità.  

---

## **Query con Raggruppamento (1/2)**  

### **Sintassi generale**  

```sql
SELECT AttrExpr [[AS] Alias] {, AttrExpr [[AS] Alias]}
FROM TableName [[AS] Alias] {, TableName [[AS] Alias]}
[WHERE condition]
[GROUP BY Attr {, Attr}]
[HAVING condition]
[ORDER BY AttrExpr [ASC|DESC] {, AttrExpr [ASC|DESC]}]
```

### **Ordine di esecuzione**  

1. Selezione delle righe in base alla clausola `WHERE`.  
2. Raggruppamento delle righe secondo la clausola `GROUP BY`.  
3. Calcolo delle funzioni aggregate per ciascun gruppo.  
4. Filtraggio dei gruppi in base alla clausola `HAVING`.  
5. Ordinamento dei gruppi con `ORDER BY`.  

### **Esempio**

#### **Numero di impiegati per dipartimento**  

```sql
SELECT dipartimento, COUNT(*) AS numero_impiegati
FROM Impiegato
GROUP BY dipartimento
ORDER BY numero_impiegati DESC;
```

---

## **Query con Raggruppamento (2/2)**  

1. `WHERE` filtra le righe prima del raggruppamento, `HAVING` opera sui dati aggregati.  
2. `HAVING` può contenere condizioni semplici o subquery con funzioni aggregate.  
   - **Evitare di usare `HAVING` senza `GROUP BY`**, a meno che non si voglia considerare l'intera tabella come un unico gruppo.  
3. Gli attributi nella `SELECT` (escluso quelli in funzioni aggregate) devono essere presenti in `GROUP BY`.  
4. `ORDER BY` può usare sia campi normali sia alias di funzioni aggregate.  

### **Esempio**

#### **Dipartimenti con più di 5 impiegati**  

```sql
SELECT dipartimento, COUNT(*) AS numero_impiegati
FROM Impiegato
GROUP BY dipartimento
HAVING COUNT(*) > 5
ORDER BY numero_impiegati DESC;
```

---

## **Funzioni Aggregate (1/2)**  

| Funzione | Descrizione |
|----------|------------|
| `COUNT(*)` | Conta il numero totale di righe. |
| `COUNT(DISTINCT colonna)` | Conta i valori distinti (escludendo NULL). |
| `AVG(colonna)` | Calcola la media (solo su valori numerici). |
| `SUM(colonna)` | Somma dei valori numerici. |
| `MAX(colonna)` / `MIN(colonna)` | Restituisce il valore massimo/minimo. |

### **Esempi**  

#### **Numero di dipendenti per dipartimento**  

```sql
SELECT dipartimento, COUNT(*) AS numero_impiegati
FROM Impiegato
GROUP BY dipartimento;
```

#### **Stipendio medio per dipartimento**  

```sql
SELECT dipartimento, AVG(stipendio_mensile) AS stipendio_medio
FROM Impiegato
GROUP BY dipartimento;
```

---

## **Funzioni Aggregate (2/2)**  

- Se non specificato, `ALL` è il comportamento di default (includendo i duplicati).  
- Le funzioni `SUM` e `AVG` si applicano solo a numeri, mentre `MAX` e `MIN` anche a stringhe e date.  
- `COUNT(*)` su una tabella vuota restituisce 0, mentre le altre funzioni aggregate restituiscono `NULL` se non ci sono valori.  
- **Non è possibile nidificare funzioni aggregate** (es. `SUM(AVG(colonna))` non è valido).  
- Si possono usare operatori aritmetici con funzioni aggregate.  

### **Esempio**

#### **Spesa totale per dipartimento (stipendio + bonus)**  

```sql
SELECT dipartimento, SUM(stipendio_mensile + extra_mensile) AS spesa_totale
FROM Impiegato
GROUP BY dipartimento
ORDER BY spesa_totale DESC;
```

---

## **Espressioni nelle Funzioni Aggregate**  

#### **Incasso totale per concerto**  

```sql
SELECT cod_concerto, SUM(N_posti_prenotati * prezzo_biglietto) AS incasso
FROM Programmazione
GROUP BY cod_concerto;
```

---

## **Funzioni Aggregate nella WHERE (Subquery)**  

#### **Impiegati del dipartimento DEE con lo stipendio massimo**  

```sql
SELECT *
FROM Impiegato
WHERE dipartimento = 'DEE'
AND stipendio_mensile = (
    SELECT MAX(stipendio_mensile)
    FROM Impiegato
    WHERE dipartimento = 'DEE'
);
```

---

## **Funzioni Aggregate nella HAVING (Esempi)**  

#### **Docenti che insegnano esattamente 2 corsi**  

```sql
SELECT docente, COUNT(*) AS numero_lezioni
FROM Corso
JOIN Lezione ON Corso.codice = Lezione.codCorso
JOIN Periodo ON Lezione.codPeriodo = Periodo.codice
WHERE aula IN ('A', 'B') AND giorno BETWEEN 'Lunedì' AND 'Martedì'
AND docente IN (
    SELECT docente
    FROM Corso
    GROUP BY docente
    HAVING COUNT(*) = 2
)
GROUP BY docente;
```

---

## **Clausola GROUP BY con più attributi**  

#### **Numero di trasmissioni per film su ciascuna rete**  

```sql
SELECT codice, rete, COUNT(*) AS numero_trasmissioni
FROM Programmazione
GROUP BY codice, rete;
```

---

## **Operatori Insiemistici**  

| Operatore | Descrizione |
|-----------|------------|
| `UNION` | Combina i risultati eliminando duplicati. |
| `UNION ALL` | Mantiene anche i duplicati. |
| `EXCEPT` (`MINUS`) | Ritorna i valori presenti solo nella prima query. |
| `INTERSECT` | Ritorna solo i valori comuni a entrambe le query. |

### **Esempio**

#### **Clienti che hanno sviluppato solo foto in bianco e nero nel 2003**  

```sql
SELECT nome, cognome
FROM Cliente
WHERE CF IN (
    (SELECT CF_cliente FROM Sviluppo WHERE data BETWEEN '01/01/2003' AND '31/12/2003')
    EXCEPT
    (SELECT CF_cliente FROM Sviluppo NATURAL JOIN Foto WHERE data BETWEEN '01/01/2003' AND '31/12/2003' AND colore = 'a colori')
);
```

---

## **Il predicato EXISTS**  

- `EXISTS` verifica se una subquery restituisce almeno una riga.  
- Se la subquery è vuota, il predicato è `FALSE`.  

### **Esempio**

#### **Attori che hanno recitato in tutti i film di Clint Eastwood**  

```sql
SELECT DISTINCT attore
FROM HaRecitatoIn H
WHERE NOT EXISTS (
    SELECT *
    FROM Film
    WHERE regista = 'Clint Eastwood'
    AND titolo NOT IN (
        SELECT film
        FROM HaRecitatoIn
        WHERE attore = H.attore
    )
);
```

---

## **INSERT, DELETE, UPDATE**  

### **INSERT**  

#### **Inserire un nuovo impiegato**  

```sql
INSERT INTO Impiegato (matricola, nome, cognome, età, salario)
VALUES ('511AB', 'Mario', 'Rossi', 21, 3000);
```

#### **Inserire impiegati tra 25 e 30 anni nel dipartimento "Vendite"**  

```sql
INSERT INTO Lavora (matricola, codice, percentuale_tempo)
SELECT matricola, (SELECT codice FROM Dipartimento WHERE nome='Vendite'), 20
FROM Impiegato
WHERE età BETWEEN 25 AND 30;
```

---

### **DELETE**  

#### **Eliminare tutti gli impiegati di Firenze**  

```sql
DELETE FROM Impiegato
WHERE dipartimento IN (
    SELECT nome FROM Dipartimento WHERE città = 'Firenze'
);
```

---

### **UPDATE**  

#### **Aumentare gli stipendi del 10% per chi guadagna più di 3000€**  

```sql
UPDATE Impiegato
SET stipendio = stipendio * 1.1, extra = NULL
WHERE dipartimento = 'DEE' AND stipendio > 3000;
```

Query con Raggruppamento (1/2)
Select AttrExpr [[as] Alias]{, AttrExpr [[as] Alias]}
From TableName [[as] Alias]{, TableName [[as] Alias]}
[Where condition]
[Group by Attr {, Attr}]
[Having condition]
[Order by AttrExpr [asc|desc] {, AttrExpr [asc|desc] }]
Ordine di esecuzione:

1. Vengono scelte le righe in base alla clausola where
2. queste righe vengono raggruppate in base alla clausola group by
3. per ciascun gruppo vengono calcolati i risultati delle funzioni aggregate
4. vengono scelti ed eliminati i gruppi in base alla clausola having
5. I gruppi vengono ordinati sulla base della clausola order by

---

Query con Raggruppamento (2/2)

1. La condizione del where viene valutata sulle righe della tabella mentre quella
dell’having viene valutata sui dati aggregati
2. La condizione dell’having è, in genere, costituita da condizioni semplici o complesse
(subquery) che coinvolgono funzioni aggregate

- non usare mai la clausola having senza la clausola group by perché sarebbe
una condizione esprimibile nel where
- having senza group by equivale a considerare l’intera tabella come un unico
gruppo

3. I campi della target list (con esclusione delle funzioni aggregate) devono essere
uguali o un sottoinsieme dei campi della clausola group by
4. Nella clausola order by oltre ai campi della tabella è possibile trovare alias che
rappresentano i risultati di funzioni aggregate
Cosa produce un group by su chiave primaria?
Considerando l’ordine di esecuzione di una query è possibile usare espressioni o funzioni aggregate
nella clausola group by?

---

Funzioni Aggregate (1/2)
Per il conteggio dei valori della lista di attributi:
count ( < *| [all|distinct] lista di attributi >)
count(*) - conta il numero di righe restituite per raggruppamento
Per il calcolo , rispettivamente, della media, del totale, del valore massimo
e minimo :
<avg | sum | max | min> ( [all|distinct] AttrEspr )

---

Funzioni Aggregate (2/2)

- La parola chiave di default è ALL ossia, se non si utilizza esplicitamente DISTINCT,
tutte le funzioni aggregate, per il calcolo del risultato, considerano anche i valori
duplicati mentre i valori NULL vengono, in ogni caso, scartati
- Le funzioni sum e avg si applicano solo a valori numerici mentre max e min a
valori numerici, stringhe di caratteri (si considera l’ordine alfabetico) e date
- Count calcolato su una tabella vuota restituisce 0 mentre tutte le altre funzioni
aggregate, calcolate su un insieme vuoto, restituiscono NULL
- NON è possibile concatenare le funzioni aggregate. Per es. per il calcolo della
somma delle medie la seguente espressione sum(avg(AttrEspr)) non è corretta!!!
- Nella target list e nella clausola order by è possibile utilizzare più funzioni
aggregate
- È possibile utilizzare gli operatori aritmetici con le funzioni aggregate e con gli
attributi a cui le funzioni si applicano

---

Funzioni Aggregate
nella Target List (1/2)
IMPIEGATO (CF,nome, cognome, dipartimento, stipendio_mensile, extra_mensile)
Select count(*)
From Impiegato Calcola il numero di tuple della tabella Impiegato
( la tabella Impiegato è vista come un unico raggruppamento )
Select count(*)
From Impiegato
Group by dipartimento Calcola per ciascun dipartimento il numero di impiegati.
Select count(stipendio)
From Impiegato
Group by dipartimento
Calcola per ciascun dipartimento il numero di tuple che
hanno un valore non nullo per l’attributo Stipendio
( vengono scartati solo i NULL ).
Select count(distinct stipendio)
From Impiegato
Group by dipartimento
Giuseppe Loseto
A.A. 2014/2015
Calcola per ciascun dipartimento il numero di diversi
valori dell’attributo Stipendio
(vengono scartati i NULL ed i valori duplicati).
SQL come linguaggio di manipolazione dei dati

---

Funzioni Aggregate
nella Target List (2/2)
Le funzioni aggregate sono calcolate su insiemi di valori:
Select avg(stipendio_mensile), sum(stipendio_mensile + extra_mensile)
From Impiegato
Where dipartimento=‘DEE’
Restituisce rispettivamente lo stipendio
medio e la spesa
mensile totale relativi solo al DEE
Espressioni equivalenti
mentre i risultati possono
discostarsi leggermente
a causa degli arrotondamenti
Select dipartimento, sum(stipendio_mensile) + sum(extra_mensile) as tot
From Impiegato
Group by dipartimento
Order by tot
Restituisce, per ciascun dipartimento, il nome del dipartimento e la
relativa spesa mensile totale. I risultati sono ordinati per valori della
spesa totale crescenti.

---

Espressioni nelle Funzioni Aggregate
CONCERTO (codice, titolo, esecutore, durata)
SALA (codice, nome, indirizzo, citta, telefono)
PROGRAMMAZIONE (data_programmazione, cod_concerto, ora_inizio, N_posti_prenotati,
cod_sala, prezzo_biglietto)
Interrogazione 23: Calcolare l’incasso totalizzato da ciascun concerto.
Select cod_concerto, sum (N_posti_prenotati * prezzo_biglietto) AS incasso
From Programmazione
Group by cod_concerto

---

Funzioni aggregate nella
clausola WHERE
Operatore di confronto a valore singolo
IMPIEGATO (nome, cognome, dipartimento, stipendio)
Interrogazione 24 : Risoluzione equivalente all‘ Interrogazione 17 :
Selezionare i dati dei dipendenti del DEE che percepiscono lo stipendio maggiore
Select *
From Impiegato
Where dipartimento=‘DEE’ AND
stipendio_mensile = ( Select max(stipendio_mensile)
From Impiegato
Where dipartimento=‘DEE’ )

---

Funzioni aggregate
nella clausola HAVING (1/5)
<Condizione della clausola having semplice>::= <funzione aggregata> OP valore
CORSO (codice, nome, docente)
LEZIONE (codCorso, codPeriodo, aula)
PERIODO (codice, giorno, ora_inizio)
Interrogazione 25:
Determinare per ciascun docente, che insegna esattamente due corsi, il numero di lezioni
che tiene tra Lunedì e Martedì in aula B o in aula A.
Select Docente, count(*)
From Corso, Lezione, Periodo
Where Corso.codice=codCorso
AND Periodo.codice=codPeriodo
AND ( aula=‘A’ OR aula=‘B’)
AND giorno BETWEEN ‘Lunedì’ AND ‘Martedì’
AND docente IN (Select docente
From Corso
Group by docente
Having count(*)=2)
Group by docente

---

Funzioni aggregate
nella clausola HAVING (2/5)
<Condizione clausola having complessa>::= <funzione aggregata> OP <subquery a valore singolo>
PERSONA (CF, nome, cognome, età, sesso, CF_padre)
MATRIMONIO (CF_sposo, CF_sposa, data, num_invitati)
Interrogazione 26:
Selezionare i genitori che hanno tutti i figli sposati dopo il 1990
Select CF_padre
From Persona P
Where CF IN ( Select CF_sposo
From Matrimonio
Where data > ’31/01/1990’ )
OR CF IN ( Select CF_sposa
From Matrimonio
Where data > ’31/01/1990’ )
Group by CF_padre
Having count(*) = ( Select count(*)
From Persona
Where CF_padre = P.CF_padre )

---

Funzioni aggregate
nella clausola HAVING (3/5)
AUTO(targa, modello, marca, alimentazione)
ACCESSO(targa, id_garage, data_accesso, costo)
GARAGE(ID, nome, città, indirizzo, capienza, costo orario)
Interrogazione 27:
Selezionare i garage che hanno ospitato più macchine con alimentazione diesel che benzina
Select *
From Garage
Where ID IN ( Select ID
From Accesso AS A, Auto
Where A.targa = Auto.targa
AND alimentazione = 'diesel‘
Group by ID
Having count(*) > ( Select count(*)
From Accesso B, Auto
Where B.targa = auto.targa
AND alimentazione = 'benzina'
AND B.ID = A.ID ))

---

Funzioni aggregate
nella clausola HAVING (4/5)
Impiegato(CF,Nome, cognome,ID_DIP_lav)
Dipartimento(ID_DIP, nome, indirizzo)
Lavora_su(CF_imp,ID_Prog_lav,ore)
Progetto(ID_Prog,nome_prog,ID_DIP_gestore)
Interrogazione 28:
Si determinino nome e cognome di ciascun impiegato che lavora su tutti i progetti di cui è
responsabile il dipartimento “produzione”.
Ipotesi
Consideriamo gli impiegati che lavorano su tutti i progetti del dipartimento “produzione” e su nessun progetto
di altro dipartimento
Risoluzione

1. Trovare tutti i progetti di cui è responsabile il dipartimento ‘produzione’
2. Trovare gli impiegati che lavorano su un progetto che non è presente nell’insieme dei
progetti del passo 1
3. Trovare gli impiegati che lavorano su un numero di progetti pari all’insieme dei progetti al
passo 1
4. Estrarre gli impiegati che, contemporaneamente, non fanno parte degli impiegati del passo
2 ma che fanno parte degli impiegati del passo 3

---

Funzioni aggregate
nella clausola HAVING (5/5)
Select nome, cognome
From Impiegato
Where CF NOT IN ( Select CF_imp
From lavora_su
Where ID_Prog_lav IN ( Select ID_prog
From Progetto
Where ID_dip_gestore <> ( Select ID_Dip
From Dipartimento
Where nome=‘produzione’ )))
AND CF IN ( Select CF_imp
From lavora_su
Group by CF_imp
Having count(*) = ( Select count(*)
From Progetto
Where ID_dip_gestore = ( Select ID_Dip
From Dipartimento
Where nome=‘produzione’ )))

---

Clausola GROUP BY
con più attributi
FILM (Codice, titolo, durata, regista)
PROGRAMMAZIONE (Data, Codice, ora_inizio, rete)
Interrogazione 29:
Per ciascun film, determinare il numero di volte che è stato trasmesso su ciascuna
rete
Select codice, rete, count(*)
From Programmazione
Group By codice, rete

---

Operatori Insiemistici (1/2)
<querySQL o subquerySQL> ::=
<selectSQL> <UNION | EXCEPT (o MINUS) | INTERSECT [all]> <selectSQL>
o Union: restituisce i valori di due insiemi in un unico insieme
o Except: restituisce solo i valori del primo insieme che non sono contenuti nel secondo
o Intersect: restituisce solo i valori contenuti sia nel primo che nel secondo insieme

- Gli operatori insiemistici per default eliminano i duplicati, usando la parola chiave ALL i
duplicati si conservano
- I nomi dei campi delle due selectSQL non devono coincidere necessariamente (l’insieme
restituito ha i nomi dei campi della prima selectSQL) ma devono essere dello stesso numero e
stesso tipo
- Importanza dell’uso delle parentesi per definire l’ordine di esecuzione della subquery con
operatori insiemistici rispetto alla query esterna

---

Operatori Insiemistici (2/2)
CLIENTE (CF, nome, cognome, età, sesso)
SVILUPPO (ID_rullino, CF_cliente, data, num_foto)
FOTO (ID_foto, formato, colore, ID_rullino, tipo_carta)
Interrogazione 30 – Appello del 9 Novembre 2004 :
Il cognome ed il nome di chi ha sviluppato solo foto in bianco e nero nel 2003.
Select nome, cliente
From Cliente
Where CF IN ( ( Select CF_cliente
From Sviluppo
Where data >= ’01/01/2003’ AND data<=’31/12/2003’ )
EXCEPT
( Select CF_cliente
From Sviluppo Natural Join foto
Where data >= ’01/01/2003’ AND data<=’31/12/2003’
AND colore=‘a colori’ ) )

---

Il predicato EXISTS
<condizione del where> :: = [NOT] EXISTS <subquery a valori multipli>
{ [AND|OR] < condizione semplice o complessa>}

- La subquery dopo l’exists restituisce sempre l’intera tabella della clausola from poiché il
predicato si basa sulle righe e NON sulle colonne.
- Se la subquery restituisce almeno una riga il predicato è true
- Se la subquery è vuota il predicato è false
FILM (titolo, regista, anno, genere)
HARECITATOIN (attore, film)
Interrogazione 31: Selezionare gli attori che hanno recitato in tutti i film diretti da Clint Eastwood
Select distinct attore
From HaRecitatoIn H
Where NOT EXISTS ( Select *
From Film
Where regista=‘Clint Eastwood’
AND titolo NOT IN (Select film
From HaRecitatoIn
Where attore=H.attore))

---

Operatori Equivalenti

- La sintassi delle interrogazioni SQL è ben definita ma non esiste un metodo
standard per risolvere una interrogazione
- Una stessa interrogazione può essere risolta in modi differenti
- Generalmente le interrogazioni risolte con l’operatore di sinistra possono
risolversi con il corrispondente di destra:
IN =ANY
NOT IN <>ALL
BETWEEN val_inf AND val_sup >=val_inf AND >=val_sup
EXCEPT NOT IN
EXISTS (per le righe) IN (per le colonne)

---

Insert
Insert into NomeTabella [ ListaAttributi ] values (Lista di valori) | selectSQL
IMPIEGATO (matricola, nome, cognome, età, salario)
LAVORA (matricola, codice, percentuale_tempo)
DIPARTIMENTO (codice, nome, budget, matr_direttore, matr_vice_direttore)
Inserimento con lista di valori:
Insert into Impiegato values (‘511AB’, ‘Mario’, ‘Rossi’, 21, 3000)
Se fossero definiti dei valori di default per alcuni campi ?
Inserimento con selectSQL:
Interrogazione 32:
Inserire tutti gli impiegati tra 25 e 30 anni nel dipartimento ‘vendite’ al 20% del loro tempo
Insert into Lavora (matricola, codice, percentuale_tempo)
Select matricola, (Select codice From Dipartimento Where nome=‘Vendite’), 20
From Impiegato
Where età BETWEEN 25 AND 30

---

Delete
Delete From NomeTabella [Where condizione]
IMPIEGATO (nome, cognome, dipartimento, ufficio, stipendio, extra)
DIPARTIMENTO (nome, indirizzo, città, tel)
Delete senza clausola where:
Delete From Impiegato
(svuota completamente la tabella)
Delete con clausola where semplice:
Delete From Impiegato Where dipartimento=‘DEE’
Delete con clausola where complessa:
Delete From Impiegato
Where dipartimento IN (Select nome
From Dipartimento
Where città=‘Firenze’)

---

Update
Update NomeTabella set attributo = < espressione | selectSQL | null | default >
{ , attributo = < espressione | selectSQL | null | default >}
[ Where condizione ]
Aggiornamento della chiave primaria:
Update Dipartimento set nome=‘D.E.E’ Where nome=‘DEE’
Aggiornamento mediante il risultato di un’espressione:
Update Dipartimento set stipendio=stipendio*1.1, extra=null
Where dipartimento=‘DEE’ AND stipendio>3000
Aggiornamento mediante il risultato di una subquery a valore singolo:
Update Dipartimento set stipendio= ( Select stipendio
From Impiegato
Where nome=‘Ugo’ AND cognome=‘Rossi’)
Where dipartimento=‘DEE’

---

## Esempio database e query

Ecco una serie di tabelle con dati di esempio per testare le query descritte.  

### **1. Creazione delle tabelle**  

```sql
CREATE TABLE Impiegato (
    CF VARCHAR(16) PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    dipartimento VARCHAR(50),
    stipendio_mensile DECIMAL(10,2),
    extra_mensile DECIMAL(10,2)
);

CREATE TABLE Dipartimento (
    ID_DIP INT PRIMARY KEY,
    nome VARCHAR(50),
    indirizzo VARCHAR(100)
);

CREATE TABLE Lavora_su (
    CF_imp VARCHAR(16),
    ID_Prog_lav INT,
    ore INT,
    PRIMARY KEY (CF_imp, ID_Prog_lav)
);

CREATE TABLE Progetto (
    ID_Prog INT PRIMARY KEY,
    nome_prog VARCHAR(50),
    ID_DIP_gestore INT
);

CREATE TABLE Corso (
    codice INT PRIMARY KEY,
    nome VARCHAR(50),
    docente VARCHAR(50)
);

CREATE TABLE Lezione (
    codCorso INT,
    codPeriodo INT,
    aula CHAR(1),
    PRIMARY KEY (codCorso, codPeriodo)
);

CREATE TABLE Periodo (
    codice INT PRIMARY KEY,
    giorno VARCHAR(20),
    ora_inizio TIME
);

CREATE TABLE Auto (
    targa VARCHAR(10) PRIMARY KEY,
    modello VARCHAR(50),
    marca VARCHAR(50),
    alimentazione VARCHAR(10)
);

CREATE TABLE Accesso (
    targa VARCHAR(10),
    id_garage INT,
    data_accesso DATE,
    costo DECIMAL(10,2),
    PRIMARY KEY (targa, id_garage, data_accesso)
);

CREATE TABLE Garage (
    ID INT PRIMARY KEY,
    nome VARCHAR(50),
    città VARCHAR(50),
    indirizzo VARCHAR(100),
    capienza INT,
    costo_orario DECIMAL(10,2)
);
```

---

### **2. Inserimento dei dati**

```sql
-- Impiegati
INSERT INTO Impiegato VALUES 
('CF001', 'Mario', 'Rossi', 'IT', 2500, 200),
('CF002', 'Luca', 'Bianchi', 'HR', 2200, 150),
('CF003', 'Giulia', 'Verdi', 'IT', 2700, 300),
('CF004', 'Anna', 'Neri', 'Finance', 2800, NULL);

-- Dipartimenti
INSERT INTO Dipartimento VALUES 
(1, 'IT', 'Via Roma 10'),
(2, 'HR', 'Via Milano 20'),
(3, 'Finance', 'Via Napoli 30');

-- Lavora_su
INSERT INTO Lavora_su VALUES 
('CF001', 101, 10),
('CF002', 102, 15),
('CF003', 103, 20),
('CF004', 101, 5);

-- Progetti
INSERT INTO Progetto VALUES 
(101, 'CRM Upgrade', 1),
(102, 'HR System', 2),
(103, 'Budget Analysis', 3);

-- Corsi
INSERT INTO Corso VALUES 
(1, 'Database', 'Prof. Rossi'),
(2, 'Networking', 'Prof. Verdi');

-- Lezioni
INSERT INTO Lezione VALUES 
(1, 101, 'A'),
(2, 102, 'B');

-- Periodi
INSERT INTO Periodo VALUES 
(101, 'Lunedì', '09:00:00'),
(102, 'Martedì', '11:00:00');

-- Auto
INSERT INTO Auto VALUES 
('AB123CD', 'Fiat 500', 'Fiat', 'benzina'),
('EF456GH', 'BMW X5', 'BMW', 'diesel');

-- Accesso
INSERT INTO Accesso VALUES 
('AB123CD', 1, '2024-02-01', 5.50),
('EF456GH', 1, '2024-02-02', 6.00);

-- Garage
INSERT INTO Garage VALUES 
(1, 'Garage Centrale', 'Roma', 'Via Veneto 15', 50, 2.50);
```

---

### **3. Query di test**

#### **Conteggio degli impiegati**

```sql
SELECT COUNT(*) FROM Impiegato;
```

#### **Numero di impiegati per dipartimento**

```sql
SELECT dipartimento, COUNT(*) 
FROM Impiegato 
GROUP BY dipartimento;
```

#### **Numero di impiegati con stipendio non nullo per dipartimento**

```sql
SELECT dipartimento, COUNT(stipendio_mensile) 
FROM Impiegato 
GROUP BY dipartimento;
```

#### **Numero di stipendi distinti per dipartimento**

```sql
SELECT dipartimento, COUNT(DISTINCT stipendio_mensile) 
FROM Impiegato 
GROUP BY dipartimento;
```

#### **Stipendio medio e somma stipendi per il dipartimento IT**

```sql
SELECT AVG(stipendio_mensile), SUM(stipendio_mensile + COALESCE(extra_mensile, 0)) 
FROM Impiegato 
WHERE dipartimento='IT';
```

#### **Incasso totale per ciascun garage**

```sql
SELECT id_garage, SUM(costo) AS incasso
FROM Accesso
GROUP BY id_garage;
```

#### **Auto diesel vs benzina nei garage**

```sql
SELECT ID
FROM Accesso AS A, Auto
WHERE A.targa = Auto.targa
AND alimentazione = 'diesel'
GROUP BY ID
HAVING COUNT(*) > (
    SELECT COUNT(*)
    FROM Accesso B, Auto
    WHERE B.targa = Auto.targa
    AND alimentazione = 'benzina'
    AND B.ID = A.ID
);
```

#### **Impiegati che lavorano su tutti i progetti del dipartimento "IT"**

```sql
SELECT nome, cognome
FROM Impiegato
WHERE CF NOT IN (
    SELECT CF_imp
    FROM Lavora_su
    WHERE ID_Prog_lav IN (
        SELECT ID_Prog
        FROM Progetto
        WHERE ID_DIP_gestore <> (SELECT ID_DIP FROM Dipartimento WHERE nome='IT')
    )
)
AND CF IN (
    SELECT CF_imp
    FROM Lavora_su
    GROUP BY CF_imp
    HAVING COUNT(*) = (
        SELECT COUNT(*)
        FROM Progetto
        WHERE ID_DIP_gestore = (SELECT ID_DIP FROM Dipartimento WHERE nome='IT')
    )
);
```

#### **Numero di trasmissioni per film e rete**

```sql
SELECT codice, rete, COUNT(*)
FROM Programmazione
GROUP BY codice, rete;
```

---

### **4. Operatori Insiemistici**

#### **Clienti che hanno sviluppato solo foto in bianco e nero nel 2023**

```sql
SELECT nome, cognome
FROM Cliente
WHERE CF IN (
    (SELECT CF_cliente FROM Sviluppo WHERE data BETWEEN '2023-01-01' AND '2023-12-31')
    EXCEPT
    (SELECT CF_cliente FROM Sviluppo NATURAL JOIN Foto WHERE data BETWEEN '2023-01-01' AND '2023-12-31' AND colore='a colori')
);
```

---

### **5. EXISTS**

#### **Attori che hanno recitato in tutti i film di Clint Eastwood**

```sql
SELECT DISTINCT attore
FROM HaRecitatoIn H
WHERE NOT EXISTS (
    SELECT * 
    FROM Film 
    WHERE regista='Clint Eastwood' 
    AND titolo NOT IN (
        SELECT film FROM HaRecitatoIn WHERE attore=H.attore
    )
);
```

---
