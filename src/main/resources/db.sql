-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: pttk_bookstore
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `ID` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('1','thangnd','12345678'),('3eb16b6f-e597-45ec-900b-1cf8b3c588d9','ngocanhtran','12345678'),('432ce1cb-0239-4b26-8c96-8ea481388501','thangwsn','12345678'),('4c6e10f2-bc54-459c-a516-27f5e656333a','user1','1323dfsfs'),('883b7f98-c141-4653-80fb-7cf49b221784','huyenttt','12345678'),('b6a8b746-2805-4167-a8a6-845f8dffa57d','quannv','12345678'),('c3b725ce-5d96-45d8-bb3a-f64563dfee34','huyentran','12345678');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `ID` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL,
  `Province` varchar(255) NOT NULL,
  `District` varchar(255) NOT NULL,
  `Ward` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('0c78ee40-d8fa-4fb9-975a-b6d14f8ac7ce','Vietnam','Ha Noi','Tu Liem','Cau Dien'),('1','Viet Nam','Ha Nam','Ly Nhan','Tien Thang'),('47f3fb0c-45e2-4caa-9354-420c302361cd','Vietnam','Ha Noi','Ha Dong','Phuc La'),('a592d4b7-f600-4a31-a232-b51daecda278','Viet Nam','Ha Noi','Cau Giay','Nghia Do'),('b04e0b28-76b6-47f6-a127-22e87d19d22b','Vietnam','Ha Noi','Ha Dong','Mo Lap'),('c346dcc6-838d-47b5-b462-5609c37c2566','Vietnam','Ha Noi','Binh Luc','Tien Thang`'),('ee6dee93-63f7-481f-b39d-3f2d52111bf7','Vietnam','Ha Noi','Tu Liem','Cau Dien');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `ID` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Biography` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('1','Nguyen Van A','DSFIEHFIHEF','Ha Noi'),('2','Tran Van N','NFSFGKFGKN','Nam Dinh'),('3','Nguyễn Nhật Ánh','Nguyễn Nhật Ánh là tên và cũng là bút danh của một nhà văn Việt Nam chuyên viết cho tuổi mới lớn','Quảng Nam');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ID` varchar(255) NOT NULL,
  `BookItemID` varchar(255) NOT NULL,
  `OrderID` varchar(255) DEFAULT NULL,
  `ImportPrice` double NOT NULL,
  `CreateDate` date DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKBook313834` (`BookItemID`),
  KEY `FKBook75827` (`OrderID`),
  CONSTRAINT `FKBook313834` FOREIGN KEY (`BookItemID`) REFERENCES `bookitem` (`ID`),
  CONSTRAINT `FKBook75827` FOREIGN KEY (`OrderID`) REFERENCES `order` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('1','1','3d2da5ff-7069-4fd2-aba4-55c67ec11950',100000,NULL,'Sold'),('10','9d6c9675-29eb-4342-82a3-1815c8fcce4e','921b8914-0cc4-406e-8729-41a5ce914476',50000,NULL,'Sold'),('11','9d6c9675-29eb-4342-82a3-1815c8fcce4e',NULL,50000,NULL,'InStock'),('12','9d6c9675-29eb-4342-82a3-1815c8fcce4e',NULL,50000,NULL,'InStock'),('13','9d6c9675-29eb-4342-82a3-1815c8fcce4e',NULL,50000,NULL,'InStock'),('14','9d6c9675-29eb-4342-82a3-1815c8fcce4e',NULL,50000,NULL,'InStock'),('15','eceb3a79-f847-48ff-8d67-4f61315a670c','5a120fa6-9e8b-4af9-8e3d-914efff21785',100000,NULL,'Sold'),('16','eceb3a79-f847-48ff-8d67-4f61315a670c','86c67d75-2186-4ff5-b187-b6dfcfb21b44',100000,NULL,'Sold'),('17','eceb3a79-f847-48ff-8d67-4f61315a670c','5c14211c-cc50-4f70-964f-f1c6b7b729a4',100000,NULL,'Sold'),('18','eceb3a79-f847-48ff-8d67-4f61315a670c',NULL,100000,NULL,'InStock'),('19','eceb3a79-f847-48ff-8d67-4f61315a670c',NULL,100000,NULL,'InStock'),('2','1','3d2da5ff-7069-4fd2-aba4-55c67ec11950',100000,NULL,'Sold'),('20','eceb3a79-f847-48ff-8d67-4f61315a670c',NULL,110000,NULL,'InStock'),('21','db70a53d-9f38-4a4a-989f-3ecb01679c38','861adeb6-7b66-43f8-93b4-dcbb732ec6ee',110000,NULL,'Sold'),('22','db70a53d-9f38-4a4a-989f-3ecb01679c38','da38445d-8693-4e5d-ab55-90af3bbea057',110000,NULL,'Sold'),('23','db70a53d-9f38-4a4a-989f-3ecb01679c38',NULL,110000,NULL,'InStock'),('24','db70a53d-9f38-4a4a-989f-3ecb01679c38',NULL,110000,NULL,'InStock'),('25','db70a53d-9f38-4a4a-989f-3ecb01679c38',NULL,110000,NULL,'InStock'),('26','db70a53d-9f38-4a4a-989f-3ecb01679c38',NULL,110000,NULL,'InStock'),('27','db70a53d-9f38-4a4a-989f-3ecb01679c38',NULL,110000,NULL,'InStock'),('28','db70a53d-9f38-4a4a-989f-3ecb01679c38',NULL,110000,NULL,'InStock'),('29','c45d709f-b7d3-460b-b8d5-637e49c3366d','5a120fa6-9e8b-4af9-8e3d-914efff21785',140000,NULL,'Sold'),('3','2','fb00b8d4-630a-493f-a408-b18b6c2ab0a5',100000,NULL,'Sold'),('30','c45d709f-b7d3-460b-b8d5-637e49c3366d','5a120fa6-9e8b-4af9-8e3d-914efff21785',140000,NULL,'Sold'),('31','c45d709f-b7d3-460b-b8d5-637e49c3366d',NULL,140000,NULL,'InStock'),('32','c45d709f-b7d3-460b-b8d5-637e49c3366d',NULL,140000,NULL,'InStock'),('33','c45d709f-b7d3-460b-b8d5-637e49c3366d',NULL,140000,NULL,'InStock'),('34','c45d709f-b7d3-460b-b8d5-637e49c3366d',NULL,140000,NULL,'InStock'),('35','c45d709f-b7d3-460b-b8d5-637e49c3366d',NULL,140000,NULL,'InStock'),('36','c45d709f-b7d3-460b-b8d5-637e49c3366d',NULL,140000,NULL,'InStock'),('37','c45d709f-b7d3-460b-b8d5-637e49c3366d',NULL,140000,NULL,'InStock'),('4','2','861adeb6-7b66-43f8-93b4-dcbb732ec6ee',100000,NULL,'Sold'),('5','1','eec22f47-6044-443d-a648-01760e51b9f1',20000,NULL,'Sold'),('6','2',NULL,80000,NULL,'InStock'),('7','9d6c9675-29eb-4342-82a3-1815c8fcce4e',NULL,50000,NULL,'InStock'),('8','9d6c9675-29eb-4342-82a3-1815c8fcce4e',NULL,50000,NULL,'InStock'),('9','9d6c9675-29eb-4342-82a3-1815c8fcce4e',NULL,50000,NULL,'InStock');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookitem`
