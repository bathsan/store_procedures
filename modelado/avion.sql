-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.9 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla mydb.tb_aerolineas
CREATE TABLE IF NOT EXISTS `tb_aerolineas` (
  `id_aerolinea` int(11) NOT NULL AUTO_INCREMENT,
  `aerolinea` varchar(45) DEFAULT NULL,
  `tarifapernocta` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_aerolinea`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla mydb.tb_aerolineas: ~2 rows (aproximadamente)
DELETE FROM `tb_aerolineas`;
/*!40000 ALTER TABLE `tb_aerolineas` DISABLE KEYS */;
INSERT INTO `tb_aerolineas` (`id_aerolinea`, `aerolinea`, `tarifapernocta`) VALUES
	(1, 'vivaaerobus', 30.00),
	(2, 'volaris', 35.00);
/*!40000 ALTER TABLE `tb_aerolineas` ENABLE KEYS */;


-- Volcando estructura para tabla mydb.tb_aeropuerto
CREATE TABLE IF NOT EXISTS `tb_aeropuerto` (
  `id_aeropuerto` int(11) NOT NULL AUTO_INCREMENT,
  `aeropuerto` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_aeropuerto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla mydb.tb_aeropuerto: ~1 rows (aproximadamente)
DELETE FROM `tb_aeropuerto`;
/*!40000 ALTER TABLE `tb_aeropuerto` DISABLE KEYS */;
INSERT INTO `tb_aeropuerto` (`id_aeropuerto`, `aeropuerto`) VALUES
	(1, 'cancun');
/*!40000 ALTER TABLE `tb_aeropuerto` ENABLE KEYS */;


-- Volcando estructura para tabla mydb.tb_pernocta
CREATE TABLE IF NOT EXISTS `tb_pernocta` (
  `id_llegadas` int(11) NOT NULL AUTO_INCREMENT,
  `num_pasajeros` int(11) DEFAULT NULL,
  `ruta` varchar(45) DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `id_aeropuerto` int(11) NOT NULL,
  `id_aerolinea` int(11) NOT NULL,
  PRIMARY KEY (`id_llegadas`,`id_aeropuerto`,`id_aerolinea`),
  KEY `fk_tb_llegada_tb_aeropuerto_idx` (`id_aeropuerto`),
  KEY `fk_tb_llegada_tb_aerolineas1_idx` (`id_aerolinea`),
  CONSTRAINT `fk_tb_llegada_tb_aerolineas1` FOREIGN KEY (`id_aerolinea`) REFERENCES `tb_aerolineas` (`id_aerolinea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_llegada_tb_aeropuerto` FOREIGN KEY (`id_aeropuerto`) REFERENCES `tb_aeropuerto` (`id_aeropuerto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla mydb.tb_pernocta: ~3 rows (aproximadamente)
DELETE FROM `tb_pernocta`;
/*!40000 ALTER TABLE `tb_pernocta` DISABLE KEYS */;
INSERT INTO `tb_pernocta` (`id_llegadas`, `num_pasajeros`, `ruta`, `hora_llegada`, `hora_salida`, `fecha_llegada`, `id_aeropuerto`, `id_aerolinea`) VALUES
	(1, 30, 'cun-mex', '19:30:00', '21:48:48', '2016-09-10', 1, 1),
	(2, 40, 'cun-gdl', '10:00:00', '15:09:01', '2016-09-10', 1, 1),
	(3, 20, 'cun-mid', '13:43:15', '15:09:08', '2016-09-11', 1, 1);
/*!40000 ALTER TABLE `tb_pernocta` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
