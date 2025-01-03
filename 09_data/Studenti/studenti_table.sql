
DROP TABLE IF EXISTS studenti;

CREATE TABLE studenti (
  id INT AUTO_INCREMENT,
  nome VARCHAR(50),
  cognome VARCHAR(50),
  genere ENUM('M', 'F'),
  indirizzo VARCHAR(100),
  citta VARCHAR(50),
  provincia CHAR(2) DEFAULT 'To',
  regione VARCHAR(50) DEFAULT 'Piemonte',
  email VARCHAR(50) NOT NULL UNIQUE,
  data_nascita DATE,
  ins TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
);