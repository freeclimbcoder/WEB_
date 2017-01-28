-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------


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
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `message` longtext,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES (58,'2016-11-29 14:21:53','коммент','user'),(59,'2016-11-29 14:22:19','коммент1','user'),(60,'2016-11-29 14:53:16','коммент2','user'),(61,'2016-11-29 14:55:25','коммент3','user'),(62,'2016-11-29 16:30:35','коммент4','user');
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDERS`
--

DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDERS` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  `DELIVERY` bit(1) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDERS`
--

LOCK TABLES `ORDERS` WRITE;
/*!40000 ALTER TABLE `ORDERS` DISABLE KEYS */;
INSERT INTO `ORDERS` VALUES (33,'Культуры 12','2016-11-29 14:22:45','\0','user'),(34,'Луначарского 10','2016-11-29 14:55:06','','user'),(35,' Невский 21','2016-11-29 16:16:42','\0','user'),(36,'blablabla','2016-11-29 16:31:51','','user');
/*!40000 ALTER TABLE `ORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_cartItemList`
--

DROP TABLE IF EXISTS `Order_cartItemList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_cartItemList` (
  `Order_ORDER_ID` int(11) NOT NULL,
  `AMOUNT` int(11) DEFAULT NULL,
  `GOODS_ID` int(11) DEFAULT NULL,
  KEY `FK_f0umpb40xmotwnamm7h1edbel` (`Order_ORDER_ID`),
  CONSTRAINT `FK_f0umpb40xmotwnamm7h1edbel` FOREIGN KEY (`Order_ORDER_ID`) REFERENCES `ORDERS` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_cartItemList`
--

LOCK TABLES `Order_cartItemList` WRITE;
/*!40000 ALTER TABLE `Order_cartItemList` DISABLE KEYS */;
INSERT INTO `Order_cartItemList` VALUES (33,2,1),(34,2,1),(35,3,1),(36,3,2);
/*!40000 ALTER TABLE `Order_cartItemList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descriptions`
--

DROP TABLE IF EXISTS `descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descriptions` (
  `goods_id` int(11) NOT NULL,
  `lang` varchar(2) NOT NULL,
  `description` text CHARACTER SET utf8,
  PRIMARY KEY (`goods_id`,`lang`),
  KEY `descriptions_goods_id_idx` (`goods_id`),
  KEY `descriptions_lang_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descriptions`
--

LOCK TABLES `descriptions` WRITE;
/*!40000 ALTER TABLE `descriptions` DISABLE KEYS */;
INSERT INTO `descriptions` VALUES (1,'en','beginner glider\naspect ratio 4.7 \"\nCountry: Germany\nBest first wing chose\n'),(1,'ru','Для начинающих\nУдлинение 4.7\"\nПроизводство: Германия\nИдеально для первого крыла\n'),(1,'ua','Для початківців\nПодовження 4.7 \"\nВиробництво: Німеччина\nІдеально для першого крила\n'),(2,'en','XC glider\naspect ratio 5.8 \"\nCountry: Germany\nBest XC wing \n'),(2,'ru','Для маршрутных полётов\nУдлинение 5.8 \"\nПроизводство: Германия\nЛучший в своём классе \n'),(2,'ua','Для маршрутних польотів\nПодовження 5.8 \"\nВиробництво: Німеччина\nЛучшій в своєму класі\n');
/*!40000 ALTER TABLE `descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `name` char(200) CHARACTER SET utf8 NOT NULL,
  `price` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `categ` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'MESCAL4',1500,'img/beginner.jpg','en-A'),(2,'Garmin nuviCam',1400,'img/inter.jpg','XC');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `property` char(200) CHARACTER SET utf8 NOT NULL,
  `value` char(200) CHARACTER SET utf8 NOT NULL,
  `goods_id` int(11) NOT NULL,
  `lang` varchar(2) NOT NULL,
  PRIMARY KEY (`property`,`goods_id`,`lang`),
  KEY `properties_goods_id_idx` (`goods_id`),
  KEY `properties_lang_idx` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES ('Cells','69',2,'en'),('Glider weight (kg)','5,4 \"',2,'en'),('Wingspan flat (m)','12.5',2,'en'),('Cells','58',1,'en'),('Glider weight (kg)','6,4 \"',1,'en'),('Wingspan flat (m)','10.8',1,'en'),('Ячейки','69',2,'ru'),('Вес (kg)','5,4 \"',2,'ru'),('размах (m)','12.5',2,'ru'),('Ячейки','58',1,'ru'),('Вес (kg)','6,4 \"',1,'ru'),('Размах (m)','10.8',1,'ru'),('Клітки','69',2,'ua'),('Вага (kg)','5,4 \"',2,'ua'),('Розмах  (m)','12.5',2,'ua'),('Клітки','58',1,'ua'),('Вага (kg)','6,4 \"',1,'ua'),('Розмах  (m)','10.8',1,'ua');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `author` char(200) CHARACTER SET utf8 NOT NULL,
  `review` text CHARACTER SET utf8 NOT NULL,
  `goods_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_goods_id_idx` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('Василь','норм!',1,1),('Петя','ОК',1,2),('Гриша','Сойдёт',1,3),('Bill','awesome',2,4);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-29 16:45:39
