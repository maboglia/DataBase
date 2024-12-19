/*
1
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui cognome è uguale a 'verdi' e ordina per nome
*/
select cognome, nome, email, data_nascita
from studenti
where cognome = 'verdi'
order by cognome;

/*
2
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui genere è 'femmina' e ordina per cognome e per nome
*/
select cognome, nome, email, data_nascita
from studenti
where genere = 'f'
order by cognome, nome;

/*
3
seleziona il cognome, il nome, la città, l'email e la data di nascita
dalla tabella studenti
la cui città NON è 'Torino' e ordina per città, per cognome e nome
*/
select cognome, nome, citta, email, data_nascita
from studenti
where citta != 'torino'
order by citta, cognome, nome;

/*
4
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui data di nascita è maggiore della data '2000-01-01' compresa
e ordina per data di nascita dalla più recente alla più remota
*/
select cognome, nome, email, data_nascita
from studenti
-- where data_nascita > '1999-12-31'
where data_nascita >= '2000-01-01' 
order by data_nascita desc;

/*
5
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui genere è 'maschio' e la provincia è 'Alessandria' e ordina per cognome e nome
*/
select cognome, nome, citta, email, data_nascita
from studenti
where genere ='m' and provincia = 'al'
order by cognome, nome;

/*
6
seleziona il cognome, il nome, l'email, la data di nascita e la provincia
dalla tabella studenti
la cui provincia è Asti o Novara e ordina per provincia, cognome e nome
*/
select cognome, nome, citta, email, data_nascita
from studenti
where provincia = 'at' or provincia = 'no'
order by provincia, cognome, nome;

/*
7
seleziona il cognome, il nome, l'email, la data di nascita e la provincia
dalla tabella studenti
la cui provincia è Cuneo o Asti o Novara o Alessandria e ordina per provincia, cognome e nome
*/
select cognome, nome, citta, email, data_nascita
from studenti
where provincia in ('cn','at','no','al')
order by provincia, cognome, nome;

/*
8
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui data di nascita è compresa tra il 1990-01-01 e il 1999-12-31
e il cui genere è 'femmina' e ordina per data di nascita dalla più recente alla più remota,
per cognome e per nome
*/
select cognome, nome, email, data_nascita
from studenti
where data_nascita between '1990-01-01' and '1999-12-31' and genere = 'f'
order by data_nascita desc, cognome, nome;

/*
9
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui data di nascita NON è compresa tra il 1990-01-01 e il 1999-12-31
e il cui genere è 'femmina' e ordina per data di nascita dalla più recente alla più remota,
per cognome e per nome
*/
select cognome, nome, email, data_nascita
from studenti
where data_nascita not between '1990-01-01' and '1999-12-31' and genere = 'f'
order by data_nascita desc;

/*
10
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui cognome inizia per 'r' e ordina per cognome e nome
*/
select cognome, nome, email, data_nascita
from studenti
where cognome like 'r%'
order by cognome, nome;

/*
11
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui cognome inizia per 've' o 'de' e ordina per cognome e nome
*/
select cognome, nome, email, data_nascita
from studenti
-- where cognome like 've%' or cognome like 'de%'
where cognome regexp '^[vd]e'
order by cognome;