## NOTE

Codice SQL stile **PostgreSQL** (consigliato). 
Se vuoi, adattalo a MySQL puro.

---

# ✅ FILE 1 — `schema.sql` (DDL completo)

```sql
-- ==========================================
-- schema.sql
-- Database: scuola
-- ==========================================

DROP TABLE IF EXISTS esame;
DROP TABLE IF EXISTS docente_materia;
DROP TABLE IF EXISTS iscrizione;
DROP TABLE IF EXISTS studente;
DROP TABLE IF EXISTS docente;
DROP TABLE IF EXISTS materia;
DROP TABLE IF EXISTS classe;

-- ==========================================
-- TABELLA CLASSE
-- ==========================================
CREATE TABLE classe (
    id_classe SERIAL PRIMARY KEY,
    anno INT NOT NULL CHECK (anno BETWEEN 1 AND 5),
    sezione VARCHAR(5) NOT NULL,
    indirizzo VARCHAR(100) NOT NULL,
    UNIQUE (anno, sezione, indirizzo)
);

-- ==========================================
-- TABELLA STUDENTE
-- ==========================================
CREATE TABLE studente (
    id_studente SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    data_nascita DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- ==========================================
-- TABELLA DOCENTE
-- ==========================================
CREATE TABLE docente (
    id_docente SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- ==========================================
-- TABELLA MATERIA
-- ==========================================
CREATE TABLE materia (
    id_materia SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    ore_settimanali INT NOT NULL CHECK (ore_settimanali BETWEEN 1 AND 10)
);

-- ==========================================
-- TABELLA ISCRIZIONE (storico classe per anno scolastico)
-- ==========================================
CREATE TABLE iscrizione (
    id_iscrizione SERIAL PRIMARY KEY,
    id_studente INT NOT NULL,
    id_classe INT NOT NULL,
    anno_scolastico VARCHAR(9) NOT NULL, -- es: 2025/2026

    CONSTRAINT fk_iscrizione_studente
        FOREIGN KEY (id_studente)
        REFERENCES studente(id_studente)
        ON DELETE CASCADE,

    CONSTRAINT fk_iscrizione_classe
        FOREIGN KEY (id_classe)
        REFERENCES classe(id_classe)
        ON DELETE RESTRICT,

    CONSTRAINT uq_iscrizione UNIQUE (id_studente, anno_scolastico)
);

-- ==========================================
-- TABELLA DOCENTE_MATERIA (relazione N:M)
-- ==========================================
CREATE TABLE docente_materia (
    id_docente INT NOT NULL,
    id_materia INT NOT NULL,

    PRIMARY KEY (id_docente, id_materia),

    CONSTRAINT fk_dm_docente
        FOREIGN KEY (id_docente)
        REFERENCES docente(id_docente)
        ON DELETE CASCADE,

    CONSTRAINT fk_dm_materia
        FOREIGN KEY (id_materia)
        REFERENCES materia(id_materia)
        ON DELETE CASCADE
);

-- ==========================================
-- TABELLA ESAME
-- ==========================================
CREATE TABLE esame (
    id_esame SERIAL PRIMARY KEY,
    id_studente INT NOT NULL,
    id_materia INT NOT NULL,
    data_esame DATE NOT NULL,
    voto INT NOT NULL CHECK (voto BETWEEN 2 AND 10),
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('orale','scritto','pratico')),

    CONSTRAINT fk_esame_studente
        FOREIGN KEY (id_studente)
        REFERENCES studente(id_studente)
        ON DELETE CASCADE,

    CONSTRAINT fk_esame_materia
        FOREIGN KEY (id_materia)
        REFERENCES materia(id_materia)
        ON DELETE RESTRICT
);

-- ==========================================
-- INDICI CONSIGLIATI
-- ==========================================
CREATE INDEX idx_esame_studente ON esame(id_studente);
CREATE INDEX idx_esame_materia ON esame(id_materia);
CREATE INDEX idx_iscrizione_classe ON iscrizione(id_classe);
CREATE INDEX idx_studente_email ON studente(email);
```

