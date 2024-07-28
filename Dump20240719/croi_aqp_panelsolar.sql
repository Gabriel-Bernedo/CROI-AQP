-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: croi_aqp
-- ------------------------------------------------------
-- Server version	9.0.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `panelsolar`
--

DROP TABLE IF EXISTS `panelsolar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panelsolar` (
  `IDPanelSolar` int NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Largo` decimal(10,2) DEFAULT NULL,
  `Ancho` decimal(10,2) DEFAULT NULL,
  `Potencia` decimal(10,2) DEFAULT NULL,
  `Voltaje` decimal(10,2) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`IDPanelSolar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panelsolar`
--

LOCK TABLES `panelsolar` WRITE;
/*!40000 ALTER TABLE `panelsolar` DISABLE KEYS */;
INSERT INTO `panelsolar` VALUES (1,'PANEL SOLAR 550W 24V MONOCRISTALINO PERC AE SOLAR',2278.00,1133.00,550.00,42.57,1200.00),(2,'Panel solar 100w 12v policristalino Sunlake',1130.00,670.00,100.00,17.80,700.00),(3,'Panel Solar 100w 12v Monocristalino Sunlake',0.00,0.00,100.00,12.00,700.00),(4,'Panel solar 150w 12v policristalino Sunlake',1480.00,680.00,150.00,17.80,900.00),(5,'Panel solar 150w 12v monocristalino Sunlake',0.00,0.00,150.00,12.00,950.00),(6,'Panel Solar 340w 24v Policristalino Eco Green',1956.00,992.00,340.00,38.42,871.50),(7,'Panel Solar 450w 24v Monocristalino PERC Eco Green',2102.00,1040.00,450.00,40.96,1410.00),(8,'Panel Solar 460Wp 24v Amerisolar Monocristalino Perc Half Cell',2102.00,1040.00,460.00,42.20,1180.00),(9,'Panel Solar 550w 24v Monocristalino PERC Eco Green',2102.00,1040.00,550.00,40.96,1350.00),(10,'Panel Solar policristalino 100wp Renjiang',1000.00,670.00,100.00,17.80,369.64),(11,'Panel Solar 100W Amerisolar Policristalino',1010.00,670.00,100.00,18.20,456.00),(12,'Panel Solar 150W Amerisolar Policristalino',1480.00,670.00,150.00,18.20,600.00),(13,'Panel Solar 340W Amerisolar Policristalino',1956.00,992.00,340.00,37.30,1160.00),(14,'Panel Solar 370Wp Amerisolar Monocristalino PERC',1956.00,992.00,370.00,39.40,1272.00),(15,'Panel Solar Monocristalino 150W Sunlake',1480.00,670.00,150.00,17.80,305.00),(16,'Panel Solar 160W Amerisolar Policristalino',1480.00,670.00,160.00,18.60,625.56),(17,'Panel Solar 285W Amerisolar Policristalino',1640.00,992.00,285.00,31.80,846.72),(18,'Panel Solar 370W Peimar Monocristalino PERC Peimar Italian',1957.00,992.00,370.00,38.20,1142.89),(19,'Panel Solar 150W Peimar Italian Policristalino',1480.00,674.00,150.00,17.64,485.73),(20,'Panel Solar 285wp Policristalino Peimar Italian',1640.00,992.00,285.00,31.98,885.72),(21,'Panel Solar Jinko Solar 400Wp HC Monocristalino PERC',2008.00,1002.00,400.00,41.70,1244.80),(22,'Panel Solar 400W Peimar Monocristalino PERC Peimar Italian',1979.00,1002.00,400.00,40.60,1196.00),(23,'Panel Solar 450W Peimar Monocristalino Half Cell PERC Peimar Italian',2115.00,1048.00,450.00,40.65,1465.72),(24,'Panel Solar 315Wp Monocristalino PERC Peimar Italian',1640.00,992.00,315.00,33.75,982.84),(25,'Panel Solar 340w Policristalino Peimar Italian',1956.00,992.00,340.00,37.30,1040.00),(26,'Panel Solar Jinko Solar 335Wp Policristalino',1956.00,992.00,335.00,38.00,1045.73),(27,'Panel Solar 270Wp Policristalino AE Solar PowerPlus',1650.00,992.00,270.00,30.82,732.92),(28,'Panel Solar 450Wp TrinaSolar Monocristalino Half Cell PERC TALLMAX',2102.00,1040.00,450.00,41.00,1465.72),(29,'TRINA SOLAR PANEL 24V 400W MONOPER HALF CELL',1754.00,1096.00,400.00,34.20,1220.80),(30,'PANEL SOLAR 460W 24V AE SOLAR MONOCRISTALINO PERC',1902.00,1133.00,460.00,35.60,1046.00);
/*!40000 ALTER TABLE `panelsolar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-19 22:49:55
