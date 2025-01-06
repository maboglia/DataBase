CREATE TABLE `Studenti`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(255) NOT NULL,
    `cognome` VARCHAR(255) NOT NULL,
    `data_nascita` DATE NOT NULL
);
CREATE TABLE `materie`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nome` BIGINT NOT NULL
);
CREATE TABLE `esami`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_materia` BIGINT NOT NULL,
    `id_studente` BIGINT NOT NULL,
    `voto` TINYINT NOT NULL,
    `data_esame` DATE NOT NULL
);
ALTER TABLE
    `esami` ADD CONSTRAINT `esami_id_materia_foreign` FOREIGN KEY(`id_materia`) REFERENCES `materie`(`id`);
ALTER TABLE
    `esami` ADD CONSTRAINT `esami_id_studente_foreign` FOREIGN KEY(`id_studente`) REFERENCES `Studenti`(`id`);