--

DROP TABLE IF EXISTS `bookitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookitem` (
  `ID` varchar(255) NOT NULL,
  `PublisherID` varchar(255) NOT NULL,
  `ISBN` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Summary` varchar(255) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `PublicationDate` date NOT NULL,
  `NumberOfPage` int NOT NULL,
  `BuyPrice` double NOT NULL,
  `Quantity` int NOT NULL,
  `CreateDate` date DEFAULT NULL,
  `SoldQuantity` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ISBN` (`ISBN`),
  KEY `FKBookItem856437` (`PublisherID`),
  CONSTRAINT `FKBookItem856437` FOREIGN KEY (`PublisherID`) REFERENCES `publisher` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookitem`
--

LOCK TABLES `bookitem` WRITE;
/*!40000 ALTER TABLE `bookitem` DISABLE KEYS */;
INSERT INTO `bookitem` VALUES ('1','1','B123','Toan','Toan cao cap\r\n                                    \r\n                                    ','Comic','2021-01-01',200,120000,117,'2021-12-22',3),('2','2','B132','Van','njnjgnfndgfd','Textbook','2020-02-02',100,100000,98,'2021-12-12',3),('9d6c9675-29eb-4342-82a3-1815c8fcce4e','2','B011','Anh',' TOEIC IIG                         \r\n                                    \r\n                                    ','Textbook','2010-12-02',300,120000,99,'2022-01-03',1),('c45d709f-b7d3-460b-b8d5-637e49c3366d','3','B14435','Tự Học ARDUINO Bằng Hình Ảnh','                 Phần 1: Thực hành với Arduino\r\n\r\n- Chương 1: giới thiệu Arduino\r\n\r\n- Chương 2: Hiển thị                 ','Textbook','2004-01-07',533,200000,8,'2022-01-05',2),('db70a53d-9f38-4a4a-989f-3ecb01679c38','2','B1436','Ngày Xưa Có Một Chuyện Tình',' \"Ngày xưa có một chuyện tình\" là tác phẩm mới tinh thứ 2 trong năm 2016 của nhà văn Nguyễn Nhật Ánh dài hơn 300 trang, được coi là tập tiếp theo của tập truyện Mắt biếc.                     ','Novel','2020-10-11',344,130000,18,'2022-01-05',2),('eceb3a79-f847-48ff-8d67-4f61315a670c','2','B035','Thương Nhớ Trà Long','Một cuốn sách lãng mạn, trong từng con chữ đầy ắp tình yêu với mưa, với lá, với ngôi nhà cũ, cuốn sách xưa, cùng nỗi nhớ quê và những kỷ niệm thuở nhỏ                        ','Novel','2020-10-11',110,80000,7,'2022-01-05',3);
/*!40000 ALTER TABLE `bookitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookitem_author`
--

DROP TABLE IF EXISTS `bookitem_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookitem_author` (
  `AuthorID` varchar(255) NOT NULL,
  `BookItemID` varchar(255) NOT NULL,
  PRIMARY KEY (`AuthorID`,`BookItemID`),
  KEY `FKBookItem_A269348` (`BookItemID`),
  CONSTRAINT `FKBookItem_A269348` FOREIGN KEY (`BookItemID`) REFERENCES `bookitem` (`ID`),
  CONSTRAINT `FKBookItem_A711079` FOREIGN KEY (`AuthorID`) REFERENCES `author` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookitem_author`
--

LOCK TABLES `bookitem_author` WRITE;
/*!40000 ALTER TABLE `bookitem_author` DISABLE KEYS */;
INSERT INTO `bookitem_author` VALUES ('1','1'),('2','1'),('1','2'),('1','9d6c9675-29eb-4342-82a3-1815c8fcce4e'),('1','c45d709f-b7d3-460b-b8d5-637e49c3366d'),('2','c45d709f-b7d3-460b-b8d5-637e49c3366d'),('3','db70a53d-9f38-4a4a-989f-3ecb01679c38'),('3','eceb3a79-f847-48ff-8d67-4f61315a670c');
/*!40000 ALTER TABLE `bookitem_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `ID` varchar(255) NOT NULL,
  `CustomerID` varchar(255) NOT NULL,
  `Total` double NOT NULL,
  `Status` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKCart972029` (`CustomerID`),
  CONSTRAINT `FKCart972029` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('019dce61-2712-41ea-b622-7c002444afb0','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9',240000,'Completed'),('04233ed4-2f0d-4589-ac57-32ed503f2b86','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9',80000,'Completed'),('0b76b882-58a7-4561-a903-1570e61f76c4','1',0,'InProgress'),('134b42dd-4002-4e17-a953-0e2de7880002','1',120000,'Completed'),('41641a50-805b-40aa-942b-f32095a4305f','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9',80000,'Completed'),('569c8fb9-3569-40eb-aaeb-9fda41ae2306','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9',200000,'InProgress'),('5e850f23-125b-4786-ad27-ca567766964d','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9',480000,'Completed'),('6d25165f-d351-4933-a36d-9eafd3e4db3f','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9',120000,'Completed'),('92dedbb8-9cc3-4d08-b193-f4fa50495d1f','1',100000,'Completed'),('98e5048e-33fb-4ad7-ab94-a54f54e20d0b','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9',230000,'Completed'),('a0410a22-848d-47c4-a0d5-5ff7357416cd','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9',130000,'Completed'),('a180b3a4-5976-477a-82a9-8247b3d84c1b','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9',0,'Completed'),('a5a42c1b-79e1-4c22-a888-30c922aa1062','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9',120000,'Completed'),('eb24ed1d-38e3-4cbc-8190-260a4756f228','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9',120000,'Completed'),('fd1d5c29-0666-4a61-9009-3af934f31ec5','1',220000,'Completed');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartdetail`
--

DROP TABLE IF EXISTS `cartdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartdetail` (
  `ID` varchar(255) NOT NULL,
  `CartID` varchar(255) NOT NULL,
  `BookItemID` varchar(255) NOT NULL,
  `Quantity` int NOT NULL,
  `BuyPrice` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKCartDetail47301` (`BookItemID`),
  KEY `FKCartDetail151737` (`CartID`),
  CONSTRAINT `FKCartDetail151737` FOREIGN KEY (`CartID`) REFERENCES `cart` (`ID`),
  CONSTRAINT `FKCartDetail47301` FOREIGN KEY (`BookItemID`) REFERENCES `bookitem` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartdetail`
--

LOCK TABLES `cartdetail` WRITE;
/*!40000 ALTER TABLE `cartdetail` DISABLE KEYS */;
INSERT INTO `cartdetail` VALUES ('23611aa2-4e3f-401b-b20c-745ee3aca3fa','98e5048e-33fb-4ad7-ab94-a54f54e20d0b','2',1,100000),('26cd2878-44b2-4e50-94ba-35b24d0458db','a0410a22-848d-47c4-a0d5-5ff7357416cd','db70a53d-9f38-4a4a-989f-3ecb01679c38',1,130000),('38be7abb-4393-4bf2-9d9f-2b0c221210db','04233ed4-2f0d-4589-ac57-32ed503f2b86','eceb3a79-f847-48ff-8d67-4f61315a670c',1,80000),('6ce8ae63-6d6c-4746-82ff-9792de9e96bb','98e5048e-33fb-4ad7-ab94-a54f54e20d0b','db70a53d-9f38-4a4a-989f-3ecb01679c38',1,130000),('7ce35f6b-414e-4b47-a0d1-94dcf14d51ca','fd1d5c29-0666-4a61-9009-3af934f31ec5','2',1,100000),('7d3a9310-3cdb-4e01-ad22-8dc4a32357cb','a5a42c1b-79e1-4c22-a888-30c922aa1062','1',1,120000),('7d96b7cf-bfd8-45a9-a34d-f6db999fad49','5e850f23-125b-4786-ad27-ca567766964d','eceb3a79-f847-48ff-8d67-4f61315a670c',1,80000),('869c8554-4eba-4adb-9f3a-eb6226120f52','41641a50-805b-40aa-942b-f32095a4305f','eceb3a79-f847-48ff-8d67-4f61315a670c',1,80000),('8d2da693-c516-4703-a8ce-0baf58591f52','fd1d5c29-0666-4a61-9009-3af934f31ec5','1',1,120000),('a18cd1ff-31ae-410f-8495-0984fd0bcd4d','92dedbb8-9cc3-4d08-b193-f4fa50495d1f','2',1,100000),('a760c651-6148-4e2b-8bf8-1c5b369feb06','eb24ed1d-38e3-4cbc-8190-260a4756f228','1',1,120000),('cb3419a3-681f-4741-9012-462d9b301830','134b42dd-4002-4e17-a953-0e2de7880002','1',1,120000),('ccc81fd9-09c7-468d-95c1-283c341a897b','569c8fb9-3569-40eb-aaeb-9fda41ae2306','c45d709f-b7d3-460b-b8d5-637e49c3366d',1,200000),('d3f51cee-9105-41db-ae11-75be660d7d19','5e850f23-125b-4786-ad27-ca567766964d','c45d709f-b7d3-460b-b8d5-637e49c3366d',2,200000),('ebe8c2b9-58cb-4dcd-b183-3dbfe5aaf527','019dce61-2712-41ea-b622-7c002444afb0','1',2,120000),('fd82262b-a846-4aa3-b9d6-bb5bd97dbe82','6d25165f-d351-4933-a36d-9eafd3e4db3f','9d6c9675-29eb-4342-82a3-1815c8fcce4e',1,120000);
/*!40000 ALTER TABLE `cartdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check`
--

DROP TABLE IF EXISTS `check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check` (
  `PaymentID` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `BankID` varchar(255) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  CONSTRAINT `FKCheck471472` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check`
--

LOCK TABLES `check` WRITE;
/*!40000 ALTER TABLE `check` DISABLE KEYS */;
INSERT INTO `check` VALUES ('042c7c88-f8d1-4398-8d97-f39cae129d54','Thang Nguyen','0343224353'),('dd030daf-e75d-4b80-9817-76e931f6952c','Thang Nguyen','134545345');
/*!40000 ALTER TABLE `check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cod`
--

DROP TABLE IF EXISTS `cod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cod` (
  `PaymentID` varchar(255) NOT NULL,
  `Status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  CONSTRAINT `FKCOD479041` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cod`
--

LOCK TABLES `cod` WRITE;
/*!40000 ALTER TABLE `cod` DISABLE KEYS */;
INSERT INTO `cod` VALUES ('47d60052-246e-447a-b57e-3e9dac8d426c','Unpaid'),('5477b92a-38d5-40b8-81e3-3377fefbed11','Unpaid'),('59e4a142-653b-42bc-b2c9-58fab6f2f9f0','Unpaid'),('6982f4e4-be9c-42b4-9b1b-726860cae5f5','Unpaid'),('9661becc-bfa4-47dc-92d5-0c04bbf174e3','Unpaid'),('b3402a01-5b29-433b-9bb7-0a7b4cc85674','Unpaid'),('cbd8a3e3-4e94-40b3-a70d-f0356bd0afa7','Unpaid'),('d95e212d-f9fe-403e-a4fd-db99e12ea3b4','Unpaid');
/*!40000 ALTER TABLE `cod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit`
--

DROP TABLE IF EXISTS `credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit` (
  `PaymentID` varchar(255) NOT NULL,
  `Number` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ExpireDate` date NOT NULL,
  PRIMARY KEY (`PaymentID`),
  CONSTRAINT `FKCredit998953` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit`
--

LOCK TABLES `credit` WRITE;
/*!40000 ALTER TABLE `credit` DISABLE KEYS */;
INSERT INTO `credit` VALUES ('235213c7-36f8-4f59-bc8a-bf0d6357a4f8','5758378253','Quan Nguyen Van','2023-12-21'),('281769d6-b7c9-4488-b6c9-86c64d363878','4658584363','Thang Nguyen','2023-12-08'),('286b0e4a-2d26-4bad-a4ab-6e803bdbb912','134566457443','Thang','2022-03-20');
/*!40000 ALTER TABLE `credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `UserID` varchar(255) NOT NULL,
  `MemberLevel` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `FKCustomer697196` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('089331b4-7374-49dd-b34e-cf5dc964d765','Standard'),('1','Standard'),('34eb4b08-2a35-4052-b8e9-7bdc94aad384','Standard'),('55b8a434-6412-4946-96d3-4caaf68b9b77','Standard'),('78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9','Standard'),('c06c1543-b513-4b36-82bc-5baee1d8bec1','Standard');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL,
  `salary` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fullname`
--

DROP TABLE IF EXISTS `fullname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fullname` (
  `ID` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fullname`
--

LOCK TABLES `fullname` WRITE;
/*!40000 ALTER TABLE `fullname` DISABLE KEYS */;
INSERT INTO `fullname` VALUES ('1','Nguyen Duy','Thang'),('188144ff-131d-4cb5-8da4-d3d4864a4192','Huyen','Tran'),('41e49418-9cab-4224-a36e-b2ae984c41fe','Anh','Tran Thi Ngoc'),('7216c87b-6ae1-4bf7-81af-ff961200ce36','Huyen','Tran'),('c1d2d8d4-0c90-4683-8190-880de87d6bfd','Thang','Nguyen'),('c468f9d8-fd05-48a6-87ce-435df3848860','Quan','Nguyen Van'),('f5f8033b-a772-4875-80cd-e9afe16a8ecf','Quan','Nguyen Van');
/*!40000 ALTER TABLE `fullname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `ID` varchar(255) NOT NULL,
  `BookItemID` varchar(255) NOT NULL,
  `Path` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKImage998240` (`BookItemID`),
  CONSTRAINT `FKImage998240` FOREIGN KEY (`BookItemID`) REFERENCES `bookitem` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES ('1','2','https://www.vinabook.com/images/thumbnails/product/240x/27784_34286.jpg'),('2','1','https://www.vinabook.com/images/thumbnails/product/240x/23723_30180.jpg'),('3','9d6c9675-29eb-4342-82a3-1815c8fcce4e','https://www.vinabook.com/images/thumbnails/product/240x/23278_29728.jpg'),('4','eceb3a79-f847-48ff-8d67-4f61315a670c','https://www.vinabook.com/images/thumbnails/product/240x/363241_p92688mscan0001.jpg'),('5','db70a53d-9f38-4a4a-989f-3ecb01679c38','https://www.vinabook.com/images/thumbnails/product/240x/363240_p92686mscan0003.jpg'),('6','c45d709f-b7d3-460b-b8d5-637e49c3366d','https://www.vinabook.com/images/thumbnails/product/240x/348435_p88814mscan0001.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `ID` varchar(255) NOT NULL,
  `CartID` varchar(255) NOT NULL,
  `ShipmentID` varchar(255) NOT NULL,
  `PaymentID` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `CustomerID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CartID` (`CartID`),
  UNIQUE KEY `ShipmentID` (`ShipmentID`),
  UNIQUE KEY `PaymentID` (`PaymentID`),
  KEY `FKOrder76788_idx` (`CustomerID`),
  CONSTRAINT `FKOrder751924` FOREIGN KEY (`ShipmentID`) REFERENCES `shipment` (`ID`),
  CONSTRAINT `FKOrder76788` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`UserID`),
  CONSTRAINT `FKOrder795597` FOREIGN KEY (`CartID`) REFERENCES `cart` (`ID`),
  CONSTRAINT `FKOrder92191` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('3d2da5ff-7069-4fd2-aba4-55c67ec11950','019dce61-2712-41ea-b622-7c002444afb0','58416f7a-ee70-4fd4-83eb-9b0d7514f4eb','6982f4e4-be9c-42b4-9b1b-726860cae5f5','InProgress','2022-01-02 00:00:00',NULL),('4f49b087-9f17-4adb-8ddb-02861bd2b4f1','a180b3a4-5976-477a-82a9-8247b3d84c1b','46413fac-b5a4-4ef3-b946-b33fc648b7b0','cbd8a3e3-4e94-40b3-a70d-f0356bd0afa7','InProgress','2022-01-02 00:00:00',NULL),('5a120fa6-9e8b-4af9-8e3d-914efff21785','5e850f23-125b-4786-ad27-ca567766964d','d3bc0520-4939-4e70-8265-d1d00f18b353','59e4a142-653b-42bc-b2c9-58fab6f2f9f0','InProgress','2022-01-05 00:00:00','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9'),('5c14211c-cc50-4f70-964f-f1c6b7b729a4','41641a50-805b-40aa-942b-f32095a4305f','641c88fe-e52f-48ed-8d85-f0eb298619ba','dd030daf-e75d-4b80-9817-76e931f6952c','InProgress','2022-01-06 00:00:00','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9'),('861adeb6-7b66-43f8-93b4-dcbb732ec6ee','98e5048e-33fb-4ad7-ab94-a54f54e20d0b','1d6830b2-dd33-44d0-857e-2b74f76470b1','286b0e4a-2d26-4bad-a4ab-6e803bdbb912','InProgress','2022-01-05 00:00:00','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9'),('86c67d75-2186-4ff5-b187-b6dfcfb21b44','04233ed4-2f0d-4589-ac57-32ed503f2b86','b10f7006-091f-4ab8-8de5-658814fda707','281769d6-b7c9-4488-b6c9-86c64d363878','InProgress','2022-01-06 00:00:00','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9'),('921b8914-0cc4-406e-8729-41a5ce914476','6d25165f-d351-4933-a36d-9eafd3e4db3f','9c5ae81f-4bb1-45b7-ab3b-5bed53e6ad5e','b3402a01-5b29-433b-9bb7-0a7b4cc85674','InProgress','2022-01-06 00:00:00','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9'),('a8ff9720-e106-4f0d-9a8d-4f173efcf9a8','a5a42c1b-79e1-4c22-a888-30c922aa1062','0f5c4e31-7728-4af7-bd71-e22d0fbea7b8','5477b92a-38d5-40b8-81e3-3377fefbed11','InProgress','2022-01-02 00:00:00',NULL),('b74ee87b-bee6-456f-a32c-530583e29818','fd1d5c29-0666-4a61-9009-3af934f31ec5','c7051c85-a88b-49ca-8d9c-431f46b47577','9661becc-bfa4-47dc-92d5-0c04bbf174e3','InProgress','2022-01-02 00:00:00',NULL),('da38445d-8693-4e5d-ab55-90af3bbea057','a0410a22-848d-47c4-a0d5-5ff7357416cd','e56eaa5a-2355-4ba2-a889-fe2310b50c66','d95e212d-f9fe-403e-a4fd-db99e12ea3b4','InProgress','2022-01-06 00:00:00','78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9'),('e8f10491-7ffe-4de8-8842-71655f0b55ce','eb24ed1d-38e3-4cbc-8190-260a4756f228','320286fa-259a-412b-b6d7-7f7ebf777cb3','47d60052-246e-447a-b57e-3e9dac8d426c','InProgress','2022-01-02 00:00:00',NULL),('eec22f47-6044-443d-a648-01760e51b9f1','134b42dd-4002-4e17-a953-0e2de7880002','1f6b5c40-cbf7-414e-a81a-925ef585c54e','235213c7-36f8-4f59-bc8a-bf0d6357a4f8','InProgress','2022-01-02 00:00:00',NULL),('fb00b8d4-630a-493f-a408-b18b6c2ab0a5','92dedbb8-9cc3-4d08-b193-f4fa50495d1f','a3f457d7-64e9-4db3-8214-b82f15f58936','042c7c88-f8d1-4398-8d97-f39cae129d54','InProgress','2022-01-02 00:00:00',NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `ID` varchar(255) NOT NULL,
  `Amount` double NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `PaymentType` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('042c7c88-f8d1-4398-8d97-f39cae129d54',130000,'2022-01-02 00:00:00','Check'),('235213c7-36f8-4f59-bc8a-bf0d6357a4f8',150000,'2022-01-02 00:00:00','Credit'),('281769d6-b7c9-4488-b6c9-86c64d363878',110000,'2022-01-06 00:00:00','Credit'),('286b0e4a-2d26-4bad-a4ab-6e803bdbb912',260000,'2022-01-05 00:00:00','Credit'),('47d60052-246e-447a-b57e-3e9dac8d426c',150000,'2022-01-02 00:00:00','COD'),('5477b92a-38d5-40b8-81e3-3377fefbed11',150000,'2022-01-02 00:00:00','COD'),('59e4a142-653b-42bc-b2c9-58fab6f2f9f0',510000,'2022-01-05 00:00:00','COD'),('6982f4e4-be9c-42b4-9b1b-726860cae5f5',260000,'2022-01-02 00:00:00','COD'),('9661becc-bfa4-47dc-92d5-0c04bbf174e3',250000,'2022-01-02 00:00:00','COD'),('b3402a01-5b29-433b-9bb7-0a7b4cc85674',150000,'2022-01-06 00:00:00','COD'),('cbd8a3e3-4e94-40b3-a70d-f0356bd0afa7',30000,'2022-01-02 00:00:00','COD'),('d95e212d-f9fe-403e-a4fd-db99e12ea3b4',160000,'2022-01-06 00:00:00','COD'),('dd030daf-e75d-4b80-9817-76e931f6952c',110000,'2022-01-06 00:00:00','Check');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `ID` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES ('1','NXB Kim Dong','Ha Noi'),('2','NXB Tuoi Tre','Ha Nam'),('3','NXB Thanh Nien','Ha Noi');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `ID` varchar(255) NOT NULL,
  `ShipmentTypeID` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Note` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKShipment2868` (`ShipmentTypeID`),
  CONSTRAINT `FKShipment2868` FOREIGN KEY (`ShipmentTypeID`) REFERENCES `shipmenttype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES ('0f5c4e31-7728-4af7-bd71-e22d0fbea7b8','1','Phuc La, Ha Dong, Ha Noi, Vietnam','','0854930590'),('1d6830b2-dd33-44d0-857e-2b74f76470b1','1','Phuc La, Ha Dong, Ha Noi, Vietnam','','0854930590'),('1f6b5c40-cbf7-414e-a81a-925ef585c54e','1','12 Thon 5','','8584585853'),('320286fa-259a-412b-b6d7-7f7ebf777cb3','1','Phuc La, Ha Dong, Ha Noi, Vietnam','','0854930590'),('46413fac-b5a4-4ef3-b946-b33fc648b7b0','1','Phuc La, Ha Dong, Ha Noi, Vietnam','','0854930590'),('58416f7a-ee70-4fd4-83eb-9b0d7514f4eb','2','Phuc La, Ha Dong, Ha Noi, Vietnam','Test','0854930590'),('641c88fe-e52f-48ed-8d85-f0eb298619ba','1','12 Thon 5','','0854930590'),('9c5ae81f-4bb1-45b7-ab3b-5bed53e6ad5e','1','Phuc La, Ha Dong, Ha Noi, Vietnam','','0854930590'),('a3f457d7-64e9-4db3-8214-b82f15f58936','1','12 Thon 5','','0854930590'),('b10f7006-091f-4ab8-8de5-658814fda707','1','12 Thon 5','','4854930590'),('c7051c85-a88b-49ca-8d9c-431f46b47577','1','Tien Thang, Ly Nhan, Ha Nam, Viet Nam','','0985838355'),('d3bc0520-4939-4e70-8265-d1d00f18b353','1','Phuc La, Ha Dong, Ha Noi, Vietnam','','0854930590'),('e56eaa5a-2355-4ba2-a889-fe2310b50c66','1','Phuc La, Ha Dong, Ha Noi, Vietnam','','0854930590');
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipmenttype`
--

DROP TABLE IF EXISTS `shipmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipmenttype` (
  `ID` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Fee` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipmenttype`
--

LOCK TABLES `shipmenttype` WRITE;
/*!40000 ALTER TABLE `shipmenttype` DISABLE KEYS */;
INSERT INTO `shipmenttype` VALUES ('1',' Fast',30000),('2','Save',20000);
/*!40000 ALTER TABLE `shipmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `UserID` varchar(255) NOT NULL,
  `Position` varchar(255) NOT NULL,
  `Rate` double NOT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `FKStaff312633` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('c607170f-04f9-41e6-bc4d-f04d72c1e9db','Admin',5);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ID` varchar(255) NOT NULL,
  `AcccountID` varchar(255) NOT NULL,
  `FullnameID` varchar(255) NOT NULL,
  `AddressID` varchar(255) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  `Dob` date NOT NULL,
  `Role` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AccountID` (`AcccountID`),
  UNIQUE KEY `FullnameID` (`FullnameID`),
  UNIQUE KEY `AddressID` (`AddressID`),
  CONSTRAINT `FKUser465381` FOREIGN KEY (`AcccountID`) REFERENCES `account` (`ID`),
  CONSTRAINT `FKUser481364` FOREIGN KEY (`FullnameID`) REFERENCES `fullname` (`ID`),
  CONSTRAINT `FKUser847543` FOREIGN KEY (`AddressID`) REFERENCES `address` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('089331b4-7374-49dd-b34e-cf5dc964d765','4c6e10f2-bc54-459c-a516-27f5e656333a','c468f9d8-fd05-48a6-87ce-435df3848860','c346dcc6-838d-47b5-b462-5609c37c2566','Male','quannv@gmail.com','8584585853','2000-03-11','Customer'),('1','1','1','1','Male','thangnd@gmail.com','0985838355','2000-03-11','Customer'),('34eb4b08-2a35-4052-b8e9-7bdc94aad384','883b7f98-c141-4653-80fb-7cf49b221784','7216c87b-6ae1-4bf7-81af-ff961200ce36','0c78ee40-d8fa-4fb9-975a-b6d14f8ac7ce','Female','sasa@gmail.com','09545343452','1997-11-23','Customer'),('55b8a434-6412-4946-96d3-4caaf68b9b77','b6a8b746-2805-4167-a8a6-845f8dffa57d','f5f8033b-a772-4875-80cd-e9afe16a8ecf','b04e0b28-76b6-47f6-a127-22e87d19d22b','Female','quannv1@gmail.com','00835356325','2001-11-04','Customer'),('78a10ae4-0364-4c5f-ae3d-d1a4edeac1f9','432ce1cb-0239-4b26-8c96-8ea481388501','c1d2d8d4-0c90-4683-8190-880de87d6bfd','47f3fb0c-45e2-4caa-9354-420c302361cd','Male','nguyenduythangk6@gmail.com','0854930590','2000-03-11','Customer'),('c06c1543-b513-4b36-82bc-5baee1d8bec1','3eb16b6f-e597-45ec-900b-1cf8b3c588d9','41e49418-9cab-4224-a36e-b2ae984c41fe','a592d4b7-f600-4a31-a232-b51daecda278','Female','anh@gmail.com','03854547594','2000-11-03','Customer'),('c607170f-04f9-41e6-bc4d-f04d72c1e9db','c3b725ce-5d96-45d8-bb3a-f64563dfee34','188144ff-131d-4cb5-8da4-d3d4864a4192','ee6dee93-63f7-481f-b39d-3f2d52111bf7','Female','sasa@gmail.com','0954534656','1998-12-02','Staff');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-29  0:34:49
