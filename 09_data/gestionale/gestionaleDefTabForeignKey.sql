CREATE TABLE if not exists cliente (
  id int auto_increment,
  cognome varchar(50) not null,
  nome varchar(40),
  telefono varchar(15),
  email varchar(100) unique not null,
  indirizzo varchar(100) not null,
  citta varchar(50) not null,
  provincia char(2) not null,
  regione varchar(30) not null,
  credito int DEFAULT 0,
  primary key(id)
);

CREATE TABLE if not exists ufficio (
  id int auto_increment,
  nome varchar(30),
  luogo_id int, 
  primary key(id)
);

CREATE TABLE if not exists impiegato (
  id int auto_increment,
  nome varchar(50),
  cognome varchar(50),
  ruolo varchar(50),
  rif_to int,
  stipendio decimal(6,2),
  ufficio_id int,
  foreign key fk_impiegato_ufficio (ufficio_id) references ufficio(id)
  on UPDATE CASCADE
  on delete no action,
  primary key(id)
);

CREATE TABLE if not exists ordine (
  id int auto_increment,
  cliente_id int,
  impiegato_id int,
  data date,
  consegna enum('consegnato','da spedire', 'spedito'),
  foreign key fk_ordine_cliente (cliente_id) references cliente(id)
  on UPDATE CASCADE
  on delete no action,
  foreign key fk_ordine_impiegato (impiegato_id) references impiegato(id)
  on UPDATE CASCADE
  on delete no action,
  primary key(id)
);

CREATE TABLE if not exists articolo (
  id int auto_increment,
  descrizione varchar(255),
  prezzo decimal(6,2),
  categoria enum('hardware','software'),
  rimanenza tinyint unsigned,
  primary key(id) 
);

CREATE TABLE if not exists ordine_dettaglio (
  ordine_id int,
  articolo_id int,
  quantita tinyint unsigned,
  foreign key fk_od_articolo (articolo_id) references articolo(id)
  on UPDATE CASCADE
  on delete no action,
  foreign key fk_od_ordine (ordine_id) references ordine(id)
  on UPDATE CASCADE
  on delete no action,
  primary key(ordine_id, articolo_id)
);
