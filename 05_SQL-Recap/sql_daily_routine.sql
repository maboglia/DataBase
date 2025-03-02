
-- 1. Creazione Database e Utente
CREATE DATABASE EsercizioSQL;
CREATE USER 'esercizio_user'@'localhost' IDENTIFIED BY 'password123';
GRANT ALL PRIVILEGES ON EsercizioSQL.* TO 'esercizio_user'@'localhost';
FLUSH PRIVILEGES;

-- 2. Creazione Tabelle
USE EsercizioSQL;

CREATE TABLE Clienti (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Prodotti (
    id_prodotto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    prezzo DECIMAL(10,2) NOT NULL CHECK (prezzo > 0),
    giacenza INT NOT NULL DEFAULT 100
);

CREATE TABLE Ordini (
    id_ordine INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_prodotto INT,
    quantita INT NOT NULL CHECK (quantita > 0),
    data_ordine DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clienti(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_prodotto) REFERENCES Prodotti(id_prodotto) ON DELETE CASCADE
);

-- 3. Inserimento Dati
INSERT INTO Clienti (nome, email) VALUES 
('Mario Rossi', 'mario.rossi@email.com'),
('Luca Bianchi', 'luca.bianchi@email.com');

INSERT INTO Prodotti (nome, prezzo) VALUES 
('Laptop', 1200.00),
('Smartphone', 800.00);

INSERT INTO Ordini (id_cliente, id_prodotto, quantita) VALUES 
(1, 1, 2),
(2, 2, 1);

-- 4. Query di Lettura
SELECT Ordini.id_ordine, Clienti.nome AS Cliente, Prodotti.nome AS Prodotto, Ordini.quantita, Prodotti.prezzo, 
(Ordini.quantita * Prodotti.prezzo) AS Totale
FROM Ordini
INNER JOIN Clienti USING(id_cliente)
INNER JOIN Prodotti USING(id_prodotto);

SELECT Clienti.nome, COUNT(Ordini.id_ordine) AS NumeroOrdini
FROM Clienti
LEFT JOIN Ordini USING(id_cliente)
GROUP BY Clienti.nome;

SELECT Clienti.nome, COUNT(Ordini.id_ordine) AS NumeroOrdini
FROM Clienti
JOIN Ordini USING(id_cliente)
GROUP BY Clienti.nome
HAVING COUNT(Ordini.id_ordine) > 1;

SELECT Clienti.nome, SUM(Prodotti.prezzo * Ordini.quantita) AS TotaleSpeso
FROM Ordini
JOIN Clienti USING(id_cliente)
JOIN Prodotti USING(id_prodotto)
GROUP BY Clienti.nome;

-- 5. Update e Delete
UPDATE Prodotti SET prezzo = 1300.00 WHERE nome = 'Laptop';

DELETE FROM Ordini WHERE id_ordine = 2;

-- 6. Test Vincoli
INSERT INTO Ordini (id_cliente, id_prodotto, quantita) VALUES (1, 1, -1);

-- 7. Subquery
SELECT nome, email FROM Clienti WHERE id_cliente IN (SELECT id_cliente FROM Ordini);
SELECT nome FROM Prodotti WHERE id_prodotto IN (SELECT id_prodotto FROM Ordini GROUP BY id_prodotto HAVING COUNT(*) > 1);
SELECT nome FROM Clienti WHERE id_cliente = (SELECT id_cliente FROM Ordini GROUP BY id_cliente ORDER BY SUM(quantita * prezzo) DESC LIMIT 1);
SELECT nome FROM Prodotti WHERE id_prodotto NOT IN (SELECT id_prodotto FROM Ordini);

-- 8. Stored Procedure
DELIMITER //
CREATE PROCEDURE AggiungiOrdine(IN cliente INT, IN prodotto INT, IN qty INT)
BEGIN
    DECLARE stock INT;
    SELECT giacenza INTO stock FROM Prodotti WHERE id_prodotto = prodotto;
    IF stock >= qty THEN
        INSERT INTO Ordini (id_cliente, id_prodotto, quantita) VALUES (cliente, prodotto, qty);
        UPDATE Prodotti SET giacenza = giacenza - qty WHERE id_prodotto = prodotto;
    END IF;
END;
//
DELIMITER ;

-- 9. Funzione Custom
DELIMITER //
CREATE FUNCTION CalcolaTotaleOrdine(ordine INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE totale DECIMAL(10,2);
    SELECT SUM(quantita * prezzo) INTO totale
    FROM Ordini
    JOIN Prodotti USING(id_prodotto)
    WHERE id_ordine = ordine;
    RETURN totale;
END;
//
DELIMITER ;

-- 10. Trigger
DELIMITER //
CREATE TRIGGER AggiornaGiacenza AFTER INSERT ON Ordini
FOR EACH ROW
BEGIN
    UPDATE Prodotti SET giacenza = giacenza - NEW.quantita WHERE id_prodotto = NEW.id_prodotto;
END;
//
DELIMITER ;

-- 11. Query Avanzate
SELECT nome FROM Clienti WHERE id_cliente IN (
    SELECT id_cliente FROM Ordini GROUP BY id_cliente HAVING COUNT(DISTINCT id_prodotto) > 1
);

SELECT nome FROM Clienti WHERE id_cliente = (
    SELECT id_cliente FROM Ordini JOIN Prodotti USING(id_prodotto) GROUP BY id_cliente ORDER BY SUM(quantita * prezzo) DESC LIMIT 1
);

SELECT id_cliente, COUNT(DISTINCT id_prodotto) AS prodotti_diversi FROM Ordini GROUP BY id_cliente;

SELECT nome FROM Prodotti WHERE giacenza < (SELECT SUM(quantita) FROM Ordini WHERE id_prodotto = Prodotti.id_prodotto GROUP BY id_prodotto);

-- 12. Eliminazione Dati
DELETE FROM Ordini;
DROP TABLE Ordini, Clienti, Prodotti;
DROP USER 'esercizio_user'@'localhost';
DROP DATABASE EsercizioSQL;
