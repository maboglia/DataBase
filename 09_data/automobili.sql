-- Creazione della tabella 'automobili'
CREATE TABLE automobili (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50),
    modello VARCHAR(50),
    cilindrata INT,
    posti INT,
    prezzo DECIMAL(10, 2)
);

-- Inserimento di 20 righe di dati fake
INSERT INTO automobili (marca, modello, cilindrata, posti, prezzo) VALUES
('Fiat', 'Panda', 1200, 5, 13000.00),
('Ford', 'Focus', 1500, 5, 20000.00),
('Volkswagen', 'Golf', 1600, 5, 25000.00),
('Toyota', 'Yaris', 1000, 5, 15000.00),
('BMW', 'Serie 3', 2000, 5, 35000.00),
('Mercedes', 'Classe A', 1800, 5, 33000.00),
('Audi', 'A4', 2000, 5, 36000.00),
('Renault', 'Clio', 1200, 5, 14000.00),
('Peugeot', '208', 1300, 5, 16000.00),
('Kia', 'Sportage', 1700, 5, 27000.00),
('Hyundai', 'Tucson', 1800, 5, 28000.00),
('Jeep', 'Renegade', 1400, 5, 22000.00),
('Honda', 'Civic', 1500, 5, 24000.00),
('Nissan', 'Qashqai', 1600, 5, 26000.00),
('Mazda', 'CX-5', 2000, 5, 32000.00),
('Volvo', 'XC40', 2000, 5, 40000.00),
('Tesla', 'Model 3', 0, 5, 45000.00),
('Chevrolet', 'Spark', 1200, 4, 11000.00),
('Suzuki', 'Swift', 1300, 5, 14000.00),
('Subaru', 'Outback', 2500, 5, 35000.00);
