/* 1
Seleziona cognome, nome, email dei docenti
e titolo corso che insegnano
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from docenti, corsi
where docenti.id = corsi.docente_id
order by cognome, nome;

/* 2
Seleziona cognome, nome, email dei docenti
e titolo corso che costa meno di 200€(esclusi)
e ordina per cognome e nome
*/
select cognome, nome, email, titolo, prezzo
from docenti, corsi
where docenti.id = corsi.docente_id
and prezzo < 200
order by cognome, nome;

/* 3
Seleziona cognome, nome, email del docente
che insegna nel corso HTML
*/
select cognome, nome, email
from docenti, corsi
where docenti.id = corsi.docente_id
and titolo = 'html';

/* 4
Seleziona titolo corso/i insegnati dal docente il cui cognome è Verdi
e ordina per titolo corsi
*/
select titolo
from docenti, corsi
where docenti.id = corsi.docente_id
and cognome = 'Verdi'
order by titolo;

/* 5
Seleziona cognome, nome, email del/dei docente/i
che insegnano nei corsi il cui titolo comincia per 'Introduzione'
e ordina per titolo, cognome e nome
*/
select cognome, nome, email, titolo
from docenti, corsi
where docenti.id = corsi.docente_id
and titolo like 'Introduzione%'
order by titolo, cognome, nome;

/* 6
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
order by cognome, nome;

/* 7
Seleziona cognome, nome, email, degli studenti FEMMINA
e titolo corso a cui sono iscritte
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and genere = 'f'
order by cognome, nome;

/* 8
Seleziona cognome, nome, email, degli studenti
iscritti al corso di Java
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and titolo = 'java'
order by cognome, nome;

/* 9
Seleziona cognome, nome, email, degli studenti MASCHI
iscritti al corso di Basi di dati
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and titolo = 'basi di dati'
and genere = 'm'
order by cognome, nome;

/* 10
Seleziona cognome, nome, email, degli studenti
iscritti a corsi per i quali hanno pagato più di 200€(compresi)
e ordina per cognome e nome
*/
select cognome, nome, email, titolo, iscrizioni.prezzo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and iscrizioni.prezzo >= 200
order by cognome, nome;