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
-- Table structure for table `tb_productcomment`
--

DROP TABLE IF EXISTS `tb_productcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_productcomment` (
  `CommentID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Image` text,
  `Detail` varchar(500) DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `RatingID` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `FK_tb_productcomment_ProductID` (`ProductID`),
  KEY `FK_tb_productcomment_UserID` (`UserID`),
  CONSTRAINT `FK_tb_productcomment_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `tb_product` (`ProductID`) ON DELETE CASCADE,
  CONSTRAINT `FK_tb_productcomment_UserID` FOREIGN KEY (`UserID`) REFERENCES `tb_user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Comment sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_productcomment`
--

LOCK TABLES `tb_productcomment` WRITE;
/*!40000 ALTER TABLE `tb_productcomment` DISABLE KEYS */;
INSERT INTO `tb_productcomment` VALUES (8,1,'dang','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fz3948052088691_aaa3c7e8e953caff1f4f9ee8c93b664d.jpg?alt=media&token=7d97f270-1f73-4f16-9c71-0cdedec588e6','4',11,4,'2023-05-07 18:49:45','DangPD','2023-05-07 18:49:45','DangPD'),(9,1,'dang','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fz3948052088691_aaa3c7e8e953caff1f4f9ee8c93b664d.jpg?alt=media&token=7d97f270-1f73-4f16-9c71-0cdedec588e6','ok',59,5,'2023-05-07 19:01:47','DangPD','2023-05-07 19:01:47','DangPD'),(10,1,'dang','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fz3948052088691_aaa3c7e8e953caff1f4f9ee8c93b664d.jpg?alt=media&token=7d97f270-1f73-4f16-9c71-0cdedec588e6','5 sao',59,5,'2023-05-07 20:32:20','DangPD','2023-05-07 20:32:20','DangPD'),(11,1,'dang','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fz3948052088691_aaa3c7e8e953caff1f4f9ee8c93b664d.jpg?alt=media&token=7d97f270-1f73-4f16-9c71-0cdedec588e6','Danh gia oke',14,5,'2023-05-07 20:46:13','DangPD','2023-05-07 20:46:13','DangPD'),(12,1,'dang','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fz3948052088691_aaa3c7e8e953caff1f4f9ee8c93b664d.jpg?alt=media&token=7d97f270-1f73-4f16-9c71-0cdedec588e6','Oke nhé',55,5,'2023-05-07 20:46:25','DangPD','2023-05-07 20:46:25','DangPD'),(13,1,'dang','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fz3948052088691_aaa3c7e8e953caff1f4f9ee8c93b664d.jpg?alt=media&token=7d97f270-1f73-4f16-9c71-0cdedec588e6','tạm ổn',18,5,'2023-05-07 20:46:31','DangPD','2023-05-07 20:46:31','DangPD'),(14,1,'dang','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fanh.jpg?alt=media&token=6a00814c-c481-4ff9-bdc0-3aad20071c37','Chất lượng tuyệt vời',40,5,'2023-05-07 20:51:25','DangPD','2023-05-07 20:51:25','DangPD'),(15,1,'dang','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fanh.jpg?alt=media&token=6a00814c-c481-4ff9-bdc0-3aad20071c37','5 sao',55,5,'2023-05-07 21:03:40','DangPD','2023-05-07 21:03:40','DangPD'),(16,1,'dang','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fanh.jpg?alt=media&token=6a00814c-c481-4ff9-bdc0-3aad20071c37','ok',16,5,'2023-05-07 21:04:06','DangPD','2023-05-07 21:04:06','DangPD');
/*!40000 ALTER TABLE `tb_productcomment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-11  9:45:22
