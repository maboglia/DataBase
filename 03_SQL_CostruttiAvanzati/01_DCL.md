## Linguaggio di Controllo dei Dati (DCL) - MySQL

**CREATE USER**

Per gestire il controllo degli accessi e assegnare i permessi agli utenti, si utilizza l'istruzione `CREATE USER`. Questa istruzione crea un nuovo utente e gli assegna una password. La password deve essere specificata in chiaro.

```sql
CREATE USER 'app_tss'@'localhost' IDENTIFIED BY 'tss_2024!';
```

**GRANT**

L'istruzione `GRANT` viene utilizzata per assegnare permessi e/o privilegi agli utenti su determinati oggetti nel database.

```sql
GRANT --istruzioni_consentite
ON namedatabase.*
TO 'nameuser'@'hostuser';
```

**REVOKE**

L'istruzione `REVOKE` viene utilizzata per revocare i permessi precedentemente concessi agli utenti.

```sql
REVOKE --istruzioni_revocate
ON databaseName.*
FROM 'user'@'host';
```

**Cambiare/Aggiornare la Password Utente**

Per cambiare la password di un utente, si utilizza l'istruzione `ALTER USER`.

```sql
ALTER USER 'userName'@'host' IDENTIFIED BY 'newpass';
```

**Verificare i Permessi Utente**

Per verificare i privilegi di un utente, si utilizzano le istruzioni `SHOW GRANTS`.

```sql
SHOW GRANTS FOR 'user'@'localhost';
SHOW GRANTS FOR CURRENT_USER;
```

**Eliminare un Utente**

Per eliminare un utente, si utilizza l'istruzione `DROP USER`.

```sql
DROP USER 'user'@'localhost';
```

**Accesso al DBMS - Utente**

Per accedere al Database Management System (DBMS) come utente, si utilizza il comando `mysql` seguito dalle credenziali dell'utente.

```bash
mysql -u nomeUser -p
```

**Prendere Possesso del Database**

Per prendere possesso di un database e lavorarci, si utilizza l'istruzione `USE` seguita dal nome del database.

```sql
USE nomeDatabase;
```

Una volta dentro il database, è possibile lavorarci direttamente senza l'uso di `USE`.

```bash
mysql -u nomeUser -p nomeDatabase
```

Ricordatevi che molte applicazioni hanno file dedicati per la connessione al database, dove vengono specificati tutti i parametri necessari, incluso l'host e, talvolta, la porta.
