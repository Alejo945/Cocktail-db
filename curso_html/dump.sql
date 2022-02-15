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
  `FlavorID` int DEFAULT NULL,
  `ToppingsID` int DEFAULT NULL,
  `Alcohol_typeID` int DEFAULT NULL,
  `Side_BaseID` int DEFAULT NULL,
  `Flavors` varchar(40) DEFAULT NULL,
  `Toppings` varchar(40) DEFAULT NULL,
  `Alcohol_type` varchar(40) DEFAULT NULL,
  `Side_Base` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktail`
--

LOCK TABLES `Cocktail` WRITE;
/*!40000 ALTER TABLE `Cocktail` DISABLE KEYS */;
INSERT INTO `Cocktail` VALUES (1,'Irish_Coffee',NULL,NULL,NULL,NULL,NULL,'Bitter','Whipped_cream','Whiskey','Coffee'),(2,'CBD_Spritz',NULL,NULL,NULL,NULL,NULL,'Fruity','Grapefruit','Vodka','Sparkling_Soda'),(3,'Dark_Side',NULL,NULL,NULL,NULL,NULL,'Bitter','Cherry','Gin','None'),(4,'Margarita',NULL,NULL,NULL,NULL,NULL,'Sweet','Lime','Tequila','Lime_Juice'),(5,'Old_Fashioned',NULL,NULL,NULL,NULL,NULL,'Bitter','Orange','Whiskey','Syrup'),(6,'Negroni',NULL,NULL,NULL,NULL,NULL,'Sweet','None','Campari','Sparkling_Soda'),(7,'Daiquiri',NULL,NULL,NULL,NULL,NULL,'Sour','Lime','Rum','Lime_Juice'),(8,'Pear_and_Rose_Punch',NULL,NULL,NULL,NULL,NULL,'Fruity','Rosemary','None','Pear_Juice'),(9,'Virgin_Piña_Colada',NULL,NULL,NULL,NULL,NULL,'Fruity','Cherry','None','Pineapple_Juice'),(10,'Faux_Fizz',NULL,NULL,NULL,NULL,NULL,'Sour','Rosemary','None','Syrup'),(11,'Non_Alcoholic_G&T',NULL,NULL,NULL,NULL,NULL,'Sweet','Mint','None','Tonic_Water');
/*!40000 ALTER TABLE `Cocktail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cocktail_Flavor`
--

DROP TABLE IF EXISTS `Cocktail_Flavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocktail_Flavor` (
  `CocktailID` int DEFAULT NULL,
  `FlavorID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktail_Flavor`
--

LOCK TABLES `Cocktail_Flavor` WRITE;
/*!40000 ALTER TABLE `Cocktail_Flavor` DISABLE KEYS */;
INSERT INTO `Cocktail_Flavor` VALUES (1,19),(2,20),(3,19),(4,21),(5,19),(6,21),(7,22),(8,20),(9,20),(10,22),(11,21);
/*!40000 ALTER TABLE `Cocktail_Flavor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cocktail_Side_Base`
--

DROP TABLE IF EXISTS `Cocktail_Side_Base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocktail_Side_Base` (
  `CocktailID` int DEFAULT NULL,
  `Side_baseID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktail_Side_Base`
--

LOCK TABLES `Cocktail_Side_Base` WRITE;
/*!40000 ALTER TABLE `Cocktail_Side_Base` DISABLE KEYS */;
INSERT INTO `Cocktail_Side_Base` VALUES (1,23),(2,24),(3,25),(4,26),(5,27),(6,24),(7,26),(8,28),(9,29),(10,27),(11,30);
/*!40000 ALTER TABLE `Cocktail_Side_Base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cocktail_Topping`
--

DROP TABLE IF EXISTS `Cocktail_Topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocktail_Topping` (
  `CocktailID` int DEFAULT NULL,
  `ToppingID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktail_Topping`
--

LOCK TABLES `Cocktail_Topping` WRITE;
/*!40000 ALTER TABLE `Cocktail_Topping` DISABLE KEYS */;
INSERT INTO `Cocktail_Topping` VALUES (1,31),(2,32),(3,33),(4,34),(5,35),(6,36),(7,34),(8,37),(9,38),(10,37),(11,39);
/*!40000 ALTER TABLE `Cocktail_Topping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cocktail_TypeA`
--

DROP TABLE IF EXISTS `Cocktail_TypeA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocktail_TypeA` (
  `CocktailID` int DEFAULT NULL,
  `ALcoholID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocktail_TypeA`
--

LOCK TABLES `Cocktail_TypeA` WRITE;
/*!40000 ALTER TABLE `Cocktail_TypeA` DISABLE KEYS */;
INSERT INTO `Cocktail_TypeA` VALUES (1,12),(2,13),(3,14),(4,15),(5,12),(6,16),(7,17),(8,18),(9,18),(10,18),(11,18);
/*!40000 ALTER TABLE `Cocktail_TypeA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flavors`
--

DROP TABLE IF EXISTS `Flavors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flavors` (
  `FLavorID` int DEFAULT NULL,
  `Flavor_type` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flavors`
--

LOCK TABLES `Flavors` WRITE;
/*!40000 ALTER TABLE `Flavors` DISABLE KEYS */;
INSERT INTO `Flavors` VALUES (19,'Bitter'),(20,'Fruity'),(21,'Sweet'),(22,'Sour');
/*!40000 ALTER TABLE `Flavors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Side_BAse`
--

DROP TABLE IF EXISTS `Side_BAse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Side_BAse` (
  `Side_BaseID` int DEFAULT NULL,
  `Side_base_type` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Side_BAse`
--

LOCK TABLES `Side_BAse` WRITE;
/*!40000 ALTER TABLE `Side_BAse` DISABLE KEYS */;
INSERT INTO `Side_BAse` VALUES (23,'Coffee'),(24,'Sparkling Soda'),(25,'None'),(26,'Lime Juice'),(27,'Syrup'),(28,'Pear Juice'),(29,'Pineapple Juice'),(30,'Tonic Water');
/*!40000 ALTER TABLE `Side_BAse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Toppings`
--

DROP TABLE IF EXISTS `Toppings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Toppings` (
  `ToppingsID` int DEFAULT NULL,
  `Toppings_type` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Toppings`
--

LOCK TABLES `Toppings` WRITE;
/*!40000 ALTER TABLE `Toppings` DISABLE KEYS */;
INSERT INTO `Toppings` VALUES (31,'Whipped Cream'),(32,'Grapefruit'),(33,'Cherry'),(34,'Lime'),(35,'Orange'),(36,'None'),(37,'Rosemary'),(40,'Cherry'),(41,'Mint');
/*!40000 ALTER TABLE `Toppings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Type_of_Alcohol`
--

DROP TABLE IF EXISTS `Type_of_Alcohol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Type_of_Alcohol` (
  `Type_of_alcoholID` int DEFAULT NULL,
  `Alcohol_Type` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Type_of_Alcohol`
--

LOCK TABLES `Type_of_Alcohol` WRITE;
/*!40000 ALTER TABLE `Type_of_Alcohol` DISABLE KEYS */;
INSERT INTO `Type_of_Alcohol` VALUES (12,'Whiskey'),(13,'Vodka'),(14,'Gin'),(15,'Tequila'),(16,'Campari'),(17,'Rum'),(18,'None');
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

-- Dump completed on 2022-02-09 14:45:54
