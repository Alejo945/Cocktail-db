-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: Perfect_Cocktaildb
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `Cocktail`
--

DROP TABLE IF EXISTS `Cocktail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocktail` (
  `CocktailID` int DEFAULT NULL,
  `Cocktail_name` varchar(40) DEFAULT NULL,
  `Recipe` varchar(255) DEFAULT NULL,
  `Flavors` varchar(40) DEFAULT NULL,
  `Toppings` varchar(40) DEFAULT NULL,
  `Alcohol_type` varchar(40) DEFAULT NULL,
  `Side_Base` varchar(40) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktail`
--

LOCK TABLES `Cocktail` WRITE;
/*!40000 ALTER TABLE `Cocktail` DISABLE KEYS */;
INSERT INTO `Cocktail` VALUES (1,'Irish_Coffee',NULL,'Bitter','Whipped_cream','Whiskey','Coffee'),(2,'CBD_Spritz',NULL,'Fruity','Grapefruit','Vodka','Sparkling_Soda'),(3,'Dark_Side',NULL,'Bitter','Cherry','Gin','None'),(4,'Margarita',NULL,'Sweet','Lime','Tequila','Lime_Juice'),(5,'Old_Fashioned',NULL,'Bitter','Orange','Whiskey','Syrup'),(6,'Negroni',NULL,'Sweet','None','Campari','Sparkling_Soda'),(7,'Daiquiri',NULL,'Sour','Lime','Rum','Lime_Juice'),(8,'Pear_and_Rose_Punch',NULL,'Fruity','Rosemary','None','Pear_Juice'),(9,'Virgin_Piña_Colada',NULL,'Fruity','Cherry','None','Pineapple_Juice'),(10,'Faux_Fizz',NULL,'Sour','Rosemary','None','Syrup'),(11,'Non_Alcoholic_G&T',NULL,'Sweet','Mint','None','Tonic_Water');
/*!40000 ALTER TABLE `Cocktail` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `UsersID` int DEFAULT NULL,
  `User_Name` varchar(40) DEFAULT NULL
  `Password` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Type_of_Alcohol` DISABLE KEYS */;
INSERT INTO `Users` VALUES (00001,'Alejandro', 'Password');
/*!40000 ALTER TABLE `Type_of_Alcohol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-13 14:55:48
