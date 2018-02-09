-- --------------------------------------------------------
-- Host:                         10.40.3.131
-- Versión del servidor:         5.6.4-m7 - MySQL Community Server (GPL)
-- SO del servidor:              linux2.6
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
	(1, 'Adm. radiobases', 1),
	(2, 'Reportes radiobases', 2),
	(3, 'Adm. radioenlaces/trámites', 3),
	(4, 'Reportes radioenlaces', 4),
	(5, 'Reportes de trámites', 5),
	(6, 'Adm. terminales', 6),
	(7, 'Reportes terminales', 7),
	(8, 'Adm. tablas auxiliares', 8),
	(9, 'Reportes DUF ', 9),
	(10, 'Adm. global', 10),
	(15, 'Adm. usuarios', 15);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;


-- Volcando estructura para tabla duf_conf_users.notification_emails
DROP TABLE IF EXISTS `notification_emails`;
CREATE TABLE IF NOT EXISTS `notification_emails` (
  `id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.notification_emails: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `notification_emails` DISABLE KEYS */;
REPLACE INTO `notification_emails` (`id`, `email`) VALUES
	(0, 'hsiles@nuevatel.com'),
	(1, 'vmejia@nuevatel.com'),
	(2, 'brosas@nuevatel.com'),
	(3, 'pbutron@nuevatel.com'),
	(4, 'psolares@nuevatel.com'),
	(5, 'mdiezdemedina@nuevatel.com'),
	(6, 'pbarron@nuevatel.com');
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
	(4, 'Baja de sitios', 'radiobases/searchRadiobases.xhtml', 'searchRadiobases', 4, 1),
	(5, 'Edición de sitios', 'radiobases/editRadiobases.xhtml', 'editRadiobases', 5, 1),
	(6, 'Reporte completo', 'radiobases/completeReportRadiobases.xhtml', 'completeReportRadiobases', 1, 2),
	(7, 'Reporte con filtro', 'radiobases/filteredReportRadiobases.xhtml', 'filteredReportRadiobases', 2, 2),
	(8, 'Reportes mensuales', 'radiobases/mobileWimaxTable.xhtml', 'monthlyReportRadioBases', 3, 2),
	(9, 'Reportes Altas/Bajas', 'radiobases/updownMonthlyReport.xhtm', 'updownReportRadiobases', 4, 2),
	(10, 'Reportes Anuales', 'radiobases/annualRadiobaseReport.xhtm', 'annualReport', 5, 2),
	(11, 'Registrar Rol', 'admin/roleForm.xhtml', 'newRole', 3, 15),
	(12, 'Editar Roles', 'admin/roleEdit.xhtml', 'roleEdit', 4, 15),
	(13, 'Registrar Usuario', 'admin/userForm.xhtml', 'newUser', 1, 15),
	(14, 'Editar Usuarios', 'admin/userEdit.xhtml', 'userEdit', 2, 15),
	(15, 'Carga inicial radioenlaces', 'radiolinks/loadRadiolinks.xhtml', 'loadRadioLink', 1, 3),
	(16, 'Carga inicial trámites', 'radiolinks/loadPaperwork.xhtml', 'loadPaperwork', 2, 3),
	(17, 'Alta de trámites radioenlaces', 'radiolinks/searchProcedure.xhtml', 'searchProcedure', 3, 3),
	(18, 'Edición de radioenlaces', 'radiolinks/searchRadioLinks.xhtml', 'searchRadioLinks', 4, 3),
	(19, 'Edición de trámites', 'radiolinks/editPaperWork.xhtml', 'editPaperWork', 5, 3),
	(20, 'Reporte con filtro', 'radiolinks/radiolinkReport.xhtml', 'radiolinkReport', 2, 4),
	(21, 'Reporte completo ', 'radiolinks/completeRadiolinkReport.xhtml', 'completeRadiolinkReport', 1, 4),
	(22, 'Reporte con filtro', 'radiolinks/paperWorkReport.xhtml', 'paperWorkReport', 2, 5),
	(23, 'Reporte completo', 'radiolinks/completePaperWorkReport.xhtml', 'completePaperWorkReport', 1, 5),
	(24, 'Reportes anuales', 'radiolinks/annualRadiolinkReport.xhtml', 'annualRadiolinkReport', 3, 4),
	(25, 'Reporte a demanda', 'radiolinks/manualPaperWorkReport.xhtml', 'manualPaperWorkReport', 3, 5),
	(26, 'Generar reporte a demanda', 'radiolinks/generateManualReport.xhtml', 'generateManualPaperWorkReport', 4, 5),
	(27, 'Buscar terminales', 'terminals/searchTerminals.xhtml', 'searchTerminals', 1, 6),
	(28, 'Reporte mensual terminales', 'terminals/monthlyReportTerminals.xhtml', 'monthlyReportTerminals', 2, 6),
	(29, 'Cánones', 'config/searchCanons.xhtml', 'searchCanons', 1, 10),
	(30, 'UFVs', 'config/searchUfvs.xhtml', 'searchUfvs', 2, 10),
	(31, 'Ancho de banda', 'config/bandwidthManagement.xhtml', 'bandwidth', 3, 10),
	(32, 'Indice Demográfico', 'config/searchDemographicIndex.xhtml', 'searchDemographicIndex', 4, 10),
	(33, 'Datos Generales', 'config/generalDataManager.xhtml', 'generalData', 5, 10),
	(34, 'Datos Generales DAF DUF', 'config/generalDataDafDuf.xhtml', 'generalDataDafDuf', 6, 10),
	(35, 'Reporte DUF Anual Movil', 'duf/annualMobileReport.xhtml', 'annualMobileReport', 1, 9),
	(36, 'Reporte DUF Anual Wimax', 'duf/annualWimaxReport.xhtml', 'annualWimaxReport', 2, 9),
	(38, 'Cálculos DUF de Trámites', 'duf/paperworkMWRadiolinkReport.xhtml', 'paperworkMWRadiolinkReport', 6, 9),
	(39, 'Reporte DUF Anual Radioenlaces MW', 'duf/annualMWReport.xhtml', 'annualMWReport', 3, 9),
	(40, 'Reporte DUF Anual Radioenlaces SAT', 'duf/annualSATReport.xhtml', 'annualSATReport', 4, 9),
	(41, 'Generar Cálculos DUF de Trámites', 'duf/generatePaperworkDUFReport.xhtml', 'generatePaperworkDUFReport', 5, 9),
	(42, 'Formularios 811M - 830M', 'duf/reportForm.xhtml', 'reportForm', 7, 9);
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;


-- Volcando estructura para tabla duf_conf_users.rol
DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.rol: ~1 rows (aproximadamente)
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

-- Volcando datos para la tabla duf_conf_users.rol_privileges: ~41 rows (aproximadamente)
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
	(160414721, 25),
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
	(160414721, 42);
/*!40000 ALTER TABLE `rol_privileges` ENABLE KEYS */;


-- Volcando estructura para tabla duf_conf_users.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_conf_users.users: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `user_name`) VALUES
	(1, 'hsiles');
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

-- Volcando datos para la tabla duf_conf_users.user_rol: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `user_rol` DISABLE KEYS */;
REPLACE INTO `user_rol` (`user_id`, `rol_id`) VALUES
	(1, 160414721);
/*!40000 ALTER TABLE `user_rol` ENABLE KEYS */;


-- Volcando estructura de base de datos para duf_core
DROP DATABASE IF EXISTS `duf_core`;
CREATE DATABASE IF NOT EXISTS `duf_core` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `duf_core`;


-- Volcando estructura para tabla duf_core.columns
DROP TABLE IF EXISTS `columns`;
CREATE TABLE IF NOT EXISTS `columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `column_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `visualization_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_core.columns: ~142 rows (aproximadamente)
/*!40000 ALTER TABLE `columns` DISABLE KEYS */;
REPLACE INTO `columns` (`id`, `column_name`, `visualization_name`, `position`) VALUES
	(1, 'operador', 'OPERADOR', 0),
	(2, 'nombre_estacion', 'NOMBRE DE LA ESTACION', 1),
	(3, 'tipo_sitio', 'TIPO DE SITIO', 2),
	(4, 'site_id', 'SITE ID', 3),
	(5, 'cell_id_primera_portadora', 'Cell ID 1ra Portadora', 4),
	(6, 'cell_id_segunda_portadora', 'Cell ID 2da Portadora', 5),
	(7, 'cell_id_tercera_portadora', 'Cell ID 3ra Portadora', 6),
	(8, 'categoria', 'CATEGORIA', 7),
	(9, 'estado', 'ESTADO', 8),
	(10, 'fecha_puesta_servicio_att', 'FECHA PUESTA EN SERVICIO ATT', 9),
	(11, 'fecha_activacion_newperformance', 'FECHA ACTIVACION NEWPERFORMANCE', 10),
	(12, 'fecha_ultima_modificacion', 'FECHA ULTIMA MODIFICACION', 11),
	(13, 'fecha_baja_att_estacion', 'FECHA DE BAJA ATT DE ESTACION', 12),
	(14, 'tipo_servicio', 'TIPO DE SERVICIO', 13),
	(15, 'tecnologia_2g', 'TECNOLOGIA 2G', 14),
	(16, 'tecnologia_hspa', 'TECNOLOGIA HSPA', 15),
	(17, 'tecnologia_wimax', 'TECNOLOGIA WIMAX', 16),
	(18, 'tecnologia_lte', 'TECNOLOGIA LTE', 17),
	(19, 'departamento', 'DEPARTAMENTO', 18),
	(20, 'provincia', 'PROVINCIA', 19),
	(21, 'ciudad', 'CIUDAD, MUNICIPIO O LOCALIDAD', 20),
	(22, 'latitud_sur', 'LATITUD SUR', 21),
	(23, 'longitud_oeste', 'LONGITUD OESTE', 22),
	(24, 'direccion', 'DIRECCION', 23),
	(25, 'elevacion_rbs', 'ELEVACION RBS', 24),
	(26, 'altura_terreno_antena', 'ALTURA SOBRE TERRENO DE LA ANTENA', 25),
	(27, 'estructura', 'ESTRUCTURA', 26),
	(28, 'marca_antena', 'MARCA DE LA ANTENA', 27),
	(29, 'modelo_antena', 'MODELO DE LA ANTENA', 28),
	(30, 'ganancia_antena', 'GANANCIA DE LA ANTENA', 29),
	(31, 'polarizacion_antena', 'POLARIZACION DE LA ANTENA', 30),
	(32, 'brochure_antena', 'BROCHURE DE LA ANTENA', 31),
	(33, 'descripcion_emisiones', 'DESCRIPCION DE EMISIONES', 32),
	(34, 'potencia_nominal', 'POTENCIA NOMINAL', 33),
	(35, 'pire', 'PIRE', 34),
	(36, 'potencia_transmisor', 'POTENCIA DEL TRANSMISOR', 35),
	(37, 'cobertura', 'COBERTURA', 36),
	(38, 'estudios_radiacion', 'ESTUDIOS DE RADIACION', 37),
	(39, 'msc_atiende_rbs', 'MSC QUE ATIENDE A RBS', 38),
	(40, 'bsc_atiende_rbs', 'BSC QUE ATIENDE A RBS', 39),
	(41, 'rnc_atiende_nodo_b', 'RNC QUE ATIENDE A NODO B', 40),
	(42, 'nota_comunicacion_att', 'NOTA COMUNICACION ATT', 41),
	(43, 'ceco_sitio', 'CeCo DEL SITIO', 42),
	(44, 'tipo_ceco', 'TIPO DE CeCo', 43),
	(45, 'modalidad_uso_sitio', 'MODALIDAD USO DE SITIO', 44),
	(46, 'socio_negocios_1', 'SOCIO DE NEGOCIOS 1', 45),
	(47, 'nombre_propietario_sitio_1', 'NOMBRE DEL PROPIETARIO DEL SITIO  1', 46),
	(48, 'telefono_propietario_1', 'TELEFONOS DEL PROPIETARIO 1', 47),
	(49, 'numero_contrato_1', 'NUMERO DE CONTRATO 1', 48),
	(50, 'objeto_contrato_1', 'OBJETO DEL CONTRATO 1', 49),
	(51, 'reconduccion_tacita_contrato_1', 'RECONDUCCION TACITA DE CONTRATO 1', 50),
	(52, 'fecha_inicial_contrato_1', 'FECHA INICIAL CONTRATO O CONVENIO 1', 51),
	(53, 'fecha_fin_contrato_1', 'FECHA FIN CONTRATO O CONVENIO 1', 52),
	(54, 'contrato_1', '(archivo) CONTRATO 1', 53),
	(55, 'socio_negocios_2', 'SOCIO DE NEGOCIOS 2', 54),
	(56, 'nombre_propietario_sitio_2', 'NOMBRE DEL PROPIETARIO DEL SITIO  2', 55),
	(57, 'telefono_propietario_2', 'TELEFONOS DEL PROPIETARIO 2', 56),
	(58, 'numero_contrato_2', 'NUMERO DE CONTRATO 2', 57),
	(59, 'objeto_contrato_2', 'OBJETO DEL CONTRATO 2', 58),
	(60, 'reconduccion_tacita_contrato_2', 'RECONDUCCION TACITA DE CONTRATO 2', 59),
	(61, 'fecha_inicial_contrato_2', 'FECHA INICIAL CONTRATO O CONVENIO 2', 60),
	(62, 'fecha_fin_contrato_2', 'FECHA FIN CONTRATO O CONVENIO 2', 61),
	(63, 'contrato_2', '(archivo) CONTRATO 2', 62),
	(64, 'socio_negocios_3', 'SOCIO DE NEGOCIOS 3', 63),
	(65, 'nombre_propietario_sitio_3', 'NOMBRE DEL PROPIETARIO DEL SITIO  3', 64),
	(66, 'telefono_propietario_3', 'TELEFONOS DEL PROPIETARIO 3', 65),
	(67, 'numero_contrato_3', 'NUMERO DE CONTRATO 3', 66),
	(68, 'objeto_contrato_3', 'OBJETO DEL CONTRATO 3', 67),
	(69, 'reconduccion_tacita_contrato_3', 'RECONDUCCION TACITA DE CONTRATO 3', 68),
	(70, 'fecha_inicial_contrato_3', 'FECHA INICIAL CONTRATO O CONVENIO 3', 69),
	(71, 'fecha_fin_contrato_3', 'FECHA FIN CONTRATO O CONVENIO 3', 70),
	(72, 'contrato_3', '(archivo) CONTRATO 3', 71),
	(73, 'socio_negocios_4', 'SOCIO DE NEGOCIOS 4', 72),
	(74, 'nombre_propietario_sitio_4', 'NOMBRE DEL PROPIETARIO DEL SITIO 4', 73),
	(75, 'telefono_propietario_4', 'TELEFONOS DEL PROPIETARIO 4', 74),
	(76, 'numero_contrato_4', 'NUMERO DE CONTRATO 4', 75),
	(77, 'objeto_contrato_4', 'OBJETO DEL CONTRATO 4', 76),
	(78, 'reconduccion_tacita_contrato_4', 'RECONDUCCION TACITA DE CONTRATO 4', 77),
	(79, 'fecha_inicial_contrato_4', 'FECHA INICIAL CONTRATO O CONVENIO 4', 78),
	(80, 'fecha_fin_contrato_4', 'FECHA FIN CONTRATO O CONVENIO 4', 79),
	(81, 'contrato_4', '(archivo) CONTRATO 4', 80),
	(82, 'espacio_utilizado_contrato_1', 'ESPACIO UTILIZADO CONTRATO 1', 81),
	(83, 'espacio_utilizado_efectivo_1', 'ESPACIO UTILIZADO EFECTIVO 1', 82),
	(84, 'espacio_utilizado_contrato_2', 'ESPACIO UTILIZADO CONTRATO 2', 83),
	(85, 'espacio_utilizado_efectivo_2', 'ESPACIO UTILIZADO EFECTIVO 2', 84),
	(86, 'espacio_utilizado_contrato_3', 'ESPACIO UTILIZADO CONTRATO 3', 85),
	(87, 'espacio_utilizado_efectivo_3', 'ESPACIO UTILIZADO EFECTIVO 3', 86),
	(88, 'espacio_utilizado_contrato_4', 'ESPACIO UTILIZADO CONTRATO 4', 87),
	(89, 'espacio_utilizado_efectivo_4', 'ESPACIO UTILIZADO EFECTIVO 4', 88),
	(90, 'garantia_1', 'GARANTIA 1', 89),
	(91, 'importe_1', 'IMPORTE 1', 90),
	(92, 'moneda_importe_1', 'MONEDA IMPORTE 1', 91),
	(93, 'garantia_2', 'GARANTIA 2', 92),
	(94, 'importe_2', 'IMPORTE 2', 93),
	(95, 'moneda_importe_2', 'MONEDA IMPORTE 2', 94),
	(96, 'garantia_3', 'GARANTIA 3', 95),
	(97, 'importe_3', 'IMPORTE 3', 96),
	(98, 'moneda_importe_3', 'MONEDA IMPORTE 3', 97),
	(99, 'garantia_4', 'GARANTIA 4', 98),
	(100, 'importe_4', 'IMPORTE 4', 99),
	(101, 'moneda_importe_4', 'MONEDA IMPORTE 4', 100),
	(102, 'formulario_survey', 'FORMULARIO SURVEY', 101),
	(103, 'fotocopia_ci_propietario_sitio_1', 'Fotocopia CI del propietario del sitio 1 (archivo)', 102),
	(104, 'fotocopia_testimonio_propiedad_1', 'Fotocopia Testimonio de Propiedad 1 (archivo)', 103),
	(105, 'fotocopia_folio_real_1', 'Fotocopia Folio Real 1 (archivo)', 104),
	(106, 'fotocopia_impuesto_propiedad_1', 'Fotocopia Impuestos a la Propiedad 1 (archivo)', 105),
	(107, 'formulario_acta_preacuerdo_1', 'Formulario Acta de Preacuerdo 1 (archivo)', 106),
	(108, 'planos_inmueble_1', 'Planos de inmueble 1 (archivo)', 107),
	(109, 'fotocopia_ci_propietario_sitio_2', 'Fotocopia CI del propietario del sitio 2 (archivo)', 108),
	(110, 'fotocopia_testimonio_propiedad_2', 'Fotocopia Testimonio de Propiedad 2 (archivo)', 109),
	(111, 'fotocopia_folio_real_2', 'Fotocopia Folio Real 2 (archivo)', 110),
	(112, 'fotocopia_impuesto_propiedad_2', 'Fotocopia Impuestos a la Propiedad 2 (archivo)', 111),
	(113, 'formulario_acta_preacuerdo_2', 'Formulario Acta de Preacuerdo 2 (archivo)', 112),
	(114, 'planos_inmueble_2', 'Planos de inmueble 2 (archivo)', 113),
	(115, 'fotocopia_ci_propietario_sitio_3', 'Fotocopia CI del propietario del sitio 3 (archivo)', 114),
	(116, 'fotocopia_testimonio_propiedad_3', 'Fotocopia Testimonio de Propiedad 3 (archivo)', 115),
	(117, 'fotocopia_folio_real_3', 'Fotocopia Folio Real 3 (archivo)', 116),
	(118, 'fotocopia_impuesto_propiedad_3', 'Fotocopia Impuestos a la Propiedad 3 (archivo)', 117),
	(119, 'formulario_acta_preacuerdo_3', 'Formulario Acta de Preacuerdo 3 (archivo)', 118),
	(120, 'planos_inmueble_3', 'Planos de inmueble 3 (archivo)', 119),
	(121, 'fotocopia_ci_propietario_sitio_4', 'Fotocopia CI del propietario del sitio 4 (archivo)', 120),
	(122, 'fotocopia_testimonio_propiedad_4', 'Fotocopia Testimonio de Propiedad 4 (archivo)', 121),
	(123, 'fotocopia_folio_real_4', 'Fotocopia Folio Real 4 (archivo)', 122),
	(124, 'fotocopia_impuesto_propiedad_4', 'Fotocopia Impuestos a la Propiedad 4 (archivo)', 123),
	(125, 'formulario_acta_preacuerdo_4', 'Formulario Acta de Preacuerdo 4 (archivo)', 124),
	(126, 'planos_inmueble_4', 'Planos de inmueble 4 (archivo)', 125),
	(127, 'fecha_licencia_social', 'Licencia Social - Fecha', 126),
	(128, 'licencia_social', 'Licencia Social - (archivo)', 127),
	(129, 'licencia_ambiental_numero', 'Licencia Ambiental - Numero', 128),
	(130, 'fecha_inicial_licencia_ambiental', 'Licencia Ambiental - Fecha Inicial', 129),
	(131, 'fecha_fin_licencia_ambiental', 'Licencia Ambiental - Fecha Final', 130),
	(132, 'licencia_ambiental', 'Licencia Ambiental - (archivo)', 131),
	(133, 'permiso_municipal_numero', 'Permiso Municipal - Numero', 132),
	(134, 'fecha_inicial_permiso_municipal', 'Permiso Municipal - Fecha Inicial', 133),
	(135, 'fecha_fin_permiso_municipal', 'Permiso Municipal - Fecha Final', 134),
	(136, 'permiso_municipal', 'Permiso Municipal - (archivo)', 135),
	(137, 'fotografia_sitio_1', 'FOTOGRAFIA SITIO 1', 136),
	(138, 'fotografia_sitio_2', 'FOTOGRAFIA SITIO 2', 137),
	(139, 'fotografia_sitio_3', 'FOTOGRAFIA SITIO 3', 138),
	(140, 'fotografia_sitio_4', 'FOTOGRAFIA SITIO 4', 139),
	(141, 'fotografia_sitio_5', 'FOTOGRAFIA SITIO 5', 140),
	(142, 'observaciones_sitios', 'Observaciones sitios', 141);
/*!40000 ALTER TABLE `columns` ENABLE KEYS */;


-- Volcando estructura para tabla duf_core.paperworks
DROP TABLE IF EXISTS `paperworks`;
CREATE TABLE IF NOT EXISTS `paperworks` (
  `id` int(11) NOT NULL,
  `numero_de_tramite` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `id_op` enum('286') COLLATE utf8_bin NOT NULL DEFAULT '286',
  `operador_abreviado` enum('NUEVATEL S.A.') COLLATE utf8_bin NOT NULL DEFAULT 'NUEVATEL S.A.',
  `estado_licencia` enum('TRAMITE','FINALIZADO') COLLATE utf8_bin NOT NULL,
  `licencia` enum('Radioenlaces Terrestres','Radioenlaces Satelitales') COLLATE utf8_bin NOT NULL,
  `tipo_servicio` enum('Privados/Radioenlaces') COLLATE utf8_bin DEFAULT 'Privados/Radioenlaces',
  `codigo_tipo_servicio` enum('1') COLLATE utf8_bin NOT NULL DEFAULT '1',
  `servicio` enum('Todos') COLLATE utf8_bin NOT NULL DEFAULT 'Todos',
  `tipo_area_servicio` enum('URBANO','RURAL','URBANO/RURAL') COLLATE utf8_bin NOT NULL,
  `area_servicio` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA','BRASIL') COLLATE utf8_bin NOT NULL,
  `tipo_item` enum('Portadora') COLLATE utf8_bin NOT NULL DEFAULT 'Portadora',
  `cantidad_items` enum('1') COLLATE utf8_bin NOT NULL DEFAULT '1',
  `correlativo_licencia` int(3) DEFAULT NULL,
  `tecnologia_da` enum('DIGITAL') COLLATE utf8_bin NOT NULL DEFAULT 'DIGITAL',
  `id_estacion1` varchar(7) COLLATE utf8_bin DEFAULT NULL,
  `departamento_estacion1` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA','BRASIL') COLLATE utf8_bin DEFAULT NULL,
  `localidad_estacion1` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion1` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `latitud_sur_decimal_estacion1` double DEFAULT NULL,
  `longitud_oeste_decimal_estacion1` double DEFAULT NULL,
  `elevacion_estacion1` double(8,2) DEFAULT NULL,
  `altura_antena_sobre_suelo_estacion1` double(5,2) DEFAULT NULL,
  `direccion_estacion1` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `id_estacion2` varchar(7) COLLATE utf8_bin DEFAULT NULL,
  `departamento_estacion2` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA','BRASIL') COLLATE utf8_bin DEFAULT NULL,
  `localidad_estacion2` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion2` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `latitud_sur_decimal_estacion2` double DEFAULT NULL,
  `longitud_oeste_estacion2` double DEFAULT NULL,
  `elevacion_estacion2` double(8,2) DEFAULT NULL,
  `altura_antena_sobre_suelo_estacion2` double(5,2) DEFAULT NULL,
  `direccion_estacion2` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `frecuencia_literal` double(8,2) DEFAULT NULL,
  `frecuencia_numeral` double(8,2) DEFAULT NULL,
  `frecuencia_unidad` enum('MHz') COLLATE utf8_bin NOT NULL DEFAULT 'MHz',
  `ancho_banda_literal` double(7,3) DEFAULT NULL,
  `ancho_banda_numeral` double(7,3) DEFAULT NULL,
  `ancho_banda_unidad` enum('MHz') COLLATE utf8_bin NOT NULL DEFAULT 'MHz',
  `capacidad_velocidad_literal` double(7,3) DEFAULT NULL,
  `capacidad_velocidad_numeral` double(7,3) DEFAULT NULL,
  `capacidad_velocidad_unidad` enum('Mbps') COLLATE utf8_bin NOT NULL DEFAULT 'Mbps',
  `descripcion_emision` varchar(10) COLLATE utf8_bin DEFAULT 'Mbps',
  `potencial_nominal` double(5,2) DEFAULT NULL,
  `potencial_nominal_unidad` enum('dBm') COLLATE utf8_bin NOT NULL DEFAULT 'dBm',
  `pire` double(5,2) DEFAULT NULL,
  `pire_unidad` enum('dBm') COLLATE utf8_bin DEFAULT 'dBm',
  `polarizacion` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `nota_bol` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `rec_uit` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `id_procedure` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `latitud_sur_grados_estacion1` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `longitud_oeste_grados_estacion1` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_core.paperworks: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `paperworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `paperworks` ENABLE KEYS */;


-- Volcando estructura para tabla duf_core.radiobases
DROP TABLE IF EXISTS `radiobases`;
CREATE TABLE IF NOT EXISTS `radiobases` (
  `id` int(11) NOT NULL,
  `operador` enum('NUEVATEL') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'NUEVATEL',
  `nombre_estacion` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tipo_sitio` enum('RADIOBASE','REPETIDORA') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `site_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cell_id_primera_portadora` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cell_id_segunda_portadora` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cell_id_tercera_portadora` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `categoria` enum('URBANO','RURAL') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `estado` enum('ACTIVO','BAJA','EN PROCESO') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fecha_puesta_servicio_att` date DEFAULT NULL,
  `fecha_activacion_newperformance` date DEFAULT NULL,
  `fecha_ultima_modificacion` date DEFAULT NULL,
  `fecha_baja_att_estacion` date DEFAULT NULL,
  `tipo_servicio` enum('MOVIL','FIJO','MOVIL/FIJO') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tecnologia_2g` tinyint(4) DEFAULT NULL,
  `tecnologia_hspa` tinyint(4) DEFAULT NULL,
  `tecnologia_wimax` tinyint(4) DEFAULT NULL,
  `tecnologia_lte` tinyint(4) DEFAULT NULL,
  `departamento` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `provincia` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(51) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `latitud_sur` varchar(20) DEFAULT NULL,
  `longitud_oeste` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `elevacion_rbs` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `altura_terreno_antena` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `estructura` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `marca_antena` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modelo_antena` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ganancia_antena` int(11) DEFAULT NULL,
  `polarizacion_antena` enum('HORIZONTAL','VERTICAL','CROSPOL') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `brochure_antena` enum('SI','NO') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `descripcion_emisiones` enum('SI','NO') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `potencia_nominal` int(11) DEFAULT NULL,
  `pire` int(11) DEFAULT NULL,
  `potencia_transmisor` int(11) DEFAULT NULL,
  `cobertura` int(11) DEFAULT NULL,
  `estudios_radiacion` enum('SI','NO') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `msc_atiende_rbs` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `bsc_atiende_rbs` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `rnc_atiende_nodo_b` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nota_comunicacion_att` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ceco_sitio` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tipo_ceco` enum('FINAL','EN PROCESO') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modalidad_uso_sitio` enum('PROPIO','CONVENIO','ARRENDADO') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `socio_negocios_1` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nombre_propietario_sitio_1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `telefono_propietario_1` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `numero_contrato_1` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `objeto_contrato_1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `reconduccion_tacita_contrato_1` enum('SI','NO') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fecha_inicial_contrato_1` date DEFAULT NULL,
  `fecha_fin_contrato_1` date DEFAULT NULL,
  `contrato_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `socio_negocios_2` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nombre_propietario_sitio_2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `telefono_propietario_2` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `numero_contrato_2` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `objeto_contrato_2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `reconduccion_tacita_contrato_2` enum('SI','NO') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fecha_inicial_contrato_2` date DEFAULT NULL,
  `fecha_fin_contrato_2` date DEFAULT NULL,
  `contrato_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `socio_negocios_3` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nombre_propietario_sitio_3` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `telefono_propietario_3` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `numero_contrato_3` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `objeto_contrato_3` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `reconduccion_tacita_contrato_3` enum('SI','NO') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fecha_inicial_contrato_3` date DEFAULT NULL,
  `fecha_fin_contrato_3` date DEFAULT NULL,
  `contrato_3` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `socio_negocios_4` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nombre_propietario_sitio_4` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `telefono_propietario_4` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `numero_contrato_4` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `objeto_contrato_4` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `reconduccion_tacita_contrato_4` enum('SI','NO') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fecha_inicial_contrato_4` date DEFAULT NULL,
  `fecha_fin_contrato_4` date DEFAULT NULL,
  `contrato_4` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `espacio_utilizado_contrato_1` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `espacio_utilizado_efectivo_1` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `espacio_utilizado_contrato_2` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `espacio_utilizado_efectivo_2` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `espacio_utilizado_contrato_3` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `espacio_utilizado_efectivo_3` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `espacio_utilizado_contrato_4` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `espacio_utilizado_efectivo_4` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `garantia_1` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `importe_1` float DEFAULT NULL,
  `moneda_importe_1` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `garantia_2` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `importe_2` float DEFAULT NULL,
  `moneda_importe_2` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `garantia_3` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `importe_3` float DEFAULT NULL,
  `moneda_importe_3` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `garantia_4` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `importe_4` float DEFAULT NULL,
  `moneda_importe_4` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `formulario_survey` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_ci_propietario_sitio_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_testimonio_propiedad_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_folio_real_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_impuesto_propiedad_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `formulario_acta_preacuerdo_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `planos_inmueble_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_ci_propietario_sitio_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_testimonio_propiedad_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_folio_real_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_impuesto_propiedad_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `formulario_acta_preacuerdo_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `planos_inmueble_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_ci_propietario_sitio_3` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_testimonio_propiedad_3` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_folio_real_3` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_impuesto_propiedad_3` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `formulario_acta_preacuerdo_3` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `planos_inmueble_3` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_ci_propietario_sitio_4` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_testimonio_propiedad_4` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_folio_real_4` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotocopia_impuesto_propiedad_4` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `formulario_acta_preacuerdo_4` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `planos_inmueble_4` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fecha_licencia_social` date DEFAULT NULL,
  `licencia_social` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `licencia_ambiental_numero` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fecha_inicial_licencia_ambiental` date DEFAULT NULL,
  `fecha_fin_licencia_ambiental` date DEFAULT NULL,
  `licencia_ambiental` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `permiso_municipal_numero` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fecha_inicial_permiso_municipal` date DEFAULT NULL,
  `fecha_fin_permiso_municipal` date DEFAULT NULL,
  `permiso_municipal` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotografia_sitio_1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotografia_sitio_2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotografia_sitio_3` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotografia_sitio_4` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fotografia_sitio_5` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `observaciones_sitios` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla duf_core.radiobases: ~372 rows (aproximadamente)
/*!40000 ALTER TABLE `radiobases` DISABLE KEYS */;
/*!40000 ALTER TABLE `radiobases` ENABLE KEYS */;


-- Volcando estructura para tabla duf_core.radiolinks
DROP TABLE IF EXISTS `radiolinks`;
CREATE TABLE IF NOT EXISTS `radiolinks` (
  `id` int(11) NOT NULL,
  `estado_licencia` enum('ACTIVO','BAJA') COLLATE utf8_bin NOT NULL,
  `numero_rar` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_rar` date DEFAULT NULL,
  `licencia` enum('Radioenlaces Terrestres','Radioenlaces Satelitales') COLLATE utf8_bin NOT NULL,
  `correlativo_licencia` int(11) DEFAULT NULL,
  `departamento_estacion_1` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA','BRASIL') COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion_1` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion_2` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `latitud_sur_estacion_1` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `longitud_oeste_estacion_1` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `elevacion_estacion_1` float DEFAULT NULL,
  `direccion_estacion_1` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `frecuencia_estacion_1` float DEFAULT NULL,
  `descripcion_emision` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ancho_de_banda` float DEFAULT NULL,
  `velocidad` float DEFAULT NULL,
  `potencia_nominal` float DEFAULT NULL,
  `pire` float DEFAULT NULL,
  `altura_antena_sobre_suelo_estacion_1` float DEFAULT NULL,
  `polarizacion` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `rar_modificacion_1` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_rar_modificacion_1` date DEFAULT NULL,
  `rar_modificacion_2` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_rar_modificacion_2` date DEFAULT NULL,
  `rar_modificacion_3` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_rar_modificacion_3` date DEFAULT NULL,
  `rar_modificacion_4` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_rar_modificacion_4` date DEFAULT NULL,
  `rar_modificacion_5` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_rar_modificacion_5` date DEFAULT NULL,
  `rar_modificacion_6` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_rar_modificacion_6` date DEFAULT NULL,
  `rar_modificacion_7` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_rar_modificacion_7` date DEFAULT NULL,
  `rar_modificacion_8` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_rar_modificacion_8` date DEFAULT NULL,
  `rar_modificacion_9` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_rar_modificacion_9` date DEFAULT NULL,
  `rar_modificacion_10` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `fecha_rar_modificacion_10` date DEFAULT NULL,
  `observaciones` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_core.radiolinks: ~3 853 rows (aproximadamente)
/*!40000 ALTER TABLE `radiolinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `radiolinks` ENABLE KEYS */;


-- Volcando estructura para tabla duf_core.terminals
DROP TABLE IF EXISTS `terminals`;
CREATE TABLE IF NOT EXISTS `terminals` (
  `id` int(11) NOT NULL DEFAULT '0',
  `city_state` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `period` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `prepago` int(11) DEFAULT NULL,
  `postpago` int(11) DEFAULT NULL,
  `telpu` int(11) DEFAULT NULL,
  `fourg_pre` int(11) DEFAULT NULL,
  `fourg_post` int(11) DEFAULT NULL,
  `vdatos` int(11) DEFAULT NULL,
  `localizame` int(11) DEFAULT NULL,
  `wimax` int(11) DEFAULT NULL,
  `lte_pre` int(11) DEFAULT NULL,
  `lte_post` int(11) DEFAULT NULL,
  `churn_pre` int(11) DEFAULT NULL,
  `empleados` int(11) DEFAULT NULL,
  `pruebas` int(11) DEFAULT NULL,
  `comteco` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_state_period` (`city_state`,`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_core.terminals: ~63 rows (aproximadamente)
/*!40000 ALTER TABLE `terminals` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminals` ENABLE KEYS */;


-- Volcando estructura de base de datos para duf_daf_reports
DROP DATABASE IF EXISTS `duf_daf_reports`;
CREATE DATABASE IF NOT EXISTS `duf_daf_reports` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `duf_daf_reports`;


-- Volcando estructura para tabla duf_daf_reports.annual_duf
DROP TABLE IF EXISTS `annual_duf`;
CREATE TABLE IF NOT EXISTS `annual_duf` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(50) COLLATE utf8_bin NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `period` varchar(6) COLLATE utf8_bin NOT NULL,
  `type` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_daf_reports.annual_duf: ~104 rows (aproximadamente)
/*!40000 ALTER TABLE `annual_duf` DISABLE KEYS */;
/*!40000 ALTER TABLE `annual_duf` ENABLE KEYS */;


-- Volcando estructura para tabla duf_daf_reports.duf
DROP TABLE IF EXISTS `duf`;
CREATE TABLE IF NOT EXISTS `duf` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `network_type` enum('MW','SAT','Terminales') DEFAULT NULL,
  `city_state` varchar(20) DEFAULT NULL,
  `network_description` varchar(100) DEFAULT NULL,
  `station_number` int(5) DEFAULT NULL,
  `station_canon` int(10) DEFAULT NULL,
  `terminal_number` int(10) DEFAULT NULL,
  `terminal_canon` int(10) DEFAULT NULL,
  `a1t` float DEFAULT NULL,
  `bandwidth` float DEFAULT NULL,
  `bandwidth_function` float DEFAULT NULL,
  `transmission_speed` float DEFAULT NULL,
  `band_appreciation` int(5) DEFAULT NULL,
  `penetration_grade` float DEFAULT NULL,
  `spectrum_saturation` int(2) DEFAULT NULL,
  `demographic_index` int(5) DEFAULT NULL,
  `efficiency_factor` float DEFAULT NULL,
  `service_factor` float DEFAULT NULL,
  `a2t` float DEFAULT NULL,
  `a1t_plus_a2t` float DEFAULT NULL,
  `duft` float DEFAULT NULL,
  `period` varchar(8) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268409482 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla duf_daf_reports.duf: ~3 102 rows (aproximadamente)
/*!40000 ALTER TABLE `duf` DISABLE KEYS */;
/*!40000 ALTER TABLE `duf` ENABLE KEYS */;


-- Volcando estructura para tabla duf_daf_reports.duf_balance
DROP TABLE IF EXISTS `duf_balance`;
CREATE TABLE IF NOT EXISTS `duf_balance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Móvil','Wimax') COLLATE utf8_bin DEFAULT NULL,
  `period` varchar(6) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `balance` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238823433 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_daf_reports.duf_balance: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `duf_balance` DISABLE KEYS */;
REPLACE INTO `duf_balance` (`id`, `type`, `period`, `balance`) VALUES
	(1, 'Móvil', '201411', 0.00),
	(2, 'Wimax', '201411', 0.00);
/*!40000 ALTER TABLE `duf_balance` ENABLE KEYS */;


-- Volcando estructura para tabla duf_daf_reports.pdf_file
DROP TABLE IF EXISTS `pdf_file`;
CREATE TABLE IF NOT EXISTS `pdf_file` (
  `file_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `file` mediumblob NOT NULL,
  `period` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` enum('803M','811M') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `period` (`period`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla duf_daf_reports.pdf_file: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `pdf_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdf_file` ENABLE KEYS */;


-- Volcando estructura de base de datos para duf_global_config
DROP DATABASE IF EXISTS `duf_global_config`;
CREATE DATABASE IF NOT EXISTS `duf_global_config` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `duf_global_config`;


-- Volcando estructura para tabla duf_global_config.bandwidth
DROP TABLE IF EXISTS `bandwidth`;
CREATE TABLE IF NOT EXISTS `bandwidth` (
  `id` int(11) NOT NULL,
  `numero_ab` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL DEFAULT '',
  `frecuencia` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla duf_global_config.bandwidth: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `bandwidth` DISABLE KEYS */;
REPLACE INTO `bandwidth` (`id`, `numero_ab`, `descripcion`, `frecuencia`) VALUES
	(1, 1, 'Banda Móvil 1900 MHz', 50),
	(2, 2, 'Banda Móvil LTE', 30),
	(3, 3, 'Banda WiMax Fijo', 50);
/*!40000 ALTER TABLE `bandwidth` ENABLE KEYS */;


-- Volcando estructura para tabla duf_global_config.canon
DROP TABLE IF EXISTS `canon`;
CREATE TABLE IF NOT EXISTS `canon` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `rango_min` int(11) DEFAULT NULL,
  `rango_max` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla duf_global_config.canon: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `canon` DISABLE KEYS */;
REPLACE INTO `canon` (`id`, `descripcion`, `monto`, `rango_min`, `rango_max`) VALUES
	(1, 'Por cada Estación Radiobase Terrestre en operación', 919.00, NULL, NULL),
	(2, 'Por cada Equipo Terminal en operación', 24.00, NULL, NULL),
	(3, 'Por cada Estación Radiobase en operación', 919.00, NULL, NULL),
	(4, 'Por cada Equipo Terminal en operación', 11.00, NULL, NULL),
	(5, 'Velocidad de Transmisión menor o igual a 2 Mbps', 458.00, 0, 2),
	(6, 'Velocidad de Transmisión mayor a 2 y menor o igual a 8 Mbps', 919.00, 2, 8),
	(7, 'Velocidad de Transmisión mayor a 8 y menor o igual a 34 Mbps', 1836.00, 8, 34),
	(8, 'Velocidad de Transmisión mayor a 34 y menor o igual a 140 Mbps', 3673.00, 34, 140),
	(9, 'Velocidad de Transmisión mayor a 140 Mbps', 7344.00, 140, 1000000);
/*!40000 ALTER TABLE `canon` ENABLE KEYS */;


-- Volcando estructura para tabla duf_global_config.canon_group
DROP TABLE IF EXISTS `canon_group`;
CREATE TABLE IF NOT EXISTS `canon_group` (
  `canon_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`canon_id`,`group_id`),
  KEY `FK_canon_group_group` (`group_id`),
  KEY `canon_id` (`canon_id`),
  CONSTRAINT `FK_canon_group_canon` FOREIGN KEY (`canon_id`) REFERENCES `canon` (`id`),
  CONSTRAINT `FK_canon_group_group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla duf_global_config.canon_group: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `canon_group` DISABLE KEYS */;
REPLACE INTO `canon_group` (`canon_id`, `group_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 2),
	(5, 3),
	(6, 3),
	(7, 3),
	(8, 3),
	(9, 3);
/*!40000 ALTER TABLE `canon_group` ENABLE KEYS */;


-- Volcando estructura para tabla duf_global_config.demographic_index
DROP TABLE IF EXISTS `demographic_index`;
CREATE TABLE IF NOT EXISTS `demographic_index` (
  `id` int(11) NOT NULL,
  `area_de_servicio` enum('LA PAZ','ORURO','POTOSÍ','COBIJA','TRINIDAD','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') DEFAULT NULL,
  `indice_demografico` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla duf_global_config.demographic_index: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `demographic_index` DISABLE KEYS */;
REPLACE INTO `demographic_index` (`id`, `area_de_servicio`, `indice_demografico`) VALUES
	(1, 'LA PAZ', 4),
	(2, 'SANTA CRUZ', 4),
	(3, 'COCHABAMBA', 4),
	(4, 'TARIJA', 4),
	(5, 'CHUQUISACA', 4),
	(6, 'POTOSÍ', 4),
	(7, 'ORURO', 4),
	(8, 'TRINIDAD', 3),
	(9, 'COBIJA', 2);
/*!40000 ALTER TABLE `demographic_index` ENABLE KEYS */;


-- Volcando estructura para tabla duf_global_config.general_configuration
DROP TABLE IF EXISTS `general_configuration`;
CREATE TABLE IF NOT EXISTS `general_configuration` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla duf_global_config.general_configuration: ~31 rows (aproximadamente)
/*!40000 ALTER TABLE `general_configuration` DISABLE KEYS */;
REPLACE INTO `general_configuration` (`id`, `nombre`, `valor`, `descripcion`) VALUES
	(1, 'DUF_CANON_DATE', '2013-01-14', 'Fecha canones para DUF'),
	(2, 'NAME_803', 'NOMBRE O RAZON SOCIAL', 'NUEVATEL PCS DE BOLIVIA S.A.'),
	(3, 'NIT_NUMBER_803', 'NUMERO DE NIT', '1007173022'),
	(4, 'TITULAR_NAME_803', 'NOMBRE DEL TITULAR', 'FELIX LEONARDO SAUNERO NAVA'),
	(5, 'TITULAR_POSITION_803', 'CARGO DEL TITULAR', 'VICEPRESIDENTE DE REGULACION Y RRII'),
	(6, 'ID_NUMBER_803', 'N CARNET IDENTIDAD', '2712807'),
	(7, 'ID_ISSUED_803', 'CARNET IDENTIDAD EXPEDIDO', 'LA PAZ'),
	(8, 'OPERATOR_CODE_803', 'CODIGO DE OPERADOR', '286'),
	(9, 'SERVICE_803', 'SERVICIO', 'MÓVIL'),
	(10, 'TECHNOLOGY_803', 'BANDA Y/O TECNOLOGIA', '850 y 1900 MHz'),
	(11, 'NAME_811', 'NOMBRE O RAZON SOCIAL', 'NUEVATEL PCS DE BOLIVIA S.A.'),
	(12, 'NIT_NUMBER_811', 'NUMERO DE NIT', '1007173022'),
	(13, 'TITULAR_NAME_811', 'NOMBRE DEL TITULAR', 'FELIX LEONARDO SAUNERO NAVA'),
	(14, 'TITULAR_POSITION_811', 'CARGO DEL TITULAR', 'VICEPRESIDENTE DE REGULACION Y RRII'),
	(15, 'ID_NUMBER_811', 'N CARNET IDENTIDAD', '2712807'),
	(16, 'ID_ISSUED_811', 'CARNET IDENTIDAD EXPEDIDO', 'LA PAZ'),
	(17, 'OPERATOR_CODE_811', 'CODIGO DE OPERADOR', '286'),
	(18, 'SERVICE_811', 'SERVICIO', 'ACCESO A INTERNET FIJO'),
	(19, 'TECHNOLOGY_811', 'BANDA Y/O TECNOLOGIA', '3.5 GHz'),
	(20, 'ORDER_OF_DAF_DUF', 'A LA ORDEN DE:', 'Autoridad de Regulación y Fiscalización de Telecomunicaciones y Transportes (ATT)'),
	(21, 'AMOUNT_DAF_DUF', 'MONTO:', 'Bs: (Monto)'),
	(22, 'RELEASE_DATE_DAF_DUF', 'FECHA DE EMISIÓN (dd/mm/aa):', 'Hasta el DD-MM-AA'),
	(23, 'BANK_DAF_DUF', 'Banco', 'Banco Unión S.A.'),
	(24, 'BANK_ACCOUNT_DAF_DUF', 'Cuenta Corriente', '1-6866567'),
	(25, 'REFERENCE_DAF_DUF', 'Referencia', 'CODIGO ID: 286'),
	(26, 'FIRST_DESCRIPTION_DAF_DUF', 'Descripción:', '(Detalle del pago)'),
	(27, 'SECOND_DESCRIPTION_DAF_DUF', '-', 'Por favor realizar el pago hasta el DD-MM-AA'),
	(28, 'REQUEST_DATE_DAF_DUF', 'FECHA SOLICITUD (dd/mm/aa):', 'DD-MM-AA'),
	(29, 'EXPENSE_ACCOUNT_DAF_DUF', 'CUENTA DE GASTO', '-'),
	(30, 'COST_CENTER_DAF_DUF', 'CENTRO DE COSTO', '-'),
	(31, 'PA_PRODUCT', 'PRODUCTO PA', '-');
/*!40000 ALTER TABLE `general_configuration` ENABLE KEYS */;


-- Volcando estructura para tabla duf_global_config.group
DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla duf_global_config.group: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
REPLACE INTO `group` (`id`, `descripcion`) VALUES
	(1, 'Servicio Móvil Satelital u otro Servicio Básico Móvil'),
	(2, 'Servicio Local de Acceso Inalámbrico Fijo, Servicios Portadores y Acceso Inalámbircos Fijos, por cada una de las Áreas de Servicio'),
	(3, 'Radioenlaces terrestres y satelitales - Sistemas Digitales: Por cada enlace originado en una Estación, pasiva o activa, de acuerdo a:'),
	(4, 'Radioenlaces terrestres y satelitales - Sistemas Analógicos: Por cada enlace originado en una Estación, pasiva o activa, de acuerdo a:');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;


-- Volcando estructura para tabla duf_global_config.sap_notifications_emails
DROP TABLE IF EXISTS `sap_notifications_emails`;
CREATE TABLE IF NOT EXISTS `sap_notifications_emails` (
  `id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_global_config.sap_notifications_emails: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `sap_notifications_emails` DISABLE KEYS */;
REPLACE INTO `sap_notifications_emails` (`id`, `email`) VALUES
	(1, 'hugo.siles@nuevatel.com');
/*!40000 ALTER TABLE `sap_notifications_emails` ENABLE KEYS */;


-- Volcando estructura para tabla duf_global_config.ufv
DROP TABLE IF EXISTS `ufv`;
CREATE TABLE IF NOT EXISTS `ufv` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `valor` decimal(10,3) NOT NULL,
  `delta_ufv` decimal(10,3) DEFAULT NULL,
  `incremento` decimal(10,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fecha` (`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla duf_global_config.ufv: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `ufv` DISABLE KEYS */;
REPLACE INTO `ufv` (`id`, `fecha`, `valor`, `delta_ufv`, `incremento`) VALUES
	(1, '2012-01-01', 1.719, 0.000, 0.0),
	(2, '2013-01-01', 1.801, 1.048, 4.8),
	(3, '2014-01-01', 1.900, 1.055, 5.5),
	(4, '2015-01-01', 2.013, 1.059, 5.9);
/*!40000 ALTER TABLE `ufv` ENABLE KEYS */;


-- Volcando estructura de base de datos para duf_reports
DROP DATABASE IF EXISTS `duf_reports`;
CREATE DATABASE IF NOT EXISTS `duf_reports` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `duf_reports`;


-- Volcando estructura para tabla duf_reports.annual_link_mw
DROP TABLE IF EXISTS `annual_link_mw`;
CREATE TABLE IF NOT EXISTS `annual_link_mw` (
  `id` int(11) NOT NULL,
  `departamento_estacion_1` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion_1` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion_2` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `ancho_de_banda` float DEFAULT NULL,
  `velocidad` float DEFAULT NULL,
  `periodo` varchar(6) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `Unique_key` (`id`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.annual_link_mw: ~2 428 rows (aproximadamente)
/*!40000 ALTER TABLE `annual_link_mw` DISABLE KEYS */;
/*!40000 ALTER TABLE `annual_link_mw` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.annual_link_sat
DROP TABLE IF EXISTS `annual_link_sat`;
CREATE TABLE IF NOT EXISTS `annual_link_sat` (
  `id` int(11) NOT NULL,
  `departamento_estacion_1` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion_1` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion_2` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `ancho_de_banda` float DEFAULT NULL,
  `velocidad` float DEFAULT NULL,
  `periodo` varchar(6) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `Unique_key` (`id`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.annual_link_sat: ~749 rows (aproximadamente)
/*!40000 ALTER TABLE `annual_link_sat` DISABLE KEYS */;
/*!40000 ALTER TABLE `annual_link_sat` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.annual_movil_radiobases
DROP TABLE IF EXISTS `annual_movil_radiobases`;
CREATE TABLE IF NOT EXISTS `annual_movil_radiobases` (
  `site_id` varchar(10) COLLATE utf8_bin NOT NULL,
  `cell_id_primera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_segunda_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_tercera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `departamento` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `estado` enum('ACTIVO') COLLATE utf8_bin NOT NULL,
  `ceco_sitio` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `tipo_ceco` enum('FINAL','EN PROCESO') COLLATE utf8_bin DEFAULT NULL,
  `periodo` varchar(6) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `Unique_key` (`site_id`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.annual_movil_radiobases: ~200 rows (aproximadamente)
/*!40000 ALTER TABLE `annual_movil_radiobases` DISABLE KEYS */;
/*!40000 ALTER TABLE `annual_movil_radiobases` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.annual_wimax_radiobases
DROP TABLE IF EXISTS `annual_wimax_radiobases`;
CREATE TABLE IF NOT EXISTS `annual_wimax_radiobases` (
  `site_id` varchar(10) COLLATE utf8_bin NOT NULL,
  `cell_id_primera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_segunda_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_tercera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `departamento` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `estado` enum('ACTIVO') COLLATE utf8_bin NOT NULL,
  `ceco_sitio` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `tipo_ceco` enum('FINAL','EN PROCESO') COLLATE utf8_bin DEFAULT NULL,
  `periodo` varchar(6) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `Unique_key` (`site_id`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.annual_wimax_radiobases: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `annual_wimax_radiobases` DISABLE KEYS */;
/*!40000 ALTER TABLE `annual_wimax_radiobases` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.manual_paperworks_mw
DROP TABLE IF EXISTS `manual_paperworks_mw`;
CREATE TABLE IF NOT EXISTS `manual_paperworks_mw` (
  `id` int(11) NOT NULL,
  `numero_de_tramite` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `departamento_estacion1` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion1` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion2` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `ancho_banda_numeral` float DEFAULT NULL,
  `capacidad_velocidad_numeral` float DEFAULT NULL,
  `periodo` varchar(8) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `Unique_key` (`id`,`periodo`),
  KEY `periodo_num_tramite` (`periodo`,`numero_de_tramite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.manual_paperworks_mw: ~88 rows (aproximadamente)
/*!40000 ALTER TABLE `manual_paperworks_mw` DISABLE KEYS */;
/*!40000 ALTER TABLE `manual_paperworks_mw` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.manual_paperworks_sat
DROP TABLE IF EXISTS `manual_paperworks_sat`;
CREATE TABLE IF NOT EXISTS `manual_paperworks_sat` (
  `id` int(11) NOT NULL,
  `numero_de_tramite` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `departamento_estacion1` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion1` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion2` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `ancho_banda_numeral` float DEFAULT NULL,
  `capacidad_velocidad_numeral` float DEFAULT NULL,
  `periodo` varchar(8) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `Unique_key` (`id`,`periodo`),
  KEY `periodo_num_tramite` (`periodo`,`numero_de_tramite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.manual_paperworks_sat: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `manual_paperworks_sat` DISABLE KEYS */;
/*!40000 ALTER TABLE `manual_paperworks_sat` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.monthly_active_mobile_radiobases
DROP TABLE IF EXISTS `monthly_active_mobile_radiobases`;
CREATE TABLE IF NOT EXISTS `monthly_active_mobile_radiobases` (
  `site_id` varchar(10) COLLATE utf8_bin NOT NULL,
  `cell_id_primera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_segunda_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_tercera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `departamento` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `estado` enum('ACTIVO','BAJA') COLLATE utf8_bin NOT NULL,
  `ceco_sitio` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `tipo_ceco` enum('FINAL','EN PROCESO') COLLATE utf8_bin DEFAULT NULL,
  `periodo` varchar(6) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `Unique_key` (`site_id`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.monthly_active_mobile_radiobases: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `monthly_active_mobile_radiobases` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_active_mobile_radiobases` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.monthly_active_mobile_radiobases_summary
DROP TABLE IF EXISTS `monthly_active_mobile_radiobases_summary`;
CREATE TABLE IF NOT EXISTS `monthly_active_mobile_radiobases_summary` (
  `departamento` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin NOT NULL,
  `cantidad_altas` int(11) NOT NULL,
  `cantidad_bajas` int(11) NOT NULL,
  `altas_menos_bajas` int(11) NOT NULL,
  `periodo` varchar(6) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `departamento_periodo` (`departamento`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.monthly_active_mobile_radiobases_summary: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `monthly_active_mobile_radiobases_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_active_mobile_radiobases_summary` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.monthly_active_wimax_radiobases
DROP TABLE IF EXISTS `monthly_active_wimax_radiobases`;
CREATE TABLE IF NOT EXISTS `monthly_active_wimax_radiobases` (
  `site_id` varchar(10) COLLATE utf8_bin NOT NULL,
  `cell_id_primera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_segunda_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_tercera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `departamento` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `estado` enum('ACTIVO','BAJA') COLLATE utf8_bin NOT NULL,
  `ceco_sitio` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `tipo_ceco` enum('FINAL','EN PROCESO') COLLATE utf8_bin DEFAULT NULL,
  `periodo` varchar(6) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `Unique_key` (`site_id`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.monthly_active_wimax_radiobases: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `monthly_active_wimax_radiobases` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_active_wimax_radiobases` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.monthly_active_wimax_radiobases_summary
DROP TABLE IF EXISTS `monthly_active_wimax_radiobases_summary`;
CREATE TABLE IF NOT EXISTS `monthly_active_wimax_radiobases_summary` (
  `departamento` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin NOT NULL,
  `cantidad_altas` int(11) NOT NULL,
  `cantidad_bajas` int(11) NOT NULL,
  `altas_menos_bajas` int(11) NOT NULL,
  `periodo` varchar(6) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `departamento_periodo` (`departamento`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.monthly_active_wimax_radiobases_summary: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `monthly_active_wimax_radiobases_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_active_wimax_radiobases_summary` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.monthly_movil_radiobases
DROP TABLE IF EXISTS `monthly_movil_radiobases`;
CREATE TABLE IF NOT EXISTS `monthly_movil_radiobases` (
  `site_id` varchar(10) COLLATE utf8_bin NOT NULL,
  `cell_id_primera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_segunda_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_tercera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `departamento` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `estado` enum('ACTIVO','BAJA','EN PROCESO') COLLATE utf8_bin NOT NULL,
  `ceco_sitio` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `tipo_ceco` enum('FINAL','EN PROCESO') COLLATE utf8_bin DEFAULT NULL,
  `periodo` varchar(6) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `Unique_key` (`site_id`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.monthly_movil_radiobases: ~2 403 rows (aproximadamente)
/*!40000 ALTER TABLE `monthly_movil_radiobases` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_movil_radiobases` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.monthly_movil_terminals
DROP TABLE IF EXISTS `monthly_movil_terminals`;
CREATE TABLE IF NOT EXISTS `monthly_movil_terminals` (
  `id` int(11) NOT NULL,
  `city_state` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `monthly_total` int(11) DEFAULT NULL,
  `previous_monthly_total` int(11) DEFAULT NULL,
  `netadds` int(11) DEFAULT NULL,
  `period` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  UNIQUE KEY `Unique_key` (`id`,`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.monthly_movil_terminals: ~63 rows (aproximadamente)
/*!40000 ALTER TABLE `monthly_movil_terminals` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_movil_terminals` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.monthly_wimax_radiobases
DROP TABLE IF EXISTS `monthly_wimax_radiobases`;
CREATE TABLE IF NOT EXISTS `monthly_wimax_radiobases` (
  `site_id` varchar(10) COLLATE utf8_bin NOT NULL,
  `cell_id_primera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_segunda_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cell_id_tercera_portadora` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `nombre_estacion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `departamento` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `estado` enum('ACTIVO','BAJA','EN PROCESO') COLLATE utf8_bin NOT NULL,
  `ceco_sitio` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `tipo_ceco` enum('FINAL','EN PROCESO') COLLATE utf8_bin DEFAULT NULL,
  `periodo` varchar(6) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `Unique_key` (`site_id`,`periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.monthly_wimax_radiobases: ~186 rows (aproximadamente)
/*!40000 ALTER TABLE `monthly_wimax_radiobases` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_wimax_radiobases` ENABLE KEYS */;


-- Volcando estructura para tabla duf_reports.monthly_wimax_terminals
DROP TABLE IF EXISTS `monthly_wimax_terminals`;
CREATE TABLE IF NOT EXISTS `monthly_wimax_terminals` (
  `id` int(11) NOT NULL,
  `city_state` enum('LA PAZ','ORURO','POTOSÍ','PANDO','BENI','SANTA CRUZ','COCHABAMBA','CHUQUISACA','TARIJA') COLLATE utf8_bin DEFAULT NULL,
  `monthly_total` int(11) DEFAULT NULL,
  `previous_monthly_total` int(11) DEFAULT NULL,
  `netadds` int(11) DEFAULT NULL,
  `period` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  UNIQUE KEY `Unique_key` (`id`,`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_reports.monthly_wimax_terminals: ~63 rows (aproximadamente)
/*!40000 ALTER TABLE `monthly_wimax_terminals` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_wimax_terminals` ENABLE KEYS */;


-- Volcando estructura de base de datos para duf_security_logs
DROP DATABASE IF EXISTS `duf_security_logs`;
CREATE DATABASE IF NOT EXISTS `duf_security_logs` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `duf_security_logs`;


-- Volcando estructura para tabla duf_security_logs.system_events
DROP TABLE IF EXISTS `system_events`;
CREATE TABLE IF NOT EXISTS `system_events` (
  `event_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `event_type` varchar(45) COLLATE utf8_bin NOT NULL,
  `event_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event_date_timestamp` bigint(20) NOT NULL DEFAULT '0',
  `status` varchar(100) COLLATE utf8_bin NOT NULL,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `access_ip` varchar(20) COLLATE utf8_bin NOT NULL,
  `error` varchar(1024) COLLATE utf8_bin NOT NULL,
  `aditional_params` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla duf_security_logs.system_events: 1 768 rows
/*!40000 ALTER TABLE `system_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_events` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
