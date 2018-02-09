-- --------------------------------------------------------
-- Host:                         10.47.17.213
-- Versión del servidor:         5.6.15-log - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para duf_conf_users
DROP DATABASE IF EXISTS `duf_conf_users`;
CREATE DATABASE IF NOT EXISTS `duf_conf_users` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `duf_conf_users`;


-- Volcando estructura para tabla duf_conf_users.configuration_email
CREATE TABLE IF NOT EXISTS `configuration_email` (
  `notification_id` int(11) DEFAULT NULL,
  `email_id` int(11) DEFAULT NULL,
  KEY `FK__notifications` (`notification_id`),
  KEY `FK__notification_emails` (`email_id`),
  CONSTRAINT `FK__notifications` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__notification_emails` FOREIGN KEY (`email_id`) REFERENCES `notification_emails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.configuration_email: ~0 rows (aproximadamente)

/*!40000 ALTER TABLE `configuration_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuration_email` ENABLE KEYS */;


-- Volcando estructura para tabla duf_conf_users.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(45) CHARACTER SET latin1 NOT NULL,
  `position` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.menus: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
REPLACE INTO `menus` (`id`, `label`, `position`) VALUES
	(1, 'Adm. Radiobases', 1),
	(2, 'Reportes Radiobases', 2),
	(3, 'Adm. Radioenlaces', 3),
	(4, 'Reportes Radioenlaces', 4),
	(5, 'Reportes de Trámites', 5),
	(6, 'Reportes de Terminales', 6),
	(7, 'Reportes Terminales', 7),
	(8, 'Adm. tablas auxiliares', 8),
	(9, 'Cálculos DUF', 9),
	(10, 'Datos Auxiliares', 10),
	(15, 'Adm. usuarios', 15);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;


-- Volcando estructura para tabla duf_conf_users.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.notifications: ~0 rows (aproximadamente)

/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
REPLACE INTO `notifications` (`id`, `notification`) VALUES
	(-1, 'Test'),
	(1, 'SAP'),
	(2, 'New Performance'),
	(3, 'Fallos de procesos'),
	(4, 'Registro de Tramites');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;


-- Volcando estructura para tabla duf_conf_users.notification_emails
DROP TABLE IF EXISTS `notification_emails`;
CREATE TABLE IF NOT EXISTS `notification_emails` (
  `id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.notification_emails: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `notification_emails` DISABLE KEYS */;
REPLACE INTO `notification_emails` (`id`, `email`) VALUES
	(0, 'hsiles@nuevatel.com'),
	(1, 'vmejia@nuevatel.com'),
	(2, 'brosas@nuevatel.com'),
	(3, 'ocardenas@nuevatel.com');
/*!40000 ALTER TABLE `notification_emails` ENABLE KEYS */;


-- Volcando estructura para tabla duf_conf_users.privileges
DROP TABLE IF EXISTS `privileges`;
CREATE TABLE IF NOT EXISTS `privileges` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `subMenu_label` varchar(50) COLLATE utf8_bin NOT NULL,
  `view` varchar(50) COLLATE utf8_bin NOT NULL,
  `action` varchar(30) COLLATE utf8_bin NOT NULL,
  `inMenu` tinyint(4) NOT NULL,
  `menu_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.privileges: ~41 rows (aproximadamente)
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
REPLACE INTO `privileges` (`privilege_id`, `subMenu_label`, `view`, `action`, `inMenu`, `menu_index`) VALUES
	(1, 'Cargado inicial', 'radiobases/loadRadioBases.xhtml', 'loadRadioBases', 1, 1),
	(2, 'Cargado nuevos sitios', 'radiobases/signUpNewSite.xhtml', 'signUpNewSite', 2, 1),
	(3, 'Cargado sitios ATT', 'radiobases/attLoadRadioBases.xhtml', 'attLoadRadioBases', 3, 1),
	(4, 'Baja de sitios', 'radiobases/searchRadiobases.xhtml', 'searchRadiobases', 6, 1),
	(5, 'Edición de sitios', 'radiobases/editRadiobases.xhtml', 'editRadiobases', 7, 1),
	(6, 'Reporte completo', 'radiobases/completeReportRadiobases.xhtml', 'completeReportRadiobases', 1, 2),
	(7, 'Reporte con filtro', 'radiobases/filteredReportRadiobases.xhtml', 'filteredReportRadiobases', 2, 2),
	(8, 'Reportes mensuales', 'radiobases/mobileWimaxTable.xhtml', 'monthlyReportRadioBases', 3, 2),
	(9, 'Reportes Altas/Bajas', 'radiobases/updownMonthlyReport.xhtm', 'updownReportRadiobases', 4, 2),
	(10, 'Reportes Anuales', 'radiobases/annualRadiobaseReport.xhtm', 'annualReport', 5, 2),
	(11, 'Crear Roles', 'admin/roleForm.xhtml', 'newRole', 1, 15),
	(12, 'Editar Roles', 'admin/roleEdit.xhtml', 'roleEdit', 2, 15),
	(13, 'Registrar Usuario', 'admin/userForm.xhtml', 'newUser', 3, 15),
	(14, 'Editar Usuarios', 'admin/userEdit.xhtml', 'userEdit', 4, 15),
	(15, 'Carga inicial radioenlaces', 'radiolinks/loadRadiolinks.xhtml', 'loadRadioLink', 1, 3),
	(16, 'Carga de Trámites', 'radiolinks/loadPaperwork.xhtml', 'loadPaperwork', 2, 3),
	(17, 'Alta de Trámites radioenlaces', 'radiolinks/searchProcedure.xhtml', 'searchProcedure', 3, 3),
	(18, 'Edición de radioenlaces', 'radiolinks/searchRadioLinks.xhtml', 'searchRadioLinks', 4, 3),
	(19, 'Edición de trámites', 'radiolinks/editPaperWork.xhtml', 'editPaperWork', 5, 3),
	(20, 'Reporte con filtro', 'radiolinks/radiolinkReport.xhtml', 'radiolinkReport', 2, 4),
	(21, 'Reporte completo ', 'radiolinks/completeRadiolinkReport.xhtml', 'completeRadiolinkReport', 1, 4),
	(22, 'Reporte con filtro', 'radiolinks/paperWorkReport.xhtml', 'paperWorkReport', 2, 5),
	(23, 'Reporte completo', 'radiolinks/completePaperWorkReport.xhtml', 'completePaperWorkReport', 1, 5),
	(24, 'Reportes anuales', 'radiolinks/annualRadiolinkReport.xhtml', 'annualRadiolinkReport', 3, 4),
	(26, 'Exportar para cálculo DUF', 'radiolinks/generateManualReport.xhtml', 'generateManualPaperWorkReport', 4, 5),
	(27, 'Reporte detallado', 'terminals/searchTerminals.xhtml', 'searchTerminals', 1, 6),
	(28, 'Reporte Net Adds', 'terminals/monthlyReportTerminals.xhtml', 'monthlyReportTerminals', 2, 6),
	(29, 'Canones', 'config/searchCanons.xhtml', 'searchCanons', 1, 10),
	(30, 'UFVs', 'config/searchUfvs.xhtml', 'searchUfvs', 2, 10),
	(31, 'Ancho de banda', 'config/bandwidthManagement.xhtml', 'bandwidth', 3, 10),
	(32, 'Índice Demográfico', 'config/searchDemographicIndex.xhtml', 'searchDemographicIndex', 4, 10),
	(33, 'Datos Generales', 'config/generalDataManager.xhtml', 'generalData', 5, 10),
	(34, 'Datos para pagos', 'config/generalDataDafDuf.xhtml', 'generalDataDafDuf', 6, 10),
	(35, 'Cálculo DUF Anual Móvil', 'duf/annualMobileReport.xhtml', 'annualMobileReport', 1, 9),
	(36, 'Cálculo DUF Anual Wimax', 'duf/annualWimaxReport.xhtml', 'annualWimaxReport', 2, 9),
	(38, 'Mostrar Cálculos DUF de Trámites', 'duf/paperworkMWRadiolinkReport.xhtml', 'paperworkMWRadiolinkReport', 6, 9),
	(39, 'Cálculo DUF Anual Radioenlaces MW', 'duf/annualMWReport.xhtml', 'annualMWReport', 3, 9),
	(40, 'Cálculo DUF Anual Radioenlaces SAT', 'duf/annualSATReport.xhtml', 'annualSATReport', 4, 9),
	(41, 'Generar Cálculos DUF de Trámites', 'duf/generatePaperworkDUFReport.xhtml', 'generatePaperworkDUFReport', 5, 9),
	(42, 'Formularios 803M y 811M', 'duf/reportForm.xhtml', 'reportForm', 7, 9),
	(43, 'Editar Correos', 'admin/emailForm.xhtml', 'emailForm', 5, 15),
	(44, 'Altas de Tecnología', 'radiobases/signUpRadiobaseTechnology.xhtml', 'signUpRadiobaseTechnology', 4, 1),
	(45, 'Altas de Tecnología', 'radiobases/signUpRadiobaseTechnology.xhtml', 'signUpRadiobaseTechnology', 5, 1);
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;


-- Volcando estructura para tabla duf_conf_users.rol
DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.rol: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
REPLACE INTO `rol` (`id`, `name`, `description`) VALUES
	(160414721, 'Administrator', 'Rol de Administracion');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;


-- Volcando estructura para tabla duf_conf_users.rol_privileges
DROP TABLE IF EXISTS `rol_privileges`;
CREATE TABLE IF NOT EXISTS `rol_privileges` (
  `rol_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`rol_id`,`privilege_id`),
  KEY `FK_rol_privileges_privileges` (`privilege_id`),
  CONSTRAINT `FK_rol_privileges_privileges` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`privilege_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rol_privileges_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.rol_privileges: ~40 rows (aproximadamente)
/*!40000 ALTER TABLE `rol_privileges` DISABLE KEYS */;
REPLACE INTO `rol_privileges` (`rol_id`, `privilege_id`) VALUES
	(160414721, 1),
	(160414721, 2),
	(160414721, 3),
	(160414721, 4),
	(160414721, 5),
	(160414721, 6),
	(160414721, 7),
	(160414721, 8),
	(160414721, 9),
	(160414721, 10),
	(160414721, 11),
	(160414721, 12),
	(160414721, 13),
	(160414721, 14),
	(160414721, 15),
	(160414721, 16),
	(160414721, 17),
	(160414721, 18),
	(160414721, 19),
	(160414721, 20),
	(160414721, 21),
	(160414721, 22),
	(160414721, 23),
	(160414721, 24),
	(160414721, 26),
	(160414721, 27),
	(160414721, 28),
	(160414721, 29),
	(160414721, 30),
	(160414721, 31),
	(160414721, 32),
	(160414721, 33),
	(160414721, 34),
	(160414721, 35),
	(160414721, 36),
	(160414721, 38),
	(160414721, 39),
	(160414721, 40),
	(160414721, 41),
	(160414721, 42),
	(160414721, 43),
	(160414721, 44),
	(160414721, 45);
/*!40000 ALTER TABLE `rol_privileges` ENABLE KEYS */;


-- Volcando estructura para tabla duf_conf_users.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.users: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `user_name`) VALUES
	(3, 'brosas'),
	(1, 'hsiles'),
	(10, 'joscastro'),
	(4, 'ocardenas'),
	(93295670, 'pbutron'),
	(2, 'vmejia');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Volcando estructura para tabla duf_conf_users.user_rol
DROP TABLE IF EXISTS `user_rol`;
CREATE TABLE IF NOT EXISTS `user_rol` (
  `user_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`rol_id`),
  KEY `FK_user_rol_rol` (`rol_id`),
  CONSTRAINT `FK_user_rol_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_user_rol_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.user_rol: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `user_rol` DISABLE KEYS */;
REPLACE INTO `user_rol` (`user_id`, `rol_id`) VALUES
	(1, 160414721),
	(2, 160414721),
	(3, 160414721),
	(4, 160414721),
	(10, 160414721),
	(93295670, 160414721);
/*!40000 ALTER TABLE `user_rol` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
