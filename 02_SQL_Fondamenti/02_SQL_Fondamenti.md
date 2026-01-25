# Elementi fondamentali del linguaggio SQL

Possiamo suddividere il linguaggio SQL in cinque categorie principali, ognuna con uno scopo specifico all'interno del ciclo di vita dei dati.

---

### 1. DDL – Data Definition Language

Si occupa della **struttura** del database. Serve a definire, modificare o eliminare gli schemi, le tabelle e gli indici (l'ossatura, non il contenuto).

* **CREATE**: Crea nuovi oggetti (database, tabelle, viste).
* **ALTER**: Modifica la struttura di un oggetto esistente (es. aggiunge una colonna).
* **DROP**: Elimina definitivamente un oggetto e il suo contenuto.
* **TRUNCATE**: Svuota una tabella di tutti i record, ma mantiene la struttura.

### 2. DML – Data Manipulation Language

Si occupa della **gestione dei dati** all'interno delle tabelle. È il "motore" che permette di popolare e aggiornare le informazioni.

* **INSERT**: Inserisce nuove righe (tuple) in una tabella.
* **UPDATE**: Modifica i valori nelle righe esistenti.
* **DELETE**: Rimuove righe specifiche da una tabella.

### 3. DQL – Data Query Language

È la componente più utilizzata. Serve esclusivamente a **interrogare** il database per estrarre informazioni.

* **SELECT**: Recupera i dati da una o più tabelle. È il comando che permette di filtrare, ordinare e aggregare i risultati.
> *Nota: Spesso il comando SELECT viene raggruppato sotto il DML, ma data la sua importanza e specificità, viene quasi sempre trattato come categoria a sé (DQL).*



### 4. DCL – Data Control Language

Si occupa della **sicurezza** e dei permessi. Definisce chi può fare cosa all'interno del database.

* **GRANT**: Concede privilegi agli utenti (es. permesso di sola lettura).
* **REVOKE**: Revoca i privilegi precedentemente concessi.

### 5. TCL – Transaction Control Language

Gestisce le **transazioni**, ovvero sequenze di operazioni che devono essere trattate come un'unica unità di lavoro "atomica" (o vanno tutte a buon fine, o nessuna).

* **COMMIT**: Rende permanenti le modifiche effettuate durante la transazione.
* **ROLLBACK**: Annulla le modifiche se qualcosa è andato storto, riportando il DB allo stato precedente.
* **SAVEPOINT**: Crea punti di ripristino intermedi all'interno di una transazione.

---

### Tabella Riassuntiva

| Categoria | Scopo Principale      | Comandi Chiave               |
| --------- | --------------------- | ---------------------------- |
| **DDL**   | Struttura (Schema)    | `CREATE`, `ALTER`, `DROP`    |
| **DML**   | Contenuto (Dati)      | `INSERT`, `UPDATE`, `DELETE` |
| **DQL**   | Interrogazione        | `SELECT`                     |
| **DCL**   | Sicurezza/Permessi    | `GRANT`, `REVOKE`            |
| **TCL**   | Integrità/Transazioni | `COMMIT`, `ROLLBACK`         |

