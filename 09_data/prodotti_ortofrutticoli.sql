-- Creazione tabella prodotti ortofrutticoli
CREATE TABLE prodotti_ortofrutticoli (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    origine VARCHAR(100),
    prezzo_kg DECIMAL(5,2),
    disponibilita ENUM('alta', 'media', 'bassa')
);

-- Inserimento dati di esempio
INSERT INTO prodotti_ortofrutticoli (nome, categoria, origine, prezzo_kg, disponibilita) VALUES
('Mele Fuji', 'Frutta', 'Trentino-Alto Adige', 1.85, 'alta'),
('Pere Abate', 'Frutta', 'Emilia-Romagna', 2.10, 'media'),
('Arance Navel', 'Frutta', 'Sicilia', 1.25, 'alta'),
('Banane', 'Frutta', 'Ecuador', 1.40, 'alta'),
('Pomodori Datterino', 'Verdura', 'Campania', 2.95, 'media'),
('Zucchine', 'Verdura', 'Lazio', 1.80, 'alta'),
('Melanzane', 'Verdura', 'Sicilia', 2.30, 'bassa'),
('Cipolle Dorate', 'Verdura', 'Veneto', 0.95, 'alta'),
('Patate Novelle', 'Verdura', 'Piemonte', 1.10, 'alta'),
('Carote', 'Verdura', 'Emilia-Romagna', 0.90, 'alta'),
('Insalata Gentile', 'Ortaggi', 'Lombardia', 1.20, 'media'),
('Radicchio Rosso', 'Ortaggi', 'Veneto', 2.50, 'bassa'),
('Finocchi', 'Ortaggi', 'Toscana', 1.45, 'media'),
('Peperoni Rossi', 'Verdura', 'Calabria', 2.75, 'bassa'),
('Uva Italia', 'Frutta', 'Puglia', 2.20, 'media');

INSERT INTO prodotti_ortofrutticoli (nome, categoria, origine, prezzo_kg, disponibilita) VALUES
('Fragole', 'Frutta', 'Basilicata', 3.50, 'alta'),
('Ciliegie Ferrovia', 'Frutta', 'Puglia', 4.20, 'media'),
('Albicocche', 'Frutta', 'Campania', 2.80, 'bassa'),
('Pesche Nettarine', 'Frutta', 'Emilia-Romagna', 2.10, 'alta'),
('Anguria', 'Frutta', 'Sardegna', 0.70, 'alta'),
('Melone Gialletto', 'Frutta', 'Sicilia', 1.15, 'media'),
('Cetrioli', 'Verdura', 'Lazio', 1.00, 'alta'),
('Fagiolini', 'Verdura', 'Toscana', 2.60, 'media'),
('Lattuga Romana', 'Ortaggi', 'Marche', 1.25, 'alta'),
('Cavolfiore', 'Ortaggi', 'Abruzzo', 1.80, 'media'),
('Broccoli', 'Ortaggi', 'Puglia', 1.90, 'media'),
('Spinaci', 'Ortaggi', 'Campania', 1.65, 'alta'),
('Zucca', 'Verdura', 'Lombardia', 1.20, 'bassa'),
('Cavolini di Bruxelles', 'Verdura', 'Trentino-Alto Adige', 2.50, 'media'),
('Asparagi', 'Ortaggi', 'Veneto', 3.80, 'bassa');


INSERT INTO prodotti_ortofrutticoli (nome, categoria, origine, prezzo_kg, disponibilita) VALUES
('Pomodori Datterini Bio', 'Verdura', 'Sicilia', 3.20, 'alta'),
('Mele Fuji Bio', 'Frutta', 'Trentino', 2.90, 'media'),
('Pere Williams', 'Frutta', 'Piemonte', 2.30, 'alta'),
('Uva Italia', 'Frutta', 'Puglia', 2.10, 'alta'),
('Cachi', 'Frutta', 'Emilia-Romagna', 2.70, 'bassa'),
('Mandarini', 'Frutta', 'Calabria', 1.90, 'media'),
('Finocchi', 'Ortaggi', 'Lazio', 1.30, 'alta'),
('Peperoni Rossi', 'Verdura', 'Sardegna', 2.60, 'alta'),
('Peperoni Verdi', 'Verdura', 'Abruzzo', 2.40, 'media'),
('Cipolle Rosse di Tropea', 'Ortaggi', 'Calabria', 1.80, 'alta'),
('Carote Bio', 'Verdura', 'Toscana', 2.20, 'alta'),
('Radicchio Tardivo', 'Ortaggi', 'Veneto', 3.40, 'bassa'),
('Ravanelli', 'Verdura', 'Emilia-Romagna', 1.00, 'media'),
('Zucchine', 'Verdura', 'Lombardia', 1.60, 'alta'),
('Patate Novelle', 'Ortaggi', 'Campania', 1.10, 'alta');

