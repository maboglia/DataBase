-- DB generation
-- 1) Contate gli studenti divisi per genere
-- la tabelle risultante mostrerà i seguenti attributi
-- Genere, Quanti
select genere Genere, count(genere) Quanti
from studenti
group by genere;

-- 2) Contate gli studenti divisi per genere solo della provincia di Alessandria
-- la tabelle risultante mostrerà i seguenti attributi
-- Genere, Quanti
select genere Genere, count(genere) Quanti
from studenti
where provincia = 'al'
group by genere
order by quanti;

-- 3) Contate gli studenti divisi per regione
-- la tabelle risultante mostrerà i seguenti attributi
-- Regione, Quanti
select regione Regione, count(*) Quanti
from studenti
group by regione;

-- 4) Contate gli studenti divisi per regione e per genere
-- la tabelle risultante mostrerà i seguenti attributi
-- Regione, Genere, Quanti
select regione Regione, genere Genere, count(*) Quanti
from studenti
group by regione, genere;

-- 5) Contate gli studenti divisi per regione e per genere mostrando anche i totali aggregati
-- ricordatevi della funzione grouping() e dell'istruzione with rollup
-- la tabelle risultante mostrerà i seguenti attributi, con le righe in più dei subtotali e del totale
-- Regione, Genere, Quanti
select
	if(grouping(regione),'totale regioni',regione) Regione,
    if(grouping(genere),'totale genere',genere) Genere,
    count(*) Quanti
from studenti
group by regione, genere with rollup;

-- 6) Contate gli impiegati divisi per ruolo
-- la tabelle risultante mostrerà i seguenti attributi
-- Ruolo, Quanti
select ruolo Ruolo, count(*) Quanti
from impiegato
group by Ruolo;

-- DB liceo
-- 7) Contate gli alunni assegnati alle diverse aule
-- la tabelle risultante mostrerà i seguenti attributi
-- Nome aula, Numero studenti
select a.nome `Nome aula`, count(*) `Numero studenti`
from aule a
join alunni al
on a.id = al.aula_id
group by `Nome aula`;

-- DB libro
-- 8) Contate gli autori divisi per nazionalità
-- la tabelle risultante mostrerà i seguenti attributi
-- Nazionalità, Quanti
select nazionalita `Nazionalità`, count(*) Quanti
from autore
group by nazionalita
order by Quanti desc;

-- 9) Contate i libri per editore e il valore dei libri, ordinate per Editore
-- la tabelle risultante mostrerà i seguenti attributi
-- Editore, Quanti, Valore
select e.nome Editore,
	count(*) Quanti,
    sum(prezzo) Valore
from libri l
join editori e
on e.id = l.editore_id
group by Editore
order by Editore;