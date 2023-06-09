﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.338.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/studio
-- Script date 4/12/2023 4:35:51 PM
-- Target server version: 8.0.32
-- Target connection string: User Id=root;Host=localhost;Character Set=utf8
--



SET NAMES 'utf8';
USE autopro;
--
-- Delete data from the table 'tb_user'
--
DELETE FROM tb_user;

--
-- Inserting data into table tb_user
--
INSERT INTO tb_user(UserId, Account, Password, Role, FisrtName, LastName, FullName, DateOfBirth, Gender, Address, Email, PhoneNumber) VALUES
(1, 'User181', '2652381698', 'User', 'Nguyễn', ' Hồng', 'Nguyễn Thị Thanh', '1982-09-13 22:08:43', 0, 'Bình Thuận', 'ArnoldG.Ambrose455@example.com', '265238169'),
(2, 'User772', '5474568815', 'User', NULL, NULL, NULL, NULL, NULL, NULL, 'Whitman9@example.com', NULL),
(3, 'User059', '7556667693', 'User', 'Hoàng', ' Bằng', 'Đinh Văn Nhân', '2003-07-13 05:29:47', 1, 'Lào Cai', 'Stacey85@nowhere.com', '854745688'),
(4, 'User201', '6446763180', 'User', 'Mai', ' Tuân', 'Nguyễn Linh Đan', '1970-01-01 00:13:17', 2, 'Bắc Ninh', 'Lutz438@nowhere.com', '157556667'),
(5, 'User755', '6704749517', 'User', 'Trương', ' Thọ', 'Vũ Thị Liễu', '1998-12-03 02:22:41', 1, 'Hưng Yên', 'RegaladoO@example.com', '693644676'),
(6, 'User676', '2339538789', 'User', 'Hoàng', ' Thoa', 'Trần Ngọc Khuê', '1995-09-13 15:05:10', 0, 'Nam Định', 'Hyman@example.com', '318067047'),
(7, 'User407', '0394104653', 'User', 'Nguyễn', ' Quế', 'Hồ Thị Thơm', '1970-01-01 01:00:02', 1, 'Cà Mau', 'KareemBinkley@example.com', '495172339'),
(8, 'User780', '1198173280', 'User', 'Trần', ' Liễu', 'Trần Thị Trâm', '2011-01-08 16:18:38', 2, 'Hải Hậu', 'Eda_Mallory577@example.com', '538789039'),
(9, 'User553', '2514428925', 'User', 'Nguyễn', ' Băng', 'Đinh Khánh Thu', '2017-05-08 16:59:38', 1, 'Lào Cai', 'AguiarP@nowhere.com', '410465311'),
(10, 'User521', '6691530975', 'User', 'Hồ', ' Dương', 'Đinh Văn Phúc', '2013-11-08 03:12:38', 0, 'Quảng Ninh', 'RicardaNAndre@example.com', '981732802'),
(11, 'User236', '9727520345', NULL, 'Bùi', ' Bình', 'Hoàng Tiến Trung', '2013-02-15 10:49:43', 2, 'Hải Hậu', 'BannisterO485@example.com', '514428925'),
(12, 'User718', '2593829820', 'User', 'Trần', ' Kiên', 'Mai Thị My', '1992-08-15 01:39:03', 1, 'Hà Nội', 'MauricePepper949@example.com', '669153097'),
(13, 'User479', '1767867078', 'User', 'Hồ', ' Thoa', 'Bùi Văn Linh', '1988-08-28 17:03:46', 0, 'Cà Mau', 'Fay.Andres@example.com', '597275203'),
(14, 'User394', '2962999705', 'User', 'Trần', ' Định', 'Nguyễn Văn Lĩnh', '2002-11-04 01:34:24', 1, 'Quảng Ninh', 'Wade.H.Marx722@example.com', '452593829'),
(15, 'User265', '7989280477', 'User', NULL, NULL, NULL, NULL, NULL, NULL, 'zajvyfes_gigpanbvkz@example.com', NULL),
(16, 'User032', '7721414799', 'User', 'Nguyễn', ' Bằng', 'Hồ Trọng Dương', '1970-01-01 00:12:29', 0, 'Bắc Giang', 'jmcqy5@example.com', '820176786'),
(17, 'User130', '8359746071', 'User', 'Nông', ' Trí', 'Trịnh Thành Nghị', '1972-05-18 17:08:55', 2, 'Bắc Ninh', 'Acevedo733@example.com', '707829629'),
(18, 'User641', '9474486234', 'User', 'Hoàng', ' Đạt', 'Trần Thị Nhã', '1994-09-24 15:32:36', 1, 'Hà Nam', 'Abreu@example.com', '997057989'),
(19, 'User428', '6958524804', 'User', NULL, NULL, NULL, NULL, NULL, NULL, 'Moeller@example.com', NULL),
(20, 'User021', '6943303940', 'User', 'Trần', ' Anh', 'Hoàng Thị Chi', '1970-01-01 00:12:02', 1, 'Ninh Bình', 'Acker@example.com', '280477772'),
(21, 'User624', '4700267608', 'User', 'Võ', ' Nhân', 'Trần Hưng Thọ', '2011-09-30 17:20:23', 0, 'Bình Thuận', 'ElissaJacobs@example.com', '141479983'),
(22, 'User475', '9449575971', 'User', 'Nguyễn', ' Phương', 'Trần Văn Cảnh', '1983-04-08 02:45:01', 2, 'Hà Nội', 'rxrisnix_pmwl@nowhere.com', '597460719'),
(23, 'User195', '0257820161', NULL, 'Nguyễn', ' Cường', 'Trịnh Anh Cường', '1970-01-01 01:51:01', 2, 'Bắc Ninh', 'gmfyejp7@example.com', '474486234'),
(24, 'User345', '7688864445', 'User', 'Nguyễn', ' Mỹ', 'Nguyễn Thị Thoa', '1970-01-01 00:12:02', 1, 'Hưng Yên', 'FallonLane@example.com', '695852480'),
(25, 'User730', '5839739435', 'User', NULL, NULL, NULL, NULL, NULL, NULL, 'Alvin.Hahn@example.com', NULL),
(26, 'User581', '4222057430', 'User', NULL, NULL, NULL, NULL, NULL, NULL, 'bfpu4@example.com', NULL),
(27, 'User483', '3998543063', 'User', 'Nguyễn', ' Bình', 'Đinh Linh Chi', '1995-08-15 07:26:22', 2, 'Hải Hậu', 'ElijahAbney@example.com', '469433039'),
(28, 'User670', '7711614241', 'User', 'Nguyễn', ' Liễu', 'Võ Quang Phúc', '1994-04-08 18:16:12', 1, 'TP.Hồ Chí Minh', 'Haynes729@example.com', '404700267'),
(29, 'User696', '6803580349', 'User', 'Nguyễn', ' Linh', 'Võ Quốc Thịnh', '1992-08-14 18:19:17', 1, 'Hải Hậu', 'Marchand@example.com', '608944957'),
(30, 'User712', '2524468315', 'User', 'Vũ', ' Vinh', 'Bùi Văn Phi', '1971-07-30 13:03:25', 2, 'Bắc Giang', 'AndyLott617@example.com', '597102578'),
(31, 'User753', '9546221785', 'User', 'Trần', ' Linh', 'Vũ Thị Diệp', '1970-01-01 00:12:07', 1, 'Lào Cai', 'MasonM_Cortes145@nowhere.com', '201617688'),
(32, 'User928', '3292416155', 'User', 'Nguyễn', ' Cương', 'Nguyễn Thị Mỹ', '1984-03-18 02:02:48', 0, 'Hải Hậu', 'AbbyRhoads4@example.com', '864445583'),
(33, 'User309', '7293574018', 'User', 'Bùi', ' Long', 'Nguyễn Văn Phúc', '1996-06-29 23:40:05', 2, 'Bình Thuận', 'IlonaAshmore@example.com', '973943542'),
(34, 'User830', '0451932706', NULL, 'Mai', ' Đan', 'Trương Văn Đạt', '1983-05-09 17:10:34', 0, 'Bắc Giang', 'Valentin@nowhere.com', '220574303'),
(35, 'User978', '1873588564', 'User', 'Nguyễn', ' Khánh', 'Nguyễn Ngọc Huyền', '1998-07-12 06:02:57', 1, 'Bình Thuận', 'ylffg9891@example.com', '998543063'),
(36, 'User718', '0703367260', 'User', 'Bùi', ' Hương', 'Đinh Văn Nhân', '2018-05-09 18:21:55', 2, 'Bắc Giang', 'Keith29@nowhere.com', '771161424'),
(37, 'User607', '9044317173', 'User', 'Nguyễn', ' Liễu', 'Trần Trí Thắng', '2015-05-05 10:47:50', 0, 'Hải Hậu', 'Acker@example.com', '168035803'),
(38, 'User874', '2740426073', 'User', 'Nguyễn', ' Anh', 'Nông Thị Ngà', '2008-12-26 19:14:24', 1, 'Bình Dương', 'Abrams29@example.com', '492524468'),
(39, 'User722', '7408801709', 'User', 'Nguyễn', ' Quang', 'Nông Quang Nam', '1970-01-01 00:12:33', 0, 'Cà Mau', 'xrysmi3@example.com', '315954622'),
(40, 'User941', '1370916363', 'User', 'Nguyễn', ' Hà', 'Trần Thị Loan', '1970-01-01 00:21:58', 2, 'Lào Cai', 'LaddT@nowhere.com', '178532924'),
(41, 'User708', '9385945714', 'User', 'Hoàng', ' Phú', 'Nguyễn Ngọc Thăng', '2007-05-19 03:15:38', 2, 'Cà Mau', 'CurtisBTrimble2@example.com', '161557293'),
(42, 'User873', '0242127846', 'User', 'Nguyễn', ' Dương', 'Nguyễn Thị Phương', '1970-01-01 02:24:56', 0, 'Lào Cai', 'IgnacioEllington43@example.com', '574018045'),
(43, 'User303', '2590981955', 'User', 'Trần', ' Duy', 'Trịnh Thị Điệp', '1970-01-01 00:12:10', 0, 'Hưng Yên', 'Forsythe@nowhere.com', '193270618'),
(44, 'User011', '4264804604', 'User', 'Nguyễn', ' Anh', 'Nguyễn Văn Nghĩa', '2011-06-14 22:36:38', 1, 'Hà Nam', 'Toby.Dellinger@example.com', '735885640'),
(45, 'User037', '0574017271', 'User', 'Trần', ' Nghị', 'Nguyễn Thành Anh', '1980-05-12 18:35:19', 2, 'Hà Nội', 'ScottyNavarro6@example.com', '703367260'),
(46, 'User737', '8634845135', 'User', 'Nguyễn', ' Huyền', 'Nguyễn Thị Diệp', '1984-06-05 19:13:51', 1, 'Hưng Yên', 'Martha.Ayala@example.com', '904431717'),
(47, 'User495', '0530713742', 'User', 'Nguyễn', ' Hương', 'Trương Khánh Nga', '1970-01-01 00:22:50', 2, 'Hà Nam', 'AllmanD@example.com', '327404260'),
(48, 'User239', '7029077352', 'User', 'Nguyễn', ' Ngọc', 'Nguyễn Thị Liên', '1996-11-23 04:07:47', 0, 'Thanh Hóa', 'Whitmire346@example.com', '737408801'),
(49, 'User681', '9175275492', NULL, 'Trần', ' Chung', 'Nông Quốc Thái', '1970-01-01 00:33:05', 1, 'Bình Dương', 'Nava@example.com', '709137091'),
(50, 'User701', '0188067223', NULL, 'Mai', ' Chương', 'Trần Văn Tài', '1992-07-13 04:32:11', 0, 'Hà Nội', 'rregc52@example.com', '636393859');