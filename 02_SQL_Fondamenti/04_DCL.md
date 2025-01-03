# Linguaggio di Controllo dei Dati (DCL) - MySQL

## **CREATE USER**

Per gestire il controllo degli accessi e assegnare i permessi agli utenti, si utilizza l'istruzione `CREATE USER`. Questa istruzione crea un nuovo utente e gli assegna una password. La password deve essere specificata in chiaro.

```sql
CREATE USER 'app_tss'@'localhost' IDENTIFIED BY 'tss_2024!';
```

---

## **GRANT**

L'istruzione `GRANT` viene utilizzata per assegnare permessi e/o privilegi agli utenti su determinati oggetti nel database.

```sql
GRANT --istruzioni_consentite
ON namedatabase.*
TO 'nameuser'@'hostuser';
```

Ecco un esempio di utilizzo del comando **GRANT** in SQL per assegnare privilegi a un utente su un database:

```sql
GRANT SELECT, INSERT, UPDATE, DELETE
ON namedatabase.*
TO 'nameuser'@'hostuser'
IDENTIFIED BY 'password';
```

---

### Spiegazione

1. **`GRANT`**: Indica l'inizio del comando per concedere permessi.
2. **`SELECT, INSERT, UPDATE, DELETE`**: Specifica i privilegi concessi all'utente (lettura, inserimento, aggiornamento, eliminazione).
3. **`ON namedatabase.*`**: Specifica il database e tutte le tabelle (`*`) su cui i privilegi sono applicabili.
4. **`TO 'nameuser'@'hostuser'`**: Specifica il nome dell'utente e l'host da cui si connette.
   - `'nameuser'`: Nome dell'utente a cui si concedono i privilegi.
   - `'hostuser'`: Indica l'host da cui l'utente si connette (può essere `%` per tutti gli host).
5. **`IDENTIFIED BY 'password'`** (opzionale): Imposta la password per l'utente.

---

### Caso d'uso specifico

Se vuoi concedere solo privilegi di lettura a un utente, il comando sarà:

```sql
GRANT SELECT
ON mydatabase.*
TO 'readonlyuser'@'%'
IDENTIFIED BY 'readonlypassword';
```

Questo concede solo il privilegio **SELECT** sul database `mydatabase` a un utente chiamato `readonlyuser`, che può connettersi da qualsiasi host (`%`) usando la password `readonlypassword`.

---

## FLUSH PRIVILEGES

**Nota**: Dopo aver assegnato i privilegi, è buona norma ricaricare i privilegi nel sistema per applicare i cambiamenti:

```sql
FLUSH PRIVILEGES;
```

---

## **REVOKE**

L'istruzione `REVOKE` viene utilizzata per revocare i permessi precedentemente concessi agli utenti.

```sql
REVOKE --istruzioni_revocate
ON databaseName.*
FROM 'user'@'host';
```

---

**Cambiare/Aggiornare la Password Utente**

Per cambiare la password di un utente, si utilizza l'istruzione `ALTER USER`.

```sql
ALTER USER 'userName'@'host' IDENTIFIED BY 'newpass';
```

---

## **Verificare i Permessi Utente**

Per verificare i privilegi di un utente, si utilizzano le istruzioni `SHOW GRANTS`.

```sql
SHOW GRANTS FOR 'user'@'localhost';
SHOW GRANTS FOR CURRENT_USER;
```

---

**Eliminare un Utente**

Per eliminare un utente, si utilizza l'istruzione `DROP USER`.

```sql
DROP USER 'user'@'localhost';
```

---

## **Accesso al DBMS - Utente**

Per accedere al Database Management System (DBMS) come utente, si utilizza il comando `mysql` seguito dalle credenziali dell'utente.

```bash
mysql -u nomeUser -p
```

---

**Prendere Possesso del Database**

- [Leggi di più su DDL](01_DDL.md)

Accedere al server mysql

```bash
mysql -u nomeUser -p nomeDatabase
```

Molte applicazioni hanno file dedicati per la connessione al database, dove vengono specificati tutti i parametri necessari, incluso l'host e, talvolta, la porta.

---

## Creare un Database

Ecco un esempio di comando per creare un database in SQL:

```sql
CREATE DATABASE namedatabase;
```

### Spiegazione

1. **`CREATE DATABASE`**: Comando per creare un nuovo database.
2. **`namedatabase`**: Nome del database che desideri creare.

---

### Opzioni aggiuntive

Puoi includere parametri opzionali per specificare la codifica del set di caratteri e il confronto (collation). Ad esempio:

```sql
CREATE DATABASE namedatabase
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;
```

- **`CHARACTER SET`**: Specifica il set di caratteri (ad es. `utf8mb4` per supportare emoji e caratteri multilingue).
- **`COLLATE`**: Specifica la regola di confronto (ad es. `utf8mb4_general_ci` per confronto insensibile alla maiuscola/minuscola).

---

### Controllare se il database esiste già

Per evitare errori, puoi usare l'opzione **IF NOT EXISTS**:

```sql
CREATE DATABASE IF NOT EXISTS namedatabase;
```

---

Dopo aver creato il database, puoi selezionarlo per iniziare a lavorare con esso:

```sql
USE namedatabase;
```

Una volta 'dentro' il database, è possibile lavorarci direttamente senza l'uso di `USE`.
