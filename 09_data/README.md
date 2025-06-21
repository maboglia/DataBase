# 📁 Raccolta di Esercizi e Database SQL

Questa repository raccoglie una serie di file SQL, CSV, JSON e documentazione utile per esercitazioni, simulazioni di database reali e query SQL. I file sono organizzati per argomento.

---

## 📚 Biblioteca e Libri

- [`biblioteca/biblioteca.sql`](biblioteca/biblioteca.sql): Schema e dati di una biblioteca.
- [`biblioteca/query.md`](biblioteca/query.md): Esercizi e query SQL sulla biblioteca.
- [`libreria/autore.sql`](libreria/autore.sql): Tabella autori.
- [`libreria/libro.sql`](libreria/libro.sql): Tabella libri.
- [`libreria/editore.sql`](libreria/editore.sql): Tabella editori.
- [`libreria/autore_libro.sql`](libreria/autore_libro.sql): Relazione autore-libro.
- [`libreria/db_totale.sql`](libreria/db_totale.sql): Script completo del database libreria.
- [`libri2.sql`](libri2.sql): Variante semplificata del database libri.

---

## 🎓 Scuola, Corsi e Studenti

- [`Corsi/db_corsi.sql`](Corsi/db_corsi.sql): Schema del database corsi.
- [`Corsi/db_corsi_dati.sql`](Corsi/db_corsi_dati.sql): Inserimento dati per i corsi.
- [`Corsi/drawSQL-mysql-export-2024-12-30.sql`](Corsi/drawSQL-mysql-export-2024-12-30.sql): Esportazione grafica da drawSQL.
- [`Studenti/studenti_table.sql`](Studenti/studenti_table.sql): Struttura tabella studenti.
- [`Studenti/studenti_record.sql`](Studenti/studenti_record.sql): Dati di esempio studenti.

---

## 🍽 Alimenti e Prodotti

- [`alimenti/alimenti.sql`](alimenti/alimenti.sql): Tabella alimenti.
- [`alimenti/alimenti.md`](alimenti/alimenti.md): Descrizione ed esercizi.
- [`prodotti.sql`](prodotti.sql): Tabella prodotti generici.
- [`prodotti_ortofrutticoli.sql`](prodotti_ortofrutticoli.sql): Prodotti agricoli/frutta e verdura.
- [`listino_bar.sql`](listino_bar.sql): Listino prezzi bar.

---

## 🚗 Mezzi di Trasporto

- [`automobili.sql`](automobili.sql): Tabella automobili.
- [`moto.json`](moto.json): Esempio JSON con dati moto.

---

## 🗺️ Comuni, Paesi e Popolazione

- [`comuni/istat_comuni_italiani.sql`](comuni/istat_comuni_italiani.sql): Comuni italiani (ISTAT).
- [`comuni/query.md`](comuni/query.md): Query sui comuni.
- [`countries.sql`](countries.sql): Elenco paesi.
- [`country-data.sql`](country-data.sql): Dati estesi sui paesi.
- [`popolazione_italiana_eta.sql`](popolazione_italiana_eta.sql): Popolazione italiana per età.
- [`popolazione_italiana_regione.sql`](popolazione_italiana_regione.sql): Popolazione per regione.

---

## 🎶 Musica, Canzoni e Film

- [`canzoni.sql`](canzoni.sql): Brani musicali.
- [`canzoni2020.sql`](canzoni2020.sql): Brani del 2020.
- [`100 greatest cartoons of all time.csv`](100%20greatest%20cartoons%20of%20all%20time.csv): Lista di cartoni animati celebri.
- [`netflixdb-mysql.sql`](netflixdb-mysql.sql): Catalogo Netflix (schema relazionale).
- [`sakilaDB/`](sakilaDB/): Database di esempio su film, attori e noleggi:
  - [`sakila_film_attori.sql`](sakilaDB/sakila_film_attori.sql)
  - [`sakila_queries.sql`](sakilaDB/sakila_queries.sql)
  - [`sakila_queries_questions.md`](sakilaDB/sakila_queries_questions.md)
  - Esercizi e PDF allegati.

