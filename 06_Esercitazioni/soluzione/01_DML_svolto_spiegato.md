```sql
/* 1:
inserisci i seguenti record:

Tabella "americhe":
1) Stati Uniti, New York
2) Canada, Ottawa   
3) Brasile, Brasilia 

Tabella "africa":
1) Egitto, Il Cairo      
2) Sudafrica, Port Elizabeth
3) Marocco, Rabat         

Tabella "europa":
1) Italia, Roma
2) Francia, Lione
3) Germania, Berlino

Crea una "insert" unica per ogni tabella, le query risultanti saranno tre
*/
-- istrizione SQL di seguito
insert into americhe(stato, capitale)
values
('Stati Uniti', 'New York'), -- primo record
('Canada', 'Ottawa'), -- secondo record
('Brasile', 'Brasilia'); -- ultimo record

insert into africa(stato, capitale)
values('Egitto', 'Il Cairo'), ('Sudafrica', 'Port Elizabeth'), ('Marocco', 'Rabat');

insert into europa(stato, capitale)
values('Italia', 'Roma'), ('Francia', 'Lione'), ('Germania', 'Berlino');

/* 2:
Aggiorna il record relativo alla capitale degli Stati Uniti con il valore corretto:
Washington D.C.
*/
-- istrizione SQL di seguito

update americhe
set capitale = 'Washington D.C.' where id = 1;

/* 3:
Aggiorna il record relativo alla capitale del Sudafrica con il valore corretto:
Città del Capo
*/
-- istrizione SQL di seguito
update africa
set capitale = 'Città del Capo'
where id = 2;

/* 4:
Aggiorna il record relativo alla capitale della Francia con il valore corretto:
Parigi
*/
-- istrizione SQL di seguito
update europa
set capitale = 'Parigi' where id = 2;

/* 5:
inserisci nella tabella libro i record seguenti:
1)
titolo: Marcovaldo
prezzo: 13.00
pagine: 204
editore_id: 1
2)
titolo: La coscienza di Zeno
prezzo: 14.00
pagine: 664
editore_id: 2
3)
titolo: Furore
prezzo: 12.50
pagine: 478
editore_id: 1
4)
titolo: Il Piccolo Principe
prezzo: 10.50
pagine: 124
editore_id: 1

ATTENZIONE: Crea una "insert" unica
*/
-- istrizione SQL di seguito
insert into libro(titolo,prezzo,pagine,id_editore)
values('Marcovaldo',13.00,204,1),
('La coscienza di Zeno',14.00,664,2),
('Furore',12.50,478,1),
('Il Piccolo Principe',10.50,124,1);

/* 6:
inserisci nella tabella clienti i record seguenti:
1)
nome: Pippo
cognome: Costanzo
telefono: 3212345678
email: pippo.costanzo@gmail.com
provincia: to
2)
nome: Maria
cognome: Filippi
telefono: 3332345687
email: maria.filippi@gmail.com
provincia: mi
3)
nome: Mario
cognome: Liberato
telefono: 3357000678
email: mario.liberato@gicloud.com
provincia: cn
4)
nome: Grazia
cognome: Alcanto
telefono: 3212345678
email: graziaalcanto@gmail.com
provincia: mi
5)
nome: Francesco
cognome: Franco
telefono: 3481112345
email: franco.francesco@icloud.com
provincia: mi

ATTENZIONE: Crea una "insert" unica
*/
-- istrizione SQL di seguito
insert into customers(nome,cognome,telefono,email,provincia)
values('Pippo','Costanzo','3212345678','pippo.costanzo@gmail.com','to'),
('Maria','Filippi','3332345687','maria.filippi@gmail.com','mi'),
('Mario','Liberato','3357000678','mario.liberato@gicloud.com','cn'),
('Grazia','Alcanto','3212345678','graziaalcanto@gmail.com','mi'),
('Francesco','Franco','3481112345','franco.francesco@icloud.com','mi');

/* 7:
Aggiorna la provincia (tabella clienti) con il valore 'al' solo per i clienti la cui provincia è 'mi'
*/
-- istrizione SQL di seguito
update clienti set provincia = 'al' where provincia = 'mi';

/* 8:
Cancella dalla tabella clienti i record la cui provincia è = 'al'
*/
-- istrizione SQL di seguito
delete from clienti where provincia = 'al';
```

---

# Ecco una spiegazione dei costrutti MySQL usati nel codice

---

### **1. `INSERT INTO ... VALUES`**
- **Descrizione:** Inserisce nuovi record in una tabella. Può accettare più righe in un'unica istruzione.
- **Esempio:**
```sql
insert into americhe(stato, capitale)
values
('Stati Uniti', 'New York'), -- primo record
('Canada', 'Ottawa'), -- secondo record
('Brasile', 'Brasilia'); -- ultimo record
```
- **Spiegazione:**
  - `americhe(stato, capitale)`: Specifica la tabella e le colonne in cui inserire i dati.
  - `values`: Elenca i dati da inserire nei record.

---

### **2. `UPDATE ... SET ... WHERE`**
- **Descrizione:** Modifica i dati di uno o più record esistenti in una tabella. 
- **Esempio:**
```sql
update americhe
set capitale = 'Washington D.C.'
where id = 1;
```
- **Spiegazione:**
  - `update americhe`: Specifica la tabella da aggiornare.
  - `set capitale = 'Washington D.C.'`: Cambia il valore della colonna `capitale`.
  - `where id = 1`: Limita l'aggiornamento al record con `id = 1`.

---

### **3. `DELETE FROM ... WHERE`**
- **Descrizione:** Rimuove uno o più record da una tabella.
- **Esempio:**
```sql
delete from clienti where provincia = 'al';
```
- **Spiegazione:**
  - `delete from clienti`: Specifica la tabella da cui eliminare i record.
  - `where provincia = 'al'`: Limita l'eliminazione ai record con `provincia = 'al'`.

---

### **4. `INSERT INTO` con più valori**
- **Descrizione:** Consente di inserire più record in una tabella con una singola query.
- **Esempio:**
```sql
insert into libro(titolo,prezzo,pagine,id_editore)
values
('Marcovaldo',13.00,204,1),
('La coscienza di Zeno',14.00,664,2),
('Furore',12.50,478,1),
('Il Piccolo Principe',10.50,124,1);
```
- **Spiegazione:**
  - Si specificano una volta le colonne (`titolo`, `prezzo`, ecc.).
  - Si elencano i valori per ogni record separati da virgole.

---

### **5. `UPDATE` senza join**
- **Descrizione:** Cambia una colonna in base a una condizione.
- **Esempio:**
```sql
update clienti
set provincia = 'al'
where provincia = 'mi';
```
- **Spiegazione:**
  - Modifica tutti i record in cui `provincia` è uguale a `'mi'`.

---

### **6. Combinazioni di operazioni**
- **Inserimento in massa:** Risparmio di righe di codice e maggiore efficienza con `INSERT INTO ... VALUES` multiplo.
- **Aggiornamenti condizionali:** Specifici per record con `UPDATE ... WHERE`.
- **Cancellazioni mirate:** Usando `DELETE ... WHERE`.

---

**Nota:** Ogni query MySQL nel codice è ottimizzata per semplicità ed efficienza, rispettando le relazioni e le condizioni della tabella. 
