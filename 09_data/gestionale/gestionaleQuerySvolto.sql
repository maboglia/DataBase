/* 1) Valore del magazzino */
select format(sum(prezzo*rimanenza),2,'de_DE') 'Valore magazzino'
from articolo;
/*
+------------------+
| Valore magazzino |
+------------------+
| 340.573,50       |
+------------------+
*/

/* 2) Valore del magazzino per categoria */
select categoria, format(sum(prezzo*rimanenza),2,'de_DE') 'Valore magazzino'
from articolo
group by categoria;
/*
+-----------+------------------+
| categoria | Valore magazzino |
+-----------+------------------+
| hardware  | 106.676,00       |
| software  | 233.897,50       |
+-----------+------------------+
*/

/* 3) articoli ordinati e quantità relative ordinati per quantità */
select descrizione,sum(quantita) ordinati
from ordine_dettaglio od,articolo a
where a.id=od.articolo_id
group by a.id
order by ordinati DESC;
/*
+-------------+----------+
| descrizione | ordinati |
+-------------+----------+
| chiavetta   |       16 |
| monitor     |       13 |
| Webcam      |        6 |
| hard-disk   |        6 |
| Office      |        5 |
| smartwatch  |        4 |
| Photoshop   |        2 |
+-------------+----------+
*/

/* 4) quantità articoli ordinati, divisi per categoria */
select categoria,sum(quantita) ordinati
from ordine_dettaglio od,articolo a
where a.id=od.articolo_id
group by a.categoria;

/*
+-----------+----------+
| categoria | ordinati |
+-----------+----------+
| hardware  |       45 |
| software  |        7 |
+-----------+----------+
*/

/* 5) articoli ordinati nell'ordine con id=7 */
select a.descrizione,quantita
from ordine_dettaglio od,articolo a
where a.id=od.articolo_id and ordine_id=7;
/*
+-------------+----------+
| descrizione | quantita |
+-------------+----------+
| chiavetta   |        5 |
| hard-disk   |        2 |
| Webcam      |        1 |
+-------------+----------+
*/

/* 6) Valore degli ordini: Totale denaro speso dai clienti  */
select format((sum(quantita*prezzo)),2,'de_DE') 'Valore ordini'
from articolo a,ordine_dettaglio od
where a.id=od.articolo_id;
-- test -- select a.id, od.ordine_id, sum(quantita*prezzo) from ordine_dettaglio od, articolo a where od.articolo_id=a.id group by od.ordine_id, a.id;
/* 
+---------------+
| Valore ordini |
+---------------+
| 12.126,50     |
+---------------+
*/

/* 7) Seleziono cognome, email dei clienti che hanno effettuato ordini */
select cognome,email
from cliente c,ordine o
where c.id=o.cliente_id
group by c.id
order by cognome;

select cognome,email
from cliente c
join ordine o on c.cliente_id=o.cliente_id
group by c.id
order by cognome;

select cognome, email
from cliente
where credito > 0;

-- con subquery
select cognome,email
from cliente
where id IN (select cliente_id from ordine)
group by cliente.id
order by cognome;

/*
+----------+----------------------+
| cognome  | email                |
+----------+----------------------+
| bianchi  | luca2@gmail.com      |
| esposito | francoe@icloud.com   |
| rossi    | paolo25@gmail.com    |
| rosso    | alberto12@icloud.com |
+----------+----------------------+
*/

/* 8) Seleziono nome del cliente, l'id dell'ordine e la data */
select cognome,o.id,data
from cliente c,ordine o
where c.id=o.cliente_id
order by cognome,o.id;
/*
+----------+----+------------+
| cognome  | id | data       |
+----------+----+------------+
| bianchi  |  2 | 2018-01-11 |
| bianchi  |  4 | 2018-01-23 |
| bianchi  | 12 | 2018-02-28 |
| esposito |  5 | 2018-02-03 |
| esposito |  7 | 2018-02-13 |
| rossi    |  1 | 2017-12-01 |
| rosso    |  3 | 2018-01-21 |
+----------+----+------------+
*/

/* 9) Seleziono i clienti e il denaro speso in totale da ciascuno */

select c.cognome, sum(prezzo*quantita) Speso
from cliente c, ordine o, ordine_dettaglio od, articolo a
where c.id=o.cliente_id
and a.id=od.articolo_id
and o.id=od.ordine_id
group by c.id
order by cognome;

--subquery per aggiornare il credito dei cliente (IDEALE un TRIGGER)
update cliente c set credito = (
  select sum(prezzo*quantita)
  from ordine o, ordine_dettaglio od, articolo a
  where c.id=o.cliente_id
  and a.id=od.articolo_id
  and o.id=od.ordine_id
  group by c.id
);
/*
+----------+---------+
| cognome  | Speso   |
+----------+---------+
| rossi    |  242.50 |
| bianchi  | 7670.50 |
| rosso    |  785.00 |
| esposito | 3428.50 |
+----------+---------+
*/