---

## 🛒 Gestionale e Shop

- [`myShopSQL.sql`](myShopSQL.sql): Negozio online (clienti, prodotti, ordini).
- [`gestionale/`](gestionale/): Struttura e query per un gestionale completo:
  - Tabelle, foreign key e query svolte.

---

## 🧾 Finanza e Giochi

- [`FinancesSchema.sql`](FinancesSchema.sql): Schema per dati finanziari.
- [`games.sql`](games.sql): Giochi, produttori, classificazioni.

---

## 💽 Database Classici

- [`chinook/Chinook_MySql.sql`](chinook/Chinook_MySql.sql): Database musicale simile a iTunes.
- [`chinook/query.md`](chinook/query.md), [`chinook/query2.md`](chinook/query2.md): Esercizi su Chinook.

---

## 📦 Varie

- [`database.sqlite`](database.sqlite): File SQLite generico.
- `logo-its.png`, `LOGO PNRR Regione.png`: Immagini/logo.

---

## Altri esempi

### 💼 **Gestionali e Business**

1. **Sistema prenotazioni hotel**

   * Clienti, camere, prenotazioni, pagamenti, servizi.
2. **E-commerce**

   * Clienti, ordini, prodotti, pagamenti, spedizioni.
3. **CRM - Gestione clienti**

   * Aziende, contatti, interazioni, appuntamenti, attività.

### 🎓 **Didattici e Scuola**

4. **Registro scolastico**

   * Alunni, materie, voti, assenze, docenti.
5. **Esami universitari**

   * Studenti, corsi, esami, iscrizioni, appelli.
6. **Mensa scolastica**

   * Alunni, pasti, menù giornalieri, allergie, prenotazioni.

### 📊 **Social, Media e Cultura**

7. **Social network**

   * Utenti, post, commenti, like, amicizie.
8. **Festival musicali o cinematografici**

   * Eventi, artisti, location, biglietti, sponsor.
9. **Serie TV / Anime / Manga**

   * Serie, stagioni, episodi, personaggi, autori.

### 🗺️ **Dati geografici / turismo**

10. **Luoghi turistici**

    * Città, attrazioni, visitatori, recensioni.
11. **Viaggi e voli**

    * Compagnie aeree, voli, aeroporti, passeggeri, prenotazioni.
12. **Mappe e percorsi**

    * Nodi, percorsi, distanze, mezzi (bus/treni).

### 🏥 **Salute e Benessere**

13. **Clinica medica**

    * Pazienti, visite, medici, prescrizioni, farmaci.
14. **Palestra / Centro fitness**

    * Clienti, abbonamenti, corsi, istruttori, allenamenti.

### 💹 **Economia e finanza**

15. **Criptovalute**

    * Monete, transazioni, wallet, tassi di cambio.
16. **Investimenti**

    * Utenti, portafogli, azioni, operazioni, dividendi.

### 🐶 **Animali e natura**

17. **Veterinario**

    * Animali, proprietari, visite, vaccini.
18. **Zoo o bioparco**

    * Animali, habitat, alimentazione, schede informative.

### 🧪 **Scienza e tecnologia**

19. **Esperimenti scientifici**

    * Progetti, misurazioni, strumenti, risultati.
20. **Inventario laboratorio tech**

    * Componenti, fornitori, esperimenti, riparazioni.

---

### Extra: Dataset reali da usare come base

Puoi ispirarti a dataset reali (formato CSV/JSON facilmente convertibili in SQL), ad esempio:

* [Open Data ISTAT](https://www.istat.it/it/archivio/open-data)
* [Kaggle datasets](https://www.kaggle.com/datasets)
* [Data.gov](https://www.data.gov/)
* [Open Food Facts](https://world.openfoodfacts.org/data)

