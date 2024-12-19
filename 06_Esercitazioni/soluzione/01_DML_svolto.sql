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