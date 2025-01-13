# Ecco una spiegazione e il contesto per ogni query SQL scritta:

---

### **1. Creazione della tabella `prodotti`**
- **Esempio:**
```sql
create table if not exists prodotti(
id int auto_increment primary key,
nome varchar(50),
prezzo decimal(6, 2),
quantita tinyint
);
```
- **Spiegazione:**
  - **`id int auto_increment primary key`**: Campo intero con incremento automatico, definito come chiave primaria.
  - **`nome varchar(50)`**: Nome del prodotto, stringa con lunghezza massima di 50 caratteri.
  - **`prezzo decimal(6, 2)`**: Prezzo con massimo 6 cifre, di cui 2 decimali.
  - **`quantita tinyint`**: Quantità con un limite massimo di 100 (dimensione ridotta per occupare meno memoria).

---

### **2. Modifica della tabella `prodotti`**
- **Esempio:**
```sql
alter table prodotti
add descrizione text
after nome;
```
- **Spiegazione:**
  - **`add descrizione text`**: Aggiunge un campo `descrizione` di tipo `text`.
  - **`after nome`**: Specifica che il nuovo campo deve essere inserito subito dopo il campo `nome`.

---

### **3. Creazione della tabella `ordini`**
- **Esempio:**
```sql
create table if not exists ordini(
id int auto_increment primary key,
data_ordine date,
totale decimal(10, 2),
id_cliente int
);
```
- **Spiegazione:**
  - Tabella per gli ordini, include:
    - **`data_ordine`**: Data dell'ordine.
    - **`totale decimal(10, 2)`**: Totale dell'ordine con massimo 10 cifre (2 decimali).
    - **`id_cliente`**: ID del cliente associato all'ordine.

---

### **4. Creazione della tabella `clienti`**
- **Esempio:**
```sql
create table if not exists clienti(
id int auto_increment primary key,
nome varchar(30),
cognome varchar(30),
email varchar(100),
provincia char(2)
);
```
- **Spiegazione:**
  - Campi principali:
    - **`nome`** e **`cognome`**: Stringhe con lunghezza massima rispettivamente di 30 caratteri.
    - **`provincia char(2)`**: Codice della provincia con 2 caratteri.

---

### **5. Modifica della tabella `clienti`**
- **Esempio:**
```sql
alter table clienti
modify cognome varchar(50),
add telefono varchar(20)
after cognome;
```
- **Spiegazione:**
  - **`modify cognome varchar(50)`**: Modifica la lunghezza massima del campo `cognome` da 30 a 50 caratteri.
  - **`add telefono varchar(20) after cognome`**: Aggiunge un campo `telefono` subito dopo `cognome`.

---

### **6. Creazione delle tabelle `americhe`, `europa` e `africa`**
- **Esempio:**
```sql
create table if not exists americhe(
id int auto_increment primary key,
stato varchar(50),
capitale varchar(50)
);

create table if not exists europa(
id int auto_increment primary key,
stato varchar(50),
capitale varchar(50)
);

create table if not exists africa(
id int auto_increment primary key,
stato varchar(50),
capitale varchar(50)
);
```
- **Spiegazione:**
  - Ciascuna tabella rappresenta un continente, con:
    - **`stato varchar(50)`**: Nome dello stato.
    - **`capitale varchar(50)`**: Nome della capitale.

---

### **7. Creazione della tabella `libro`**
- **Esempio:**
```sql
create table if not exists libro(
id int auto_increment primary key,
titolo varchar(100),
prezzo decimal(6, 2),
pagine smallint,
id_editore int
);
```
- **Spiegazione:**
  - Tabella per i libri, include:
    - **`titolo varchar(100)`**: Titolo del libro con massimo 100 caratteri.
    - **`pagine smallint`**: Numero di pagine (valori interi di dimensione ridotta).

---

### **8. Rinomina della tabella `clienti`**
- **Esempio:**
```sql
alter table clienti rename to customers;
```
- **Spiegazione:**
  - **`rename to customers`**: Cambia il nome della tabella `clienti` in `customers`.

---

Questi comandi SQL sono fondamentali per la gestione delle tabelle, dalla creazione alla modifica, fino alla rinomina. Le istruzioni seguono una sintassi SQL standard compatibile con la maggior parte dei DBMS.

---

```sql
/* 1:
Crea una tabella chiamata "prodotti" con i seguenti campi:
- id (intero, chiave primaria)
- nome (stringa di lunghezza massima 50 caratteri)
- prezzo (decimale(6,2))
- quantita (intero)
nb: il valore relativo alla quantità non supera il valore 100
*/
-- istruzione SQL di seguito
create table if not exists prodotti(
id int auto_increment primary key,
nome varchar(50),
prezzo decimal(6, 2),
quantita tinyint
);
...

/* 2:
Modifica la tabella "prodotti" aggiungendo un nuovo campo chiamato "descrizione" di tipo testo.
Inserite il nuovo campo dopo il campo "nome"
*/
-- istruzione SQL di seguito
alter table prodotti
add descrizione text
after nome;
...

/* 3:
Crea una tabella chiamata "ordini" con i seguenti campi:
- id (intero, chiave primaria)
- data_ordine (data)
- totale (decimale(10,2))
- id_cliente (intero)
*/
-- istruzione SQL di seguito
create table if not exists ordini(
id int auto_increment primary key,
data_ordine date,
totale decimal(10, 2),
id_cliente int
);
...

/* 4:
Crea una tabella chiamata "clienti" con i seguenti campi:
- id (intero, chiave primaria)
- nome (stringa di lunghezza massima 30 caratteri)
- cognome (stringa di lunghezza massima 30 caratteri)
- email (stringa di lunghezza massima 100 caratteri)
- provincia (stringa di 2 caratteri)
*/
-- istruzione SQL di seguito
create table if not exists clienti(
id int auto_increment primary key,
nome varchar(30),
cognome varchar(30),
email varchar(100),
provincia char(2)
);
...

/* 5:
Modifica la tabella "clienti":
modifica la lunghezza massima del campo cognome da 30 caratteri a 50, 
aggiungi un nuovo campo chiamato "telefono" dopo il cognome, di tipo stringa di lunghezza massima 20 caratteri.
Scrivi un unica query.
*/
-- istruzione SQL di seguito
alter table clienti
modify cognome varchar(50),
add telefono varchar(20)
after cognome;
...

/* 6:
Crea le tabelle "americhe", "europa", "africa" (3 query)
Le tabelle hanno i seguenti attributi:
- id (intero, chiave primaria)
- stato (stringa di lunghezza massima 50 caratteri)
- capitale (stringa di lunghezza massima 50 caratteri)
*/
-- istruzione SQL di seguito
create table if not exists americhe(
id int auto_increment primary key,
stato varchar(50),
capitale varchar(50)
);

create table if not exists europa(
id int auto_increment primary key,
stato varchar(50),
capitale varchar(50)
);

create table if not exists africa(
id int auto_increment primary key,
stato varchar(50),
capitale varchar(50)
);
...

...

...

/* 7
Crea una tabella chiamata "libro" con i seguenti campi:
- id (intero, chiave primaria)
- titolo (stringa di lunghezza massima 100 caratteri)
- prezzo (decimale(6,2))
- pagine (intero)
- id_editore (intero)
*/
-- istruzione SQL di seguito
create table if not exists libro(
id int auto_increment primary key,
titolo varchar(100),
prezzo decimal(6, 2),
pagine smallint,
id_editore int
);
...

/* 8:
Rinomina la tabella "clienti": il nuovo nome è "customers".
*/
-- istruzione SQL di seguito
alter table clienti rename to customers;
```
