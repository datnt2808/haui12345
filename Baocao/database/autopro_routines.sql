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
-- Dumping routines for database 'autopro'
--
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Brand_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Brand_Delete`(IN v_BrandID varchar(255))
BEGIN
  DELETE
    FROM tb_brand
  WHERE BrandID = v_BrandID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Brand_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Brand_Filter`(IN p_TextSearch varchar(255), IN p_PageSize int, IN p_PageNumber int)
BEGIN
  SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  SET p_TextSearch = CONCAT('%', COALESCE(p_TextSearch, ''), '%');
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
    ROW_NUMBER() OVER (
    ORDER BY tb.ModifiedDate DESC) AS RowIndex,
    tb.BrandID,
    tb.BrandCode,
    tb.BrandName,
    tb.Image,
    tb.Description,
    tb.CreatedDate,
    tb.ModifiedDate
  FROM tb_brand tb
  WHERE tb.BrandCode LIKE p_TextSearch
  OR tb.BrandName LIKE p_TextSearch;

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
  SELECT
    COUNT(tl.BrandID) AS 'totalRecord',
    CEILING((COUNT(tl.BrandID) / p_PageSize)) AS 'TotalPage'
  FROM tbOrginal tl
  WHERE tl.BrandCode LIKE p_TextSearch
  OR tl.BrandName LIKE p_TextSearch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Brand_GetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Brand_GetAll`()
BEGIN
  SELECT * FROM tb_brand tb;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Brand_GetByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Brand_GetByID`(IN v_BrandID varchar(255))