INSERT INTO prodotti_ortofrutticoli (nome, categoria, origine, prezzo_kg, disponibilita) VALUES
('Pomodori San Marzano', 'Verdura', 'Campania', 2.80, 'alta'),
('Carciofi Romaneschi', 'Ortaggi', 'Lazio', 3.50, 'media'),
('Cavolo Nero', 'Ortaggi', 'Toscana', 2.90, 'alta'),
('Cavolo Cappuccio', 'Ortaggi', 'Emilia-Romagna', 1.50, 'media'),
('Cavolo Rosso', 'Ortaggi', 'Lombardia', 1.70, 'alta'),
('Cavolfiore Romanesco', 'Ortaggi', 'Sicilia', 2.20, 'bassa'),
('Broccoli Romaneschi', 'Ortaggi', 'Lazio', 2.40, 'media'),
('Spinaci Novelli', 'Ortaggi', 'Campania', 1.80, 'alta'),
('Cavolo di Bruxelles', 'Ortaggi', 'Trentino-Alto Adige', 2.60, 'media'),
('Cavolo Broccolo', 'Ortaggi', 'Emilia-Romagna', 2.50, 'alta'),
('Carciofi Romaneschi Bio', 'Ortaggi', 'Lazio', 4.00, 'media'),
('Cavolo Nero Bio', 'Ortaggi', 'Toscana', 3.20, 'alta'),
('Cavolo Cappuccio Bio', 'Ortaggi', 'Emilia-Romagna', 2.70, 'media'),
('Cavolo Rosso Bio', 'Ortaggi', 'Lombardia', 2.90, 'alta'),
('Cavolfiore Romanesco Bio', 'Ortaggi', 'Sicilia', 3.10, 'bassa'),
('Broccoli Romaneschi Bio', 'Ortaggi', 'Lazio', 3.00, 'media'),
('Spinaci Novelli Bio', 'Ortaggi', 'Campania', 2.50, 'alta'),
('Cavolo di Bruxelles Bio', 'Ortaggi', 'Trentino-Alto Adige', 3.20, 'media'),
('Cavolo Broccolo Bio', 'Ortaggi', 'Emilia-Romagna', 2.90, 'alta');
('Fagiolini Bio', 'Verdura', 'Toscana', 2.80, 'alta'),
('Piselli Freschi', 'Verdura', 'Emilia-Romagna', 2.50, 'media'),
('Cavolini di Bruxelles Bio', 'Ortaggi', 'Trentino-Alto Adige', 3.00, 'bassa'),
('Asparagi Verdi', 'Ortaggi', 'Veneto', 4.50, 'alta'),
('Carciofi Spinosi', 'Ortaggi', 'Sicilia', 3.20, 'media'),
('Carciofi Violetto', 'Ortaggi', 'Lazio', 3.00, 'alta'),
('Carciofi di Paestum', 'Ortaggi', 'Campania', 3.50, 'media'),
('Carciofi di Albenga', 'Ortaggi', 'Liguria', 3.80, 'bassa'),
('Carciofi di Catania', 'Ortaggi', 'Sicilia', 4.00, 'alta'),
('Carciofi di Sant’Erasmo', 'Ortaggi', 'Veneto', 3.60, 'media'),
('Carciofi di Nardò', 'Ortaggi', 'Puglia', 3.40, 'alta'),
('Carciofi di Ciriè', 'Ortaggi', 'Piemonte', 3.20, 'media'),
('Carciofi di Albenga Bio', 'Ortaggi', 'Liguria', 4.00, 'bassa'),
('Carciofi di Sant’Erasmo Bio', 'Ortaggi', 'Veneto', 3.80, 'alta'),
('Carciofi di Nardò Bio', 'Ortaggi', 'Puglia', 3.60, 'media');