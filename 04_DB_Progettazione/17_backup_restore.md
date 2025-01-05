---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# Backup e Ripristino dei Dati

La creazione regolare di backup e la capacità di ripristinare i dati sono elementi critici per garantire la disponibilità e l'integrità delle informazioni contenute in un database.

---

## Backup dei Dati

1. **Backup dei Dati
   - Il backup consiste nella creazione di una copia dei dati del database in un punto specifico nel tempo. Questa copia viene archiviata in un luogo separato dal database primario.
   - I backup possono essere completi (contenenti tutti i dati), differenziali (contenenti solo le modifiche apportate dai backup precedenti) o incrementali (contenenti solo le modifiche apportate dai backup più recenti).

---

## Pianificazione dei Backup

2. **Pianificazione dei Backup
   - I backup devono essere pianificati regolarmente in base alle esigenze del sistema. La frequenza dei backup dipende dalla quantità di dati modificati e dalla criticità del sistema.
   - Un piano di backup dovrebbe essere ben documentato, indicando i tipi di backup, la frequenza e la durata di conservazione.

---

## Ripristino dei Dati

3. **Ripristino dei Dati
   - Il ripristino dei dati è il processo di utilizzo di un backup per ripristinare il database a uno stato precedente in caso di perdita di dati, errore umano, guasti hardware o altri problemi.
   - Un piano di ripristino dovrebbe essere sviluppato in anticipo, specificando come ripristinare i dati e quanto tempo dovrebbe essere dedicato al ripristino in caso di emergenza.

---

## Verifica dei Backup

4. **Verifica dei Backup
   - I backup devono essere verificati per assicurarsi che siano completi e che i dati possano essere ripristinati correttamente. Questo può essere fatto periodicamente eseguendo un ripristino di prova.
   - La verifica dei backup riduce il rischio di scoprire problemi solo quando è troppo tardi.

---

## Archiviazione dei Backup

5. **Archiviazione dei Backup
   - Le copie dei backup dovrebbero essere archiviate in luoghi fisicamente separati dal database primario per proteggerle da eventi catastrofici come incendi o alluvioni.
   - L'archiviazione in cloud è spesso utilizzata come opzione sicura e facilmente accessibile.

---

## Sicurezza dei Backup

6. **Sicurezza dei Backup
   - I backup contengono dati sensibili e dovrebbero essere trattati con la stessa attenzione alla sicurezza dei dati del database primario.
   - È importante crittografare i backup per proteggerli da accessi non autorizzati.

---

## Backup di Schema

7. **Backup di Schema e Configurazione
   - Oltre ai dati, è importante eseguire il backup dello schema del database e delle configurazioni del sistema. Ciò facilita il ripristino completo del sistema in caso di necessità.

L'implementazione di una robusta strategia di backup e ripristino è essenziale per garantire la continuità operativa e la sicurezza dei dati. La pianificazione, la verifica e la documentazione accurata sono elementi chiave per un efficace processo di backup e ripristino.

---

### Backup di un Database MySQL

#### Sintassi di base

```bash
mysqldump -u nome_utente -p nome_database > /percorso/del/backup/backup_file.sql
```

- **`-u nome_utente`**: Sostituisci `nome_utente` con il tuo nome utente MySQL (es. `root`).
- **`-p`**: Chiede la password per l'utente.
- **`nome_database`**: Sostituisci con il nome del database che vuoi fare il backup.
- **`/percorso/del/backup/backup_file.sql`**: Il percorso dove verrà salvato il backup (sarà un file `.sql`).

#### Esempio

```bash
mysqldump -u root -p mio_database > /backup/mio_database_backup.sql
```

Dopo aver inserito la password, questo comando eseguirà il backup del database `mio_database` nel file `mio_database_backup.sql`.

### Altre opzioni utili per `mysqldump`

1. **Backup di più database**:

   ```bash
   mysqldump -u root -p --databases db1 db2 db3 > /percorso/del/backup/multiple_databases.sql
   ```

2. **Backup di tutti i database**:

   ```bash
   mysqldump -u root -p --all-databases > /percorso/del/backup/all_databases.sql
   ```

3. **Includere le routine (procedure/funzioni) nel backup**:

   ```bash
   mysqldump -u root -p --routines nome_database > /percorso/del/backup/backup_con_routine.sql
   ```

4. **Includere i trigger nel backup**:

   ```bash
   mysqldump -u root -p --triggers nome_database > /percorso/del/backup/backup_con_trigger.sql
   ```

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

