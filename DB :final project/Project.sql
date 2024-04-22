-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for project
CREATE DATABASE IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `project`;

-- Dumping structure for table project.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` varchar(4) NOT NULL,
  `CustomerFirstName` varchar(25) NOT NULL,
  `CustomerLastName` varchar(25) NOT NULL,
  `CustomerPhoneNumber` varchar(50) DEFAULT NULL,
  `CustomerAdress` varchar(100) DEFAULT NULL,
  `AreaCode` varchar(4) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `AreaCode` (`AreaCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table project.customers: ~4 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`CustomerID`, `CustomerFirstName`, `CustomerLastName`, `CustomerPhoneNumber`, `CustomerAdress`, `AreaCode`) VALUES
	('C101', 'Maya', 'Masri', '(961) 76 - 162 418', 'Tripoli', 'T-12'),
	('C102', 'Kinda', 'Alawa', '(961) 03 - 596 014', 'Koura', 'K-50'),
	('C103', 'Pierre', 'Hatem', '(961) 70 - 138 590', 'Beirut', 'B-5'),
	('C104', 'Stephanie', 'Rahme', '(961) 01 - 443 556', 'Beirut', 'B-19');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for table project.deliveryboy
CREATE TABLE IF NOT EXISTS `deliveryboy` (
  `DeliveryBoyID` varchar(4) NOT NULL,
  `DeliveryBoyName` varchar(50) NOT NULL,
  `DBPhoneNumber` varchar(50) NOT NULL,
  `AreaCode` varchar(4) NOT NULL,
  PRIMARY KEY (`DeliveryBoyID`),
  KEY `AreaCode` (`AreaCode`),
  CONSTRAINT `FK_deliveryboy_customers` FOREIGN KEY (`AreaCode`) REFERENCES `customers` (`AreaCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table project.deliveryboy: ~4 rows (approximately)
/*!40000 ALTER TABLE `deliveryboy` DISABLE KEYS */;
INSERT INTO `deliveryboy` (`DeliveryBoyID`, `DeliveryBoyName`, `DBPhoneNumber`, `AreaCode`) VALUES
	('D01', 'Omar Najjar', '(961) 03 234 123', 'T-12'),
	('D02', 'Jacques Nehme', '(961) 76 345 232', 'K-50'),
	('D03', 'Joseph Kanaan', '(961) 71 234 087', 'B-5'),
	('D04', 'Michel Mitre', '(961) 01 247 806', 'B-19');
/*!40000 ALTER TABLE `deliveryboy` ENABLE KEYS */;

-- Dumping structure for table project.menuitems
CREATE TABLE IF NOT EXISTS `menuitems` (
  `ItemID` int(11) NOT NULL,
  `ItemDescription` varchar(50) NOT NULL,
  `ItemType` varchar(50) NOT NULL,
  `ItemPrice` decimal(20,2) NOT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table project.menuitems: ~9 rows (approximately)
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` (`ItemID`, `ItemDescription`, `ItemType`, `ItemPrice`) VALUES
	(1, 'Omlette', 'BreakFast', 4.50),
	(2, 'Sajj', 'BreakFast', 2.30),
	(3, 'Toast', 'BreakFast', 5.00),
	(4, 'Salade', 'Appetizer', 6.00),
	(5, 'Pizza', 'Lunch', 5.50),
	(6, 'Pasta', 'Lunch', 5.00),
	(7, 'Burger', 'Lunch', 7.00),
	(8, 'Smoothie', 'Drinks', 2.20),
	(9, 'Coffee', 'Drinks', 1.20);
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;

-- Dumping structure for table project.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustID` varchar(4) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `DeliveryBoyID` varchar(4) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustID` (`CustID`),
  KEY `ItemID` (`ItemID`),
  KEY `DeliveryBoyID` (`DeliveryBoyID`),
  CONSTRAINT `FK__customers` FOREIGN KEY (`CustID`) REFERENCES `customers` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__deliveryboy` FOREIGN KEY (`DeliveryBoyID`) REFERENCES `deliveryboy` (`DeliveryBoyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__menuitems` FOREIGN KEY (`ItemID`) REFERENCES `menuitems` (`ItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table project.orders: ~4 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`OrderID`, `CustID`, `ItemID`, `DeliveryBoyID`, `Quantity`, `OrderDate`) VALUES
	(1, 'C101', 4, 'D02', 2, '2023-05-05'),
	(2, 'C102', 4, 'D02', 1, '2023-05-02'),
	(3, 'C103', 5, 'D03', 3, '2023-05-05'),
	(4, 'C104', 6, 'D04', 1, '2023-05-05');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
