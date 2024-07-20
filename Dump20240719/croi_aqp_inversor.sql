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
-- Table structure for table `inversor`
--

DROP TABLE IF EXISTS `inversor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inversor` (
  `ID` int NOT NULL,
  `Nombre` varchar(120) DEFAULT NULL,
  `Potencia` int DEFAULT NULL,
  `Admision_Voltaje` int DEFAULT NULL,
  `ISO` varchar(255) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inversor`
--

LOCK TABLES `inversor` WRITE;
/*!40000 ALTER TABLE `inversor` DISABLE KEYS */;
INSERT INTO `inversor` VALUES (1,'Inversor a RED Growatt MIC 1500TL-X monofasico',1500,80,'CE, IEC62109, G98, G99, VFR2014, CEI0-21, VDE-AR-N4105, EN61727, IEC62116',2800.00),(2,'Inversor a RED Growatt MIC 3000TL-X monofasico',3000,80,'-',3549.20),(3,'Inversor a red Growatt MIN 5000TL-XH',5000,100,'CE, IEC62109, G98, G99, VFR2014, CEI0-21, VDE-AR-N4105, EN61727, IEC62116',6030.00),(4,'INVERSOR A RED GROWATT MID 6KTL3-XL DELTA INVERTER 6KW 3-FASE 220V 2MPPT IP65',6000,220,'CE, EN50549, VDE-AR-N4105, CEI 0-21, CEI 0-16, IEC 62116, IEC 61727, G99, AS4777',12490.74),(5,'INVERSOR A RED GROWATT MID 10KTL3-XL DELTA INVERTER 10KW 3-FASE 220V 2MPPT IP65',10000,220,'CE, EN50549, VDE-AR-N4105, CEI 0-21, CEI 0-16, IEC 62116, IEC 61727, G99, AS4777',16935.36),(6,'INVERSOR A RED GROWATT MID 15KTL3-X TRIFASICO 380VAC',15000,160,'CE, VDE0126, Greece, EN50549, C10/C11, UTE C 15-712, IEC62116,IEC61727, IEC 60068, IEC 61683, CEI0-21, CEI0-16, N4105,TOR Erzeuger, G98/G99, G100, AS/NZS 3100, AS4777, UNE217001, UNE206007, PO12.2, KSC8565',1302.00),(7,'Inversor Interconexion Primo 3.6kW WLAN/LAN/WEBSERVER',3680,80,'DIN V VDE 0126-1-1/A1, IEC 62109-1/-2, IEC 62116, IEC 61727, AS 4777-2, AS 4777-3, G83/2, G59/3, CEI 0-21, VDE AR N 4105',0.00),(8,'Inversor Interconexion Symo 5kw WLAN/LAN/WEBSERVER',5000,200,'?VE / ?NORM E 8001-4-712, DIN V VDE 0126-1-1/A1, VDE AR N 4105, IEC 62109-1/-2, IEC 62116, IEC 61727, AS 3100, AS 4777-2, AS 4777-3, CER 06-190, G83/2, UNE 206007-1, SI 4777, CEI 0-21, NRS 097',0.00),(9,'Inversor Interconexion Fronius Symo 10kw WLAN/LAN/WEBSERVER',10000,200,'?VE / ?NORM E 8001-4-712, DIN V VDE 0126-1-1/A1, VDE AR N 4105, IEC 62109-1/-2, IEC 62116, IEC 61727, AS 3100, AS 4777-2, AS 4777-3, CER 06-190, G83/2, UNE 206007-1, SI 4777, CEI 0-16, CEI 0-21, NRS 097',0.00),(10,'Inversor Interconexion Fronius Symo 15.0-3 208 WLAN/LAN/web server',15000,200,'?VE / ?NORM E 8001-4-712, DIN V VDE 0126-1-1/A1, VDE AR N 4105, IEC 62109-1/-2, IEC 62116, IEC 61727, AS 3100, AS 4777-2, AS 4777-3, CER 06-190, G83/2, UNE 206007-1, SI 4777, CEI 0-16, CEI 0-21, NRS 097',0.00),(11,'Inversor Interconexion Fronius Symo 20Kw WLAN/LAN/WEBSERVER Trif?sico',20000,200,'?VE / ?NORM E 8001-4-712, DIN V VDE 0126-1-1/A1, VDE AR N 4105, IEC 62109-1/-2, IEC 62116, IEC 61727, AS 3100, AS 4777-2, AS 4777-3, CER 06-190, G83/2, UNE 206007-1, SI 4777, CEI 0-16, CEI 0-21, NRS 097',0.00),(12,'Inversor RED TRIFASICO GROWATT MAC 36KTL3-XL',36000,250,'CE, IEC62116, IEC61727, IEC 60068, IEC 61683, IEC60529IEEE1547, UL1741, IEEE1547',13305.00),(13,'INVERSOR O.M PHOENIX SOLAR ENERGY 12V 600W',600,12,'CE,LVD, RoHS',140.00),(14,'INVERSOR PHOENIX SOLAR ENERGY 12V 1000W ONDA MODIFICADA',1000,12,'-',540.00),(15,'INVERSOR PHOENIX SOLAR ENERGY 12V 1000W ONDA PURA',1000,12,'-',1200.00);
/*!40000 ALTER TABLE `inversor` ENABLE KEYS */;
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
