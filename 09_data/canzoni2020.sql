-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: localhost    Database: tss_2019
-- ------------------------------------------------------
-- Server version	5.7.41-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `canzoni2020`
--

DROP TABLE IF EXISTS `canzoni2020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canzoni2020` (
  `Canzone` text,
  `Cantanti` text,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canzoni2020`
--

LOCK TABLES `canzoni2020` WRITE;
/*!40000 ALTER TABLE `canzoni2020` DISABLE KEYS */;
INSERT INTO `canzoni2020` VALUES ('Mediterranea','Irama',1),('Good times','Ghali',2),('A un passo dalla luna','Rocco Hunt & Ana Mena',3),('Blinding lights','The Weeknd',4),('Superclassico','Ernia',5),('Hypnotized','Purple Disco Machine & Sophie and the Giants',6),('Dance monkey','Tones and I',7),('Fai rumore','Diodato',8),('blun7 a swishland','tha Supreme',9),('Viceversa','Francesco Gabbani',10),('Jerusalema','Master KG feat. Nomcebo Zikode',11),('Boogieman','Ghali feat. Salmo',12),('Breaking me','Topic & A7S',13),('Rapide','Mahmood',14),('Chega','Gaia Gozzi',15),('Mamacita','Black Eyed Peas & Ozuna & J. Rey Soul',16),('M\'\' manc','Shablo & Geolier & Sfera Ebbasta',17),('Ti volevo dedicare','Rocco Hunt feat. JAx & BoomDaBash',18),('Ringo Starr','Pinguini Tattici Nucleari',19),('Tusa','Karol G & Nicki Minaj',20),('Non mi basta più','Baby K feat. Chiara Ferragni',21),('Fiori di Chernobyl','Mr. Rain',22),('Paloma','Fred De Palma feat. Anitta',23),('Roses [imanbek remix]','Saint Jhn',24),('Bando','Anna',25),('Una volta ancora','Fred De Palma feat. Ana Mena',26),('Ciclone','Takagi & Ketra & Elodie feat. Mariah & Gipsy Kings & Nicolas Reyes & Tonino Baliardo',27),('Auto Blu','Shiva & Eiffel 65',28),('Bimbi per strada (Children)','Fedez & Robert Miles',29),('Destri','Gazzelle',30),('Chico','Guè Pequeno feat. Rose Villain & Luchè',31),('Musica (e il resto scompare)','Elettra Lamborghini',32),('Savage love (LaxedSiren beat)','Jawsh 685 & Jason Derulo',33),('Don\'\'t start now','Dua Lipa',34),('Il bacio di Klimt','Emanuele Aloia',35),('Per sentirmi vivo','Fasma & GG',36),('Head & heart','Joel Corry feat. MNEK',37),('Tutto questo sei tu','Ultimo',38),('Before you go','Lewis Capaldi',39),('Altalene','Slait & Tha Supreme feat. Mara Sattei & Coez',40),('Guaranà','Elodie',41),('Sono un bravo ragazzo un po\'\' fuori di testa','Random',42),('Bella storia','Fedez',43),('Spigoli','Carl Brave & Mara Sattei & tha Supreme',44),('Bottiglie privè','Sfera Ebbasta',45),('Death bed','Powfu feat. Beabadoobee',46),('Ridere','Pinguini Tattici Nucleari',47),('Ritmo (Bad boys for life)','Black Eyed Peas & J Balvin',48),('Dorado','Mahmood & Sfera Ebbasta & Feid',49),('Bam Bam Twist','Achille Lauro feat. Gow Tribe',50),('Me ne frego','Achille Lauro',51),('Andromeda','Elodie',52),('16 marzo','Achille Lauro feat. Gow Tribe',53),('In your eyes','The Weeknd',54),('NeonLe ali','Marracash & Elisa',55),('Baby','Sfera Ebbasta & J Balvin',56),('BRAVI A CADERE: I polmoni','Marracash',57),('Tikibombom','Levante',58),('Physical','Dua Lipa',59),('Non avere paura','Tommaso Paradiso',60),('Mood','24kGoldn feat. Iann Dior',61),('Watermelon sugar','Harry Styles',62),('Autostop','Shade',63),('Le feste di Pablo','Cara & Fedez',64),('Rain on me','Lady Gaga & Ariana Grande',65),('CRUDELIA: I nervi','Marracash',66),('Dynamite','BTS',67),('Ansia no','Fsk Satellite feat. Taxi B & Sapobully & Greg Willen & chiello_fsk',68),('Rockstar','DaBaby feat. Roddy Ricch',69),('22 settembre','Ultimo',70),('SUPREME: L\'\'ego','Marracash & tha Supreme & Sfera Ebbasta',71),('La mia hit','J-Ax feat. Max Pezzali',72),('Fuck 3x','tha Supreme',73),('Dove e quando','Benji & Fede',74),('Elegante','Drefgold & Sfera Ebbasta',75),('Nena','Boro Boro & Geolier & Andry The Hitmaker',76),('Roxanne','Arizona Zervas',77),('Memories','Maroon 5',78),('Un dia (One day)','J Balvin & Dua Lipa & Bad Bunny & Tainy',79),('All I want for Christmas is you','Mariah Carey',80),('Chiasso','Random',81),('Testa tra le nuvole Pt. 2','Alfa & Yanomi',82),('Stu core t\'\'apparten','Rocco Hunt',83),('Someone you loved','Lewis Capaldi',84),('Crepe','Irama',85),('Falling','Trevor Daniel',86),('La storia infinita','Pinguini Tattici Nucleari',87),('Balla per me','Tiziano Ferro & Jovanotti',88),('Una voglia assurda','J-AX',89),('La isla','Giusy Ferreri & Elettra Lamborghini',90),('Vent\'\'anni','Maneskin',91),('Ricordami','Tommaso Paradiso',92),('Dov\'\'è','Le Vibrazioni',93),('Lose control','Meduza & Becky Hill & Goodboys',94),('Break my heart','Dua Lipa',95),('Te lo prometto','Il Tre',96),('Ride it','Regard',97),('Let\'\'s love','David Guetta & Sia',98),('Cin Cin','Alfa & Yanomi',99);
/*!40000 ALTER TABLE `canzoni2020` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tss_2019'
--

--
-- Dumping routines for database 'tss_2019'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-28 16:46:08