BEGIN
  SELECT
    *
  FROM tb_brand tb
  WHERE tb.BrandID = v_BrandID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Brand_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Brand_Insert`(IN v_BrandID int,IN v_BrandCode varchar(100), IN v_BrandName varbinary(255), IN v_Image text, IN v_Description varchar(255), IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  INSERT INTO tb_brand (BrandID,BrandCode, BrandName, Image, Description, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
    VALUES (v_BrandID,v_BrandCode, v_BrandName, v_Image, v_Description, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Brand_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Brand_Update`(IN v_BrandID int, IN v_BrandCode varchar(100), IN v_BrandName varbinary(255), IN v_Image text, IN v_Description varchar(255), IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  UPDATE tb_brand tb
  SET BrandID = v_BrandID,
      BrandCode = v_BrandCode,
      BrandName = v_BrandName,
      Image = v_Image,
      Description = v_Description,
      CreatedDate = v_CreatedDate,
      CreatedBy = v_CreatedBy,
      ModifiedDate = v_ModifiedDate,
      ModifiedBy = v_ModifiedBy
  WHERE BrandID = v_BrandID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Cart_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Cart_Delete`(IN v_CartID int)
BEGIN
  DELETE
    FROM tb_cart
  WHERE CartID = v_CartID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Cart_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Cart_Filter`(IN p_TextSearch VARCHAR(255), IN p_PageSize INT, IN p_PageNumber INT)
BEGIN
SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  SET p_TextSearch = CONCAT('%', COALESCE(p_TextSearch, ''), '%');
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
      ROW_NUMBER() OVER (
    ORDER BY tb.ModifiedDate DESC) AS RowIndex,
    tb.BrandID,
    tb.BrandCode,
    tb.BrandName,
    tb.Image,
    tb.Description,
    tb.CreatedDate,
    tb.ModifiedDate
  FROM tb_brand tb
  WHERE tb.BrandCode LIKE p_TextSearch
  OR tb.BrandName LIKE p_TextSearch;

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
  SELECT
    COUNT(tl.BrandID) AS 'totalRecord',
    CEILING((COUNT(tl.BrandID) / p_PageSize)) AS 'TotalPage'
  FROM tbOrginal tl
  WHERE tl.BrandCode LIKE p_TextSearch
  OR tl.BrandName LIKE p_TextSearch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Cart_GetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Cart_GetAll`()
BEGIN
  SELECT
    *
  FROM tb_cart tc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Cart_GetByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Cart_GetByID`(IN v_CartID int)
BEGIN
  SELECT
    *
  FROM tb_cart tc
  WHERE tc.CartID = v_CartID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Cart_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Cart_Insert`(IN v_CartID int, IN v_Price decimal, IN v_Quantity int, IN v_Status int, IN v_UserID int, IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  INSERT INTO tb_cart (CartID, Price, Quantity, Status, UserID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
    VALUES (v_CartID, v_Price, v_Quantity, v_Status, v_UserID, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Cart_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Cart_Update`(IN v_CartID int, IN v_Price decimal, IN v_Quantity int, IN v_Status int, IN v_UserID int, IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  UPDATE tb_cart tc
  SET CartID = v_CartID,
      Price = v_Price,
      Quantity = v_Quantity,
      Status = v_Status,
      UserID = v_UserID,
      CreatedDate = v_CreatedDate,
      CreatedBy = v_CreatedBy,
      ModifiedDate = v_ModifiedDate,
      ModifiedBy = v_ModifiedBy
  WHERE CartID = v_CartID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Contact_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Contact_Delete`(IN v_ContactID int)
BEGIN
  DELETE
    FROM tb_contact
  WHERE ContactID = v_ContactID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Contact_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Contact_Filter`(IN p_TextSearch varchar(255), IN p_PageSize int, IN p_PageNumber int)
BEGIN
  SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  SET p_TextSearch = CONCAT('%', COALESCE(p_TextSearch, ''), '%');
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
    ROW_NUMBER() OVER (
    ORDER BY tb.ModifiedDate DESC) AS RowIndex,
    tb.ContactID,
    tb.ContactName,
    tb.ContactEmail,
    tb.ContactPhone,
    tb.ContactContent,
    tb.CreatedDate
  FROM tb_contact tb
  WHERE tb.ContactName LIKE p_TextSearch
  OR tb.ContactEmail LIKE p_TextSearch
  OR tb.ContactPhone LIKE p_TextSearch
  OR tb.ContactContent LIKE p_TextSearch;

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
  SELECT
    COUNT(tl.ContactID) AS 'totalRecord',
    CEILING((COUNT(tl.ContactID) / p_PageSize)) AS 'TotalPage'
  FROM tbOrginal tl
  WHERE tl.ContactName LIKE p_TextSearch
  OR tl.ContactEmail LIKE p_TextSearch
  OR tl.ContactPhone LIKE p_TextSearch
  OR tl.ContactContent LIKE p_TextSearch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Contact_GetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Contact_GetAll`()
BEGIN
  SELECT
    *
  FROM tb_contact tc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Contact_GetByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Contact_GetByID`(IN v_ContactID int)
BEGIN
  SELECT
    *
  FROM tb_contact tc
  WHERE tc.ContactID = v_ContactID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Contact_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Contact_Insert`(IN v_ContactID int, IN v_ContactName varchar(255), IN v_ContactEmail varchar(50), IN v_ContactPhone varchar(100), IN v_ContactContent text, IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  INSERT INTO tb_contact (ContactID, ContactName, ContactEmail, ContactPhone, ContactContent, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
    VALUES (v_ContactID, v_ContactName, v_ContactEmail, v_ContactPhone, v_ContactContent, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Contact_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Contact_Update`(IN v_ContactID int, IN v_ContactName varchar(255), IN v_ContactEmail varchar(50), IN v_ContactPhone varchar(100), IN v_ContactContent text,IN v_CreatedDate datetime,IN v_CreatedBy varchar(100),IN v_ModifiedDate datetime,IN v_ModifiedBy varchar(100))
BEGIN
  UPDATE tb_contact tc
  SET ContactID = v_ContactID,
      ContactName = v_ContactName,
      ContactEmail = v_ContactEmail,
      ContactPhone = v_ContactPhone,
      ContactContent = v_ContactContent,
      CreatedDate = v_CreatedDate,
      CreatedBy = v_CreatedBy,
      ModifiedDate = v_ModifiedDate,
      ModifiedBy = v_ModifiedBy
  WHERE ContactID = v_ContactID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_DashLoad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_DashLoad`()
BEGIN
  SELECT
    COUNT(*) AS 'tongsp'
  FROM tb_product tp;
  SELECT
    COUNT(*) AS 'tonguser'
  FROM tb_user tu;
  SELECT
    COUNT(DISTINCT tbo.OrderID) AS tongdonhang
  FROM tb_orders tbo
    INNER JOIN tb_orderdetail `to`
      ON tbo.OrderID = `to`.OrderID;

  SELECT
    SUM(tbo.totalAmount) AS 'tongdoanhthu'
  FROM tb_orders tbo
  WHERE tbo.StatusOrders = 1;
  SELECT
    COUNT(*) AS 'tongtintuc'
  FROM tb_news tn;
  SELECT
    COUNT(*) AS 'tongnhanhang'
  FROM tb_brand tb;
  SELECT
    COUNT(*) AS 'tongdanhmuc'
  FROM tb_productcategory tp;
  SELECT
    COUNT(*) AS 'sanphamsaphethang'
  FROM tb_product tp
  WHERE (tp.Quantity - tp.QuantitySell) < 10;

  SELECT COUNT(*) AS 'tongsodanhgia' FROM tb_productcomment tp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_News_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_News_Delete`(IN v_NewsID int)
BEGIN
  DELETE
    FROM tb_news
  WHERE NewsID = v_NewsID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_News_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_News_Filter`(IN p_TextSearch VARCHAR(255), IN p_PageSize INT, IN p_PageNumber int)
BEGIN
  SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  SET p_TextSearch = CONCAT('%', COALESCE(p_TextSearch, ''), '%');
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
      ROW_NUMBER() OVER (
    ORDER BY tb.ModifiedDate DESC) AS RowIndex,
    tb.NewsID,
    tb.NewsTitle,
    tb.NewsDate,
    tb.Image,
    tb.ContentShorted,
    tb.Content,
    tb.CreatedDate,
    tb.ModifiedDate
  FROM tb_news tb
  WHERE tb.NewsTitle LIKE p_TextSearch
  OR tb.ContentShorted LIKE p_TextSearch
  OR tb.Content LIKE p_TextSearch;

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
  SELECT
    COUNT(tl.NewsID) AS 'totalRecord',
    CEILING((COUNT(tl.NewsID) / p_PageSize)) AS 'TotalPage'
  FROM tbOrginal tl
  WHERE tl.NewsTitle LIKE p_TextSearch
  OR tl.ContentShorted LIKE p_TextSearch
  OR tl.Content LIKE p_TextSearch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_News_GetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_News_GetAll`()
BEGIN
  SELECT
    *
  FROM tb_news tn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_News_GetByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_News_GetByID`(IN v_NewsID int)
BEGIN
  SELECT
    *
  FROM tb_news tn
  WHERE tn.NewsID = v_NewsID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_News_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_News_Insert`(IN v_NewsID int, IN v_NewsTitle varchar(500), IN v_NewsDate datetime, IN v_Image text, IN v_ContentShorted varchar(500), IN v_Content text, IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  INSERT INTO tb_news (NewsID, NewsTitle, NewsDate, Image, ContentShorted, Content, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
    VALUES (v_NewsID, v_NewsTitle, v_NewsDate, v_Image, v_ContentShorted, v_Content, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_News_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_News_Update`(IN v_NewsID int, IN v_NewsTitle varchar(500), IN v_NewsDate datetime,IN v_Image text, IN v_ContentShorted varchar(500), IN v_Content text, IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  UPDATE tb_news tn
  SET NewsID = v_NewsID,
      NewsTitle = v_NewsTitle,
      NewsDate = v_NewsDate,
      Image = v_Image,
      ContentShorted = v_ContentShorted,
      Content = v_Content,
      CreatedDate = v_CreatedDate,
      CreatedBy = v_CreatedBy,
      ModifiedDate = v_ModifiedDate,
      ModifiedBy = v_ModifiedBy
  WHERE NewsID = v_NewsID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_OrderDetail_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_OrderDetail_Filter`(IN p_TextSearch varchar(255), IN p_PageSize int, IN p_PageNumber int)
BEGIN
  SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  SET p_TextSearch = CONCAT('%', COALESCE(p_TextSearch, ''), '%');
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
    ROW_NUMBER() OVER (
    ORDER BY tos.OrderDate DESC) AS RowIndex,
    tb.OrderDetailID,
    tb.ProductID,
    tb.ProductCode,
    tb.ProductName,
    tb.Price,
    tb.Quantitys,
    tp.Image,
    tos.OrderCode,
    tos.OrderDate,
    tos.StatusOrders,
    tos.CheckOutStatusID,
    tos.CheckOutTypeName
  FROM tb_orderdetail tb
    INNER JOIN tb_product tp
      ON tb.ProductID = tp.ProductID
    INNER JOIN tb_orders tos
      ON tb.OrderID = tos.OrderID
  WHERE tos.OrderCode LIKE p_TextSearch
  OR tos.FullName LIKE p_TextSearch
  OR tos.PhoneNumber LIKE p_TextSearch
  OR tos.Address LIKE p_TextSearch;

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
  SELECT
    COUNT(*) AS 'totalRecord',
    CEILING((COUNT(*) / p_PageSize)) AS 'TotalPage'
  FROM tbOrginal tl;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_OrderDetail_GetByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_OrderDetail_GetByID`(v_OrderID int)
BEGIN
  SELECT ybl.* FROM tb_orderdetail ybl INNER JOIN tb_orders tbo ON ybl.OrderID = tbo.OrderID WHERE ybl.OrderID = v_OrderID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_OrderDetail_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_OrderDetail_Insert`(IN v_OrderID int, IN v_ProductID int, IN v_ProductCode varchar(255), IN v_ProductName varchar(255), IN v_Price decimal, v_Quantitys int)
BEGIN
  INSERT INTO tb_orderdetail (OrderID, ProductID, ProductCode, ProductName, Price, Quantitys)
    VALUES (v_OrderID, v_ProductID, v_ProductCode, v_ProductName, v_Price, v_Quantitys);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Orders_ByIDUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Orders_ByIDUser`(IN v_UserID int)
BEGIN
  SELECT DISTINCT
    tbo.*
  FROM tb_orders tbo
    INNER JOIN tb_orderdetail tbl
      ON tbo.OrderID = tbl.OrderID
  WHERE tbo.IdUser = v_UserID
  ORDER BY tbo.ModifiedDate DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Orders_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Orders_Delete`(IN id VARCHAR(255))
BEGIN
  DELETE FROM tb_orders WHERE OrderID= id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Orders_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Orders_Filter`(IN p_TextSearch varchar(255), IN p_PageSize int, IN p_PageNumber int)
BEGIN
  SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  SET p_TextSearch = CONCAT('%', COALESCE(p_TextSearch, ''), '%');
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
    ROW_NUMBER() OVER (
    ORDER BY tb.OrderDate DESC) AS RowIndex,
    tb.OrderID,
    tb.OrderCode,
    tb.OrderDate,
    tb.IdUser,
    tb.FullName,
    tb.Address,
    tb.PhoneNumber,
    tb.totalAmount,
    tb.StatusOrders,
    tb.StatusOrdersName,
    tb.CheckOutTypeID,
    tb.CheckOutTypeName,
    tb.CheckOutStatusID,
    tb.CheckOutStatusName
  FROM tb_orders tb
    INNER JOIN tb_orderdetail `to`
      ON tb.OrderID = `to`.OrderID
  WHERE (tb.OrderCode LIKE p_TextSearch
  OR tb.FullName LIKE p_TextSearch
  OR tb.Address LIKE p_TextSearch
  OR tb.PhoneNumber LIKE p_TextSearch)
  GROUP BY tb.OrderID;

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
  SELECT
    COUNT(tl.OrderID) AS 'totalRecord',
    CEILING((COUNT(tl.OrderID) / p_PageSize)) AS 'TotalPage'
  FROM tbOrginal tl
  WHERE tl.OrderCode LIKE p_TextSearch
  OR tl.FullName LIKE p_TextSearch
  OR tl.Address LIKE p_TextSearch
  OR tl.PhoneNumber LIKE p_TextSearch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Orders_FilterByStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Orders_FilterByStatus`(IN p_TextSearch varchar(255), IN p_PageSize int, IN p_PageNumber int, IN p_StatusOrders int)
BEGIN
  SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  SET p_TextSearch = CONCAT('%', COALESCE(p_TextSearch, ''), '%');
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
    ROW_NUMBER() OVER (
    ORDER BY tb.OrderDate DESC) AS RowIndex,
    tb.OrderID,
    tb.OrderCode,
    tb.OrderDate,
    tb.FullName,
    tb.Address,
    tb.PhoneNumber,
    tb.totalAmount,
    tb.StatusOrders,
    tb.StatusOrdersName,
    tb.CheckOutTypeID,
    tb.CheckOutTypeName,
    tb.CheckOutStatusID,
    tb.CheckOutStatusName,
    SUM(tbo.Price * tbo.Quantitys) AS TotalPrice,
    SUM(tbo.Quantitys) AS TotalQuantity
  FROM tb_orders tb
    INNER JOIN tb_orderdetail tbo
      ON tb.OrderID = tbo.OrderID
  WHERE ((tb.OrderCode LIKE p_TextSearch
  OR tb.FullName LIKE p_TextSearch
  OR tb.Address LIKE p_TextSearch
  OR tb.PhoneNumber LIKE p_TextSearch)
  AND tb.StatusOrders = p_StatusOrders)
  GROUP BY tb.OrderID;

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
  SELECT
    COUNT(tl.OrderID) AS 'totalRecord',
    CEILING((COUNT(tl.OrderID) / p_PageSize)) AS 'TotalPage'
  FROM tbOrginal tl
  WHERE tl.OrderCode LIKE p_TextSearch
  OR tl.FullName LIKE p_TextSearch
  OR tl.Address LIKE p_TextSearch
  OR tl.PhoneNumber LIKE p_TextSearch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Orders_GetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Orders_GetAll`()
BEGIN
  SELECT
    *
  FROM tb_orders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Orders_GetByCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Orders_GetByCode`(IN v_OrderCode varchar(255))
BEGIN
  SELECT * FROM tb_orders tbo WHERE tbo.OrderCode = v_OrderCode;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Orders_GetByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Orders_GetByID`(IN v_OrderID INT)
BEGIN
  SELECT * FROM tb_orders tb WHERE tb.OrderID = v_OrderID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Orders_GetMaxCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Orders_GetMaxCode`()
BEGIN
  SELECT * FROM tb_orders tbo ORDER BY tbo.OrderID DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Orders_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Orders_Insert`(IN v_OrderID int, v_OrderCode varchar(100), IN v_OrderDate datetime, IN v_IdUser int, IN v_FullName varchar(255), IN v_Address varchar(255), IN v_PhoneNumber varchar(255),IN v_Description varchar(255),IN v_TotalAmount int, IN v_StatusOrders int, IN v_StatusOrdersName varchar(255), IN v_CheckOutTypeID int, IN v_CheckOutTypeName varchar(255), IN v_CheckOutStatusID int, IN v_CheckOutStatusName varchar(100), IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  INSERT INTO tb_orders (OrderID, ordercode, orderdate, IdUser, FullName, address, phonenumber,Description, totalAmount, StatusOrders, StatusOrdersName, checkouttypeid, checkouttypename, checkoutstatusid, checkoutstatusname, createddate, createdby, modifieddate, modifiedby)
    VALUES (v_OrderID, v_OrderCode, v_OrderDate, v_IdUser, v_FullName, v_Address, v_PhoneNumber,v_Description,v_TotalAmount, v_StatusOrders, v_StatusOrdersName, v_CheckOutTypeID, v_CheckOutTypeName, v_CheckOutStatusID, v_CheckOutStatusName, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Orders_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Orders_Update`(IN v_OrderID int, v_OrderCode varchar(100), IN v_OrderDate datetime, IN v_IdUser int, IN v_FullName varchar(255), IN v_Address varchar(255), IN v_PhoneNumber varchar(255),IN v_Description varchar(255),IN v_TotalAmount int, IN v_StatusOrders int, IN v_StatusOrdersName varchar(255), IN v_CheckOutTypeID int, IN v_CheckOutTypeName varchar(255), IN v_CheckOutStatusID int, IN v_CheckOutStatusName varchar(100), IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
UPDATE tb_orders tbo
SET OrderID = v_OrderID,
    OrderCode = v_OrderCode,
    OrderDate = v_OrderDate,
    IdUser = v_IdUser,
    FullName = v_FullName,
    Address = v_Address,
    PhoneNumber = v_PhoneNumber,
    Description = v_Description,
    totalAmount = v_TotalAmount,
    StatusOrders = v_StatusOrders,
    StatusOrdersName = v_StatusOrdersName,
    CheckOutTypeID = v_CheckOutTypeID,
    CheckOutTypeName = v_CheckOutTypeName,
    CheckOutStatusID = v_CheckOutStatusID,
    CheckOutStatusName = v_CheckOutStatusName,
    CreatedDate = v_CreatedDate,
    CreatedBy = v_CreatedBy,
    ModifiedDate = v_ModifiedDate,
    ModifiedBy = v_ModifiedBy
WHERE OrderID = v_OrderID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Order_ThongKeTheoNhanHang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Order_ThongKeTheoNhanHang`(IN v_month int, IN v_year int)
BEGIN
  SELECT
    MONTH(tbo.OrderDate) AS 'month',
    YEAR(tbo.OrderDate) AS 'year',
    tb.BrandName AS 'brandName',
    SUM(tbl.Quantitys * tbl.Price) AS 'totalPrice'
  FROM tb_orders tbo
    INNER JOIN tb_orderdetail tbl
      ON tbo.OrderID = tbl.OrderID
    INNER JOIN tb_product tp
      ON tbl.ProductID = tp.ProductID
    INNER JOIN tb_brand tb
      ON tp.BrandID = tb.BrandID
  WHERE tbo.StatusOrders = 1
  AND MONTH(tbo.OrderDate) = v_month
  AND YEAR(tbo.OrderDate) = v_year
  GROUP BY tb.BrandID,
           MONTH(tbo.OrderDate),
           YEAR(tbo.OrderDate)

  UNION ALL

  SELECT
    NULL AS 'month',
    NULL AS 'year',
    tb.BrandName AS 'brandName',
    0 AS 'totalPrice'
  FROM tb_brand tb
  WHERE tb.BrandID NOT IN (SELECT
      tp.BrandID
    FROM tb_product tp
      INNER JOIN tb_orderdetail tbl
        ON tp.ProductID = tbl.ProductID
      INNER JOIN tb_orders tbo
        ON tbl.OrderID = tbo.OrderID
    WHERE tbo.StatusOrders = 1
    AND MONTH(tbo.OrderDate) = v_month
    AND YEAR(tbo.OrderDate) = v_year);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Order_ThongKeTungThangTrongNam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Order_ThongKeTungThangTrongNam`(IN v_year int)
BEGIN
  SELECT
    months.month_number AS 'thang',
    COALESCE(SUM(tbo.totalAmount), 0) AS 'tongtien'
  FROM (SELECT
      1 AS month_number
    UNION
    SELECT
      2
    UNION
    SELECT
      3
    UNION
    SELECT
      4
    UNION
    SELECT
      5
    UNION
    SELECT
      6
    UNION
    SELECT
      7
    UNION
    SELECT
      8
    UNION
    SELECT
      9
    UNION
    SELECT
      10
    UNION
    SELECT
      11
    UNION
    SELECT
      12) months
    LEFT JOIN tb_orders tbo
      ON MONTH(tbo.OrderDate) = months.month_number
      AND YEAR(tbo.OrderDate) = v_year
      AND tbo.StatusOrders = 1
  GROUP BY months.month_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Porduct_Filter2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Porduct_Filter2`(IN p_TextSearch VARCHAR(1000),IN p_OrderBy varchar(255), IN p_PageSize INT, IN p_PageNumber INT)
BEGIN

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ProductCategory_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ProductCategory_Delete`(IN v_CategoryID int)
BEGIN
  DELETE FROM tb_productcategory WHERE CategoryID = v_CategoryID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ProductCategory_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ProductCategory_Filter`(IN p_TextSearch varchar(255), IN p_PageSize int, IN p_PageNumber int)
BEGIN
  SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  SET p_TextSearch = CONCAT('%', COALESCE(p_TextSearch, ''), '%');
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
    ROW_NUMBER() OVER (
    ORDER BY tb.ModifiedDate DESC) AS RowIndex,
    tb.CategoryID,
    tb.CategoryCode,
    tb.CategoryName,
    tb.Description,
    tb.CreatedBy,
    tb.CreatedDate,
    tb.ModifiedDate
  FROM tb_productcategory tb
  WHERE tb.CategoryCode LIKE p_TextSearch
  OR tb.CategoryName LIKE p_TextSearch
  OR tb.Description LIKE p_TextSearch;

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
  SELECT
    COUNT(tl.CategoryID) AS 'totalRecord',
    CEILING((COUNT(tl.CategoryID) / p_PageSize)) AS 'TotalPage'
  FROM tbOrginal tl
  WHERE tl.CategoryCode LIKE p_TextSearch
  OR tl.CategoryName LIKE p_TextSearch
  OR tl.Description LIKE p_TextSearch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ProductCategory_GetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ProductCategory_GetAll`()
BEGIN
  SELECT * FROM tb_productcategory tp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ProductCategory_GetByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ProductCategory_GetByID`(IN v_CategoryID int)
BEGIN
  SELECT * FROM tb_productcategory tp WHERE tp.CategoryID = v_CategoryID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ProductCategory_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ProductCategory_Insert`(IN v_CategoryID int,IN v_CategoryCode varchar(50),IN v_CategoryName varchar(255),IN v_Description text,IN v_CreatedDate datetime,IN v_CreatedBy varchar(100),IN v_ModifiedDate datetime,IN v_ModifiedBy varchar(100))
BEGIN
  INSERT INTO tb_productcategory (CategoryID, CategoryCode, CategoryName, Description, CreatedDate,CreatedBy , ModifiedDate,ModifiedBy)
  VALUES (v_CategoryID,v_CategoryCode,v_CategoryName,v_Description,v_CreatedDate,v_CreatedBy,v_ModifiedDate,v_ModifiedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ProductCategory_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ProductCategory_Update`(IN v_CategoryID int,IN v_CategoryCode varchar(50),IN v_CategoryName varchar(255),IN v_Description text,IN v_CreatedDate datetime,IN v_CreatedBy varchar(100),IN v_ModifiedDate datetime,IN v_ModifiedBy varchar(100))
BEGIN
  UPDATE tb_productcategory tp 
SET CategoryID = v_CategoryID,
    CategoryCode = v_CategoryCode,
    CategoryName = v_CategoryName,
    Description = v_Description,
    CreatedBy = 'DangPD',
    CreatedDate = v_CreatedDate,
    ModifiedBy = 'DangPD',
    ModifiedDate = v_ModifiedDate
WHERE CategoryID = v_CategoryID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ProductComment_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ProductComment_Delete`(IN v_CommentID int)
BEGIN
  DELETE
    FROM tb_productcomment
  WHERE CommentID = v_CommentID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ProductComment_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ProductComment_Filter`(IN p_TextSearch varchar(255), IN p_PageSize int, IN p_PageNumber int)
BEGIN
  SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  SET p_TextSearch = CONCAT('%', COALESCE(p_TextSearch, ''), '%');
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
    ROW_NUMBER() OVER (
    ORDER BY tb.ModifiedDate DESC) AS RowIndex,
    tb.CommentID,
    tb.UserID,
    tb.Name,
    tb.Image,
    tb.Detail,
    tb.ProductID,
    tb.RatingID,
    tb.CreatedDate,
    tb.ModifiedDate
  FROM tb_productcomment tb
  WHERE tb.Name LIKE p_TextSearch
  OR tb.Detail LIKE p_TextSearch
  OR tb.ProductID LIKE p_TextSearch;

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
  SELECT
    COUNT(tl.CommentID) AS 'totalRecord',
    CEILING((COUNT(tl.CommentID) / p_PageSize)) AS 'TotalPage'
  FROM tbOrginal tl
  WHERE tl.Name LIKE p_TextSearch
  OR tl.Detail LIKE p_TextSearch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ProductComment_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ProductComment_Insert`(IN v_CommentID int, v_UserID int, IN v_Name varchar(50), IN v_Image text, IN v_Detail varchar(500), IN v_ProductID int, IN v_RatingID int, IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  INSERT INTO tb_productcomment (CommentID, UserID, Name, Image, Detail, ProductID, RatingID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
    VALUES (v_CommentID, v_UserID, v_Name, v_Image, v_Detail, v_ProductID, v_RatingID, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ProductComment_ListConmentGetByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ProductComment_ListConmentGetByID`(IN v_ProductID INT)
BEGIN
  SELECT
    *
  FROM tb_productcomment tp
  WHERE tp.ProductID = v_ProductID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_ProductOrdersDetail_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_ProductOrdersDetail_Update`(IN v_ProductID int,in v_QuantitySell int,in v_Quantity int)
BEGIN
  UPDATE tb_product tp
  SET ProductID = v_ProductID,
      QuantitySell = v_QuantitySell,
      Quantity = v_Quantity
  WHERE ProductID = v_ProductID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Product_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Product_Delete`(IN v_ProductID int)
BEGIN
  DELETE
    FROM tb_product
  WHERE ProductID = v_ProductID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Product_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Product_Filter`(IN p_TextSearch VARCHAR(255), IN p_PageSize INT, IN p_PageNumber INT)
BEGIN
SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  SET p_TextSearch = CONCAT('%', COALESCE(p_TextSearch, ''), '%');
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
      ROW_NUMBER() OVER (
    ORDER BY tb.ModifiedDate DESC) AS RowIndex,
    tb.ProductID,
    tb.ProductCode,
    tb.ProductName,
    tb.Price,
    tb.PlaceOrigin,
    tb.Status,
    tb.Image,
    tb.QuantitySell,
    tb.Quantity,
    tb.Description,
    tb.BrandID,
    tb.CategoryID,
    tb.CreatedDate,
    tb.ModifiedDate
  FROM tb_product tb
  WHERE tb.ProductCode LIKE p_TextSearch
  OR tb.ProductName LIKE p_TextSearch
  OR tb.PlaceOrigin LIKE p_TextSearch
  OR tb.Description LIKE p_TextSearch;

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
  SELECT
    COUNT(tl.ProductID) AS 'totalRecord',
    CEILING((COUNT(tl.ProductID) / p_PageSize)) AS 'TotalPage'
  FROM tbOrginal tl
  WHERE tl.ProductCode LIKE p_TextSearch
  OR tl.ProductName LIKE p_TextSearch
  OR tl.PlaceOrigin LIKE p_TextSearch
  OR tl.Description LIKE p_TextSearch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Product_GetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Product_GetAll`()
BEGIN
  SELECT * FROM tb_product tp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Product_GetByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Product_GetByID`(IN v_ProductID int)
BEGIN
  SELECT
    *
  FROM tb_product tp
  WHERE tp.ProductID = v_ProductID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Product_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Product_Insert`(IN v_ProductID int, IN v_ProductCode varchar(100), IN v_ProductName varchar(255), IN v_Price decimal, IN v_PlaceOrigin varchar(255), IN v_Status int, IN v_Image text, IN v_QuantitySell int, IN v_Quantity int, IN v_Description text, IN v_BrandID int, IN v_BrandName varchar(255), v_CategoryID int, IN v_CategoryName varchar(255), IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  INSERT INTO tb_product (ProductID, ProductCode, ProductName, Price, PlaceOrigin, Status, Image, QuantitySell, Quantity, Description, BrandID, BrandName, CategoryID, CategoryName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)
    VALUES (v_ProductID, v_ProductCode, v_ProductName, v_Price, v_PlaceOrigin, v_Status, v_Image, v_QuantitySell, v_Quantity, v_Description, v_BrandID, v_BrandName, v_CategoryID, v_CategoryName, v_CreatedDate, v_CreatedBy, v_ModifiedDate, v_ModifiedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Product_Search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Product_Search`(IN p_TextSearch varchar(1000), IN p_OrderBy varchar(255), IN p_PageSize int, IN p_PageNumber int)
BEGIN
  SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
    ROW_NUMBER() OVER (
    ORDER BY p.ModifiedDate DESC) AS RowIndex,
    p.ProductID,
    p.ProductCode,
    p.ProductName,
    p.Price,
    p.PlaceOrigin,
    p.Status,
    p.Image,
    p.QuantitySell,
    p.Quantity,
    p.Description,
    p.BrandID,
    p.CategoryID,
    p.CreatedDate,
    p.ModifiedDate
  FROM tb_product p
  WHERE p.ProductCode LIKE '%honda%'
  ORDER BY p_OrderBy;

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Product_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Product_Update`(IN v_ProductID int, IN v_ProductCode varchar(100), IN v_ProductName varchar(255), IN v_Price decimal, IN v_PlaceOrigin varchar(255), IN v_Status int, IN v_Image text,IN v_QuantitySell int , IN v_Quantity int, IN v_Description text, IN v_BrandID int,IN v_BrandName varchar(255), v_CategoryID int,IN v_CategoryName varchar(255), IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  UPDATE tb_product tp
  SET ProductID = v_ProductID,
      ProductCode = v_ProductCode,
      ProductName = v_ProductName,
      Price = v_Price,
      PlaceOrigin = v_PlaceOrigin,
      Status = v_Status,
      Image = v_Image,
      QuantitySell = v_QuantitySell,
      Quantity = v_Quantity,
      Description = v_Description,
      BrandID = v_BrandID,
      BrandName = v_BrandName,
      CategoryID = v_CategoryID,
      CategoryName = v_CategoryName,
      CreatedDate = v_CreatedDate,
      CreatedBy = v_CreatedBy,
      ModifiedDate = v_ModifiedDate,
      ModifiedBy = v_ModifiedBy
  WHERE ProductID = v_ProductID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_User_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_User_Delete`(IN v_UserID int)
BEGIN
  DELETE
    FROM tb_user
  WHERE UserID = v_UserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_User_DuplicateAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_User_DuplicateAccount`(IN v_Account varchar(100))
BEGIN
  SELECT
    COUNT(*)
  FROM tb_user tu
  WHERE tu.Account = v_Account;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_User_DuplicateEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_User_DuplicateEmail`(IN v_Email varchar(100))
BEGIN
  SELECT
    COUNT(*)
  FROM tb_user tu
  WHERE tu.Email = v_Email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_User_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_User_Filter`(IN p_TextSearch varchar(255), IN p_PageSize int, IN p_PageNumber int)
BEGIN
  SET @pageIndex = p_PageNumber;
  SET @pageSize = p_PageSize;
  SET p_TextSearch = CONCAT('%', COALESCE(p_TextSearch, ''), '%');
  CREATE TEMPORARY TABLE IF NOT EXISTS tbOrginal AS
  SELECT
    ROW_NUMBER() OVER (
    ORDER BY tb.ModifiedDate DESC) AS RowIndex,
    tb.UserID,
    tb.Account,
    tb.Password,
    tb.FirstName,
    tb.Role,
    tb.LastName,
    tb.FullName,
    tb.Image,
    tb.DateOfBirth,
    tb.Gender,
    tb.Address,
    tb.Email,
    tb.PhoneNumber,
    tb.CreatedDate,
    tb.ModifiedDate
  FROM tb_user tb
  WHERE tb.Role LIKE '%User%'
  AND (tb.Account LIKE p_TextSearch
  OR tb.FirstName LIKE p_TextSearch
  OR tb.LastName LIKE p_TextSearch
  OR tb.FullName LIKE p_TextSearch
  OR tb.Email LIKE p_TextSearch
  OR tb.Address LIKE p_TextSearch
  OR tb.PhoneNumber LIKE p_TextSearch);

  SET @IndexEnd = @pageSize * @pageIndex;
  SET @IndexStart = @IndexEnd - @pageSize + 1;

  SELECT
    *
  FROM tbOrginal eo
  WHERE eo.RowIndex BETWEEN @IndexStart AND @IndexEnd;
  SELECT
    COUNT(tl.UserID) AS 'totalRecord',
    CEILING((COUNT(tl.UserID) / p_PageSize)) AS 'TotalPage'
  FROM tbOrginal tl
  WHERE tl.Account LIKE p_TextSearch
  OR tl.FirstName LIKE p_TextSearch
  OR tl.LastName LIKE p_TextSearch
  OR tl.FullName LIKE p_TextSearch
  OR tl.Email LIKE p_TextSearch
  OR tl.Address LIKE p_TextSearch
  OR tl.PhoneNumber LIKE p_TextSearch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_User_ForgotPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_User_ForgotPassword`(IN v_Account varchar(255), IN v_Email varchar(255))
BEGIN
  SELECT tu.Password FROM tb_user tu WHERE tu.Account = v_Account AND tu.Email = v_Email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_User_GetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_User_GetAll`()
BEGIN
  SELECT
    *
  FROM tb_user tu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_User_GetByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_User_GetByID`(IN v_UserID INT)
BEGIN
  SELECT
    *
  FROM tb_user tu
  WHERE tu.UserID = v_UserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_User_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_User_Insert`(IN v_UserID int, IN v_Account varchar(100), IN v_Password varchar(100), IN v_Role varchar(25), IN v_FirstName varchar(50), IN v_LastName varchar(50), IN v_FullName varchar(255), IN v_Image varchar(255), IN v_DateOfBirth datetime, IN v_Gender int, IN v_Address varchar(255), IN v_Email varchar(50), IN v_PhoneNumber varchar(50),IN v_CreatedDate datetime,IN v_CreatedBy varchar(100),IN v_ModifiedDate datetime,IN v_ModifiedBy varchar(100))
BEGIN
  INSERT INTO tb_user (UserID, Account, Password, Role, FirstName, LastName, FullName, Image, DateOfBirth, Gender, Address, Email, PhoneNumber,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
    VALUES (v_UserID,v_Account,v_Password,v_Role,v_FirstName,v_LastName,v_FullName,v_Image,v_DateOfBirth,v_Gender,v_Address,v_Email,v_PhoneNumber,v_CreatedDate,v_CreatedBy,v_ModifiedDate,v_ModifiedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_User_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_User_Login`(IN v_Account varchar(100),IN v_Password varchar(100))
BEGIN
  SELECT * FROM tb_user tu WHERE tu.Account = v_Account AND tu.Password = v_Password;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_User_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_User_Update`(IN v_UserID int, IN v_Account varchar(100), IN v_Password varchar(100), IN v_Role varchar(25), IN v_FirstName varchar(50), IN v_LastName varchar(50), IN v_FullName varchar(255), IN v_Image varchar(255), IN v_DateOfBirth datetime, IN v_Gender int, IN v_Address varchar(255), IN v_Email varchar(50), IN v_PhoneNumber varchar(50), IN v_CreatedDate datetime, IN v_CreatedBy varchar(100), IN v_ModifiedDate datetime, IN v_ModifiedBy varchar(100))
BEGIN
  UPDATE tb_user tu
  SET UserID = v_UserID,
      Account = v_Account,
      Password = v_Password,
      Role = v_Role,
      FirstName = v_FirstName,
      LastName = v_LastName,
      FullName = v_FullName,
      Image = v_Image,
      DateOfBirth = v_DateOfBirth,
      Gender = v_Gender,
      Address = v_Address,
      Email = v_Email,
      PhoneNumber = v_PhoneNumber,
      CreatedDate = v_CreatedDate,
      CreatedBy = v_CreatedBy,
      ModifiedDate = v_ModifiedDate,
      ModifiedBy = v_ModifiedBy
  WHERE UserID = v_UserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_User_UpdatePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_User_UpdatePassword`(IN v_Password varchar(255),IN v_id int)
BEGIN
  UPDATE tb_user tu 
SET 
    Password = v_Password
WHERE UserID = v_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test`()
BEGIN
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-11  9:45:23
