# Host: localhost
# Database: myShop
CREATE DATABASE myShop; 
USE myShop              

# Host: localhost
# Database: myShop
# Table: 'prodotti'
# 
CREATE TABLE `prodotti` (
  `ID` int(11) NOT NULL default '0',
  `Prodotto` varchar(100) NOT NULL default '',
  `Descrizione` varchar(100) NOT NULL default '',
  `Prezzo` float(10,0) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) TYPE=MyISAM;

# Host: localhost
# Database: myShop
# Table: 'intestazioni_ordini'
# 
CREATE TABLE `intestazioni_ordini` (
  `ID` int(11) NOT NULL default '0',
  `Data` datetime NOT NULL default '0000-00-00 00:00:00',
  `Nome` varchar(100) NOT NULL default '',
  `Cognome` varchar(100) NOT NULL default '',
  `Indirizzo` varchar(100) NOT NULL default '',
  `Pagamento` varchar(100) NOT NULL default '',
  `Consegna` varchar(100) NOT NULL default '',
  `SpeseSpedizione` float NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) TYPE=InnoDB;

# Host: localhost
# Database: MyShop
# Table: 'righe_ordini'
# 
CREATE TABLE `righe_ordini` (
  `IDOrdine` int(11) NOT NULL default '0',
  `IDProdotto` int(11) NOT NULL default '0',
  `Prezzo` float NOT NULL default '0',
  `Quantita` int(11) NOT NULL default '0'
) TYPE=InnoDB;

# Host: localhost
# Database: myShop
# Table: 'utenti_backoffice'
# 
CREATE TABLE `utenti_backoffice` (
  `Username` varchar(100) NOT NULL default '',
  `Password` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`Username`)
) TYPE=MyISAM;

INSERT INTO prodotti (ID, Prodotto, Descrizione, Prezzo) VALUES (1, 'Hard Disk 400 GB', '7200 giri, 16MB cache, Controller Serial Ata', 230);

INSERT INTO prodotti (ID, Prodotto, Descrizione, Prezzo) VALUES (2, 'Monitor CRT', '17''''', 130);

INSERT INTO prodotti (ID, Prodotto, Descrizione, Prezzo) VALUES (3, 'Modulo RAM 512 MB', 'Modulo SDRAM 512 MB PC-133', 70);

INSERT INTO utenti_backoffice (Username, Password) VALUES ('admin', 'shop_owner');