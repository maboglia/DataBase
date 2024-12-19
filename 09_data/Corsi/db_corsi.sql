
CREATE TABLE IF NOT EXISTS corsi (
  id int AUTO_INCREMENT,
  titolo varchar(100) NOT NULL,
  prezzo decimal(6,2),
  docente_id int,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS docenti (
  id int AUTO_INCREMENT,
  nome varchar(50) NOT NULL,
  cognome varchar(50) NOT NULL,
  email varchar(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY email (email)
);

CREATE TABLE IF NOT EXISTS iscrizioni (
  id int AUTO_INCREMENT,
  studente_id int NOT NULL,
  corso_id int NOT NULL,
  prezzo decimal(6,2),
  data_isc timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- oppure vedi riga 44
CREATE TABLE IF NOT EXISTS studenti (
  id int AUTO_INCREMENT,
  nome varchar(40),
  cognome varchar(50) NOT NULL,
  genere enum('m','f', 'nb'),
  indirizzo varchar(100),
  citta varchar(30),
  provincia char(2) DEFAULT 'To',
  regione varchar(30) DEFAULT 'Piemonte',
  email varchar(100) UNIQUE,
  data_nascita date,
  data_isc timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE corsi.studenti LIKE tss2024.studenti;
-- i dati li mettiamo nello script dei dati