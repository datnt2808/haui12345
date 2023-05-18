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
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductCode` varchar(100) NOT NULL DEFAULT '',
  `ProductName` varchar(255) NOT NULL DEFAULT '',
  `Price` decimal(19,0) DEFAULT NULL,
  `PlaceOrigin` varchar(255) DEFAULT NULL COMMENT 'Nơi xuất xứ',
  `Status` int DEFAULT NULL,
  `Image` text,
  `QuantitySell` int DEFAULT NULL COMMENT 'Số lượng đã bán',
  `Quantity` int DEFAULT NULL COMMENT 'Số lượng nhập',
  `Description` text,
  `BrandID` int DEFAULT NULL,
  `BrandName` varchar(255) DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(100) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `ProductCode` (`ProductCode`),
  KEY `FK_tb_product_BrandID` (`BrandID`),
  KEY `FK_tb_product_CategoryID` (`CategoryID`),
  CONSTRAINT `FK_tb_product_BrandID` FOREIGN KEY (`BrandID`) REFERENCES `tb_brand` (`BrandID`),
  CONSTRAINT `FK_tb_product_CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `tb_productcategory` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (5,'Sp01','Dầu nhớt',150000,'Hà nội',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2t4awyiva3r130715100714Mobil%201%200W-40_logo.jpg?alt=media&token=6c6c5e49-7c43-4309-9662-2bee67250796',4,96,'Dầu nhớt',16,NULL,9,NULL,'2023-04-22 14:54:27','DangPD','2023-04-24 08:41:40','DangPD'),(6,'SP02','Bộ lọc chắn gió',1200000,'Đức',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2coqp4fkfrb20371401371192_logo.jpg?alt=media&token=3a7e2dcb-8fc2-4cf6-93c4-2a96ee196c2a',0,150,'Sản phẩm bộ lọc',16,NULL,5,NULL,'2023-04-24 08:40:21','DangPD','2023-04-24 08:40:21','DangPD'),(7,'SP03','Chắn bùn sau',300000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2ktjnjgmpx426441410441314_logo.jpg?alt=media&token=4269aa3d-2672-4a3d-a6f3-73d1f45ff14e',0,50,'Sản phẩm chắn bùn sau',14,NULL,5,NULL,'2023-04-24 08:41:28','DangPD','2023-04-24 08:41:28','DangPD'),(8,'SP04','Bộ chắn bùn mazda',600000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2FA2128900078%20-%20Bo%20chan%20bun%20banh%20Mercedes%20E400.jpg?alt=media&token=3b7614aa-49c1-4041-8545-3c67b3f251dc',0,150,'Chắn bùn mazda',16,NULL,5,NULL,'2023-04-24 08:42:54','DangPD','2023-04-24 08:42:54','DangPD'),(9,'Sp05','Chắn bun trước ',300000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2Fchan%20bun%20truoc%20sau%20o%20to.jpg?alt=media&token=5a85c920-df84-4889-9479-67276205e3de',0,200,NULL,12,NULL,5,NULL,'2023-04-24 08:43:53','DangPD','2023-04-24 08:43:53','DangPD'),(10,'Sp06','Chần đạp ga',100000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2rudpx78k2e104614094653378_logo.jpg?alt=media&token=3489236d-e9cd-4004-863e-ec7d6e8d9c06',0,100,'Chân đạp',15,NULL,5,NULL,'2023-04-24 08:44:54','DangPD','2023-04-24 08:44:54','DangPD'),(11,'SP07','Chắn bùn huyndai',350000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2FB66528181686.jpg?alt=media&token=3f2d0972-ffb6-4b3f-97a3-f8b3ff54dbda',1,29,NULL,13,NULL,5,NULL,'2023-04-24 08:57:43','DangPD','2023-04-24 08:57:43','DangPD'),(12,'SP08','Chắn bùn toyota',350000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2pysneo8evq22071405074478_logo.jpg?alt=media&token=8de2034d-1b6e-4d6e-a50d-45ee8b3cc7c2',1,49,'Chắn bùn toyota',14,NULL,5,NULL,'2023-04-24 08:58:33','DangPD','2023-04-24 08:58:33','DangPD'),(13,'SP09','Chắn bùn mazda',350000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2coqp4fkfrb20371401371192_logo.jpg?alt=media&token=ea0076f2-2986-47fa-a15a-57d7a73e5745',0,50,'Chắn bùn mazda',16,NULL,5,NULL,'2023-04-24 08:59:29','DangPD','2023-04-24 08:59:29','DangPD'),(14,'Sp10','Bóng đèn trước mazda',100000,'Việt Nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2b1dsp8swbp2752141052171_logo.jpg?alt=media&token=818bb967-e579-4218-bf67-0a7c76bb40da',6,44,'Bóng đèn trước mazda',16,NULL,5,NULL,'2023-04-24 09:00:25','DangPD','2023-04-24 09:00:25','DangPD'),(15,'Sp11','Bóng đèn trước totyta',150000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2d83edi7vcn19351502355490981-13046_logo.jpg?alt=media&token=6190580b-1e38-4a74-8e5e-7500c2e16e22',4,96,'Bóng đèn trước totyta',14,NULL,5,NULL,'2023-04-24 09:01:21','DangPD','2023-04-24 09:01:21','DangPD'),(16,'Sp12','Bóng đèn trước Vìnast',150000,'Việt nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2hmbp7xjvf62702140402401_logo.jpg?alt=media&token=7b659ca3-05ef-492e-95d7-5f8070f80e5e',4,146,'200000',12,NULL,5,NULL,'2023-04-24 09:02:28','DangPD','2023-04-24 09:02:28','DangPD'),(17,'Sp13','Bóng đèn trước honda',200000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2r7c4qcoqox1559150859263_logo.jpg?alt=media&token=0e0382e1-1e1d-49f3-887b-1e6a15495434',3,97,'Bóng đèn trước honda',15,NULL,5,NULL,'2023-04-24 09:03:22','DangPD','2023-04-24 09:03:22','DangPD'),(18,'Sp14','Bóng đèn trước huyndai',150000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2j4x5ct39an22211411211002_logo.jpg?alt=media&token=ee2f5e5d-69ef-4205-8ae1-8df0d66e11c1',1,149,'Bóng đèn trước huyndai',13,NULL,5,NULL,'2023-04-24 09:05:46','DangPD','2023-04-24 09:05:46','DangPD'),(19,'Sp16','Bóng đèn sau ',100000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2ynsy56reyg301615041608N10721801_logo.jpg?alt=media&token=1d8eed23-d377-40f0-9cb1-c7fda5a68ef9',1,49,'Bóng đèn sau',14,NULL,5,NULL,'2023-04-24 09:06:57','DangPD','2023-04-24 09:06:57','DangPD'),(20,'sp17','Bóng đèn sau vìnfast',150000,'Việt Nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F27q2donbe8q214314014316B%C3%93NG_logo.jpg?alt=media&token=5613d560-8edb-429f-a3be-be8e9e786de6',0,100,'Bóng đèn sau vinsfast',12,NULL,5,NULL,'2023-04-24 09:07:44','DangPD','2023-04-24 09:07:44','DangPD'),(21,'sp18','Bóng đèn sau mazda',100000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F24mgi2nwmd819411505412590981-15021_logo.jpg?alt=media&token=91839239-56e1-40de-89b4-933d87708073',0,100,'Bóng đèn sau mazda',16,NULL,5,NULL,'2023-04-24 09:08:19','DangPD','2023-04-24 09:09:33','DangPD'),(22,'sp15','Bóng đèn sau huyndai',150000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F072601012130887.jpg?alt=media&token=e4fbe7f1-326c-4198-9c4a-2249d34a8eaa',0,100,'Bóng đèn sau huyndai',13,NULL,5,NULL,'2023-04-24 09:09:15','DangPD','2023-04-24 09:09:15','DangPD'),(23,'sp19','Bóng đèn sau cao cap vinfast',200000,'Việt Nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2Fbong%20den%20o%20to%20cao%20cap.jpg?alt=media&token=d77215ff-7705-493a-a78c-6e21d5b2f6f2',0,50,'Bóng đèn sau cao cấp vinfast',12,NULL,5,NULL,'2023-04-24 09:10:42','DangPD','2023-04-24 09:10:42','DangPD'),(24,'sp20','Bóng đèn sau cao cấp mazda',150000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2FD1S974.jpg?alt=media&token=262fe9bc-490c-4932-94ec-62af4bef9688',0,30,'Bóng đèn sau cao cấp mazda',16,NULL,5,NULL,'2023-04-24 09:11:39','DangPD','2023-04-24 09:11:39','DangPD'),(25,'sp21','Đèn pha ô tô vinfast',150000,'Việt Nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2ad4r8tghcr23091411094159_logo.jpg?alt=media&token=67b8c63e-2a27-498a-b98b-2f1f02b8e41e',0,150,'Đèn pha ô tô',12,NULL,5,NULL,'2023-04-24 09:12:53','DangPD','2023-04-24 09:12:53','DangPD'),(26,'sp22','Đèn pha ô tô huyndai',250000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2juwjtst1z423111411110860_logo.JPG?alt=media&token=e83f0129-b472-40b3-8fdf-33b7ade91ec1',0,50,'Đèn pha ô tô huyndai',13,NULL,5,NULL,'2023-04-24 09:13:34','DangPD','2023-04-24 09:13:34','DangPD'),(27,'sp23','Đèn pha ô tô toyota',150000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2ua4fro1q762711140411041_logo.jpg?alt=media&token=cfd67d4e-3edc-416b-b595-8d8a674349c7',0,50,'Đèn pha ô tô toyota',14,NULL,5,NULL,'2023-04-24 09:14:13','DangPD','2023-04-24 09:14:13','DangPD'),(28,'sp24','Đèn pha ô tô honda',200000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2ipec9kvf0w25321403325507_logo.jpg?alt=media&token=697a1289-1a6d-4233-b82f-428d88995171',0,100,'Đèn pha ô tô honda',15,NULL,5,NULL,'2023-04-24 09:14:57','DangPD','2023-04-24 09:14:57','DangPD'),(29,'sp25','Đèn pha ô tô cao cấp honda',250000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2gy8ks44ebi2643140143021_logo.jpg?alt=media&token=eeb0e32b-d772-4c7b-a7f1-eab975824e3e',0,100,'Đèn pha ô tô cao cấp',15,NULL,5,NULL,'2023-04-24 09:15:50','DangPD','2023-04-24 09:15:50','DangPD'),(30,'sp26','Gương chiếu hậu vinfast',300000,'Việt Nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F1%20-%20Cum%20guong%20chieu%20hau%20trai%20xe%20BMW%20X5%20nam%202009%20chinh%20hang.jpg?alt=media&token=e135f8de-2d80-472e-8572-a28d18aaf8b7',0,50,'Gương chiếu hậu vinfast',12,NULL,5,NULL,'2023-04-24 09:17:47','DangPD','2023-04-24 09:17:47','DangPD'),(31,'sp27','Gương chiếu hậu huyndai',250000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F1%20-%20Cum%20guong%20chieu%20hau%20xe%20Chrysler.jpg?alt=media&token=401716f6-bd68-4fb5-ba55-e3129b5fb61c',0,100,'Gương chiếu hậu huyndai',13,NULL,5,NULL,'2023-04-24 09:18:21','DangPD','2023-04-24 09:18:21','DangPD'),(32,'sp28','Gương chiếu hậu toyota',250000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F1K8857507Q%20-%201K8%20857%20507%20Q%20-%20Cum%20guong%20chieu%20hau%20trai%20Volkswagen%20Scirocco.jpg?alt=media&token=0b3eae3d-d1df-4df2-bdfe-3c63309846b1',0,100,'Gương chiếu hậu toyota',14,NULL,5,NULL,'2023-04-24 09:19:00','DangPD','2023-04-24 09:19:00','DangPD'),(33,'sp29','Gương chiếu hậu honda',150000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2aphx3thh9y22301503301387910-0T021_logo.jpg?alt=media&token=5ff4ae8e-f3f4-4b6b-824c-93598b50aeb8',0,50,'Gương chiếu hậu honda',15,NULL,5,NULL,'2023-04-24 09:20:14','DangPD','2023-04-24 09:20:14','DangPD'),(34,'sp30','Gương chiếu hậu mazda',200000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F51%2016%207%20283%20667%20-%20Cum%20guong%20chieu%20hau%20trai%20xe%20BMW%20535i.jpg?alt=media&token=e65a6579-0ffc-4cab-8d0f-400c28e230d5',0,100,'Gương chiếu hậu mazda',16,NULL,5,NULL,'2023-04-24 09:21:05','DangPD','2023-04-24 09:21:05','DangPD'),(35,'sp31','Gương chiếu hậu cap cấp honda',250000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F87910-60E30%20-%208791060E30%20-%20Cum%20guong%20chieu%20hau%20phai%20Lexus%20GX460.jpg?alt=media&token=eebfab0e-d28d-478e-a624-e90fcd8911be',0,50,'Gương chiếu hậu cap cấp honda',15,NULL,5,NULL,'2023-04-24 09:21:59','DangPD','2023-04-24 09:21:59','DangPD'),(36,'sp32','Gương chiếu hậu cap cấp vinfast',300000,'Việt Nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F51%2016%207%20890%20040%20-%20Cum%20guong%20chieu%20hau%20phai%20xe%20BMW%20525i%20E39.jpg?alt=media&token=2a158250-a5ef-45a3-9a55-4807e32ea428',0,100,'Gương chiếu hậu cap cấp vinfast',12,NULL,5,NULL,'2023-04-24 09:22:40','DangPD','2023-04-24 09:22:40','DangPD'),(37,'sp33','Gương chiếu hậu cap cấp huyndai',300000,'hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2038106876%20-%20Cum%20guong%20chieu%20hau%20phai%20xe%20Mercedes%20C180K%20WDB203.jpg?alt=media&token=901c884f-d58f-480b-8d37-4925d784e0bc',0,1000,'Gương chiếu hậu cap cấp huyndai',13,NULL,5,NULL,'2023-04-24 09:23:21','DangPD','2023-04-24 09:23:21','DangPD'),(38,'sp34','Gương chiếu hậu cap cấp toyota',350000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F87940-53240%20-%20Cum%20guong%20chieu%20hau%20trai%20Lexus%20IS250.jpg?alt=media&token=74a46559-f30a-45c0-bf00-f59a2340df48',0,100,'Gương chiếu hậu cap cấp toyota',14,NULL,5,NULL,'2023-04-24 09:23:56','DangPD','2023-04-24 09:23:56','DangPD'),(39,'sp35','Gương chiếu hậu cap cấp mazda',350000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2108100916%20-%20Cum%20guong%20chieu%20hau%20trai%20xe%20Mercedes%20S320%20WDB140.jpg?alt=media&token=71776304-4fcc-4b08-91ef-ddb1dfeb0229',0,50,'Gương chiếu hậu cap cấp mazda',16,NULL,5,NULL,'2023-04-24 09:24:30','DangPD','2023-04-24 09:24:30','DangPD'),(40,'sp36','Gương chiếu hậu cap cấp honda 2',300000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F1%20-%20Cum%20guong%20chieu%20hau%20trai%20xe%20BMW%20X5%20nam%202009%20chinh%20hang.jpg?alt=media&token=32ef1763-544c-4b39-a077-ee9543c5ae2f',6,44,'Gương chiếu hậu cap cấp honda',15,NULL,5,NULL,'2023-04-24 09:25:09','DangPD','2023-05-07 15:53:51','DangPD'),(41,'sp37','Cánh cửa sau vinfast',2000000,'VIệt Nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2ud1dtc52o4215414105438c%C3%A1nh_logo.JPG?alt=media&token=5558ec0c-2048-483d-a3ba-07dbffb00467',0,30,'Cánh cửa sau vinfast',12,NULL,5,NULL,'2023-04-24 09:26:52','DangPD','2023-04-24 09:26:52','DangPD'),(42,'sp38','Cánh cửa sau toyota',1900000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2emfnt84bbs2545140345141_logo.jpg?alt=media&token=9f868765-255b-4ecb-856e-753a18dd1290',0,20,'Cánh cửa sau toyota',14,NULL,5,NULL,'2023-04-24 09:27:24','DangPD','2023-04-24 09:27:24','DangPD'),(43,'sp39','Cánh cửa sau mazda',1500000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F20b8piz8chh305313035311canh%20cua_logo.JPG?alt=media&token=c9548ff5-6652-41da-8f22-c2d58845b938',0,10,'Cánh cửa sau mazda',16,NULL,5,NULL,'2023-04-24 09:27:55','DangPD','2023-04-24 09:27:55','DangPD'),(44,'sp40','Cánh cửa sau honda',1800000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F3W5833055231.jpg?alt=media&token=c7565c78-d02f-4a18-bb71-8e87fc41632e',0,10,'Cánh cửa sau honda',15,NULL,5,NULL,'2023-04-24 09:28:43','DangPD','2023-04-24 09:28:43','DangPD'),(45,'sp41','Tay nắm cửa vinfast',150000,'Việt Nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2047201537%20-%20A2047201537%20-%20A%20204%20720%2015%2037%20-%20Ban%20le%20cua%20tren%20trai%20Mercedes%20C200%2C%20C250%2C%20C300.jpg?alt=media&token=f056f5a1-51de-4b9c-b3ab-815586cd2c12',0,20,'Tay nắm cửa vinfast',12,NULL,5,NULL,'2023-04-24 09:29:30','DangPD','2023-04-24 09:29:30','DangPD'),(46,'sp42','Tay nắm cửa huyndai',190000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2047201537%20-%20A2047201537%20-%20A%20204%20720%2015%2037%20-%20Ban%20le%20cua%20tren%20trai%20Mercedes%20C350%2C%20C63%20AMG.jpg?alt=media&token=8d08d525-fe69-4aa0-ac61-16a26e4ff436',0,30,'Tay nắm cửa huyndai',13,NULL,5,NULL,'2023-04-24 09:30:11','DangPD','2023-04-24 09:30:11','DangPD'),(47,'sp43','Tay nắm cửa toyota',140000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2047201537%20-%20A2047201537%20-%20A%20204%20720%2015%2037%20-%20Ban%20le%20cua%20tren%20trai%20Mercedes%20E63%20AMG%2C%20E500.jpg?alt=media&token=98dc9150-ce4e-49f4-b7c5-054133ddc92d',0,30,'Tay nắm cửa toyota',14,NULL,5,NULL,'2023-04-24 09:30:43','DangPD','2023-04-24 09:30:43','DangPD'),(48,'sp44','Tay nắm cửa mazda',160000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2047201537%20-%20A2047201537%20-%20A%20204%20720%2015%2037%20-%20Ban%20le%20cua%20tren%20trai%20Mercedes%20E350%2C%20E400%2C%20E550.jpg?alt=media&token=f3003462-daa2-4212-9e13-cf93fccdeed8',0,40,'Tay nắm cửa mazda',16,NULL,5,NULL,'2023-04-24 09:31:13','DangPD','2023-04-24 09:31:13','DangPD'),(49,'sp45','Bản lề mazda',60000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2027301937608.JPG?alt=media&token=22b6f20f-9799-4ed4-8ee6-83010e138a51',0,60,NULL,16,NULL,5,NULL,'2023-04-24 09:32:03','DangPD','2023-04-24 09:32:03','DangPD'),(50,'sp46','Bản lề toyota',70000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2027301737278.JPG?alt=media&token=c57ec6f6-67b1-496a-b5f1-b985ae847011',0,50,'Bản lề toyota',14,NULL,5,NULL,'2023-04-24 09:32:39','DangPD','2023-04-24 09:32:39','DangPD'),(51,'sp47','Bình điện cho xe vinfast',150000,'Việt Nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2f6rjgr96rh062814092824108_logo.jpg?alt=media&token=5ab2186b-e710-46fe-8316-077258a4fea8',0,20,'Bình điện cho xe vinfast',12,NULL,6,NULL,'2023-04-24 09:39:42','DangPD','2023-04-24 09:39:42','DangPD'),(52,'sp48','Bình điện cho xe mazda',1500000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2wpn9v1605u22061404064126_logo.jpg?alt=media&token=5e7a9bc3-bc4b-4670-9527-74753fa568d5',0,50,'Bình điện cho xe mazda',16,NULL,6,NULL,'2023-04-24 09:41:16','DangPD','2023-04-24 09:41:16','DangPD'),(53,'sp49','Bình điện cho xe toyota',1500000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F26e24vkpdj207031404033854_logo.jpg?alt=media&token=e2426e51-0983-4ff1-b490-64a7d472acc2',0,30,'Bình điện cho xe toyota',14,NULL,11,NULL,'2023-04-24 09:41:49','DangPD','2023-05-13 22:23:12','DangPD'),(54,'sp50','Bình điện cho xe huyndai',1900000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F278314f94p52545140945251_logo.jpg?alt=media&token=5057e0f6-ed2f-4a06-9c72-63fd84a4ed0a',0,30,'Bình điện cho xe huyndai',13,NULL,6,NULL,'2023-04-24 09:43:18','DangPD','2023-04-24 09:43:18','DangPD'),(55,'sp51','Bình điện cho xe hhonda',1700000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F000915105CD976.JPG?alt=media&token=f0f16514-5d13-4ec5-bbcf-a40d563e4411',2,58,'Bình điện cho xe honda',15,NULL,6,NULL,'2023-04-24 09:44:01','DangPD','2023-04-24 09:44:01','DangPD'),(56,'sp52','Bình điện cao cấp cho xe vinfast',2500000,'Việt Nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2FBinh%20ac%20quy%20(binh%20dien)%20Hybrid%20xe%20Lexus%20GS450H%20-%20G9510-30030%20-%20G951030030.jpg?alt=media&token=6ddce9e0-bbca-4241-b666-e199a4f32882',3,47,'Bình điện cao cấp cho xe vinfast',12,NULL,6,NULL,'2023-04-24 09:45:28','DangPD','2023-04-24 09:45:28','DangPD'),(57,'sp53','Bộ chống cháy nổ vinfast',350000,'Việt Nam',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2FG9510-4801170.jpg?alt=media&token=489eb3a8-c7f2-4d5f-9500-22e88cb023cd',4,46,'Bộ chống cháy nổ vinfast',12,NULL,6,NULL,'2023-04-24 09:47:08','DangPD','2023-04-24 09:47:08','DangPD'),(58,'sp54','Bộ chống cháy nổ toyota',300000,'Nhật',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2FG9510-50051996.jpg?alt=media&token=3bac6b94-31a9-4728-a946-80ef03cebd25',0,60,'Bộ chống cháy nổ toyota',14,NULL,6,NULL,'2023-04-24 09:47:57','DangPD','2023-04-25 01:15:45','DangPD'),(59,'sp55','Giàn nóng xe mazda',450000,'Hàn',0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F2appbnme480275114035134d%C3%A0n%20n%C3%B3ng_logo.jpg?alt=media&token=14f66595-ef84-4121-8cd5-1ee10971553c',3,7,NULL,16,NULL,6,NULL,'2023-04-27 14:12:37','DangPD','2023-04-27 14:22:31','DangPD'),(60,'sp56','Giàn lạnh',450000,NULL,0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F4F0260401%20-%204F0%20260%20401%20-%204F0260401P%20-%204F0%20260%20401%20P%20-%204F0260401E%20-%204F0%20260%20401%20E.jpg?alt=media&token=002a024e-e134-4212-a6b6-eaef147c2cf9',6,50,NULL,12,NULL,5,NULL,'2023-04-27 14:23:31','DangPD','2023-05-13 20:37:12','DangPD'),(61,'sp57','Giàn nóng honda',600000,NULL,0,'https://firebasestorage.googleapis.com/v0/b/autopro-c7a26.appspot.com/o/Products%2F7H1%20820%20101%20C%20-%207L0820102%20-%207L0%20820%20102%20-%207H1820105%20-%207H1%20820%20105%20-%207H1820101C.jpg?alt=media&token=213df202-50a4-4aef-9bc3-5ab47160c826',3,7,NULL,15,NULL,5,NULL,'2023-04-27 14:34:41','DangPD','2023-05-04 20:15:42','DangPD');
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-14  9:32:41