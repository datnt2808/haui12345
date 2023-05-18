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
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Account` varchar(100) NOT NULL DEFAULT '',
  `Password` varchar(100) NOT NULL DEFAULT '',
  `Role` varchar(25) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `Gender` int DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(50) NOT NULL DEFAULT '',
  `PhoneNumber` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `Account` (`Account`),
  KEY `Account_2` (`Account`),
  KEY `Account_3` (`Account`),
  KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Thông tin user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'dang','12345678','User','pham','dang','dang','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fanh.jpg?alt=media&token=6a00814c-c481-4ff9-bdc0-3aad20071c37','2023-04-12 00:00:00',0,'Nam Định','ducdanghaui173@gmail.com','123789',NULL,NULL,'2023-05-07 20:47:38','DangPD'),(2,'admin','12345678','Admin','Phạm ','Đăng','Phạm Đức Đăng','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fanh.jpg?alt=media&token=4ea29aa8-8fb2-4e69-aa33-b98f8067320e','2001-03-17 00:00:00',0,'Nam Định ','dangpd@gmail.com','0394061318',NULL,NULL,'2023-04-22 17:25:11','DangPD'),(3,'dang23','12345678',NULL,NULL,NULL,NULL,'link','2023-04-05 00:00:00',NULL,NULL,'dang3@gmail.com',NULL,NULL,NULL,NULL,NULL),(4,'User201','6446763180','User','Mai',' Tuân','Nguyễn Linh Đan',NULL,'1970-01-01 00:13:17',2,'Bắc Ninh','Lutz438@nowhere.com','157556667',NULL,NULL,NULL,NULL),(5,'user5','12345678','User','pham','dang pham','dang','','2023-04-13 04:41:00',0,'string','user5@gmail.com','string','2023-04-13 04:41:00','string','2023-04-23 19:25:21','DangPD'),(6,'User676','2339538789','User','Hoàng',' Thoa','Trần Ngọc Khuê','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2Fpt.png?alt=media&token=93c80398-9256-4866-bff6-c30c525914c2','1995-09-13 15:05:10',0,'Nam Định','Hyman@example.com','318067047',NULL,NULL,'2023-05-02 22:11:56','DangPD'),(7,'User407','0394104653','User','Nguyễn',' Quế','Hồ Thị Thơm',NULL,'1970-01-01 01:00:02',1,'Cà Mau','KareemBinkley@example.com','495172339',NULL,NULL,NULL,NULL),(8,'User780','1198173280','User','Trần',' Liễu','Trần Thị Trâm',NULL,'2011-01-08 16:18:38',2,'Hải Hậu','Eda_Mallory577@example.com','538789039',NULL,NULL,NULL,NULL),(9,'User553','2514428925','User','Nguyễn',' Băng','Đinh Khánh Thu',NULL,'2017-05-08 16:59:38',1,'Lào Cai','AguiarP@nowhere.com','410465311',NULL,NULL,NULL,NULL),(10,'User521','6691530975','User','Hồ',' Dương','Đinh Văn Phúc',NULL,'2013-11-08 03:12:38',0,'Quảng Ninh','RicardaNAndre@example.com','981732802',NULL,NULL,NULL,NULL),(11,'User236','9727520345',NULL,'Bùi',' Bình','Hoàng Tiến Trung',NULL,'2013-02-15 10:49:43',2,'Hải Hậu','BannisterO485@example.com','514428925',NULL,NULL,NULL,NULL),(12,'User718','2593829820','User','Trần',' Kiên','Mai Thị My',NULL,'1992-08-15 01:39:03',1,'Hà Nội','MauricePepper949@example.com','669153097',NULL,NULL,NULL,NULL),(13,'User479','1767867078','User','Hồ',' Thoa','Bùi Văn Linh',NULL,'1988-08-28 17:03:46',0,'Cà Mau','Fay.Andres@example.com','597275203',NULL,NULL,NULL,NULL),(14,'User394','2962999705','User','Trần',' Định','Nguyễn Văn Lĩnh',NULL,'2002-11-04 01:34:24',1,'Quảng Ninh','Wade.H.Marx722@example.com','452593829',NULL,NULL,NULL,NULL),(15,'User265','7989280477','User',NULL,NULL,NULL,NULL,'2023-04-04 00:00:00',NULL,NULL,'zajvyfes_gigpanbvkz@example.com',NULL,NULL,NULL,NULL,NULL),(16,'User032','7721414799','User','Nguyễn',' Bằng','Hồ Trọng Dương',NULL,'1970-01-01 00:12:29',0,'Bắc Giang','jmcqy5@example.com','820176786',NULL,NULL,NULL,NULL),(17,'User130','8359746071','User','Nông',' Trí','Trịnh Thành Nghị',NULL,'1972-05-18 17:08:55',2,'Bắc Ninh','Acevedo733@example.com','707829629',NULL,NULL,NULL,NULL),(18,'User641','9474486234','User','Hoàng',' Đạt','Trần Thị Nhã',NULL,'1994-09-24 15:32:36',1,'Hà Nam','Abreu@example.com','997057989',NULL,NULL,NULL,NULL),(19,'User428','6958524804','User',NULL,NULL,NULL,NULL,'2023-04-04 00:00:00',NULL,NULL,'Moeller@example.com',NULL,NULL,NULL,NULL,NULL),(20,'User021','6943303940','User','Trần',' Anh','Hoàng Thị Chi',NULL,'1970-01-01 00:12:02',1,'Ninh Bình','Acker@example.com','280477772',NULL,NULL,NULL,NULL),(21,'User624','4700267608','User','Võ',' Nhân','Trần Hưng Thọ',NULL,'2011-09-30 17:20:23',0,'Bình Thuận','ElissaJacobs@example.com','141479983',NULL,NULL,NULL,NULL),(22,'User475','9449575971','User','Nguyễn',' Phương','Trần Văn Cảnh',NULL,'1983-04-08 02:45:01',2,'Hà Nội','rxrisnix_pmwl@nowhere.com','597460719',NULL,NULL,NULL,NULL),(23,'User195','0257820161',NULL,'Nguyễn',' Cường','Trịnh Anh Cường',NULL,'1970-01-01 01:51:01',2,'Bắc Ninh','gmfyejp7@example.com','474486234',NULL,NULL,NULL,NULL),(24,'User345','7688864445','User','Nguyễn',' Mỹ','Nguyễn Thị Thoa',NULL,'1970-01-01 00:12:02',1,'Hưng Yên','FallonLane@example.com','695852480',NULL,NULL,NULL,NULL),(25,'User730','5839739435','User',NULL,NULL,NULL,NULL,'2023-04-04 00:00:00',NULL,NULL,'Alvin.Hahn@example.com',NULL,NULL,NULL,NULL,NULL),(26,'User581','4222057430','User',NULL,NULL,NULL,NULL,'2023-04-11 00:00:00',NULL,NULL,'bfpu4@example.com',NULL,NULL,NULL,NULL,NULL),(27,'User483','3998543063','User','Nguyễn',' Bình','Đinh Linh Chi',NULL,'1995-08-15 07:26:22',2,'Hải Hậu','ElijahAbney@example.com','469433039',NULL,NULL,NULL,NULL),(28,'User670','7711614241','User','Nguyễn',' Liễu','Võ Quang Phúc',NULL,'1994-04-08 18:16:12',1,'TP.Hồ Chí Minh','Haynes729@example.com','404700267',NULL,NULL,NULL,NULL),(29,'User696','6803580349','User','Nguyễn',' Linh','Võ Quốc Thịnh',NULL,'1992-08-14 18:19:17',1,'Hải Hậu','Marchand@example.com','608944957',NULL,NULL,NULL,NULL),(30,'User712','2524468315','User','Vũ',' Vinh','Bùi Văn Phi',NULL,'1971-07-30 13:03:25',2,'Bắc Giang','AndyLott617@example.com','597102578',NULL,NULL,NULL,NULL),(31,'User753','9546221785','User','Trần',' Linh','Vũ Thị Diệp',NULL,'1970-01-01 00:12:07',1,'Lào Cai','MasonM_Cortes145@nowhere.com','201617688',NULL,NULL,NULL,NULL),(32,'User928','3292416155','User','Nguyễn',' Cương','Nguyễn Thị Mỹ',NULL,'1984-03-18 02:02:48',0,'Hải Hậu','AbbyRhoads4@example.com','864445583',NULL,NULL,NULL,NULL),(33,'User309','7293574018','User','Bùi',' Long','Nguyễn Văn Phúc',NULL,'1996-06-29 23:40:05',2,'Bình Thuận','IlonaAshmore@example.com','973943542',NULL,NULL,NULL,NULL),(34,'User830','0451932706',NULL,'Mai',' Đan','Trương Văn Đạt',NULL,'1983-05-09 17:10:34',0,'Bắc Giang','Valentin@nowhere.com','220574303',NULL,NULL,NULL,NULL),(35,'User978','1873588564','User','Nguyễn',' Khánh','Nguyễn Ngọc Huyền',NULL,'1998-07-12 06:02:57',1,'Bình Thuận','ylffg9891@example.com','998543063',NULL,NULL,NULL,NULL),(38,'User874','2740426073','User','Nguyễn',' Anh','Nông Thị Ngà',NULL,'2008-12-26 19:14:24',1,'Bình Dương','Abrams29@example.com','492524468',NULL,NULL,NULL,NULL),(39,'User722','7408801709','User','Nguyễn',' Quang','Nông Quang Nam',NULL,'1970-01-01 00:12:33',0,'Cà Mau','xrysmi3@example.com','315954622',NULL,NULL,NULL,NULL),(40,'User941','1370916363','User','Nguyễn',' Hà','Trần Thị Loan',NULL,'1970-01-01 00:21:58',2,'Lào Cai','LaddT@nowhere.com','178532924',NULL,NULL,NULL,NULL),(41,'User708','9385945714','User','Hoàng',' Phú','Nguyễn Ngọc Thăng',NULL,'2007-05-19 03:15:38',2,'Cà Mau','CurtisBTrimble2@example.com','161557293',NULL,NULL,NULL,NULL),(42,'User873','0242127846','User','Nguyễn',' Dương','Nguyễn Thị Phương',NULL,'1970-01-01 02:24:56',0,'Lào Cai','IgnacioEllington43@example.com','574018045',NULL,NULL,NULL,NULL),(43,'User303','2590981955','User','Trần',' Duy','Trịnh Thị Điệp',NULL,'1970-01-01 00:12:10',0,'Hưng Yên','Forsythe@nowhere.com','193270618',NULL,NULL,NULL,NULL),(44,'User011','4264804604','User','Nguyễn',' Anh','Nguyễn Văn Nghĩa',NULL,'2011-06-14 22:36:38',1,'Hà Nam','Toby.Dellinger@example.com','735885640',NULL,NULL,NULL,NULL),(45,'User037','0574017271','User','Trần',' Nghị','Nguyễn Thành Anh',NULL,'1980-05-12 18:35:19',2,'Hà Nội','ScottyNavarro6@example.com','703367260',NULL,NULL,NULL,NULL),(46,'User737','8634845135','User','Nguyễn',' Huyền','Nguyễn Thị Diệp',NULL,'1984-06-05 19:13:51',1,'Hưng Yên','Martha.Ayala@example.com','904431717',NULL,NULL,NULL,NULL),(47,'User495','0530713742','User','Nguyễn',' Hương','Trương Khánh Nga',NULL,'1970-01-01 00:22:50',2,'Hà Nam','AllmanD@example.com','327404260',NULL,NULL,NULL,NULL),(48,'User239','7029077352','User','Nguyễn',' Ngọc','Nguyễn Thị Liên',NULL,'1996-11-23 04:07:47',0,'Thanh Hóa','Whitmire346@example.com','737408801',NULL,NULL,NULL,NULL),(49,'User681','9175275492',NULL,'Trần',' Chung','Nông Quốc Thái',NULL,'1970-01-01 00:33:05',1,'Bình Dương','Nava@example.com','709137091',NULL,NULL,NULL,NULL),(50,'User701','0188067223',NULL,'Mai',' Chương','Trần Văn Tài',NULL,'1992-07-13 04:32:11',0,'Hà Nội','rregc52@example.com','636393859',NULL,NULL,NULL,NULL),(52,'dang2','12345678','Admin',NULL,NULL,NULL,NULL,'2023-04-04 00:00:00',NULL,NULL,'dangadmin@gmail.com',NULL,NULL,NULL,NULL,NULL),(53,'44324d','12345678','Admin',NULL,NULL,NULL,NULL,'2023-04-04 00:00:00',NULL,NULL,'dangadm33in@gmail.com',NULL,NULL,NULL,NULL,NULL),(61,'tsdsc','123','User','da','dang','dang','https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Users%2FCarlsonFacebook.png?alt=media&token=6c87a792-19a4-4e3b-be5b-6d10ed10d481','2023-04-15 00:00:00',0,'string','da2@gmail.com','string','2023-04-13 11:32:29','DangPD','2023-05-02 22:14:13','DangPD'),(62,'string3dang','string','User','string','string','string','string','2023-04-13 04:31:27',0,'string','da3@gmail.com','string','2023-04-13 11:33:15','DangPD','2023-04-13 11:33:15','DangPD'),(65,'sdnv123913','12345678','User','jnsd','nsd','iojs',NULL,'2023-05-01 00:00:00',1,'jnsd','da@gmail.com',NULL,'2023-05-03 21:16:18','DangPD','2023-05-03 21:16:18','DangPD'),(66,'sdnv123913','12345678','User','jnsd','nsd','iojs',NULL,'2023-05-01 00:00:00',1,'jnsd','da@gmail.com',NULL,'2023-05-03 21:16:18','DangPD','2023-05-03 21:16:18','DangPD'),(67,'sdnv123913','12345678','User','jnsd','nsd','iojs',NULL,'2023-05-01 00:00:00',1,'jnsd','da@gmail.com',NULL,'2023-05-03 21:17:47','DangPD','2023-05-03 21:17:47','DangPD'),(68,'sdnv123913','12345678','User','jnsd','nsd','iojs',NULL,'2023-05-01 00:00:00',1,'jnsd','da@gmail.com',NULL,'2023-05-03 21:17:47','DangPD','2023-05-03 21:17:47','DangPD'),(69,'dv ','123456','User','nkjdsn','jnsdf ','iojsdn',NULL,'2023-05-01 00:00:00',0,'kjsd','da@gmail.com',NULL,'2023-05-03 21:18:16','DangPD','2023-05-03 21:18:16','DangPD'),(70,'dv','12345678','User','nkjdsn','jnsdf ','iojsdn',NULL,'2023-05-01 00:00:00',0,'kjsd','da@gmail.com',NULL,'2023-05-03 21:18:16','DangPD','2023-05-05 16:09:45','DangPD');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-11  9:45:23
