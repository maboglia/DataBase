Parliamo di **MVCC (Multi Version Concurrency Control)**, implementato in modo molto solido in **PostgreSQL** e (con differenze) anche in **MySQL** con motore InnoDB.

---

# 📘 Cos’è MVCC

**MVCC = Multi Version Concurrency Control**

👉 Significa:
✔ ogni modifica crea **una nuova versione del record**
✔ le letture vedono una “fotografia” consistente dei dati
✔ letture e scritture non si bloccano a vicenda

💡 Idea chiave:

> invece di bloccare i record, il DB conserva più versioni

---

# 🎯 Problema che MVCC risolve

Senza MVCC (modello a lock):

* una transazione che modifica un record lo blocca
* altre transazioni devono aspettare
* si riduce la concorrenza

Con MVCC:

* le letture non bloccano le scritture
* le scritture non bloccano le letture
* maggiore scalabilità

---

# 🔎 Esempio semplice

## Scenario

Record studente:

```
id=1, nome=Mario
```

### ✔ Transazione T1

```sql
BEGIN;
UPDATE studenti SET nome='Luigi' WHERE id=1;
```

👉 Il DB **non sovrascrive Mario**
👉 crea una nuova versione:

* v1 → Mario (vecchia)
* v2 → Luigi (nuova)

---

### ✔ Transazione T2 (in parallelo)

```sql
SELECT nome FROM studenti WHERE id=1;
```

👉 T2 vede **Mario**, perché la sua snapshot è precedente

📌 Risultato:

* T1 vede Luigi
* T2 vede Mario
* nessun blocco

---

# 🧠 Snapshot (concetto chiave)

Quando una transazione inizia:

* riceve una **snapshot consistente**
* vede solo le versioni valide in quel momento

👉 Questo garantisce:
✔ isolamento
✔ consistenza
✔ letture ripetibili (a seconda del livello)

---

# ⚙️ Come funziona in PostgreSQL

Ogni riga ha campi nascosti:

* `xmin` → ID transazione che ha creato la riga
* `xmax` → ID transazione che l’ha eliminata

Il DB decide quale versione è visibile in base alla snapshot.

👉 Le versioni obsolete vengono rimosse da:

* **VACUUM**

Questo è un punto didattico molto importante.

---

# 📊 MVCC vs Lock tradizionale

| Aspetto                    | MVCC     | Lock tradizionale |
| -------------------------- | -------- | ----------------- |
| Letture bloccano scritture | ❌        | ✔                 |
| Scritture bloccano letture | ❌        | ✔                 |
| Concorrenza                | alta     | bassa             |
| Complessità                | maggiore | minore            |
| Performance letture        | ottime   | peggiori          |

---

# 🔹 MVCC in PostgreSQL vs MySQL

### PostgreSQL

✔ MVCC “nativo”
✔ ogni UPDATE = nuova riga
✔ vacuum necessario

### MySQL (InnoDB)

✔ MVCC tramite undo log
✔ architettura diversa
✔ meno visibile didatticamente

👉 PostgreSQL è più facile da usare per spiegare MVCC.

---

# 🎓 Come spiegarlo agli studenti (metafora)

📸 **MVCC = album fotografico**

* ogni modifica è una nuova foto
* ogni transazione guarda una foto diversa
* nessuno cancella la foto mentre qualcuno la sta guardando

---

# 💡 Problemi che MVCC evita

* dirty read
* read lock contention
* perdita di performance in sistemi concorrenti

Ma introduce:

* bloat delle tabelle
* necessità di vacuum
* gestione più complessa

