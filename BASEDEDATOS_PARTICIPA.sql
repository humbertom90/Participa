/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 10.0.29-MariaDB-0ubuntu0.16.04.1 : Database - participa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`participa` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `participa`;

/*Table structure for table `acciones` */

DROP TABLE IF EXISTS `acciones`;

CREATE TABLE `acciones` (
  `id` varchar(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acciones` */

/*Table structure for table `adminlogs` */

DROP TABLE IF EXISTS `adminlogs`;

CREATE TABLE `adminlogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `subclase` varchar(255) NOT NULL,
  `objeto_id` int(10) unsigned NOT NULL,
  `objeto_type` varchar(255) NOT NULL,
  `poder_id` int(10) unsigned NOT NULL,
  `actor_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `adminlogs_objeto_id_objeto_type_index` (`objeto_id`,`objeto_type`),
  KEY `adminlogs_actor_id_foreign` (`actor_id`),
  CONSTRAINT `adminlogs_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `adminlogs` */

insert  into `adminlogs`(`id`,`descripcion`,`subclase`,`objeto_id`,`objeto_type`,`poder_id`,`actor_id`,`created_at`,`updated_at`) values (1,'','new',1,'Organismo',3,1,'2016-12-01 12:37:19','2016-12-01 12:37:19'),(2,'1','new',1,'Organismo',4,1,'2016-12-01 12:37:46','2016-12-01 12:37:46'),(3,'','mod',1,'Organismo',3,1,'2016-12-01 12:38:35','2016-12-01 12:38:35'),(4,'3','new',1,'Organismo',4,1,'2016-12-01 14:39:18','2016-12-01 14:39:18'),(5,'','new',2,'Organismo',3,1,'2016-12-06 12:36:44','2016-12-06 12:36:44'),(6,'','mod',2,'Organismo',3,1,'2016-12-06 12:40:23','2016-12-06 12:40:23');

/*Table structure for table `ajustes` */

DROP TABLE IF EXISTS `ajustes`;

CREATE TABLE `ajustes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value_type` varchar(255) NOT NULL,
  `int_value` int(11) DEFAULT NULL,
  `str_value` varchar(255) DEFAULT NULL,
  `txt_value` text,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ajustes_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ajustes` */

insert  into `ajustes`(`id`,`key`,`value_type`,`int_value`,`str_value`,`txt_value`,`description`,`created_at`,`updated_at`) values (1,'tos','txt',NULL,NULL,'Términos y condiciones de uso.','Términos y condiciones para el uso de la plataforma.','2016-12-01 11:01:26','2016-12-01 11:01:26');

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `categorias` */

insert  into `categorias`(`id`,`nombre`,`created_at`,`updated_at`,`deleted_at`) values (1,'General','2016-12-01 11:01:26','2016-12-01 11:01:26',NULL),(2,'Movilidad Urbana','2016-12-12 00:00:00','2016-12-12 00:00:00',NULL);

/*Table structure for table `comentario_votos` */

DROP TABLE IF EXISTS `comentario_votos`;

CREATE TABLE `comentario_votos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valor` int(11) NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `comentario_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `comentario_votos_comentario_id_foreign` (`comentario_id`),
  CONSTRAINT `comentario_votos_comentario_id_foreign` FOREIGN KEY (`comentario_id`) REFERENCES `comentarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `comentario_votos` */

insert  into `comentario_votos`(`id`,`valor`,`usuario_id`,`comentario_id`,`created_at`,`updated_at`) values (1,1,1,3,'2016-12-02 14:33:28','2016-12-02 14:33:28'),(2,1,3,3,'2016-12-02 14:33:43','2016-12-02 14:33:43'),(3,-1,2,2,'2016-12-07 10:47:59','2016-12-07 10:47:59'),(4,1,2,1,'2016-12-07 10:48:05','2016-12-07 10:48:05'),(5,1,2,3,'2016-12-07 11:00:59','2016-12-07 11:00:59'),(6,1,2,5,'2016-12-07 11:02:54','2016-12-07 11:02:54'),(7,1,2,4,'2016-12-07 11:02:57','2016-12-07 11:02:57'),(8,1,4,13,'2016-12-12 12:28:20','2016-12-12 12:28:20'),(9,-1,4,14,'2016-12-12 12:28:23','2016-12-12 12:28:23'),(10,1,3,16,'2016-12-12 12:46:43','2016-12-12 12:46:43'),(11,1,3,17,'2016-12-12 13:32:48','2016-12-12 13:32:48');

/*Table structure for table `comentarios` */

DROP TABLE IF EXISTS `comentarios`;

CREATE TABLE `comentarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comentable_id` int(10) unsigned NOT NULL,
  `comentable_type` varchar(255) NOT NULL,
  `cuerpo` text NOT NULL,
  `votos` int(11) NOT NULL DEFAULT '0',
  `autor_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comentarios_comentable_id_comentable_type_index` (`comentable_id`,`comentable_type`),
  KEY `comentarios_autor_id_foreign` (`autor_id`),
  CONSTRAINT `comentarios_autor_id_foreign` FOREIGN KEY (`autor_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `comentarios` */

insert  into `comentarios`(`id`,`comentable_id`,`comentable_type`,`cuerpo`,`votos`,`autor_id`,`created_at`,`updated_at`,`deleted_at`) values (1,2,'Problematica','Creo, que seria un avance',1,2,'2016-12-01 12:10:24','2016-12-07 10:48:05',NULL),(2,2,'Problematica','Coincido',-1,1,'2016-12-01 12:30:16','2016-12-07 10:47:59',NULL),(3,1,'Evento','Genial!',3,3,'2016-12-02 14:32:41','2016-12-07 11:00:59',NULL),(4,3,'Problematica','p+0\'¿¿\'}',1,2,'2016-12-07 11:02:37','2016-12-07 11:02:57',NULL),(5,4,'Comentario','kkkk',1,2,'2016-12-07 11:02:49','2016-12-07 11:02:54',NULL),(6,1,'Evento','kakaka\r\n',0,2,'2016-12-07 11:04:17','2016-12-07 11:04:17',NULL),(7,3,'Problematica','oooooooooo',0,2,'2016-12-07 11:04:38','2016-12-07 11:04:38',NULL),(8,3,'Problematica','asdasdas',0,2,'2016-12-07 12:21:27','2016-12-07 12:21:27',NULL),(9,2,'Problematica','yyyyyyyyyyy',0,2,'2016-12-07 12:24:44','2016-12-07 12:24:44',NULL),(10,3,'Problematica','sssssssssssssssssssss',0,2,'2016-12-07 12:47:39','2016-12-07 12:47:39',NULL),(11,3,'Problematica','.........\r\n',0,4,'2016-12-12 12:26:30','2016-12-12 12:26:30',NULL),(12,11,'Comentario','...\r\n',0,4,'2016-12-12 12:27:16','2016-12-12 12:27:16',NULL),(13,4,'Problematica','ikkkkkkkkk',1,4,'2016-12-12 12:27:43','2016-12-12 12:28:20',NULL),(14,13,'Comentario','llllllll',-1,4,'2016-12-12 12:28:11','2016-12-12 12:28:23',NULL),(15,1,'Novedad','......................',0,3,'2016-12-12 12:43:13','2016-12-12 12:43:13',NULL),(16,2,'ParrafoDocumento','Oxigeno',1,1,'2016-12-12 12:45:51','2016-12-12 12:46:43',NULL),(17,9,'ParrafoDocumento','interesante',1,3,'2016-12-12 13:32:03','2016-12-12 13:32:48',NULL);

/*Table structure for table `contactos` */

DROP TABLE IF EXISTS `contactos`;

CREATE TABLE `contactos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contactable_id` int(10) unsigned NOT NULL,
  `contactable_type` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `web` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `contactos_contactable_id_contactable_type_index` (`contactable_id`,`contactable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `contactos` */

insert  into `contactos`(`id`,`contactable_id`,`contactable_type`,`email`,`telefono`,`web`,`created_at`,`updated_at`) values (1,2,'Usuario',NULL,'+541144444444','http://ga.lujan.gov.ar','2016-12-01 12:05:26','2016-12-01 12:05:26'),(2,1,'Usuario',NULL,NULL,'http://ga.lujan.gov.ar','2016-12-01 12:28:34','2016-12-01 12:28:34'),(3,1,'Organismo','municipio@lujan.gov.ar',NULL,'http://www.lujan.gov.ar','2016-12-01 12:38:35','2016-12-01 12:38:35'),(4,2,'Organismo',NULL,NULL,'http://www.lujan.gov.ar/hcd','2016-12-06 12:40:23','2016-12-06 12:40:23'),(5,4,'Usuario',NULL,NULL,NULL,'2016-12-12 12:29:16','2016-12-12 12:29:16');

/*Table structure for table `contenidos` */

DROP TABLE IF EXISTS `contenidos`;

CREATE TABLE `contenidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contenible_id` int(10) unsigned NOT NULL,
  `contenible_type` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `huella` varchar(255) DEFAULT NULL,
  `puntos` int(10) unsigned NOT NULL DEFAULT '0',
  `impulsor_id` int(10) unsigned DEFAULT NULL,
  `referido_id` int(10) unsigned DEFAULT NULL,
  `categoria_id` int(10) unsigned NOT NULL,
  `autor_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contenidos_contenible_id_contenible_type_index` (`contenible_id`,`contenible_type`),
  KEY `contenidos_autor_id_foreign` (`autor_id`),
  CONSTRAINT `contenidos_autor_id_foreign` FOREIGN KEY (`autor_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `contenidos` */

insert  into `contenidos`(`id`,`contenible_id`,`contenible_type`,`titulo`,`huella`,`puntos`,`impulsor_id`,`referido_id`,`categoria_id`,`autor_id`,`created_at`,`updated_at`,`deleted_at`) values (1,1,'Problematica','Declaraciones Juradas','DeclaracionesJuradas',0,NULL,NULL,1,2,'2016-12-01 12:08:50','2016-12-01 12:11:24','2016-12-01 12:11:24'),(2,2,'Problematica','Declaraciones juradas','Declaracionesjuradas',14,NULL,NULL,1,2,'2016-12-01 12:09:55','2016-12-07 12:24:44',NULL),(3,1,'Evento','Acercarte','Acercarte',13,NULL,NULL,1,1,'2016-12-02 14:31:00','2016-12-07 11:04:17',NULL),(4,3,'Problematica','sdfsdf sdfsdf s','sdfsdfsdfsdfs',24,NULL,NULL,1,2,'2016-12-07 10:38:02','2016-12-12 12:40:57',NULL),(5,4,'Problematica','asdasdasd asdasdas','asdasdasdasdasdas',8,NULL,NULL,1,4,'2016-12-12 12:27:37','2016-12-12 12:28:11',NULL),(6,1,'Novedad','wqrewatwetw','wqrewatwetw',3,NULL,NULL,1,3,'2016-12-12 12:41:56','2016-12-12 12:43:13',NULL),(7,1,'Documento','Documento prueba','Documentoprueba',6,NULL,NULL,1,1,'2016-12-12 12:45:20','2016-12-12 13:32:03',NULL);

/*Table structure for table `documento_parrafos` */

DROP TABLE IF EXISTS `documento_parrafos`;

CREATE TABLE `documento_parrafos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cuerpo` text NOT NULL,
  `ubicacion` int(10) unsigned NOT NULL,
  `version_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `documento_parrafos` */

insert  into `documento_parrafos`(`id`,`cuerpo`,`ubicacion`,`version_id`,`created_at`,`updated_at`,`deleted_at`) values (1,'1) Sensor de ORP (Potencial Redox): El potencial Redox mide el potencial de oxidación-reducción, es decir, la degradación o compactación. El potencial Redox (inglés = oxidation reduction potential = ORP) expresa la capacidad de una molécula para dar o recibir electrones. El potencial de oxidación o de reducción se mide en mV y puede alcanzar tanto valores positivos como negativos. En la naturaleza el potencial Redox se puede encontrar entre +600 mV (oxidación) y -300 mV (reducción), lo que representa la suma de procesos de oxidación y regeneración que se producen en la naturaleza.',0,1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL),(2,'Cuando, por ejemplo, una sustancia reacciona con oxígeno, se produce oxidación. Cuando la madera se quema en el fuego o cuando el hierro se oxida, se produce oxidación. La reducción es exactamente lo contrario, como si, por ejemplo, al óxido se le volviera a extraer el oxígeno y el hierro vuelve a su brillo original.',1,1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL),(3,'Los procesos de oxidación sí son útiles, son la base de la obtención de energía vital. Los valores positivos de potencial Redox significan que, por ejemplo, a través de la cesión de electrones el agua promueve la oxidación. Cuanto mayor sea el potencial Redox (p.ej. el Anolyte ácido), mayor y más rápido será la muerte de bacterias, virus, mohos, hongos, esporas, etc. Esto también es así en animales, plantas y en el ser humano, destruyen a los patógenos. Entre +850 y +1000 mV (con un pH de alrededor de 7) todos los microbios están muertos.',2,1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL),(4,'Valores de potencial Redox negativos significan que cuanto menor sea el potencial Redox, mayor será el poder de reducción. Los agentes reductores ceden electrones. Los iones cargados negativamente pueden combinarse con los llamados radicales libres (con carga positiva) y convertirlos en inofensivos. Cuanto menor sea el potencial Redox, es decir, cuanta más alcalina sea p.ej. el agua, mayor cantidad de electrones podrá ceder el agua a sustancias oxidantes. Se trata, por tanto, de un captador ideal de radicales libres. Las reacciones Redox son aquellos procesos que aseguran las funciones vitales de los organismos vivos.',3,1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL),(5,'Nuestro organismo, y la naturaleza en general, dependen del funcionamiento de ambos procesos. El Anolyte neutro apoya la oxidación por excelencia, para que la reducción se pueda desarrollar plenamente y al mismo tiempo enlazar los radicales libres. Por tanto, si no se apoyara el proceso de oxidación, se preservarían también las bacterias y los gérmenes y permanecerían con vida.',4,1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL),(6,'2) Sensor de PH: Con el valor pH se especifica el grado de acidez de los líquidos. La escala va de 0 a 14. Justo en el centro, es decir, un pH de 7 denota un líquido neutro – para el agua potable el pH ideal se encuentra entre 7,2 y 7,4. Cuanto menor sea el valor, más ácido es el líquido. No obstante, la escala del pH debe entenderse de forma que por cada número entero de la escala (es decir, por cada muestra de color de las tiras de medición por colores) el grado de acidez se incrementa en un factor de 10. Por tanto, un estanque con un pH de 6 contiene diez veces más ácido que uno con un pH de 7, y 100 veces más que uno con un pH de 8.',5,1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL),(7,'En la otra mitad de la escala, que va de 7 a 14, los líquidos son jabonosos. El pH de la sangre, por ejemplo, debe permanecer constante en un rango muy estrecho entre 7,35 y 7,45, de lo contrario, la persona estaría gravemente enferma. Y existen otros ejemplos interesantes para el pH correcto de un líquido:',6,1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL),(8,'La lluvia normal, por ejemplo, tiene un pH de entre 6,5 y 7,4. La lluvia ácida que se da en las zonas industriales suele tener un pH alrededor de 4. La Coca Cola tiene un pH de entre 2,5 y 2,7, casi tan ácido como el vinagre.',7,1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL),(9,'Pero también en nuestro cuerpo podemos encontrar fuerte acidez: el jugo gástrico. Por las mañanas, en ayunas, el pH está en torno a 1,5, mientras que la saliva humana se encuentra entre 6,5 y 7,4. Por el contrario, el jugo pancreático con un pH de 8,4 ya se encuentra en la parte muy alcalina y el jabón con un pH normal de entre 9 y 10 ya pica fuertemente en los ojos.',8,1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL),(10,'De forma muy sencilla se podría decir que el valor de pH depende de la concentración de iones de hidrógeno (H+). Cuantos más se encuentren en el líquido, más ácido será.',9,1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL);

/*Table structure for table `documento_versiones` */

DROP TABLE IF EXISTS `documento_versiones`;

CREATE TABLE `documento_versiones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `documento_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `documento_versiones` */

insert  into `documento_versiones`(`id`,`version`,`documento_id`,`created_at`,`updated_at`,`deleted_at`) values (1,1,1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL);

/*Table structure for table `documentos` */

DROP TABLE IF EXISTS `documentos`;

CREATE TABLE `documentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `ultima_version` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `documentos` */

insert  into `documentos`(`id`,`descripcion`,`ultima_version`,`created_at`,`updated_at`,`deleted_at`) values (1,'Documento de prueba',1,'2016-12-12 12:45:20','2016-12-12 12:45:20',NULL);

/*Table structure for table `evento_usuario` */

DROP TABLE IF EXISTS `evento_usuario`;

CREATE TABLE `evento_usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `presente` tinyint(1) NOT NULL,
  `publico` tinyint(1) NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `evento_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `evento_usuario_evento_id_foreign` (`evento_id`),
  CONSTRAINT `evento_usuario_evento_id_foreign` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `evento_usuario` */

insert  into `evento_usuario`(`id`,`presente`,`publico`,`usuario_id`,`evento_id`,`created_at`,`updated_at`) values (1,1,1,1,1,'2016-12-02 14:31:14','2016-12-02 14:31:14'),(2,1,1,3,1,'2016-12-02 14:32:57','2016-12-02 14:32:57'),(3,0,1,2,1,'2016-12-02 14:37:37','2016-12-02 14:37:37');

/*Table structure for table `eventos` */

DROP TABLE IF EXISTS `eventos`;

CREATE TABLE `eventos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cuerpo` text NOT NULL,
  `lugar` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `eventos` */

insert  into `eventos`(`id`,`cuerpo`,`lugar`,`fecha`,`created_at`,`updated_at`,`deleted_at`) values (1,'AcercARTE, propuesta de PBA bla bla bla','Parque san Martin','2016-12-03 04:00:00','2016-12-02 14:31:00','2016-12-02 14:31:00',NULL);

/*Table structure for table `funcionarios` */

DROP TABLE IF EXISTS `funcionarios`;

CREATE TABLE `funcionarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(10) unsigned NOT NULL,
  `organismo_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionarios_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `funcionarios_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `funcionarios` */

insert  into `funcionarios`(`id`,`usuario_id`,`organismo_id`,`created_at`,`updated_at`,`deleted_at`) values (1,1,1,'2016-12-01 12:37:46','2016-12-01 12:37:46',NULL),(2,3,1,'2016-12-01 14:39:18','2016-12-01 14:39:18',NULL);

/*Table structure for table `notificaciones` */

DROP TABLE IF EXISTS `notificaciones`;

CREATE TABLE `notificaciones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notificable_id` int(10) unsigned NOT NULL,
  `notificable_type` varchar(255) NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notificaciones_notificable_id_notificable_type_index` (`notificable_id`,`notificable_type`),
  KEY `notificaciones_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `notificaciones_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `notificaciones` */

insert  into `notificaciones`(`id`,`notificable_id`,`notificable_type`,`usuario_id`,`deleted_at`) values (1,3,'Userlog',2,'2016-12-01 12:10:31'),(2,6,'Userlog',2,'2016-12-02 14:36:13'),(3,7,'Userlog',1,'2016-12-01 12:38:41'),(4,8,'Userlog',3,'2016-12-01 14:39:37'),(5,10,'Userlog',1,'2016-12-02 14:35:23'),(6,13,'Userlog',2,'2016-12-07 11:03:11'),(7,14,'Userlog',2,'2016-12-07 11:03:11'),(8,15,'Userlog',1,'2016-12-12 12:33:38'),(9,16,'Userlog',2,'2016-12-07 11:04:42'),(10,17,'Userlog',2,'2016-12-07 12:21:29'),(11,18,'Userlog',2,'2016-12-07 12:25:17'),(12,19,'Userlog',2,'2016-12-07 12:47:43'),(13,20,'Userlog',2,NULL),(14,22,'Userlog',2,NULL),(15,24,'Userlog',4,'2016-12-12 12:27:49'),(16,26,'Userlog',4,'2016-12-12 12:28:13'),(17,29,'Userlog',3,'2016-12-12 12:47:49'),(18,31,'Userlog',1,'2017-01-11 16:28:17'),(19,32,'Userlog',1,'2017-01-11 16:28:17');

/*Table structure for table `novedades` */

DROP TABLE IF EXISTS `novedades`;

CREATE TABLE `novedades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cuerpo` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `novedades` */

insert  into `novedades`(`id`,`cuerpo`,`created_at`,`updated_at`,`deleted_at`) values (1,'ertaertaertaeearjarlktjaehtklahrlkaekalkhtkaejhrtajkjhaer','2016-12-12 12:41:56','2016-12-12 12:41:56',NULL);

/*Table structure for table `organismos` */

DROP TABLE IF EXISTS `organismos`;

CREATE TABLE `organismos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `cupo` int(10) unsigned NOT NULL,
  `huella` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `organismos` */

insert  into `organismos`(`id`,`nombre`,`descripcion`,`cupo`,`huella`,`created_at`,`updated_at`,`deleted_at`) values (1,'Municipalidad de Luján','Gobierno Municipal de la ciudad de Luján',10,'MunicipalidaddeLuján','2016-12-01 12:37:18','2016-12-01 12:37:18',NULL),(2,'HCD Luján','Honorable Concejo deliberante de Luján',18,'HCDLuján','2016-12-06 12:36:43','2016-12-06 12:36:43',NULL);

/*Table structure for table `partidos` */

DROP TABLE IF EXISTS `partidos`;

CREATE TABLE `partidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `acronimo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `huella` varchar(255) DEFAULT NULL,
  `fundador` varchar(255) DEFAULT NULL,
  `fecha_fundacion` date DEFAULT NULL,
  `creador_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partidos_nombre_unique` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `partidos` */

/*Table structure for table `patrulla_poder` */

DROP TABLE IF EXISTS `patrulla_poder`;

CREATE TABLE `patrulla_poder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patrulla_id` int(10) unsigned NOT NULL,
  `poder_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patrulla_poder_patrulla_id_foreign` (`patrulla_id`),
  KEY `patrulla_poder_poder_id_foreign` (`poder_id`),
  CONSTRAINT `patrulla_poder_patrulla_id_foreign` FOREIGN KEY (`patrulla_id`) REFERENCES `patrullas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `patrulla_poder_poder_id_foreign` FOREIGN KEY (`poder_id`) REFERENCES `poderes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `patrulla_poder` */

insert  into `patrulla_poder`(`id`,`patrulla_id`,`poder_id`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7);

/*Table structure for table `patrullas` */

DROP TABLE IF EXISTS `patrullas`;

CREATE TABLE `patrullas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `patrullas` */

insert  into `patrullas`(`id`,`nombre`,`descripcion`,`created_at`,`updated_at`) values (1,'Aministrador','Admnistrador que instaló la plataforma.','2016-12-01 11:01:26','2016-12-01 11:01:26');

/*Table structure for table `poderes` */

DROP TABLE IF EXISTS `poderes`;

CREATE TABLE `poderes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `poderes` */

insert  into `poderes`(`id`,`nombre`,`descripcion`) values (1,'Moderar','Moderar en la plataforma.'),(2,'Configurar plataforma','Configurar parámetros de Virtugora.'),(3,'Administrar organismos','Definir los organimos existentes.'),(4,'Administrar funcionarios','Asignar los funcionarios a sus respectivos organismos.'),(5,'Administrar patrullas','Definir los distintos grupos de moderación.'),(6,'Administrar moderadores','Asignar los usuarios que serán moderadores.'),(7,'Verificar ciudadanos','Registrar como verificados a usuarios que lo demuestren.');

/*Table structure for table `preusuarios` */

DROP TABLE IF EXISTS `preusuarios`;

CREATE TABLE `preusuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `emailed_token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `preusuarios_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `preusuarios` */

/*Table structure for table `problematica_votos` */

DROP TABLE IF EXISTS `problematica_votos`;

CREATE TABLE `problematica_votos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postura` int(10) unsigned NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `problematica_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `problematica_votos_problematica_id_foreign` (`problematica_id`),
  CONSTRAINT `problematica_votos_problematica_id_foreign` FOREIGN KEY (`problematica_id`) REFERENCES `problematicas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `problematica_votos` */

insert  into `problematica_votos`(`id`,`postura`,`usuario_id`,`problematica_id`,`created_at`,`updated_at`) values (1,1,2,2,'2016-12-01 12:10:10','2016-12-01 12:10:10'),(2,2,1,2,'2016-12-01 12:29:33','2016-12-01 12:29:33'),(3,0,2,3,'2016-12-07 11:01:58','2016-12-07 11:01:58'),(4,0,4,3,'2016-12-12 12:27:01','2016-12-12 12:27:01'),(5,1,4,4,'2016-12-12 12:28:04','2016-12-12 12:28:04'),(6,0,3,3,'2016-12-12 12:40:56','2016-12-12 12:40:56');

/*Table structure for table `problematicas` */

DROP TABLE IF EXISTS `problematicas`;

CREATE TABLE `problematicas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cuerpo` text NOT NULL,
  `afectados_directos` int(10) unsigned NOT NULL DEFAULT '0',
  `afectados_indirectos` int(10) unsigned NOT NULL DEFAULT '0',
  `afectados_indiferentes` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `problematicas` */

insert  into `problematicas`(`id`,`cuerpo`,`afectados_directos`,`afectados_indirectos`,`afectados_indiferentes`,`created_at`,`updated_at`,`deleted_at`) values (1,'Seria genial, tener las DD.JJ. del Intendente, funcionarios y Concejales\r\n\r\n[img]http://breakingrisk.com/wp-content/uploads/2015/09/DECLARACIONES.jpg[/img]',0,0,0,'2016-12-01 12:08:50','2016-12-01 12:11:24','2016-12-01 12:11:24'),(2,'Seria genial tener las DD.JJ. del [b]Intendente[/b], Funcionarios y [b]Concejales[/b]\r\n\r\n[img]http://breakingrisk.com/wp-content/uploads/2015/09/DECLARACIONES.jpg[/img]',1,1,0,'2016-12-01 12:09:55','2016-12-01 12:29:33',NULL),(3,'[img]http://10.240.14.213/app/turismo/galeria/1479915354.jpg[/img]',0,0,3,'2016-12-07 10:38:02','2016-12-12 12:40:57',NULL),(4,'a sdasdas[i]dasdasdasd[/i]sd[b]asdasd[/b]',0,1,0,'2016-12-12 12:27:37','2016-12-12 12:28:04',NULL);

/*Table structure for table `propuesta_votos` */

DROP TABLE IF EXISTS `propuesta_votos`;

CREATE TABLE `propuesta_votos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postura` int(11) NOT NULL,
  `publico` tinyint(1) NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `propuesta_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `propuesta_votos_propuesta_id_foreign` (`propuesta_id`),
  CONSTRAINT `propuesta_votos_propuesta_id_foreign` FOREIGN KEY (`propuesta_id`) REFERENCES `propuestas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propuesta_votos` */

/*Table structure for table `propuestas` */

DROP TABLE IF EXISTS `propuestas`;

CREATE TABLE `propuestas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cuerpo` text NOT NULL,
  `votos_favor` int(10) unsigned NOT NULL DEFAULT '0',
  `votos_contra` int(10) unsigned NOT NULL DEFAULT '0',
  `votos_neutro` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propuestas` */

/*Table structure for table `taggables` */

DROP TABLE IF EXISTS `taggables`;

CREATE TABLE `taggables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taggable_id` int(10) unsigned NOT NULL,
  `taggable_type` varchar(255) NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggables_taggable_id_taggable_type_index` (`taggable_id`,`taggable_type`),
  KEY `taggables_tag_id_foreign` (`tag_id`),
  CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `taggables` */

insert  into `taggables`(`id`,`taggable_id`,`taggable_type`,`tag_id`) values (1,2,'Contenido',1),(2,2,'Contenido',2),(3,3,'Contenido',3),(4,3,'Contenido',4),(5,3,'Contenido',5),(6,6,'Contenido',6),(7,6,'Contenido',7),(8,6,'Contenido',8);

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `huella` varchar(255) DEFAULT NULL,
  `menciones` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tags` */

insert  into `tags`(`id`,`nombre`,`huella`,`menciones`,`created_at`,`updated_at`) values (1,'declaraciones juradas','declaracionesjuradas',1,'2016-12-01 12:09:55','2016-12-01 12:09:55'),(2,'transparencia','transparencia',1,'2016-12-01 12:09:55','2016-12-01 12:09:55'),(3,'evento','evento',1,'2016-12-02 14:31:00','2016-12-02 14:31:01'),(4,'acercarte','acercarte',1,'2016-12-02 14:31:00','2016-12-02 14:31:01'),(5,'soledad','soledad',1,'2016-12-02 14:31:01','2016-12-02 14:31:01'),(6,'rjtah','rjtah',1,'2016-12-12 12:41:56','2016-12-12 12:41:56'),(7,'rtkjhaklrethjrertaerta','rtkjhaklrethjrertaerta',1,'2016-12-12 12:41:56','2016-12-12 12:41:56'),(8,'rtartan','rtartan',1,'2016-12-12 12:41:56','2016-12-12 12:41:56');

/*Table structure for table `userlogs` */

DROP TABLE IF EXISTS `userlogs`;

CREATE TABLE `userlogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `objeto_id` int(10) unsigned NOT NULL,
  `objeto_type` varchar(255) NOT NULL,
  `accion_id` varchar(10) NOT NULL,
  `actor_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `userlogs_objeto_id_objeto_type_index` (`objeto_id`,`objeto_type`),
  KEY `userlogs_actor_id_foreign` (`actor_id`),
  CONSTRAINT `userlogs_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `userlogs` */

insert  into `userlogs`(`id`,`objeto_id`,`objeto_type`,`accion_id`,`actor_id`,`created_at`,`updated_at`) values (1,2,'Problematica','newProblem',2,'2016-12-01 12:09:55','2016-12-01 12:09:55'),(2,2,'Problematica','votProblem',2,'2016-12-01 12:10:10','2016-12-01 12:10:10'),(3,2,'Problematica','newComenta',2,'2016-12-01 12:10:25','2016-12-01 12:10:25'),(4,1,'Problematica','delProblem',2,'2016-12-01 12:11:24','2016-12-01 12:11:24'),(5,2,'Problematica','votProblem',1,'2016-12-01 12:29:33','2016-12-01 12:29:33'),(6,2,'Problematica','newComenta',1,'2016-12-01 12:30:16','2016-12-01 12:30:16'),(7,1,'Organismo','newFuncion',1,'2016-12-01 12:37:46','2016-12-01 12:37:46'),(8,1,'Organismo','newFuncion',3,'2016-12-01 14:39:18','2016-12-01 14:39:18'),(9,1,'Evento','newEventoo',1,'2016-12-02 14:31:01','2016-12-02 14:31:01'),(10,1,'Evento','newComenta',3,'2016-12-02 14:32:41','2016-12-02 14:32:41'),(11,3,'Problematica','newProblem',2,'2016-12-07 10:38:02','2016-12-07 10:38:02'),(12,3,'Problematica','votProblem',2,'2016-12-07 11:01:58','2016-12-07 11:01:58'),(13,3,'Problematica','newComenta',2,'2016-12-07 11:02:37','2016-12-07 11:02:37'),(14,3,'Problematica','newComenta',2,'2016-12-07 11:02:49','2016-12-07 11:02:49'),(15,1,'Evento','newComenta',2,'2016-12-07 11:04:17','2016-12-07 11:04:17'),(16,3,'Problematica','newComenta',2,'2016-12-07 11:04:38','2016-12-07 11:04:38'),(17,3,'Problematica','newComenta',2,'2016-12-07 12:21:27','2016-12-07 12:21:27'),(18,2,'Problematica','newComenta',2,'2016-12-07 12:24:44','2016-12-07 12:24:44'),(19,3,'Problematica','newComenta',2,'2016-12-07 12:47:39','2016-12-07 12:47:39'),(20,3,'Problematica','newComenta',4,'2016-12-12 12:26:30','2016-12-12 12:26:30'),(21,3,'Problematica','votProblem',4,'2016-12-12 12:27:01','2016-12-12 12:27:01'),(22,3,'Problematica','newComenta',4,'2016-12-12 12:27:16','2016-12-12 12:27:16'),(23,4,'Problematica','newProblem',4,'2016-12-12 12:27:37','2016-12-12 12:27:37'),(24,4,'Problematica','newComenta',4,'2016-12-12 12:27:43','2016-12-12 12:27:43'),(25,4,'Problematica','votProblem',4,'2016-12-12 12:28:04','2016-12-12 12:28:04'),(26,4,'Problematica','newComenta',4,'2016-12-12 12:28:11','2016-12-12 12:28:11'),(27,3,'Problematica','votProblem',3,'2016-12-12 12:40:56','2016-12-12 12:40:56'),(28,1,'Novedad','newNovedad',3,'2016-12-12 12:41:56','2016-12-12 12:41:56'),(29,1,'Novedad','newComenta',3,'2016-12-12 12:43:13','2016-12-12 12:43:13'),(30,1,'Documento','newDocumen',1,'2016-12-12 12:45:20','2016-12-12 12:45:20'),(31,1,'Documento','newComenta',1,'2016-12-12 12:45:51','2016-12-12 12:45:51'),(32,1,'Documento','newComenta',3,'2016-12-12 13:32:03','2016-12-12 13:32:03');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `img_tipo` int(10) unsigned NOT NULL,
  `img_hash` varchar(255) NOT NULL,
  `huella` varchar(255) DEFAULT NULL,
  `puntos` int(11) NOT NULL DEFAULT '0',
  `advertencia` varchar(255) DEFAULT NULL,
  `suspendido` tinyint(1) NOT NULL DEFAULT '0',
  `es_funcionario` tinyint(1) NOT NULL DEFAULT '0',
  `es_jefe` tinyint(1) NOT NULL DEFAULT '0',
  `dni` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `fin_advertencia` timestamp NULL DEFAULT NULL,
  `fin_suspension` timestamp NULL DEFAULT NULL,
  `partido_id` int(10) unsigned DEFAULT NULL,
  `patrulla_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`email`,`password`,`nombre`,`apellido`,`img_tipo`,`img_hash`,`huella`,`puntos`,`advertencia`,`suspendido`,`es_funcionario`,`es_jefe`,`dni`,`token`,`verified_at`,`fin_advertencia`,`fin_suspension`,`partido_id`,`patrulla_id`,`created_at`,`updated_at`,`deleted_at`) values (1,'mchisnerman@gmail.com','$2y$10$8Q/GNjAQ9qYSoctfWf3sOO.Oku2Nc3Ykggj4Diz5pv54UOSoX6OzS','Maximiliano','Chisnerman',0,'1','MaximilianoChisnerman',68,NULL,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,1,'2016-12-01 11:01:27','2017-02-06 11:31:16',NULL),(2,'stranyer@gmail.com','$2y$10$2rUm9EBE1aeKcsCO8YAKc.40kPjTXvbhf973z45aa/reTU9P.KGni','Joshua Sharon','Chisnerman',0,'2','JoshuaSharonChisnerman',104,NULL,1,0,0,NULL,NULL,NULL,NULL,'2016-12-15 00:00:00',NULL,NULL,'2016-12-01 12:02:58','2016-12-07 12:47:39',NULL),(3,'davehalen88@gmail.com','$2y$10$k3UsXv71NtnVnQqknaBrf.BTxFUR.a44e3CY.267Y4xvDjkXiITh2','Federico Andres','Grosso',1,'92f641502587814364a0275f6cec2abc','FedericoAndresGrosso',52,NULL,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-12-01 12:21:47','2016-12-12 13:32:48',NULL),(4,'matiasmazzucca@gmail.com','$2y$10$7po0A3V7QWoEocTFE89Jpe1X9QXLTfGkIGsFtLahBKgwGVMbwRvVO','Matias','Mazzucca',0,'4','MatiasMazzucca',53,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-12-01 12:21:47','2016-12-12 12:29:15',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
