
Non puoi usare gli alias delle colonne nella clausola WHERE di una query SQL perché l'elaborazione della query avviene in un ordine specifico:

1. FROM → Si identificano le tabelle e si applicano le eventuali operazioni di join.


2. WHERE → Si filtrano i dati prima di qualsiasi alias definito in SELECT.


3. SELECT → Si calcolano i valori e si assegnano gli alias.


4. ORDER BY → Qui puoi usare gli alias perché viene eseguito dopo il SELECT.



Esempio errato:

SELECT prezzo * 0.9 AS prezzo_scontato
FROM prodotti
WHERE prezzo_scontato > 100; -- Errore! L'alias non è ancora stato definito

Soluzioni:

1. Ripetere l'espressione nel WHERE

SELECT prezzo * 0.9 AS prezzo_scontato
FROM prodotti
WHERE prezzo * 0.9 > 100;


2. Usare una subquery

SELECT *
FROM (SELECT prezzo, prezzo * 0.9 AS prezzo_scontato FROM prodotti) AS sub
WHERE prezzo_scontato > 100;


3. Usare una CTE (Common Table Expression)

WITH sconti AS (
    SELECT prezzo, prezzo * 0.9 AS prezzo_scontato FROM prodotti
)
SELECT *
FROM sconti
WHERE prezzo_scontato > 100;



Le subquery e le CTE sono utili quando hai espressioni complesse o vuoi mantenere il codice più leggibile.

