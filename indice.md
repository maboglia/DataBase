# Percorso didattico Fondamenti di basi di dati SQL

1. **SQL Introduction**  
   Introduzione ai concetti fondamentali di SQL e alla sua utilità per interagire con database relazionali.

2. **SQL Getting Started**  
   Guida per iniziare, compresa l'installazione e la configurazione di un server SQL.

3. **SQL Syntax**  
   Panoramica della sintassi base di SQL, inclusa la struttura di comandi come SELECT, INSERT, UPDATE e DELETE.

4. **SQL Create Database**  
   Istruzioni per creare un nuovo database usando il comando `CREATE DATABASE`.

5. **SQL Create Table**  
   Spiegazione su come creare tabelle all'interno di un database con colonne e tipi di dati.

6. **SQL Constraints**  
   Introduzione ai vincoli (es. PRIMARY KEY, UNIQUE, FOREIGN KEY) per garantire l'integrità dei dati.

7. **SQL Insert**  
   Come inserire nuovi record in una tabella con il comando `INSERT INTO`.

8. **SQL Select**  
   Utilizzo del comando `SELECT` per recuperare dati dalle tabelle.

9. **SQL Where**  
   Filtrare i risultati di una query usando condizioni specifiche.

10. **SQL AND & OR**  
    Utilizzo di operatori logici per combinare più condizioni in una query.

11. **SQL IN & Between**  
    Filtrare dati specifici con `IN` o intervalli di valori con `BETWEEN`.

12. **SQL Order By**  
    Ordinare i risultati di una query in ordine crescente o decrescente.

13. **SQL Top/Limit**  
    Limitare il numero di risultati restituiti da una query.

14. **SQL Distinct**  
    Eliminare duplicati dai risultati usando `DISTINCT`.

15. **SQL Update**  
    Modificare i dati esistenti in una tabella con il comando `UPDATE`.

16. **SQL Delete**  
    Eliminare uno o più record da una tabella usando `DELETE`.

17. **SQL Truncate Table**  
    Rimuovere rapidamente tutti i dati da una tabella senza eliminare la struttura.

18. **SQL Drop**  
    Eliminare completamente un database o una tabella dal sistema.

---

### SQL JOIN

1. **SQL JOINS**  
   Introduzione ai JOIN per combinare righe da due o più tabelle basandosi su una condizione correlata.

2. **SQL Joining Tables**  
   Spiegazione su come unire tabelle diverse per ottenere informazioni correlate in un'unica query.

3. **SQL Inner Join**  
   Restituisce solo le righe con corrispondenze tra le tabelle unite.

4. **SQL Left Join**  
   Restituisce tutte le righe della tabella a sinistra e le corrispondenze della tabella a destra; i dati senza corrispondenza risultano nulli.

5. **SQL Right Join**  
   Simile al Left Join, ma restituisce tutte le righe della tabella a destra e le corrispondenze della tabella a sinistra.

6. **SQL Full Join**  
   Combina i risultati di Left e Right Join, restituendo tutte le righe di entrambe le tabelle, incluse quelle senza corrispondenze.

7. **SQL Cross Join**  
   Restituisce il prodotto cartesiano delle tabelle, ovvero ogni riga della prima tabella combinata con ogni riga della seconda.

---

1. **SQL Natural Join**  
   Combina righe basandosi su colonne con lo stesso nome e tipo, eliminando i duplicati senza specificare condizioni.

2. **SQL Self Join**  
   Una tabella viene unita a sé stessa per confrontare righe della stessa tabella.

3. **SQL Outer Join**  
   Include righe con corrispondenze mancanti da una o entrambe le tabelle (Left, Right o Full Join).

4. **SQL Using Clause**  
   Specifica le colonne comuni su cui eseguire il JOIN senza ambiguità.

5. **SQL On Clause**  
   Definisce condizioni esplicite di unione tra tabelle con nomi di colonne diversi o più complesse.

6. **SQL Union**  
   Combina i risultati di più SELECT eliminando i duplicati (unione semplice).

7. **SQL Union All**  
   Come UNION, ma include duplicati, utile per vedere tutti i risultati non filtrati.

