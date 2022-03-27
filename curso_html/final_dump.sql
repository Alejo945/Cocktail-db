-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: Final_Perfect_Cocktail
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cocktails`
--

DROP TABLE IF EXISTS `Cocktails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocktails` (
  `idCocktails` int NOT NULL AUTO_INCREMENT,
  `Cocktail_Name` varchar(45) NOT NULL,
  `Recipe` text NOT NULL,
  `Image_URL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idCocktails`),
  UNIQUE KEY `Cocktail_Name_UNIQUE` (`Cocktail_Name`),
  UNIQUE KEY `idCocktails_UNIQUE` (`idCocktails`)
) ENGINE=InnoDB AUTO_INCREMENT=719 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktails`
--

LOCK TABLES `Cocktails` WRITE;
/*!40000 ALTER TABLE `Cocktails` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cocktails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cocktails_has_Flavors`
--

DROP TABLE IF EXISTS `Cocktails_has_Flavors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocktails_has_Flavors` (
  `idCocktails` int NOT NULL,
  `idFlavors` int NOT NULL,
  PRIMARY KEY (`idCocktails`,`idFlavors`),
  KEY `fk_Cocktails_has_Flavors_Flavors1_idx` (`idFlavors`),
  KEY `fk_Cocktails_has_Flavors_Cocktails1_idx` (`idCocktails`),
  CONSTRAINT `fk_Cocktails_has_Flavors_Cocktails1` FOREIGN KEY (`idCocktails`) REFERENCES `Cocktails` (`idCocktails`),
  CONSTRAINT `fk_Cocktails_has_Flavors_Flavors1` FOREIGN KEY (`idFlavors`) REFERENCES `Flavors` (`idFlavors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktails_has_Flavors`
--

LOCK TABLES `Cocktails_has_Flavors` WRITE;
/*!40000 ALTER TABLE `Cocktails_has_Flavors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cocktails_has_Flavors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cocktails_has_Side_Base`
--

DROP TABLE IF EXISTS `Cocktails_has_Side_Base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocktails_has_Side_Base` (
  `idCocktails` int NOT NULL,
  `idSB` int NOT NULL,
  PRIMARY KEY (`idCocktails`,`idSB`),
  KEY `fk_Cocktails_has_Side_Base_Side_Base1_idx` (`idSB`),
  KEY `fk_Cocktails_has_Side_Base_Cocktails1_idx` (`idCocktails`),
  CONSTRAINT `fk_Cocktails_has_Side_Base_Cocktails1` FOREIGN KEY (`idCocktails`) REFERENCES `Cocktails` (`idCocktails`),
  CONSTRAINT `fk_Cocktails_has_Side_Base_Side_Base1` FOREIGN KEY (`idSB`) REFERENCES `Side_Base` (`idSB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktails_has_Side_Base`
--

LOCK TABLES `Cocktails_has_Side_Base` WRITE;
/*!40000 ALTER TABLE `Cocktails_has_Side_Base` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cocktails_has_Side_Base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cocktails_has_Toppings`
--

DROP TABLE IF EXISTS `Cocktails_has_Toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocktails_has_Toppings` (
  `idCocktails` int NOT NULL,
  `idToppings` int NOT NULL,
  PRIMARY KEY (`idCocktails`,`idToppings`),
  KEY `fk_Cocktails_has_Toppings1_Toppings1_idx` (`idToppings`),
  KEY `fk_Cocktails_has_Toppings1_Cocktails1_idx` (`idCocktails`),
  CONSTRAINT `fk_Cocktails_has_Toppings1_Cocktails1` FOREIGN KEY (`idCocktails`) REFERENCES `Cocktails` (`idCocktails`),
  CONSTRAINT `fk_Cocktails_has_Toppings1_Toppings1` FOREIGN KEY (`idToppings`) REFERENCES `Toppings` (`idToppings`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktails_has_Toppings`
--

LOCK TABLES `Cocktails_has_Toppings` WRITE;
/*!40000 ALTER TABLE `Cocktails_has_Toppings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cocktails_has_Toppings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cocktails_has_Type_of_Alcohol`
--

DROP TABLE IF EXISTS `Cocktails_has_Type_of_Alcohol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocktails_has_Type_of_Alcohol` (
  `idCocktails` int NOT NULL,
  `idAlcohol` int NOT NULL,
  PRIMARY KEY (`idCocktails`,`idAlcohol`),
  KEY `fk_Cocktails_has_Type_of_Alcohol_Type_of_Alcohol1_idx` (`idAlcohol`),
  KEY `fk_Cocktails_has_Type_of_Alcohol_Cocktails1_idx` (`idCocktails`),
  CONSTRAINT `fk_Cocktails_has_Type_of_Alcohol_Cocktails1` FOREIGN KEY (`idCocktails`) REFERENCES `Cocktails` (`idCocktails`),
  CONSTRAINT `fk_Cocktails_has_Type_of_Alcohol_Type_of_Alcohol1` FOREIGN KEY (`idAlcohol`) REFERENCES `Type_of_Alcohol` (`idAlcohol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktails_has_Type_of_Alcohol`
--

LOCK TABLES `Cocktails_has_Type_of_Alcohol` WRITE;
/*!40000 ALTER TABLE `Cocktails_has_Type_of_Alcohol` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cocktails_has_Type_of_Alcohol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flavors`
--

DROP TABLE IF EXISTS `Flavors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flavors` (
  `idFlavors` int NOT NULL AUTO_INCREMENT,
  `Flavor_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`idFlavors`),
  UNIQUE KEY `Flavor_Type_UNIQUE` (`Flavor_Type`),
  UNIQUE KEY `idFlavors_UNIQUE` (`idFlavors`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flavors`
--

LOCK TABLES `Flavors` WRITE;
/*!40000 ALTER TABLE `Flavors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Flavors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Side_Base`
--

DROP TABLE IF EXISTS `Side_Base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Side_Base` (
  `idSB` int NOT NULL AUTO_INCREMENT,
  `SB_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`idSB`),
  UNIQUE KEY `SB_Type_UNIQUE` (`SB_Type`),
  UNIQUE KEY `idSB_UNIQUE` (`idSB`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Side_Base`
--

LOCK TABLES `Side_Base` WRITE;
/*!40000 ALTER TABLE `Side_Base` DISABLE KEYS */;
/*!40000 ALTER TABLE `Side_Base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Toppings`
--

DROP TABLE IF EXISTS `Toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Toppings` (
  `idToppings` int NOT NULL AUTO_INCREMENT,
  `Toppings_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`idToppings`),
  UNIQUE KEY `Toppings_Type_UNIQUE` (`Toppings_Type`),
  UNIQUE KEY `idToppings_UNIQUE` (`idToppings`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Toppings`
--

LOCK TABLES `Toppings` WRITE;
/*!40000 ALTER TABLE `Toppings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Toppings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Type_of_Alcohol`
--

DROP TABLE IF EXISTS `Type_of_Alcohol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Type_of_Alcohol` (
  `idAlcohol` int NOT NULL AUTO_INCREMENT,
  `Alcohol_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`idAlcohol`),
  UNIQUE KEY `Alcohol_Type_UNIQUE` (`Alcohol_Type`),
  UNIQUE KEY `idAlcohol_UNIQUE` (`idAlcohol`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Type_of_Alcohol`
--

LOCK TABLES `Type_of_Alcohol` WRITE;
/*!40000 ALTER TABLE `Type_of_Alcohol` DISABLE KEYS */;
/*!40000 ALTER TABLE `Type_of_Alcohol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  UNIQUE KEY `Password_UNIQUE` (`Password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_has_Cocktails`
--

DROP TABLE IF EXISTS `User_has_Cocktails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_has_Cocktails` (
  `UserID` int NOT NULL,
  `idCocktails` int NOT NULL,
  PRIMARY KEY (`UserID`,`idCocktails`),
  KEY `fk_User_has_Cocktails_Cocktails1_idx` (`idCocktails`),
  KEY `fk_User_has_Cocktails_User1_idx` (`UserID`),
  CONSTRAINT `fk_User_has_Cocktails_Cocktails1` FOREIGN KEY (`idCocktails`) REFERENCES `Cocktails` (`idCocktails`),
  CONSTRAINT `fk_User_has_Cocktails_User1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_has_Cocktails`
--

LOCK TABLES `User_has_Cocktails` WRITE;
/*!40000 ALTER TABLE `User_has_Cocktails` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_has_Cocktails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-27 14:06:15
