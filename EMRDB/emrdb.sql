-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.9.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for emr
CREATE DATABASE IF NOT EXISTS `emr` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `emr`;

-- Dumping structure for table emr.dokter
CREATE TABLE IF NOT EXISTS `dokter` (
  `Dokter_id` int(11) NOT NULL,
  `no_ktp` char(13) NOT NULL,
  `keahlian` char(20) NOT NULL,
  `spesialis` char(20) NOT NULL,
  PRIMARY KEY (`Dokter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table emr.patient
CREATE TABLE IF NOT EXISTS `patient` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `no_ktp` char(13) NOT NULL,
  `FirstName` char(30) NOT NULL,
  `LastName` char(30) NOT NULL,
  `address` text DEFAULT NULL,
  `no_telp` char(12) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `DOB` date NOT NULL,
  `BloodType` char(3) NOT NULL,
  `catatan` text DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table emr.perawat
CREATE TABLE IF NOT EXISTS `perawat` (
  `perawat_id` int(11) NOT NULL,
  `no_ktp` char(13) NOT NULL,
  `keahlian` char(20) NOT NULL,
  `spesialis` char(20) NOT NULL,
  PRIMARY KEY (`perawat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table emr.riwayat_pengunjung
CREATE TABLE IF NOT EXISTS `riwayat_pengunjung` (
  `no_ktp` int(11) NOT NULL,
  `visitDate` date NOT NULL,
  PRIMARY KEY (`no_ktp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table emr.visitcontroller
CREATE TABLE IF NOT EXISTS `visitcontroller` (
  `VisitController_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `dokter_id` int(11) NOT NULL,
  `perawat_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `riwayat_perawatan` text NOT NULL,
  PRIMARY KEY (`VisitController_id`),
  KEY `emr_fr` (`visit_id`),
  KEY `dokter_id` (`dokter_id`),
  KEY `perawat_id` (`perawat_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `emr_fr` FOREIGN KEY (`visit_id`) REFERENCES `riwayat_pengunjung` (`no_ktp`),
  CONSTRAINT `visitcontroller_ibfk_1` FOREIGN KEY (`dokter_id`) REFERENCES `dokter` (`Dokter_id`),
  CONSTRAINT `visitcontroller_ibfk_2` FOREIGN KEY (`perawat_id`) REFERENCES `perawat` (`perawat_id`),
  CONSTRAINT `visitcontroller_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