---

# ✅ FILE 2 — `dati.sql` (INSERT realistici)

```sql
-- ==========================================
-- dati.sql
-- Popolamento realistico DB scuola
-- ==========================================

-- CLASSI
INSERT INTO classe (anno, sezione, indirizzo) VALUES
(5, 'A', 'Informatica'),
(5, 'B', 'Informatica'),
(4, 'A', 'Elettronica');

-- MATERIE
INSERT INTO materia (nome, ore_settimanali) VALUES
('Matematica', 4),
('Informatica', 5),
('Italiano', 4),
('Inglese', 3),
('Sistemi e Reti', 4),
('TPSIT', 3);

-- DOCENTI
INSERT INTO docente (nome, cognome, email) VALUES
('Giovanni', 'Bianchi', 'giovanni.bianchi@scuola.it'),
('Laura', 'Verdi', 'laura.verdi@scuola.it'),
('Marco', 'Rossi', 'marco.rossi@scuola.it'),
('Anna', 'Neri', 'anna.neri@scuola.it'),
('Paolo', 'Ricci', 'paolo.ricci@scuola.it'),
('Silvia', 'Romano', 'silvia.romano@scuola.it'),
('Davide', 'Greco', 'davide.greco@scuola.it'),
('Marta', 'Galli', 'marta.galli@scuola.it');

-- DOCENTE_MATERIA (assegnazioni)
INSERT INTO docente_materia (id_docente, id_materia) VALUES
(1, 1), -- Bianchi -> Matematica
(2, 3), -- Verdi -> Italiano
(3, 2), -- Rossi -> Informatica
(4, 4), -- Neri -> Inglese
(5, 5), -- Ricci -> Sistemi e Reti
(6, 6), -- Romano -> TPSIT
(7, 2), -- Greco -> Informatica
(8, 1); -- Galli -> Matematica

-- STUDENTI (20)
INSERT INTO studente (nome, cognome, data_nascita, email) VALUES
('Mario', 'Rossi', '2007-02-10', 'mario.rossi@studenti.it'),
('Anna', 'Bianchi', '2006-11-21', 'anna.bianchi@studenti.it'),
('Luca', 'Verdi', '2007-05-14', 'luca.verdi@studenti.it'),
('Sara', 'Neri', '2006-08-03', 'sara.neri@studenti.it'),
('Davide', 'Ricci', '2007-01-30', 'davide.ricci@studenti.it'),
('Elena', 'Galli', '2006-06-18', 'elena.galli@studenti.it'),
('Matteo', 'Romano', '2007-09-12', 'matteo.romano@studenti.it'),
('Giulia', 'Greco', '2006-03-07', 'giulia.greco@studenti.it'),
('Federico', 'Costa', '2007-07-22', 'federico.costa@studenti.it'),
('Martina', 'Fontana', '2006-12-05', 'martina.fontana@studenti.it'),
('Simone', 'Ferrari', '2007-04-19', 'simone.ferrari@studenti.it'),
('Chiara', 'Marino', '2006-09-28', 'chiara.marino@studenti.it'),
('Alessandro', 'De Luca', '2007-10-11', 'alessandro.deluca@studenti.it'),
('Francesca', 'Rinaldi', '2006-02-15', 'francesca.rinaldi@studenti.it'),
('Giorgio', 'Conti', '2007-06-09', 'giorgio.conti@studenti.it'),
('Valentina', 'Serra', '2006-05-20', 'valentina.serra@studenti.it'),
('Stefano', 'Moretti', '2007-08-01', 'stefano.moretti@studenti.it'),
('Irene', 'Barbieri', '2006-01-17', 'irene.barbieri@studenti.it'),
('Andrea', 'Pellegrini', '2007-03-25', 'andrea.pellegrini@studenti.it'),
('Noemi', 'Fabbri', '2006-07-13', 'noemi.fabbri@studenti.it');

-- ISCRIZIONI (anno scolastico 2025/2026)
-- Distribuzione su 3 classi
INSERT INTO iscrizione (id_studente, id_classe, anno_scolastico) VALUES
(1, 1, '2025/2026'),
(2, 1, '2025/2026'),
(3, 1, '2025/2026'),
(4, 1, '2025/2026'),
(5, 1, '2025/2026'),
(6, 1, '2025/2026'),
(7, 2, '2025/2026'),
(8, 2, '2025/2026'),
(9, 2, '2025/2026'),
(10, 2, '2025/2026'),
(11, 2, '2025/2026'),
(12, 2, '2025/2026'),
(13, 3, '2025/2026'),
(14, 3, '2025/2026'),
(15, 3, '2025/2026'),
(16, 3, '2025/2026'),
(17, 3, '2025/2026'),
(18, 3, '2025/2026'),
(19, 1, '2025/2026'),
(20, 2, '2025/2026');

-- ESAMI (almeno 60, qui ne metto 80 circa)
-- Materie: 1 Matematica, 2 Informatica, 3 Italiano, 4 Inglese, 5 Sistemi e Reti, 6 TPSIT

INSERT INTO esame (id_studente, id_materia, data_esame, voto, tipo) VALUES
(1, 1, '2025-10-10', 7, 'scritto'),
(1, 2, '2025-10-15', 9, 'pratico'),
(1, 5, '2025-11-05', 8, 'orale'),
(1, 3, '2025-11-20', 6, 'orale'),

(2, 1, '2025-10-10', 6, 'scritto'),
(2, 2, '2025-10-15', 7, 'pratico'),
(2, 4, '2025-11-10', 8, 'orale'),
(2, 3, '2025-11-20', 7, 'orale'),

(3, 1, '2025-10-10', 5, 'scritto'),
(3, 2, '2025-10-15', 6, 'pratico'),
(3, 6, '2025-11-12', 7, 'pratico'),
(3, 5, '2025-11-25', 6, 'orale'),

(4, 1, '2025-10-10', 8, 'scritto'),
(4, 2, '2025-10-15', 8, 'pratico'),
(4, 3, '2025-11-20', 9, 'orale'),
(4, 4, '2025-12-02', 7, 'orale'),

(5, 1, '2025-10-10', 4, 'scritto'),
(5, 2, '2025-10-15', 5, 'pratico'),
(5, 6, '2025-11-12', 6, 'pratico'),
(5, 3, '2025-11-20', 5, 'orale'),

(6, 1, '2025-10-10', 7, 'scritto'),
(6, 2, '2025-10-15', 7, 'pratico'),
(6, 5, '2025-11-25', 8, 'orale'),
(6, 4, '2025-12-02', 7, 'orale'),

(7, 1, '2025-10-11', 9, 'scritto'),
(7, 2, '2025-10-18', 10, 'pratico'),
(7, 6, '2025-11-12', 9, 'pratico'),
(7, 5, '2025-11-25', 10, 'orale'),

(8, 1, '2025-10-11', 6, 'scritto'),
(8, 2, '2025-10-18', 7, 'pratico'),
(8, 3, '2025-11-20', 7, 'orale'),
(8, 4, '2025-12-02', 6, 'orale'),

(9, 1, '2025-10-11', 5, 'scritto'),
(9, 2, '2025-10-18', 6, 'pratico'),
(9, 5, '2025-11-25', 5, 'orale'),
(9, 6, '2025-11-12', 6, 'pratico'),

(10, 1, '2025-10-11', 8, 'scritto'),
(10, 2, '2025-10-18', 8, 'pratico'),
(10, 4, '2025-11-10', 9, 'orale'),
(10, 3, '2025-11-20', 7, 'orale'),

(11, 1, '2025-10-11', 7, 'scritto'),
(11, 2, '2025-10-18', 7, 'pratico'),
(11, 5, '2025-11-25', 8, 'orale'),
(11, 6, '2025-11-12', 8, 'pratico'),

(12, 1, '2025-10-11', 6, 'scritto'),
(12, 2, '2025-10-18', 6, 'pratico'),
(12, 3, '2025-11-20', 6, 'orale'),
(12, 4, '2025-12-02', 5, 'orale'),

(13, 1, '2025-10-12', 9, 'scritto'),
(13, 2, '2025-10-19', 9, 'pratico'),
(13, 5, '2025-11-25', 8, 'orale'),
(13, 6, '2025-11-12', 9, 'pratico'),

(14, 1, '2025-10-12', 7, 'scritto'),
(14, 2, '2025-10-19', 7, 'pratico'),
(14, 3, '2025-11-20', 8, 'orale'),
(14, 4, '2025-12-02', 7, 'orale'),

(15, 1, '2025-10-12', 5, 'scritto'),
(15, 2, '2025-10-19', 6, 'pratico'),
(15, 5, '2025-11-25', 6, 'orale'),
(15, 6, '2025-11-12', 5, 'pratico'),

(16, 1, '2025-10-12', 6, 'scritto'),
(16, 2, '2025-10-19', 7, 'pratico'),
(16, 3, '2025-11-20', 7, 'orale'),
(16, 4, '2025-12-02', 8, 'orale'),

(17, 1, '2025-10-12', 4, 'scritto'),
(17, 2, '2025-10-19', 5, 'pratico'),
(17, 5, '2025-11-25', 5, 'orale'),
(17, 6, '2025-11-12', 6, 'pratico'),

(18, 1, '2025-10-12', 8, 'scritto'),
(18, 2, '2025-10-19', 9, 'pratico'),
(18, 5, '2025-11-25', 9, 'orale'),
(18, 6, '2025-11-12', 8, 'pratico'),

(19, 1, '2025-10-10', 6, 'scritto'),
(19, 2, '2025-10-15', 6, 'pratico'),
(19, 4, '2025-11-10', 7, 'orale'),
(19, 3, '2025-11-20', 6, 'orale'),

(20, 1, '2025-10-11', 7, 'scritto'),
(20, 2, '2025-10-18', 8, 'pratico'),
(20, 5, '2025-11-25', 7, 'orale'),
(20, 6, '2025-11-12', 8, 'pratico');

-- Esami extra (seconda sessione)
INSERT INTO esame (id_studente, id_materia, data_esame, voto, tipo) VALUES
(1, 1, '2026-02-10', 8, 'orale'),
(2, 2, '2026-02-12', 8, 'orale'),
(3, 3, '2026-02-15', 6, 'scritto'),
(4, 5, '2026-02-20', 9, 'orale'),
(5, 1, '2026-02-10', 5, 'orale'),
(6, 6, '2026-02-18', 7, 'pratico'),
(7, 3, '2026-02-15', 10, 'orale'),
(8, 5, '2026-02-20', 6, 'orale'),
(9, 4, '2026-02-22', 5, 'orale'),
(10, 6, '2026-02-18', 8, 'pratico'),
(11, 3, '2026-02-15', 7, 'orale'),
(12, 5, '2026-02-20', 6, 'orale'),
(13, 4, '2026-02-22', 9, 'orale'),
(14, 6, '2026-02-18', 7, 'pratico'),
(15, 3, '2026-02-15', 6, 'orale'),
(16, 5, '2026-02-20', 8, 'orale'),
(17, 4, '2026-02-22', 6, 'orale'),
(18, 3, '2026-02-15', 9, 'orale'),
(19, 5, '2026-02-20', 7, 'orale'),
(20, 4, '2026-02-22', 8, 'orale');
```

