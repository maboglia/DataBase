# Cos’è DBeaver

**DBeaver** è un **database manager universale** open-source, multipiattaforma, pensato per lavorare con **qualsiasi DB relazionale e NoSQL** tramite un’unica interfaccia grafica.

È molto usato da:

* sviluppatori
* DBA
* docenti e studenti
* data analyst

👉 Punto di forza: **un solo strumento per quasi tutti i database**.

---

## Database supportati

### Relazionali (via JDBC)

* MySQL / MariaDB
* PostgreSQL
* Oracle
* SQL Server
* SQLite
* H2
* DB2
* Firebird
* SAP HANA
  *(e molti altri)*

### NoSQL / Big Data

* MongoDB
* Cassandra
* Redis
* Elasticsearch
* Apache Hive

---

## Caratteristiche principali

### 1. Interfaccia grafica avanzata

* Struttura a **navigator** (connessioni, schemi, tabelle, viste)
* Editor SQL con **syntax highlighting**
* **Autocompletamento intelligente** (tabelle, colonne, funzioni)
* Pannelli multipli stile IDE (tipo Eclipse)

---

### 2. Editor SQL professionale

* Query multiple nello stesso editor
* Esecuzione parziale del codice
* **Explain Plan**
* Cronologia delle query
* Supporto a script SQL complessi

---

### 3. Gestione dei dati (CRUD visuale)

* Visualizzazione dei dati **a griglia**
* Inserimento, modifica e cancellazione record senza SQL
* Commit / rollback manuale
* Filtri, ordinamenti, paginazione

Perfetto per spiegare il concetto di **transazione** agli studenti.

---

### 4. Modellazione e struttura del database

* Creazione e modifica di:

  * tabelle
  * chiavi primarie / esterne
  * indici
  * viste
* **Diagrammi ER** automatici
* Reverse engineering del database

---

### 5. Import / Export dati

* CSV
* Excel
* JSON
* XML
* SQL dump

Con mapping delle colonne e preview dei dati.

---

### 6. Sicurezza e connessioni

* Connessioni salvate e cifrate
* Supporto SSH tunnel
* Certificati SSL
* Ruoli e permessi DB

---

### 7. Architettura a plugin

Essendo basato su **Eclipse**, DBeaver:

* supporta plugin
* consente estensioni
* è altamente configurabile

---

## Funzionamento (come si lavora con DBeaver)

1. **Crei una connessione**

   * scegli il DB
   * inserisci host, porta, database, utente, password
   * DBeaver scarica automaticamente il **driver JDBC**

2. **Esplori la struttura**

   * schemi
   * tabelle
   * relazioni
   * trigger e procedure

3. **Scrivi ed esegui query SQL**

   * con editor avanzato
   * risultati tabellari o testuali

4. **Gestisci dati e struttura**

   * via SQL o interfaccia grafica
   * con controllo delle transazioni

---

## Versioni disponibili

* **DBeaver Community** (gratuita, open-source)
  👉 più che sufficiente per didattica e sviluppo
* **DBeaver Enterprise** (commerciale)
  👉 funzioni avanzate per aziende

---

## Installazione di DBeaver su Ubuntu 25

Su Ubuntu 25 (25.04 / 25.10), i metodi consigliati sono **Snap** o **APT ufficiale**.

---

### Metodo 1 – Installazione tramite Snap (consigliato)

È il metodo **più semplice e stabile**.

```bash
sudo snap install dbeaver-ce
```

Verifica:

```bash
dbeaver-ce
```

Vantaggi:

* aggiornamenti automatici
* nessun problema di dipendenze
* funziona su tutte le versioni recenti di Ubuntu

---

### Metodo 2 – Repository ufficiale DBeaver (APT)

1. Aggiungi la chiave GPG:

```bash
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/dbeaver.gpg
```

2. Aggiungi il repository:

```bash
echo "deb [signed-by=/usr/share/keyrings/dbeaver.gpg] https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
```

3. Aggiorna e installa:

```bash
sudo apt update
sudo apt install dbeaver-ce
```

---

### Metodo 3 – AppImage (portabile)

Utile in laboratorio o su macchine senza installazione.

```bash
chmod +x dbeaver-ce-*.AppImage
./dbeaver-ce-*.AppImage
```

---

## Quando usare DBeaver (in sintesi)

✔ didattica database
✔ sviluppo backend
✔ analisi dati
✔ gestione DB multi-vendor
✔ sostituto moderno di phpMyAdmin / pgAdmin

