
# Backup di un Database MySQL

---

#### Sintassi di base

```bash
mysqldump -u nome_utente -p nome_database > /percorso/del/backup/backup_file.sql
```

- **`-u nome_utente`**: Sostituisci `nome_utente` con il tuo nome utente MySQL (es. `root`).
- **`-p`**: Chiede la password per l'utente.
- **`nome_database`**: Sostituisci con il nome del database di cui vuoi fare il backup.
- **`/percorso/del/backup/backup_file.sql`**: Il percorso dove verrà salvato il backup (sarà un file `.sql`).

---

#### Esempio

```bash
mysqldump -u root -p mio_database > /backup/mio_database_backup.sql
```

Dopo aver inserito la password, questo comando eseguirà il backup del database `mio_database` nel file `mio_database_backup.sql`.

---

### Altre opzioni utili per `mysqldump`
---


1. **Backup di più database**:

   ```bash
   mysqldump -u root -p --databases db1 db2 db3 > /percorso/del/backup/multiple_databases.sql
   ```

---

2. **Backup di tutti i database**:

   ```bash
   mysqldump -u root -p --all-databases > /percorso/del/backup/all_databases.sql
   ```

---

3. **Includere le routine (procedure/funzioni) nel backup**:

   ```bash
   mysqldump -u root -p --routines nome_database > /percorso/del/backup/backup_con_routine.sql
   ```

---

4. **Includere i trigger nel backup**:

   ```bash
   mysqldump -u root -p --triggers nome_database > /percorso/del/backup/backup_con_trigger.sql
   ```

---

5. **Comprimere il backup (opzionale)**:
   Puoi usare `gzip` per comprimere il backup:

   ```bash
   mysqldump -u root -p mio_database | gzip > /percorso/del/backup/mio_database_backup.sql.gz
   ```

---

### Ripristino di un Backup MySQL

Per ripristinare un backup creato con `mysqldump`, usa il seguente comando:

```bash
mysql -u nome_utente -p nome_database < /percorso/del/backup/backup_file.sql
```

Esempio:

```bash
mysql -u root -p mio_database < /backup/mio_database_backup.sql
```

Questo comando ripristinerà il database dal file di backup.
