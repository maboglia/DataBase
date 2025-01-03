# SQL Mode: STRICT MODE

Il server MySQL può funzionare in diverse modalità SQL e può applicare queste modalità in modo diverso per client diversi, a seconda del valore della variabile di sistema: `SQL_MODE`.

I DBA possono impostare la modalità SQL globale in modo che corrisponda ai requisiti operativi del server del sito e ogni applicazione può impostare la modalità SQL della sessione in base ai propri requisiti.

Le modalità influiscono sulla sintassi SQL supportata da MySQL e sui controlli di convalida dei dati che esegue. Ciò semplifica l'utilizzo di MySQL in ambienti diversi e l'utilizzo di MySQL insieme ad altri server di database.

---

```sql
SELECT @@SQL_MODE;
```

+-----------------------------------------------------+
| @@SQL_MODE                                          |
+-----------------------------------------------------+
| NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION |
+-----------------------------------------------------+

Questo significa che se si desidera operare con una sessione che lavori in STRICT MODE (che attiva i controlli sui campi, ad esempio), è necessario impostare la variabile all'inizio della sessione di connessione:

```sql
SET SQL_MODE='TRADITIONAL';
```

---

Per ulteriori informazioni, si veda la [documentazione ufficiale](https:/dev.mysql.com/doc/refman/8.0/en/sql-mode.html).
