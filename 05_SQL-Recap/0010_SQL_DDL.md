# Structured Query Language (SQL)  

### SQL: DDL e DML  

SQL non è solo un linguaggio di interrogazione, ma comprende:  

- **DDL (Data Definition Language)**: definisce lo schema del database, incluse tabelle, vincoli, domini e viste.  
- **DML (Data Manipulation Language)**: consente la modifica e l’interrogazione dei dati.  

Versioni principali di SQL:  

- **SQL-1 (SQL-89)**  
- **SQL-2 (SQL-92)** con livelli *entry, intermediate e full*  
- **SQL-3 (SQL-99)**  

---

### Definizione dei domini elementari  

#### **Stringhe**  

SQL prevede vari tipi per la gestione di caratteri e stringhe:  

```sql
Codice_fiscale CHAR(13),
prodotto_greco VARCHAR(100) CHARACTER SET Greek
```

#### **Valori Booleani**  

Il tipo `BIT` (introdotto in SQL-92) può assumere i valori `0` e `1`:  

```sql
Sequenza BIT(5),
Codice VARBIT(16)
```

#### **Numeri esatti**  

Per la rappresentazione di numeri interi o a virgola fissa:  

```sql
integer,
smallint
```

#### **Numeri in virgola fissa**  

Permettono di definire precisione e scala:  

```sql
dato_vendita NUMERIC(6,2) -- intervallo da -9999.99 a +9999.99
```

#### **Numeri in virgola mobile**  

Supportano maggiore precisione con `FLOAT`, `REAL`, e `DOUBLE PRECISION`:  

```sql
salario FLOAT(10)
```

#### **Date e ora**  

SQL gestisce date, orari e timestamp con precisione configurabile:  

```sql
data_nascita DATE,
orario TIME(3) WITH TIME ZONE,
evento TIMESTAMP(6)
```

#### **Intervalli di tempo**  

Definiscono intervalli temporali tra due valori:  

```sql
durata INTERVAL YEAR(5) TO MONTH,  
durata_giorni INTERVAL DAY(4) TO SECOND(6)
```

---

### Definizione di nuovi domini  

È possibile creare domini personalizzati con vincoli:  

```sql
CREATE DOMAIN voto AS SMALLINT DEFAULT 18 CHECK (VALUE BETWEEN 18 AND 30);
```

---

### Definizione dello schema  

Uno schema contiene tabelle, viste, indici e permessi:  

```sql
CREATE SCHEMA azienda AUTHORIZATION utente_registrato;
```

---

### Definizione delle tabelle  

Le tabelle vengono definite con attributi e vincoli:  

```sql
CREATE TABLE Impiegato (
    cf CHAR(16) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    cognome VARCHAR(50) NOT NULL
);
```

---

### Vincoli di integrità  

#### **Vincoli intra-relazionali**  

- **Primary Key**: garantisce l’unicità delle righe:  

```sql
CREATE TABLE Aereo (
    codAereo CHAR(6),
    codCompagnia CHAR(8),
    numPosti SMALLINT,
    PRIMARY KEY (codAereo, codCompagnia)
);
```

- **Unique**: impone l’unicità su uno o più attributi:  

```sql
CREATE TABLE Impiegato (
    nome VARCHAR(30) NOT NULL,
    cognome VARCHAR(30) NOT NULL,
    codFiscale CHAR(13) PRIMARY KEY,
    matricola INTEGER UNIQUE
);
```

- **Check**: impone vincoli sui valori ammessi:  

```sql
CREATE TABLE Esami (
    voto INTEGER CHECK (voto BETWEEN 18 AND 30)
);
```

---

### **Vincoli inter-relazionali**  

- **Foreign Key**: stabilisce relazioni tra tabelle:  

```sql
CREATE TABLE Dipartimento (
    idDip CHAR(8) PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE Impiegato (
    codFiscale CHAR(13) PRIMARY KEY,
    nome VARCHAR(30),
    cognome VARCHAR(30),
    idDip CHAR(8) REFERENCES Dipartimento(idDip)
);
```

- **Azioni su vincoli referenziali**:  

```sql
CREATE TABLE Impiegato (
    codFiscale CHAR(13) PRIMARY KEY,
    idDip CHAR(8) REFERENCES Dipartimento(idDip) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);
```

---

### **Modifica degli schemi relazionali**  

#### **Modificare una tabella**  

```sql
ALTER TABLE Impiegato ADD COLUMN telefono CHAR(20);
ALTER TABLE Dipartimento DROP COLUMN citta;
```

#### **Eliminare una tabella o uno schema**  

```sql
DROP TABLE Progetto CASCADE;
DROP SCHEMA azienda RESTRICT;
```

---

Le parole chiave **CASCADE** e **RESTRICT** vengono utilizzate insieme ai comandi **DROP** in SQL per specificare come devono essere gestiti i vincoli di integrità referenziale quando si elimina una tabella o uno schema. Ecco cosa fanno:

---

### 1. **CASCADE**

- La parola chiave **CASCADE** viene utilizzata quando si elimina una tabella o uno schema che è referenziato da altre tabelle tramite chiavi esterne.
- **CASCADE** indica che l'eliminazione della tabella o dello schema principale (ad esempio, la tabella `Progetto`) deve comportare anche l'eliminazione di tutte le righe nelle altre tabelle che fanno riferimento a tale tabella tramite chiavi esterne.

---

Nel caso del comando:

```sql
DROP TABLE Progetto CASCADE;
```

- Questo comando elimina la tabella `Progetto`, ma prima di farlo, elimina automaticamente tutte le righe nelle altre tabelle che contengono riferimenti a `Progetto` (ad esempio, tramite chiavi esterne).
- È utile per evitare errori di violazione dei vincoli di integrità referenziale.

---

### 2. **RESTRICT**

- La parola chiave **RESTRICT** viene utilizzata per impedire l'eliminazione di una tabella o di uno schema se esistono altre tabelle che dipendono da essa tramite vincoli di chiave esterna.
- Con **RESTRICT**, se una tabella è referenziata da altre tabelle tramite chiavi esterne, la tabella non può essere eliminata finché non vengono rimosse prima le dipendenze.

---

Nel caso del comando:

```sql
DROP SCHEMA azienda RESTRICT;
```

- Questo comando cerca di eliminare lo schema `azienda`.
- Se lo schema `azienda` contiene tabelle o altri oggetti che sono referenziati da altre tabelle in altri schemi (tramite chiavi esterne), l'eliminazione dello schema **fallirà** e restituirà un errore, perché **RESTRICT** impedisce la rimozione di oggetti che sono referenziati.

---

### Riepilogo

- **CASCADE**: Se elimini un oggetto (tabella, schema, ecc.), elimina anche tutte le righe che dipendono da esso tramite vincoli di chiave esterna.
- **RESTRICT**: Se esistono dipendenze tramite chiavi esterne, impedisce l'eliminazione dell'oggetto fino a quando non vengono rimosse tali dipendenze.

**Nota**: Di default, molti database utilizzano **RESTRICT** se non viene specificato diversamente.