---

# ✅ FILE 3 — `query.sql` (query step-by-step)

```sql
-- ==========================================
-- query.sql
-- Interrogazioni step-by-step (fondamenti SQL)
-- ==========================================

-- ==========================================
-- STEP 1: SELECT base
-- ==========================================

-- 1) Elenco studenti ordinati per cognome
SELECT * 
FROM studente
ORDER BY cognome, nome;

-- 2) Studenti nati dopo il 2007
SELECT *
FROM studente
WHERE data_nascita > '2007-01-01'
ORDER BY data_nascita;

-- 3) Materie con più di 3 ore settimanali
SELECT *
FROM materia
WHERE ore_settimanali > 3
ORDER BY ore_settimanali DESC;

-- 4) Esami con voto >= 8
SELECT *
FROM esame
WHERE voto >= 8
ORDER BY voto DESC, data_esame;

-- 5) Docenti con email dominio scuola.it
SELECT *
FROM docente
WHERE email LIKE '%@scuola.it'
ORDER BY cognome;


-- ==========================================
-- STEP 2: JOIN fondamentali
-- ==========================================

-- 6) Studenti con la classe (anno scolastico 2025/2026)
SELECT 
    s.id_studente,
    s.nome,
    s.cognome,
    c.anno,
    c.sezione,
    c.indirizzo,
    i.anno_scolastico
FROM studente s
JOIN iscrizione i ON s.id_studente = i.id_studente
JOIN classe c ON c.id_classe = i.id_classe
WHERE i.anno_scolastico = '2025/2026'
ORDER BY c.anno DESC, c.sezione, s.cognome;

-- 7) Esami dettagliati: studente + materia + voto
SELECT
    e.id_esame,
    s.nome,
    s.cognome,
    m.nome AS materia,
    e.voto,
    e.tipo,
    e.data_esame
FROM esame e
JOIN studente s ON s.id_studente = e.id_studente
JOIN materia m ON m.id_materia = e.id_materia
ORDER BY e.data_esame, s.cognome;

-- 8) Docenti e materie insegnate
SELECT
    d.nome,
    d.cognome,
    m.nome AS materia
FROM docente d
JOIN docente_materia dm ON d.id_docente = dm.id_docente
JOIN materia m ON m.id_materia = dm.id_materia
ORDER BY d.cognome, m.nome;

-- 9) Studenti che hanno sostenuto un esame di Informatica
SELECT DISTINCT
    s.id_studente,
    s.nome,
    s.cognome
FROM studente s
JOIN esame e ON s.id_studente = e.id_studente
JOIN materia m ON m.id_materia = e.id_materia
WHERE m.nome = 'Informatica'
ORDER BY s.cognome;

-- 10) Numero studenti per classe
SELECT
    c.anno,
    c.sezione,
    c.indirizzo,
    COUNT(i.id_studente) AS numero_studenti
FROM classe c
LEFT JOIN iscrizione i ON c.id_classe = i.id_classe
WHERE i.anno_scolastico = '2025/2026'
GROUP BY c.id_classe
ORDER BY numero_studenti DESC;


-- ==========================================
-- STEP 3: Aggregazioni (GROUP BY, HAVING)
-- ==========================================

-- 11) Media voti per studente
SELECT
    s.id_studente,
    s.nome,
    s.cognome,
    ROUND(AVG(e.voto), 2) AS media
FROM studente s
JOIN esame e ON s.id_studente = e.id_studente
GROUP BY s.id_studente
ORDER BY media DESC;

-- 12) Media voti per materia
SELECT
    m.nome AS materia,
    ROUND(AVG(e.voto), 2) AS media_materia
FROM materia m
JOIN esame e ON m.id_materia = e.id_materia
GROUP BY m.id_materia
ORDER BY media_materia DESC;

-- 13) Numero esami per materia
SELECT
    m.nome AS materia,
    COUNT(*) AS numero_esami
FROM materia m
JOIN esame e ON m.id_materia = e.id_materia
GROUP BY m.id_materia
ORDER BY numero_esami DESC;

-- 14) Studenti con media > 7
SELECT
    s.id_studente,
    s.nome,
    s.cognome,
    ROUND(AVG(e.voto), 2) AS media
FROM studente s
JOIN esame e ON s.id_studente = e.id_studente
GROUP BY s.id_studente
HAVING AVG(e.voto) > 7
ORDER BY media DESC;

-- 15) Media voti per classe
SELECT
    c.anno,
    c.sezione,
    c.indirizzo,
    ROUND(AVG(e.voto), 2) AS media_classe
FROM classe c
JOIN iscrizione i ON c.id_classe = i.id_classe
JOIN esame e ON e.id_studente = i.id_studente
WHERE i.anno_scolastico = '2025/2026'
GROUP BY c.id_classe
ORDER BY media_classe DESC;


-- ==========================================
-- STEP 4: Subquery avanzate
-- ==========================================

-- 16) Studente con media più alta
SELECT *
FROM (
    SELECT
        s.id_studente,
        s.nome,
        s.cognome,
        ROUND(AVG(e.voto), 2) AS media
    FROM studente s
    JOIN esame e ON s.id_studente = e.id_studente
    GROUP BY s.id_studente
) t
ORDER BY media DESC
LIMIT 1;

-- 17) Materia con voto medio più basso
SELECT *
FROM (
    SELECT
        m.nome AS materia,
        ROUND(AVG(e.voto), 2) AS media
    FROM materia m
    JOIN esame e ON m.id_materia = e.id_materia
    GROUP BY m.id_materia
) t
ORDER BY media ASC
LIMIT 1;

-- 18) Studenti che non hanno mai sostenuto esami
SELECT
    s.id_studente,
    s.nome,
    s.cognome
FROM studente s
LEFT JOIN esame e ON s.id_studente = e.id_studente
WHERE e.id_esame IS NULL
ORDER BY s.cognome;

-- 19) Docenti che insegnano più di 1 materia
SELECT
    d.id_docente,
    d.nome,
    d.cognome,
    COUNT(dm.id_materia) AS numero_materie
FROM docente d
JOIN docente_materia dm ON d.id_docente = dm.id_docente
GROUP BY d.id_docente
HAVING COUNT(dm.id_materia) > 1
ORDER BY numero_materie DESC;

-- 20) Studenti che hanno almeno un 10
SELECT DISTINCT
    s.id_studente,
    s.nome,
    s.cognome
FROM studente s
JOIN esame e ON s.id_studente = e.id_studente
WHERE e.voto = 10
ORDER BY s.cognome;


-- ==========================================
-- STEP 5: UPDATE e DELETE
-- ==========================================

-- 21) Aumentare di +1 tutti i voti < 6 (max 6)
UPDATE esame
SET voto = CASE
    WHEN voto + 1 > 6 THEN 6
    ELSE voto + 1
END
WHERE voto < 6;

-- Controllo
SELECT *
FROM esame
WHERE voto <= 6
ORDER BY voto;

-- 22) Aggiornare email di un docente
UPDATE docente
SET email = 'marco.rossi2@scuola.it'
WHERE id_docente = 3;

SELECT * FROM docente WHERE id_docente = 3;

-- 23) Cancellare esami più vecchi del 2025-10-11 (test)
-- (attenzione: eseguirlo solo se vuoi perdere dati!)
-- DELETE FROM esame WHERE data_esame < '2025-10-11';


-- ==========================================
-- STEP 6: Vincoli e test errori (da provare manualmente)
-- ==========================================

-- 24) Tentativo voto fuori range (deve fallire)
-- INSERT INTO esame (id_studente, id_materia, data_esame, voto, tipo)
-- VALUES (1, 1, '2026-03-01', 11, 'orale');

-- 25) Tentativo email duplicata (deve fallire)
-- INSERT INTO studente (nome, cognome, data_nascita, email)
-- VALUES ('Test', 'Duplicato', '2007-01-01', 'mario.rossi@studenti.it');


-- ==========================================
-- STEP 7: VIEW (Viste)
-- ==========================================

-- 26) Vista studenti + classe
CREATE OR REPLACE VIEW v_studenti_classe AS
SELECT
    s.id_studente,
    s.nome,
    s.cognome,
    s.email,
    c.anno,
    c.sezione,
    c.indirizzo,
    i.anno_scolastico
FROM studente s
JOIN iscrizione i ON s.id_studente = i.id_studente
JOIN classe c ON c.id_classe = i.id_classe;

SELECT * FROM v_studenti_classe ORDER BY cognome;

-- 27) Vista esami dettagliati
CREATE OR REPLACE VIEW v_esami_dettaglio AS
SELECT
    e.id_esame,
    s.nome,
    s.cognome,
    m.nome AS materia,
    e.voto,
    e.tipo,
    e.data_esame
FROM esame e
JOIN studente s ON s.id_studente = e.id_studente
JOIN materia m ON m.id_materia = e.id_materia;

SELECT * FROM v_esami_dettaglio ORDER BY data_esame;

-- 28) Vista medie studenti
CREATE OR REPLACE VIEW v_medie_studenti AS
SELECT
    s.id_studente,
    s.nome,
    s.cognome,
    ROUND(AVG(e.voto), 2) AS media
FROM studente s
JOIN esame e ON s.id_studente = e.id_studente
GROUP BY s.id_studente;

SELECT * FROM v_medie_studenti ORDER BY media DESC;


-- ==========================================
-- STEP 8: Report finali complessi
-- ==========================================

-- 29) Top 5 studenti per media
SELECT *
FROM v_medie_studenti
ORDER BY media DESC
LIMIT 5;

-- 30) Studenti insufficienti (media < 6)
SELECT *
FROM v_medie_studenti
WHERE media < 6
ORDER BY media ASC;

-- 31) Materie più difficili (media più bassa)
SELECT
    m.nome AS materia,
    ROUND(AVG(e.voto), 2) AS media
FROM materia m
JOIN esame e ON m.id_materia = e.id_materia
GROUP BY m.id_materia
ORDER BY media ASC;

-- 32) Distribuzione voti (quanti 10,9,8,...)
SELECT
    voto,
    COUNT(*) AS quanti
FROM esame
GROUP BY voto
ORDER BY voto DESC;

-- 33) Classe con rendimento migliore (media più alta)
SELECT
    c.anno,
    c.sezione,
    c.indirizzo,
    ROUND(AVG(e.voto), 2) AS media_classe
FROM classe c
JOIN iscrizione i ON c.id_classe = i.id_classe
JOIN esame e ON e.id_studente = i.id_studente
WHERE i.anno_scolastico = '2025/2026'
GROUP BY c.id_classe
ORDER BY media_classe DESC
LIMIT 1;


-- ==========================================
-- STEP 9: EXPLAIN (Performance)
-- ==========================================

-- 34) EXPLAIN su query pesante
EXPLAIN
SELECT
    s.id_studente,
    s.nome,
    s.cognome,
    ROUND(AVG(e.voto), 2) AS media
FROM studente s
JOIN esame e ON s.id_studente = e.id_studente
GROUP BY s.id_studente
ORDER BY media DESC;


-- ==========================================
-- STEP 10: TRANSAZIONI
-- ==========================================

-- 35) Transazione di test con rollback
BEGIN;

INSERT INTO esame (id_studente, id_materia, data_esame, voto, tipo)
VALUES (1, 2, '2026-03-15', 9, 'pratico');

-- Controllo dentro transazione
SELECT * FROM esame WHERE id_studente = 1 ORDER BY data_esame DESC;

ROLLBACK;

-- Controllo dopo rollback (l'esame NON deve esserci)
SELECT * FROM esame WHERE id_studente = 1 ORDER BY data_esame DESC;


-- 36) Transazione con commit
BEGIN;

INSERT INTO esame (id_studente, id_materia, data_esame, voto, tipo)
VALUES (1, 2, '2026-03-15', 9, 'pratico');

COMMIT;

-- Controllo dopo commit (l'esame DEVE esserci)
SELECT * FROM esame WHERE id_studente = 1 ORDER BY data_esame DESC;
```

---

# 🧪 Come eseguire (consiglio pratico)

### PostgreSQL

```bash
psql -U postgres -d scuola -f schema.sql
psql -U postgres -d scuola -f dati.sql
psql -U postgres -d scuola -f query.sql
```

### SQLite (richiede adattamenti su SERIAL e CHECK)

