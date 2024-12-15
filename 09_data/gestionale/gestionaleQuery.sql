/* 1) Valore del magazzino */
select format(sum(prezzo*rimanenza,2,'de_DE')) 'Valore magazzino' from articolo;
/*
+------------------+
| Valore magazzino |
+------------------+
| 340.573,50       |
+------------------+
*/
select categoria, format(sum(prezzo*rimanenza),2,'de_DE') 'Valore magazzino'
from articolo
group by categoria;


/* 2) Valore del magazzino per categoria */

/*
+-----------+------------------+
| categoria | Valore magazzino |
+-----------+------------------+
| hardware  | 106.676,00       |
| software  | 233.897,50       |
+-----------+------------------+
*/

/* 3) articoli ordinati e quantità relative ordinati per quantità */
select descrizione, sum(quantita) ordinati
from ordine_dettaglio od, articolo a
where a.id=od.articolo_id
group by a.id
order by ordinati desc;
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
select categoria, sum(quantita) ordinati
from ordine_dettaglio od, articolo a
where a.id = od.articolo_id
group by categoria;
/*
+-----------+----------+
| categoria | ordinati |
+-----------+----------+
| hardware  |       45 |
| software  |        7 |
+-----------+----------+
*/

/* 5) articoli ordinati nell'ordine con id=7 */
select descrizione, quantita
from ordine_dettaglio od, articolo a
where a.id = od.articolo_id
and ordine_id = 7;
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
select sum(prezzo*quantita)
from articolo a, ordine_dettaglio od
where a.id = od.articolo_id;
/* 
+---------------+
| Valore ordini |
+---------------+
| 12.126,50     |
+---------------+
*/

/* 7) Seleziono cognome, email dei clienti che hanno effettuato ordini */
select cognome, email
from cliente
where credito > 0;

select cognome, email
from cliente c, ordine o
where c.id=o.cliente_id
group by c.id
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
Select cognome, o.id, data
from cliente c, ordine o
where c.id=o.cliente_id
order by cognome, o.id;
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
select cognome, sum(prezzo*quantita) Speso
from cliente c, ordine o, ordine_dettaglio od, articolo a
where c.id = o.cliente_id
and a.id=od.articolo_id
and o.id=od.ordine_id
group by c.id
order by cognome;
/*
+----------+---------+
| cognome  | Speso   |
+----------+---------+
| bianchi  | 7670.50 |
| esposito | 3428.50 |
| rossi    |  242.50 |
| rosso    |  785.00 |
+----------+---------+
*/