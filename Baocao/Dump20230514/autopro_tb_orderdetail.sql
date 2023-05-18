-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: autopro
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `tb_orderdetail`
--

DROP TABLE IF EXISTS `tb_orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_orderdetail` (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `ProductCode` varchar(255) DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `Price` decimal(19,2) DEFAULT NULL,
  `Quantitys` int DEFAULT NULL,
  `IsComment` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`OrderDetailID`),
  KEY `FK_tb_orderdetail_OrderID` (`OrderID`),
  KEY `FK_tb_orderdetail_ProductID` (`ProductID`),
  CONSTRAINT `FK_tb_orderdetail_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `tb_orders` (`OrderID`),
  CONSTRAINT `FK_tb_orderdetail_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `tb_product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_orderdetail`
--

LOCK TABLES `tb_orderdetail` WRITE;
/*!40000 ALTER TABLE `tb_orderdetail` DISABLE KEYS */;
INSERT INTO `tb_orderdetail` VALUES (1,19,57,'sp53','Bộ chống cháy nổ vinfast',350000.00,1,0),(2,19,58,'sp54','Bộ chống cháy nổ toyota',300000.00,1,0),(3,20,57,'sp53','Bộ chống cháy nổ vinfast',350000.00,2,0),(4,21,57,'sp53','Bộ chống cháy nổ vinfast',350000.00,1,0),(5,22,57,'sp53','Bộ chống cháy nổ vinfast',350000.00,1,0),(6,23,57,'sp53','Bộ chống cháy nổ vinfast',350000.00,1,0),(7,23,60,'sp56','Giàn lạnh',450000.00,1,0),(8,24,57,'sp53','Bộ chống cháy nổ vinfast',350000.00,1,0),(9,24,60,'sp56','Giàn lạnh',450000.00,1,0),(10,40,57,'sp53','Bộ chống cháy nổ vinfast',350000.00,1,0),(11,41,61,'sp57','Giàn nóng m=honda',600000.00,8,0),(12,41,61,'sp57','Giàn nóng m=honda',600000.00,8,0),(13,43,56,'sp52','Bình điện cao cấp cho xe vinfast',2500000.00,3,0),(14,43,59,'sp55','Giàn nóng xe mazda',450000.00,1,0),(15,44,57,'sp53','Bộ chống cháy nổ vinfast',350000.00,2,0),(16,45,40,'sp36','Gương chiếu hậu cap cấp honda',300000.00,1,0),(17,45,60,'sp56','Giàn lạnh',450000.00,3,0),(18,46,60,'sp56','Giàn lạnh',450000.00,1,0),(23,75,40,'sp36','Gương chiếu hậu cap cấp honda',300000.00,1,0),(24,76,59,'sp55','Giàn nóng xe mazda',450000.00,1,0),(25,77,59,'sp55','Giàn nóng xe mazda',450000.00,2,0),(26,77,40,'sp36','Gương chiếu hậu cap cấp honda',300000.00,1,0),(27,77,60,'sp56','Giàn lạnh',450000.00,1,0),(28,77,55,'sp51','Bình điện cho xe hhonda',1700000.00,1,0),(29,78,40,'sp36','Gương chiếu hậu cap cấp honda',300000.00,1,0),(30,79,40,'sp36','Gương chiếu hậu cap cấp honda',300000.00,1,0),(31,79,61,'sp57','Giàn nóng honda',600000.00,2,0),(32,80,14,'Sp10','Bóng đèn trước mazda',100000.00,6,1),(33,80,11,'SP07','Chắn bùn huyndai',350000.00,1,0),(34,80,55,'sp51','Bình điện cho xe hhonda',1700000.00,1,1),(35,80,19,'Sp16','Bóng đèn sau ',100000.00,1,1),(36,80,18,'Sp14','Bóng đèn trước huyndai',150000.00,1,0),(37,80,17,'Sp13','Bóng đèn trước honda',200000.00,3,1),(38,80,16,'Sp12','Bóng đèn trước Vìnast',150000.00,4,0),(39,80,12,'SP08','Chắn bùn toyota',350000.00,1,0),(40,81,11,'SP07','Chắn bùn huyndai',350000.00,1,0),(41,81,55,'sp51','Bình điện cho xe hhonda',1700000.00,1,0),(42,81,19,'Sp16','Bóng đèn sau ',100000.00,1,0),(43,81,18,'Sp14','Bóng đèn trước huyndai',150000.00,1,0),(44,81,17,'Sp13','Bóng đèn trước honda',200000.00,1,0),(45,81,16,'Sp12','Bóng đèn trước Vìnast',150000.00,1,0),(46,81,12,'SP08','Chắn bùn toyota',350000.00,1,0),(47,82,16,'Sp12','Bóng đèn trước Vìnast',150000.00,1,0),(48,82,40,'sp36','Gương chiếu hậu cap cấp honda',300000.00,1,0),(49,83,16,'Sp12','Bóng đèn trước Vìnast',150000.00,1,0),(50,84,16,'Sp12','Bóng đèn trước Vìnast',150000.00,1,0),(51,85,16,'Sp12','Bóng đèn trước Vìnast',150000.00,1,0),(52,86,16,'Sp12','Bóng đèn trước Vìnast',150000.00,1,0),(53,87,16,'Sp12','Bóng đèn trước Vìnast',150000.00,1,0),(54,88,16,'Sp12','Bóng đèn trước Vìnast',150000.00,2,0),(55,89,16,'Sp12','Bóng đèn trước Vìnast',150000.00,1,0),(56,90,16,'Sp12','Bóng đèn trước Vìnast',150000.00,1,0),(57,90,55,'sp51','Bình điện cho xe hhonda',1700000.00,1,0),(58,90,5,'Sp01','Dầu nhớt',150000.00,1,0),(59,90,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(60,91,5,'Sp01','Dầu nhớt',150000.00,1,0),(61,91,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(62,92,5,'Sp01','Dầu nhớt',150000.00,1,0),(63,92,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(64,93,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(65,94,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(66,95,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(67,95,5,'Sp01','Dầu nhớt',150000.00,1,0),(68,95,23,'sp19','Bóng đèn sau cao cap vinfast',200000.00,1,0),(69,95,21,'sp18','Bóng đèn sau mazda',100000.00,1,0),(70,96,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(71,96,5,'Sp01','Dầu nhớt',150000.00,1,0),(72,96,21,'sp18','Bóng đèn sau mazda',100000.00,1,0),(73,97,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(74,97,5,'Sp01','Dầu nhớt',150000.00,1,0),(75,97,21,'sp18','Bóng đèn sau mazda',100000.00,1,0),(76,98,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(77,98,5,'Sp01','Dầu nhớt',150000.00,1,0),(78,98,21,'sp18','Bóng đèn sau mazda',100000.00,1,0),(79,99,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(80,99,5,'Sp01','Dầu nhớt',150000.00,1,0),(81,99,21,'sp18','Bóng đèn sau mazda',100000.00,1,0),(82,100,15,'Sp11','Bóng đèn trước totyta',150000.00,1,1),(83,100,5,'Sp01','Dầu nhớt',150000.00,1,1),(84,101,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(85,101,5,'Sp01','Dầu nhớt',150000.00,1,0),(86,102,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(87,102,5,'Sp01','Dầu nhớt',150000.00,1,0),(88,103,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(89,103,5,'Sp01','Dầu nhớt',150000.00,1,0),(90,104,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(91,104,5,'Sp01','Dầu nhớt',150000.00,1,0),(92,105,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(93,105,5,'Sp01','Dầu nhớt',150000.00,1,0),(94,106,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(95,106,5,'Sp01','Dầu nhớt',150000.00,1,0),(96,107,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(97,107,5,'Sp01','Dầu nhớt',150000.00,1,0),(98,108,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(99,108,5,'Sp01','Dầu nhớt',150000.00,1,0),(100,109,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(101,109,5,'Sp01','Dầu nhớt',150000.00,1,0),(102,110,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(103,110,5,'Sp01','Dầu nhớt',150000.00,1,0),(104,111,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(105,111,5,'Sp01','Dầu nhớt',150000.00,1,1),(106,112,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(107,112,5,'Sp01','Dầu nhớt',150000.00,1,0),(108,113,15,'Sp11','Bóng đèn trước totyta',150000.00,1,0),(109,113,5,'Sp01','Dầu nhớt',150000.00,1,0),(110,114,61,'sp57','Giàn nóng honda',600000.00,1,0),(111,115,61,'sp57','Giàn nóng honda',600000.00,1,0),(112,117,40,'sp36','Gương chiếu hậu cap cấp honda 2',300000.00,1,0),(113,118,57,'sp53','Bộ chống cháy nổ vinfast',350000.00,1,0),(114,119,57,'sp53','Bộ chống cháy nổ vinfast',350000.00,1,1),(115,120,61,'sp57','Giàn nóng honda',600000.00,1,0),(116,121,61,'sp57','Giàn nóng honda',600000.00,1,0),(117,122,40,'sp36','Gương chiếu hậu cap cấp honda 2',300000.00,1,1),(118,122,60,'sp56','Giàn lạnh',450000.00,1,1),(119,123,29,'sp25','Đèn pha ô tô cao cấp honda',250000.00,1,0),(120,123,59,'sp55','Giàn nóng xe mazda',450000.00,1,0);
/*!40000 ALTER TABLE `tb_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-14  9:32:42
