-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: france
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `departement`
--

DROP TABLE IF EXISTS `departement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departement` (
  `departement_id` int NOT NULL AUTO_INCREMENT,
  `departement_code` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `departement_nom` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `departement_nom_uppercase` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `departement_slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `departement_nom_soundex` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`departement_id`),
  KEY `departement_slug` (`departement_slug`),
  KEY `departement_code` (`departement_code`),
  KEY `departement_nom_soundex` (`departement_nom_soundex`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departement`
--

LOCK TABLES `departement` WRITE;
/*!40000 ALTER TABLE `departement` DISABLE KEYS */;
INSERT INTO `departement` VALUES (1,'01','Ain','AIN','ain','A500'),(2,'02','Aisne','AISNE','aisne','A250'),(3,'03','Allier','ALLIER','allier','A460'),(5,'05','Hautes-Alpes','HAUTES-ALPES','hautes-alpes','H32412'),(4,'04','Alpes-de-Haute-Provence','ALPES-DE-HAUTE-PROVENCE','alpes-de-haute-provence','A412316152'),(6,'06','Alpes-Maritimes','ALPES-MARITIMES','alpes-maritimes','A41256352'),(7,'07','Ard??che','ARD??CHE','ardeche','A632'),(8,'08','Ardennes','ARDENNES','ardennes','A6352'),(9,'09','Ari??ge','ARI??GE','ariege','A620'),(10,'10','Aube','AUBE','aube','A100'),(11,'11','Aude','AUDE','aude','A300'),(12,'12','Aveyron','AVEYRON','aveyron','A165'),(13,'13','Bouches-du-Rh??ne','BOUCHES-DU-RH??NE','bouches-du-rhone','B2365'),(14,'14','Calvados','CALVADOS','calvados','C4132'),(15,'15','Cantal','CANTAL','cantal','C534'),(16,'16','Charente','CHARENTE','charente','C653'),(17,'17','Charente-Maritime','CHARENTE-MARITIME','charente-maritime','C6535635'),(18,'18','Cher','CHER','cher','C600'),(19,'19','Corr??ze','CORR??ZE','correze','C620'),(20,'2a','Corse-du-sud','CORSE-DU-SUD','corse-du-sud','C62323'),(21,'2b','Haute-corse','HAUTE-CORSE','haute-corse','H3262'),(22,'21','C??te-d\'or','C??TE-D\'OR','cote-dor','C360'),(23,'22','C??tes-d\'armor','C??TES-D\'ARMOR','cotes-darmor','C323656'),(24,'23','Creuse','CREUSE','creuse','C620'),(25,'24','Dordogne','DORDOGNE','dordogne','D6325'),(26,'25','Doubs','DOUBS','doubs','D120'),(27,'26','Dr??me','DR??ME','drome','D650'),(28,'27','Eure','EURE','eure','E600'),(29,'28','Eure-et-Loir','EURE-ET-LOIR','eure-et-loir','E6346'),(30,'29','Finist??re','FINIST??RE','finistere','F5236'),(31,'30','Gard','GARD','gard','G630'),(32,'31','Haute-Garonne','HAUTE-GARONNE','haute-garonne','H3265'),(33,'32','Gers','GERS','gers','G620'),(34,'33','Gironde','GIRONDE','gironde','G653'),(35,'34','H??rault','H??RAULT','herault','H643'),(36,'35','Ile-et-Vilaine','ILE-ET-VILAINE','ile-et-vilaine','I43145'),(37,'36','Indre','INDRE','indre','I536'),(38,'37','Indre-et-Loire','INDRE-ET-LOIRE','indre-et-loire','I536346'),(39,'38','Is??re','IS??RE','isere','I260'),(40,'39','Jura','JURA','jura','J600'),(41,'40','Landes','LANDES','landes','L532'),(42,'41','Loir-et-Cher','LOIR-ET-CHER','loir-et-cher','L6326'),(43,'42','Loire','LOIRE','loire','L600'),(44,'43','Haute-Loire','HAUTE-LOIRE','haute-loire','H346'),(45,'44','Loire-Atlantique','LOIRE-ATLANTIQUE','loire-atlantique','L634532'),(46,'45','Loiret','LOIRET','loiret','L630'),(47,'46','Lot','LOT','lot','L300'),(48,'47','Lot-et-Garonne','LOT-ET-GARONNE','lot-et-garonne','L3265'),(49,'48','Loz??re','LOZ??RE','lozere','L260'),(50,'49','Maine-et-Loire','MAINE-ET-LOIRE','maine-et-loire','M346'),(51,'50','Manche','MANCHE','manche','M200'),(52,'51','Marne','MARNE','marne','M650'),(53,'52','Haute-Marne','HAUTE-MARNE','haute-marne','H3565'),(54,'53','Mayenne','MAYENNE','mayenne','M000'),(55,'54','Meurthe-et-Moselle','MEURTHE-ET-MOSELLE','meurthe-et-moselle','M63524'),(56,'55','Meuse','MEUSE','meuse','M200'),(57,'56','Morbihan','MORBIHAN','morbihan','M615'),(58,'57','Moselle','MOSELLE','moselle','M240'),(59,'58','Ni??vre','NI??VRE','nievre','N160'),(60,'59','Nord','NORD','nord','N630'),(61,'60','Oise','OISE','oise','O200'),(62,'61','Orne','ORNE','orne','O650'),(63,'62','Pas-de-Calais','PAS-DE-CALAIS','pas-de-calais','P23242'),(64,'63','Puy-de-D??me','PUY-DE-D??ME','puy-de-dome','P350'),(65,'64','Pyr??n??es-Atlantiques','PYR??N??ES-ATLANTIQUES','pyrenees-atlantiques','P65234532'),(66,'65','Hautes-Pyr??n??es','HAUTES-PYR??N??ES','hautes-pyrenees','H321652'),(67,'66','Pyr??n??es-Orientales','PYR??N??ES-ORIENTALES','pyrenees-orientales','P65265342'),(68,'67','Bas-Rhin','BAS-RHIN','bas-rhin','B265'),(69,'68','Haut-Rhin','HAUT-RHIN','haut-rhin','H365'),(70,'69','Rh??ne','RH??NE','rhone','R500'),(71,'70','Haute-Sa??ne','HAUTE-SA??NE','haute-saone','H325'),(72,'71','Sa??ne-et-Loire','SA??NE-ET-LOIRE','saone-et-loire','S5346'),(73,'72','Sarthe','SARTHE','sarthe','S630'),(74,'73','Savoie','SAVOIE','savoie','S100'),(75,'74','Haute-Savoie','HAUTE-SAVOIE','haute-savoie','H321'),(76,'75','Paris','PARIS','paris','P620'),(77,'76','Seine-Maritime','SEINE-MARITIME','seine-maritime','S5635'),(78,'77','Seine-et-Marne','SEINE-ET-MARNE','seine-et-marne','S53565'),(79,'78','Yvelines','YVELINES','yvelines','Y1452'),(80,'79','Deux-S??vres','DEUX-S??VRES','deux-sevres','D2162'),(81,'80','Somme','SOMME','somme','S500'),(82,'81','Tarn','TARN','tarn','T650'),(83,'82','Tarn-et-Garonne','TARN-ET-GARONNE','tarn-et-garonne','T653265'),(84,'83','Var','VAR','var','V600'),(85,'84','Vaucluse','VAUCLUSE','vaucluse','V242'),(86,'85','Vend??e','VEND??E','vendee','V530'),(87,'86','Vienne','VIENNE','vienne','V500'),(88,'87','Haute-Vienne','HAUTE-VIENNE','haute-vienne','H315'),(89,'88','Vosges','VOSGES','vosges','V200'),(90,'89','Yonne','YONNE','yonne','Y500'),(91,'90','Territoire de Belfort','TERRITOIRE DE BELFORT','territoire-de-belfort','T636314163'),(92,'91','Essonne','ESSONNE','essonne','E250'),(93,'92','Hauts-de-Seine','HAUTS-DE-SEINE','hauts-de-seine','H32325'),(94,'93','Seine-Saint-Denis','SEINE-SAINT-DENIS','seine-saint-denis','S525352'),(95,'94','Val-de-Marne','VAL-DE-MARNE','val-de-marne','V43565'),(96,'95','Val-d\'oise','VAL-D\'OISE','val-doise','V432'),(97,'976','Mayotte','MAYOTTE','mayotte','M300'),(98,'971','Guadeloupe','GUADELOUPE','guadeloupe','G341'),(99,'973','Guyane','GUYANE','guyane','G500'),(100,'972','Martinique','MARTINIQUE','martinique','M6352'),(101,'974','R??union','R??UNION','reunion','R500');
/*!40000 ALTER TABLE `departement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03 22:17:25
