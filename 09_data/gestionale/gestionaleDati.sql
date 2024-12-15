INSERT INTO articolo (id, descrizione, prezzo, categoria, rimanenza) VALUES
(1, 'monitor', '350.00', 'hardware', 87),
(2, 'chiavetta', '38.50', 'hardware', 84),
(3, 'hard-disk', '300.00', 'hardware', 94),
(4, 'smartwatch', '400.00', 'hardware', 96),
(5, 'Photoshop', '700.00', 'software', 98),
(6, 'Office', '350.50', 'software', 95),
(7, 'Webcam', '68.00', 'hardware', 94),
(8, 'Adobe CC', '1200.00', 'software', 100),
(9, 'Office', '120.00', 'software', 100);

INSERT INTO cliente (id, cognome, nome, telefono, email, indirizzo, citta, provincia, regione, credito) VALUES
(1, 'rossi', 'paolo', '0116702323', 'paolo25@gmail.com', 'Via Roma 25', 'torino', 'To', 'Piemonte', 107),
(2, 'mori', 'marco', '0116704040', 'marco18@gmail.com', 'Via Torino 18', 'milano', 'Mi', 'Lombardia', 0),
(3, 'bianchi', 'luca', '0116701010', 'luca2@gmail.com', 'Via Milano 2', 'bologna', 'Bo', 'Emilia-Romagna', 2119),
(4, 'verdi', 'mario', '0116702020', 'mario128@gmail.com', 'Corso Francia 128', 'torino', 'To', 'Piemonte', 0),
(5, 'rosso', 'alberto', '0116707070', 'alberto12@icloud.com', 'Corso Svizzera 12', 'milano', 'Mi', 'Lombardia', 789),
(6, 'esposito', 'franco', '0119978812', 'francoe@icloud.com', 'Via Roma 3', 'Asti', 'At', 'Piemonte', 1875),
(7, 'bruni', 'carlo', '0117778816', 'brunicarlo@icloud.com', 'Corso Stati Uniti 13', 'Torino', 'To', 'Piemonte', 0);

INSERT INTO ufficio (id, nome, luogo_id) VALUES
(1, 'IT', 20),
(2, 'Amministrazione', 12),
(3, 'Commerciale', 12),
(4, 'Logistica', 20);

INSERT INTO impiegato (id, nome, cognome, ruolo, rif_to, stipendio, ufficio_id) VALUES
(1, 'Mario', 'Rossi', 'tecnico', NULL, '2500.00', 1),
(2, 'Marco', 'Bianchi', 'amministrativo', 7, '1600.00', 2),
(3, 'Paolo', 'Verdi', 'amministrativo', 7, '1600.00', 2),
(4, 'Enrico', 'Marrone', 'venditore', 8, '1300.00', 3),
(5, 'Nicola', 'Testa', 'venditore', 8, '1300.00', 3),
(6, 'Franco', 'Barba', 'tecnico', 1, '1500.00', 1),
(7, 'Elena', 'Totti', 'amministrativo', NULL, '2600.00', 2),
(8, 'Paola', 'Capra', 'venditore', NULL, '2300.00', 3),
(9, 'Mauro', 'Barba', 'venditore', 8, '1300.00', 3);

INSERT INTO ordine (id, cliente_id, impiegato_id, data, consegna) VALUES
(1, 1, 4, '2017-12-01', 'consegnato'),
(2, 3, 4, '2018-01-11', 'consegnato'),
(3, 5, 8, '2018-01-21', 'da spedire'),
(4, 3, 4, '2018-01-23', 'spedito'),
(5, 6, 4, '2018-02-03', 'consegnato'),
(7, 6, 8, '2018-02-13', 'da spedire'),
(12, 3, 4, '2018-02-28', 'spedito');

INSERT INTO ordine_dettaglio (ordine_id, articolo_id, quantita) VALUES
(1, 2, 1),
(1, 7, 3),
(2, 5, 1),
(2, 6, 5),
(3, 2, 10),
(3, 4, 1),
(4, 1, 3),
(4, 3, 2),
(4, 7, 1),
(5, 3, 2),
(5, 7, 1),
(5, 4, 3),
(5, 5, 1),
(7, 2, 5),
(7, 3, 2),
(7, 7, 1),
(12, 1, 10);

