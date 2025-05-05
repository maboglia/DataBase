
CREATE TABLE listino_bar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sezione VARCHAR(100),
    prodotto VARCHAR(255),
    prezzo DECIMAL(5,2)
);

INSERT INTO listino_bar (sezione, prodotto, prezzo) VALUES
('CAFFETTERIA', 'Caffè Espresso/Americano', 1.20),
('CAFFETTERIA', 'Correzione con Liquori', 0.80),
('CAFFETTERIA', 'Caffè Decaffeinato', 1.30),
('CAFFETTERIA', 'Caffè Ginseng espresso', 1.70),
('CAFFETTERIA', 'Caffè Ginseng tazza grande', 1.90),
('CAFFETTERIA', 'Caffè Macchiato (latte)', 1.20),
('CAFFETTERIA', 'Caffè Marocchino (latte)', 1.80),
('CAFFETTERIA', 'Cappuccino di soia', 1.80),
('CAFFETTERIA', 'Cioccolata in tazza (latte)', 3.00),
('CAFFETTERIA', 'Latte bianco', 1.20),
('CAFFETTERIA', 'Latte macchiato/Caffè-latte', 1.60),
('CAFFETTERIA', 'Orzo espresso (glutine)', 1.70),
('CAFFETTERIA', 'Orzo in tazza grande (glutine)', 1.90),
('CAFFETTERIA', 'Tè, camomilla, infusi in teiera', 1.80),

('BIBITE', 'Acqua minerale bicchiere', 0.50),
('BIBITE', 'Bibite alla spina piccole', 2.50),
('BIBITE', 'Bibite alla spina medie', 4.00),
('BIBITE', 'Spremuta di agrumi', 3.50),
('BIBITE', 'Succhi di frutta 200 ml.', 2.80),
('BIBITE', 'The freddo Bott. 0,5 L.', 3.00),

('BIRRE (glutine)', 'Birra Forst spina 20 cl.', 3.00),
('BIRRE (glutine)', 'Birra Forst spina 40 cl.', 4.50),
('BIRRE (glutine)', 'Beck\'s 33 cl./Moretti Radler 33 cl.', 3.50),
('BIRRE (glutine)', 'Heineken 33 cl./Forst 33 cl. 1857', 3.50),
('BIRRE (glutine)', 'Ichnusa non filtrata 33 cl.', 4.00),
('BIRRE (glutine)', 'Peroni Senza Glutine 33 cl.', 4.00),

('SNACKS', 'Panini', 3.50),
('SNACKS', 'Tramezzini', 2.00),
('SNACKS', 'Pizzetta bianca', 2.50),
('SNACKS', 'Pizzetta margherita', 2.50),
('SNACKS', 'Pizzette farcite', 3.00),
('SNACKS', 'Patatine', 1.80),

('PASTICCERIA', 'Muffin', 2.20),
('PASTICCERIA', 'Pasticceria Mignon', 1.00),
('PASTICCERIA', 'Biscotteria Mignon', 0.60),

('GELATERIA E GRANITE', 'Crema al caffè', 2.50),
('GELATERIA E GRANITE', 'Gelato sfuso grande', 3.50),
('GELATERIA E GRANITE', 'Gelato sfuso piccolo', 2.50),
('GELATERIA E GRANITE', 'Granite', 2.50),

('VINI (solfiti)', 'Calice prosecco/spumante', 4.00),
('VINI (solfiti)', 'Calice vino bianco o rosso', 4.00),

('APERITIVI', 'Analcolici in bottiglietta', 3.00),
('APERITIVI', 'Spritz (solfiti)', 3.50);


INSERT INTO listino_bar (sezione, prodotto, prezzo) VALUES
('SUPER ALCOLICI', 'Amari, Grappe, Sambuca', 3.00),
('SUPER ALCOLICI', 'Amari speciali', 3.50),
('SUPER ALCOLICI', 'Grappe barricate', 3.50),
('SUPER ALCOLICI', 'Whisky, Cognac, Brandy', 4.00),
('SUPER ALCOLICI', 'Vodka, Rum, Gin', 4.00),
('SUPER ALCOLICI', 'Cocktail analcolici', 3.50),
('SUPER ALCOLICI', 'Cocktail alcolici', 5.00);



INSERT INTO listino_bar (sezione, prodotto, prezzo) VALUES
-- CAFFETTERIA
('CAFFETTERIA', 'Caffè', 1.00),
('CAFFETTERIA', 'Caffè macchiato', 1.10),
('CAFFETTERIA', 'Caffè decaffeinato', 1.10),
('CAFFETTERIA', 'Caffè d’orzo', 1.10),
('CAFFETTERIA', 'Caffè al ginseng', 1.20),
('CAFFETTERIA', 'Cappuccino', 1.30),
('CAFFETTERIA', 'Latte macchiato', 1.30),
('CAFFETTERIA', 'Cioccolata calda', 1.80),

-- BEVANDE
('BEVANDE', 'Acqua naturale 0,50 cl', 0.50),
('BEVANDE', 'Acqua frizzante 0,50 cl', 0.50),
('BEVANDE', 'Bibite lattina', 1.50),
('BEVANDE', 'Succhi di frutta', 1.50),
('BEVANDE', 'The freddo', 1.50),

-- BIRRE
('BIRRE', 'Birra analcolica 0,33 cl', 2.00),
('BIRRE', 'Birra 0,33 cl', 2.50),
('BIRRE', 'Birra 0,50 cl', 3.50),

-- VINI
('VINI', 'Calice di vino', 2.00),
('VINI', 'Bottiglia di vino', 6.00),

-- APERITIVI
('APERITIVI', 'Aperitivi analcolici', 2.50),
('APERITIVI', 'Aperitivi alcolici', 3.00),
('APERITIVI', 'Spritz', 3.00),

-- SUPER ALCOLICI
('SUPER ALCOLICI', 'Amari, Grappe, Sambuca', 3.00),
('SUPER ALCOLICI', 'Amari speciali', 3.50),
('SUPER ALCOLICI', 'Grappe barricate', 3.50),
('SUPER ALCOLICI', 'Whisky, Cognac, Brandy', 4.00),
('SUPER ALCOLICI', 'Vodka, Rum, Gin', 4.00),
('SUPER ALCOLICI', 'Cocktail analcolici', 3.50),
('SUPER ALCOLICI', 'Cocktail alcolici', 5.00);
