CREATE TABLE cliente (
  id int auto_increment primary key,
  cognome varchar(50),
  nome varchar(50),
  telefono varchar(20),
  email varchar(50),
  indirizzo varchar(100),
  citta varchar(50),
  provincia char(2),
  regione varchar(30),
  credito smallint
);

CREATE TABLE ordine (
  id int auto_increment primary key,
  cliente_id int,
  impiegato_id int,
  data date,
  consegna enum('consegnato','da spedire','spedito')
);

CREATE TABLE ordine_dettaglio (
  ordine_id int,
  articolo_id int,
  quantita tinyint unsigned,
  primary key(ordine_id, articolo_id)
);

CREATE TABLE articolo (
  id int auto_increment primary key,
  descrizione varchar(255),
  prezzo double(6,2),
  categoria enum('hardware','software'),
  rimanenza tinyint
);

CREATE TABLE impiegato (
  id int auto_increment primary key,
  nome varchar(50),
  cognome  varchar(50),
  ruolo varchar(20),
  rif_to int,
  stipendio double(6,2),
  ufficio_id int
);

CREATE TABLE ufficio (
  id int auto_increment primary key,
  nome varchar(30),
  luogo_id int
);