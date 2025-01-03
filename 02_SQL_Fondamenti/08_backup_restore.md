# **Procedure di Backup e Restore in SQL**

Il backup e il ripristino (restore) dei database sono operazioni fondamentali per garantire la sicurezza e la disponibilità dei dati in caso di errori, guasti o situazioni impreviste. Di seguito, esploriamo i concetti principali e le procedure per eseguire queste operazioni.

---

## **Cos'è il Backup?**

Un **backup** è una copia di sicurezza dei dati del database che può essere utilizzata per ripristinare il database in uno stato precedente in caso di perdita o corruzione dei dati.

- **Tipi di Backup:**
  - **Backup completo (Full Backup):** Copia tutti i dati e le strutture del database.
  - **Backup differenziale:** Copia solo i dati modificati dall'ultimo backup completo.
  - **Backup incrementale:** Copia solo i dati modificati dall'ultimo backup (che sia completo o incrementale).
  - **Backup log transazionali:** Salva solo i log delle transazioni, utile per ripristinare i dati a un momento specifico.

---

## **Cos'è il Restore?**

Il **restore** è il processo di ripristino di un database utilizzando un file di backup. Questa operazione viene effettuata in caso di perdita di dati, errori umani o guasti hardware/software.

---

## **Backup e Restore in SQL Server**

### **1. Backup completo**

**Comando SQL:**

```sql
BACKUP DATABASE NomeDatabase
TO DISK = 'C:\PercorsoBackup\NomeDatabase.bak'
WITH FORMAT;
```

- **`TO DISK`**: Specifica il percorso del file di backup.
- **`WITH FORMAT`**: Crea un nuovo backup formattando i file esistenti.

---

### **2. Backup differenziale**

**Comando SQL:**

```sql
BACKUP DATABASE NomeDatabase
TO DISK = 'C:\PercorsoBackup\NomeDatabase_Diff.bak'
WITH DIFFERENTIAL;
```

- **Differenza rispetto al backup completo:** Memorizza solo le modifiche rispetto all'ultimo backup completo.

---

### **3. Backup dei log transazionali**

**Comando SQL:**

```sql
BACKUP LOG NomeDatabase
TO DISK = 'C:\PercorsoBackup\NomeDatabase_Log.trn';
```

- **Scopo:** Traccia tutte le transazioni avvenute nel database, utile per ripristini puntuali.

---

## **Restore in SQL Server**

### **1. Ripristino di un backup completo**

**Comando SQL:**

```sql
RESTORE DATABASE NomeDatabase
FROM DISK = 'C:\PercorsoBackup\NomeDatabase.bak'
WITH RECOVERY;
```

- **`WITH RECOVERY`**: Completa il ripristino e rende il database disponibile.

---

### **2. Ripristino con backup differenziale**

**Comando SQL:**
```sql
RESTORE DATABASE NomeDatabase
FROM DISK = 'C:\PercorsoBackup\NomeDatabase.bak'
WITH NORECOVERY;

RESTORE DATABASE NomeDatabase
FROM DISK = 'C:\PercorsoBackup\NomeDatabase_Diff.bak'
WITH RECOVERY;
```
- **`WITH NORECOVERY`**: Mantiene il database nello stato di ripristino per permettere ulteriori restore (es. backup incrementali o differenziali).

---

### **3. Ripristino con log transazionali**

**Comando SQL:**

```sql
RESTORE DATABASE NomeDatabase
FROM DISK = 'C:\PercorsoBackup\NomeDatabase.bak'
WITH NORECOVERY;

RESTORE LOG NomeDatabase
FROM DISK = 'C:\PercorsoBackup\NomeDatabase_Log.trn'
WITH RECOVERY;
```

- Permette il ripristino a uno stato specifico, utile in caso di errori.

---

## **Backup e Restore in MySQL**

### **1. Backup con mysqldump**

**Comando da terminale:**

```bash
mysqldump -u utente -p NomeDatabase > backup.sql
```

- **`mysqldump`:** Utility di MySQL per creare un dump del database.
- **`backup.sql`:** File di testo contenente istruzioni SQL per ricreare il database.

---

### **2. Ripristino con dump**

**Comando da terminale:**
```bash
mysql -u utente -p NomeDatabase < backup.sql
```

---

## **Backup e Restore in PostgreSQL**

### **1. Backup con pg_dump**

**Comando da terminale:**
```bash
pg_dump NomeDatabase > backup.sql
```
- **`pg_dump`:** Utility per creare un dump del database PostgreSQL.

---

### **2. Ripristino con dump**

**Comando da terminale:**
```bash
psql NomeDatabase < backup.sql
```

---

### **Backup binario**

Per un backup più veloce e completo:
```bash
pg_basebackup -D /percorso/destinazione -F tar -X fetch
```

---

## **Best Practice per Backup e Restore**

1. **Frequenza:** Pianificare backup regolari in base all'importanza dei dati e al loro tasso di modifica.
2. **Test del ripristino:** Verificare periodicamente la capacità di ripristinare i backup.
3. **Sicurezza:** Conservare i backup in posizioni sicure e, se possibile, criptarli.
4. **Backup multipli:** Conservare copie dei backup in più posizioni (on-site e off-site).
5. **Automazione:** Utilizzare strumenti di automazione per pianificare e monitorare i backup.

---

## **Strumenti di Backup avanzati**

1. **SQL Server Management Studio (SSMS):**
   - Interfaccia grafica per configurare backup e restore.
   - Supporta pianificazione automatica di backup.
2. **MySQL Workbench:**
   - Supporta esportazioni e importazioni di database.
3. **pgAdmin (PostgreSQL):**
   - Interfaccia grafica per eseguire backup e restore.
