-- ====================================
-- Database: Luoghi Turistici
-- Descrizione: Gestione di città, attrazioni turistiche, visitatori e recensioni
-- ====================================

-- DROP delle tabelle se esistono già (per evitare conflitti)
DROP TABLE IF EXISTS recensione;
DROP TABLE IF EXISTS visita;
DROP TABLE IF EXISTS visitatore;
DROP TABLE IF EXISTS attrazione;
DROP TABLE IF EXISTS citta;

-- ==============================
-- Tabella: Città
-- ==============================
CREATE TABLE citta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    paese VARCHAR(100) NOT NULL,
    popolazione INT,
    regione VARCHAR(100)
);

-- ==============================
-- Tabella: Attrazione turistica
-- ==============================
CREATE TABLE attrazione (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    tipo VARCHAR(50), -- Esempi: museo, monumento, parco, ecc.
    descrizione TEXT,
    citta_id INT,
    FOREIGN KEY (citta_id) REFERENCES citta(id)
);

-- ==============================
-- Tabella: Visitatore
-- ==============================
CREATE TABLE visitatore (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nazionalita VARCHAR(50),
    data_nascita DATE
);

-- ==============================
-- Tabella: Visita (relazione attrazione-visitatori)
-- ==============================
CREATE TABLE visita (
    id INT AUTO_INCREMENT PRIMARY KEY,
    attrazione_id INT,
    visitatore_id INT,
    data_visita DATE,
    FOREIGN KEY (attrazione_id) REFERENCES attrazione(id),
    FOREIGN KEY (visitatore_id) REFERENCES visitatore(id)
);

-- ==============================
-- Tabella: Recensione
-- ==============================
CREATE TABLE recensione (
    id INT AUTO_INCREMENT PRIMARY KEY,
    visita_id INT,
    voto INT CHECK (voto BETWEEN 1 AND 5),
    commento TEXT,
    data_recensione DATE,
    FOREIGN KEY (visita_id) REFERENCES visita(id)
);

-- ==============================
-- Inserimento dati: Città
-- ==============================
INSERT INTO citta (nome, paese, popolazione, regione) VALUES
('Roma', 'Italia', 2873000, 'Lazio'),
('Parigi', 'Francia', 2148000, 'Île-de-France'),
('New York', 'USA', 8419000, 'New York');

-- ==============================
-- Inserimento dati: Attrazioni
-- ==============================
INSERT INTO attrazione (nome, tipo, descrizione, citta_id) VALUES
('Colosseo', 'Monumento', 'Antico anfiteatro romano.', 1),
('Museo del Louvre', 'Museo', 'Famoso museo con opere d’arte come la Gioconda.', 2),
('Statua della Libertà', 'Monumento', 'Iconico simbolo degli USA.', 3);

-- ==============================
-- Inserimento dati: Visitatori
-- ==============================
INSERT INTO visitatore (nome, nazionalita, data_nascita) VALUES
('Luca Rossi', 'Italia', '1990-06-15'),
('Emma Dubois', 'Francia', '1985-12-05'),
('John Smith', 'USA', '1978-04-20');

-- ==============================
-- Inserimento dati: Visite
-- ==============================
INSERT INTO visita (attrazione_id, visitatore_id, data_visita) VALUES
(1, 1, '2024-07-10'),
(2, 2, '2024-08-01'),
(3, 3, '2024-06-15'),
(1, 2, '2024-09-20');

-- ==============================
-- Inserimento dati: Recensioni
-- ==============================
INSERT INTO recensione (visita_id, voto, commento, data_recensione) VALUES
(1, 5, 'Magnifico! Un’esperienza unica.', '2024-07-11'),
(2, 4, 'Molto bello ma affollato.', '2024-08-02'),
(3, 5, 'Iconica! Da vedere almeno una volta nella vita.', '2024-06-16'),
(4, 3, 'Interessante, ma poco curato.', '2024-09-21');
