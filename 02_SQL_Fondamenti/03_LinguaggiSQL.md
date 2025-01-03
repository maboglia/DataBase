# I linguaggi di accesso ai dati

I linguaggi di accesso ai dati in ambito SQL si suddividono in diverse categorie principali, ognuna delle quali ha uno scopo specifico. 

1. **DCL** - Data Control Language
2. **DDL** - Data Definition Language
3. **DML** - Data Manipulation Language
4. **Query Language**

---

## **1. DCL - Data Control Language (Linguaggio di Controllo dei Dati)**  

**Scopo:** Controllare i diritti e le autorizzazioni degli utenti per accedere ai dati.  

- **Caratteristiche:**  
  - Gestisce la sicurezza e i permessi sulle tabelle, viste, procedure, ecc.
  - È utilizzato principalmente dagli amministratori di database per garantire accesso sicuro.  

- **Comandi principali:**  
  - **`GRANT`**: Assegna permessi a un utente o a un ruolo.  

    ```sql
    GRANT SELECT, INSERT ON database.table TO 'utente'@'host';
    ```

  - **`REVOKE`**: Revoca i permessi precedentemente assegnati.  

    ```sql
    REVOKE INSERT ON database.table FROM 'utente'@'host';
    ```

---

## **2. DDL - Data Definition Language (Linguaggio di Definizione dei Dati)**  

**Scopo:** Definire e gestire la struttura degli oggetti del database (es. tabelle, indici, viste).  

- **Caratteristiche:**  
  - Utilizzato per creare, modificare o eliminare la struttura di un database.  
  - Le istruzioni sono eseguite in modo immediato e non possono essere annullate.  

- **Comandi principali:**  
  - **`CREATE`**: Crea nuovi oggetti nel database.  

    ```sql
    CREATE TABLE utenti (
        id INT PRIMARY KEY,
        nome VARCHAR(100)
    );
    ```

  - **`ALTER`**: Modifica la struttura di oggetti esistenti.  

    ```sql
    ALTER TABLE utenti ADD email VARCHAR(100);
    ```

  - **`DROP`**: Elimina oggetti dal database.  

    ```sql
    DROP TABLE utenti;
    ```

---

## **3. DML - Data Manipulation Language (Linguaggio di Manipolazione dei Dati)**  

**Scopo:** Manipolare i dati contenuti negli oggetti definiti dal DDL.  

- **Caratteristiche:**  
  - Gestisce l’inserimento, l’aggiornamento, l’eliminazione e la lettura dei dati.  
  - I comandi DML sono transazionali, il che significa che possono essere annullati con un rollback.  

- **Comandi principali:**  
  - **`INSERT`**: Inserisce nuovi dati.  

    ```sql
    INSERT INTO utenti (id, nome) VALUES (1, 'Luca');
    ```

  - **`UPDATE`**: Modifica i dati esistenti.  

    ```sql
    UPDATE utenti SET nome = 'Marco' WHERE id = 1;
    ```

  - **`DELETE`**: Elimina i dati esistenti.  

    ```sql
    DELETE FROM utenti WHERE id = 1;
    ```

---

## **4. Query Language (Linguaggio di Interrogazione dei Dati)**  

**Scopo:** Interrogare il database per recuperare informazioni.  

- **Caratteristiche:**  
  - I comandi di query fanno parte del DML ma si distinguono per essere focalizzati solo sulla lettura dei dati.  
  - Il linguaggio di interrogazione SQL è particolarmente orientato alla selezione e al filtraggio dei dati.  

- **Comando principale:**  
  - **`SELECT`**: Recupera dati da una o più tabelle.  

    ```sql
    SELECT nome, email FROM utenti WHERE id = 1;
    ```

  - Può essere arricchito con:
    - **Clausole**: `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`.  
    - **Operazioni**: Join, funzioni aggregate (`SUM`, `AVG`, `COUNT`), sottoquery.  

---

## **Riepilogo**

| **Categoria** | **Scopo**                       | **Comandi principali**                            |
|---------------|----------------------------------|--------------------------------------------------|
| **DCL**       | Controllo dell'accesso ai dati  | `GRANT`, `REVOKE`                                |
| **DDL**       | Definizione della struttura     | `CREATE`, `ALTER`, `DROP`                        |
| **DML**       | Manipolazione dei dati          | `INSERT`, `UPDATE`, `DELETE`                     |
| **Query Language**     | Recupero dei dati               | `SELECT` (con `WHERE`, `JOIN`, `GROUP BY`, ecc.) |

Ognuna di queste categorie copre aspetti fondamentali per il funzionamento e la gestione di un database relazionale.

