/*
SQLyog Ultimate v9.02 
MySQL - 5.7.19 : Database - sga2018
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `alumno` */

CREATE TABLE `alumno` (
  `codigo_alumno` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDOS` varchar(256) NOT NULL,
  `NOMBRES` varchar(256) NOT NULL,
  `fecha_Nacimiento` date NOT NULL,
  `carne` varchar(10) NOT NULL,
  `codigo_carrera` int(11) NOT NULL,
  PRIMARY KEY (`codigo_alumno`),
  KEY `FK_carrera_alumno` (`codigo_carrera`),
  CONSTRAINT `FK_carrera_alumno` FOREIGN KEY (`codigo_carrera`) REFERENCES `carrera` (`codigo_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `alumno` */

insert  into `alumno`(`codigo_alumno`,`APELLIDOS`,`NOMBRES`,`fecha_Nacimiento`,`carne`,`codigo_carrera`) values (7,'Jose','Aquino','1998-12-01','2018001',1);
insert  into `alumno`(`codigo_alumno`,`APELLIDOS`,`NOMBRES`,`fecha_Nacimiento`,`carne`,`codigo_carrera`) values (8,'RAul','Mendez','1999-03-01','2018002',2);
insert  into `alumno`(`codigo_alumno`,`APELLIDOS`,`NOMBRES`,`fecha_Nacimiento`,`carne`,`codigo_carrera`) values (9,'Maria','Lopez','1998-01-01','2018003',3);

/*Table structure for table `alumno_curso` */

CREATE TABLE `alumno_curso` (
  `codigo_alumno` int(11) NOT NULL,
  `codigo_curso` int(11) NOT NULL,
  `fecha_asignacion` date NOT NULL,
  PRIMARY KEY (`codigo_alumno`,`codigo_curso`),
  KEY `FK_codigo_curso` (`codigo_curso`),
  CONSTRAINT `FK_codigo_alumno` FOREIGN KEY (`codigo_alumno`) REFERENCES `alumno` (`codigo_alumno`),
  CONSTRAINT `FK_codigo_curso` FOREIGN KEY (`codigo_curso`) REFERENCES `curso` (`codigo_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `alumno_curso` */

insert  into `alumno_curso`(`codigo_alumno`,`codigo_curso`,`fecha_asignacion`) values (7,2,'2018-02-03');
insert  into `alumno_curso`(`codigo_alumno`,`codigo_curso`,`fecha_asignacion`) values (7,3,'2018-02-03');
insert  into `alumno_curso`(`codigo_alumno`,`codigo_curso`,`fecha_asignacion`) values (8,1,'2018-02-03');
insert  into `alumno_curso`(`codigo_alumno`,`codigo_curso`,`fecha_asignacion`) values (8,2,'2018-02-03');
insert  into `alumno_curso`(`codigo_alumno`,`codigo_curso`,`fecha_asignacion`) values (8,3,'2018-02-03');
insert  into `alumno_curso`(`codigo_alumno`,`codigo_curso`,`fecha_asignacion`) values (9,3,'2018-02-03');

/*Table structure for table `carrera` */

CREATE TABLE `carrera` (
  `codigo_carrera` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(128) NOT NULL,
  PRIMARY KEY (`codigo_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `carrera` */

insert  into `carrera`(`codigo_carrera`,`descripcion`) values (1,'Informatica');
insert  into `carrera`(`codigo_carrera`,`descripcion`) values (2,'Perito en electrónica');
insert  into `carrera`(`codigo_carrera`,`descripcion`) values (3,'Secretariado Bilingüe');

/*Table structure for table `curso` */

CREATE TABLE `curso` (
  `codigo_curso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(256) NOT NULL,
  `numero_alumnos` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `curso` */

insert  into `curso`(`codigo_curso`,`descripcion`,`numero_alumnos`) values (1,'Matematicas',1);
insert  into `curso`(`codigo_curso`,`descripcion`,`numero_alumnos`) values (2,'fisica',2);
insert  into `curso`(`codigo_curso`,`descripcion`,`numero_alumnos`) values (3,'quimica',3);

/*Table structure for table `gerente` */

CREATE TABLE `gerente` (
  `codigo_gerente` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(128) DEFAULT NULL,
  `nombres` varchar(128) DEFAULT NULL,
  `id_puesto` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `departamento` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`codigo_gerente`),
  KEY `FK_gerente` (`departamento`),
  KEY `FK_gerente_puesto` (`id_puesto`),
  CONSTRAINT `FK_gerente_puesto` FOREIGN KEY (`id_puesto`) REFERENCES `puesto` (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `gerente` */

insert  into `gerente`(`codigo_gerente`,`apellidos`,`nombres`,`id_puesto`,`fecha_nacimiento`,`departamento`) values (2,'Martinez','Pedro',2,'1995-02-03','1');
insert  into `gerente`(`codigo_gerente`,`apellidos`,`nombres`,`id_puesto`,`fecha_nacimiento`,`departamento`) values (3,'lolencio ','fonseca',2,'1995-02-03','informatica');

/*Table structure for table `profesor` */

CREATE TABLE `profesor` (
  `codigo_profesor` int(11) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(128) NOT NULL,
  `nombres` varchar(128) NOT NULL,
  `id_puesto` int(11) NOT NULL,
  `fecha_Nacimiento` date NOT NULL,
  `numero_periodos` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_profesor`),
  KEY `FK_profesor_puesto` (`id_puesto`),
  CONSTRAINT `FK_profesor_puesto` FOREIGN KEY (`id_puesto`) REFERENCES `puesto` (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `profesor` */

insert  into `profesor`(`codigo_profesor`,`apellidos`,`nombres`,`id_puesto`,`fecha_Nacimiento`,`numero_periodos`) values (1,'Lopez','gerson',1,'1993-12-12',3);

/*Table structure for table `profesor_curso` */

CREATE TABLE `profesor_curso` (
  `codigo_profesor` int(11) NOT NULL,
  `codigo_curso` int(11) NOT NULL,
  `fecha_asignacion` date NOT NULL,
  PRIMARY KEY (`codigo_profesor`,`codigo_curso`),
  KEY `FK_curso_profesor` (`codigo_curso`),
  CONSTRAINT `FK_curso_profesor` FOREIGN KEY (`codigo_curso`) REFERENCES `curso` (`codigo_curso`),
  CONSTRAINT `FK_profesor_curso` FOREIGN KEY (`codigo_profesor`) REFERENCES `profesor` (`codigo_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `profesor_curso` */

insert  into `profesor_curso`(`codigo_profesor`,`codigo_curso`,`fecha_asignacion`) values (1,1,'1028-12-12');

/*Table structure for table `puesto` */

CREATE TABLE `puesto` (
  `id_puesto` int(11) NOT NULL AUTO_INCREMENT,
  `detalle` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `puesto` */

insert  into `puesto`(`id_puesto`,`detalle`) values (1,'Profesor');
insert  into `puesto`(`id_puesto`,`detalle`) values (2,'Gerente');

/* Trigger structure for table `alumno_curso` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'carloshuit'@'%' */ /*!50003 TRIGGER `tg_ActualizarCurso` AFTER INSERT ON `alumno_curso` FOR EACH ROW BEGIN
	DECLARE _cantidad int default 0;
	set _cantidad = (SElect ifnull(curso.`numero_alumnos`,0) from curso where curso.`codigo_curso` = new.`codigo_curso`);
	set _cantidad = _cantidad +1;
	update curso set curso.`numero_alumnos` = _cantidad
	where curso.`codigo_curso` = new.`codigo_curso`;
    END */$$


DELIMITER ;

/* Trigger structure for table `alumno_curso` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'carloshuit'@'%' */ /*!50003 TRIGGER `tg_ActualizarCursoMenosUno` AFTER DELETE ON `alumno_curso` FOR EACH ROW BEGIN
	declare _cantidad int default 0;
	set _cantidad = (select ifnull(curso.`numero_alumnos`,0)from curso where curso.`codigo_curso` = old.`codigo_curso`);
	set _cantidad = _cantidad - 1;
	update curso set curso.`numero_alumnos` = _cantidad
	where curso.`codigo_curso` = old.`codigo_curso`;
    END */$$


DELIMITER ;

/* Function  structure for function  `fn_Edad` */

DELIMITER $$

/*!50003 CREATE DEFINER=`carloshuit`@`%` FUNCTION `fn_Edad`(_fecha datetime) RETURNS int(11)
BEGIN
	declare _edad int default 0;
	set _edad = (select timestampdiff(year,_fecha,curdate()));
	return _edad;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Conslta_Profesores1` */

DELIMITER $$

/*!50003 CREATE DEFINER=`carloshuit`@`%` PROCEDURE `sp_Conslta_Profesores1`()
BEGIN
	SELECT
		p.`codigo_profesor`,
		p.`apellidos`,
		p.`nombres`,
		p.`fecha_Nacimiento`,
		p.`id_puesto`,
		ps.`detalle`,
		p.`numero_periodos`,
		c.descripcion
	from profesor p
	inner join puesto ps on p.`id_puesto` = ps.`id_puesto`
	INNER JOIN  profesor_curso pc ON p.codigo_profesor = pc.codigo_profesor
	INNER JOIN curso c ON pc.codigo_curso = c.codigo_curso;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ConsultaAlumnos` */

DELIMITER $$

/*!50003 CREATE DEFINER=`carloshuit`@`%` PROCEDURE `sp_ConsultaAlumnos`()
BEGIN
	SELECT
	 alumno.`codigo_alumno`
	,alumno.`carne`
	,alumno.`APELLIDOS`
	,alumno.`NOMBRES`
	,alumno.`fecha_Nacimiento`
	,alumno.`codigo_carrera`
	,carrera.`descripcion`
	FROM alumno inner join carrera on alumno.`codigo_carrera` = carrera.`codigo_carrera`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Consulta_Gerentes` */

DELIMITER $$

/*!50003 CREATE DEFINER=`carloshuit`@`%` PROCEDURE `sp_Consulta_Gerentes`()
BEGIN
	SELECT
		gerente.`codigo_gerente`,
		gerente.`apellidos`,
		gerente.`nombres`,
		gerente.`fecha_nacimiento`,
		gerente.`id_puesto`,
		gerente.`departamento`,
		puesto.`detalle`
	FROM gerente inner join puesto on  gerente.`id_puesto` = puesto.`id_puesto`;
   END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Consulta_Profesores` */

DELIMITER $$

/*!50003 CREATE DEFINER=`carloshuit`@`%` PROCEDURE `sp_Consulta_Profesores`()
BEGIN
	Select 
		profesor.`codigo_profesor`,
		profesor.`apellidos`,
		profesor.`nombres`,
		profesor.`fecha_Nacimiento`,
		profesor.`numero_periodos`,
		profesor.`id_puesto`,
		puesto.`detalle`
		from profesor inner join puesto on profesor.`id_puesto`= puesto.`id_puesto`;
    END */$$
DELIMITER ;

/*Table structure for table `sv_alumnosporedad` */

DROP TABLE IF EXISTS `sv_alumnosporedad`;

/*!50001 CREATE TABLE  `sv_alumnosporedad`(
 `carne` varchar(10) ,
 `APELLIDOS` varchar(256) ,
 `NOMBRES` varchar(256) ,
 `edad` int(11) 
)*/;

/*View structure for view sv_alumnosporedad */

/*!50001 DROP TABLE IF EXISTS `sv_alumnosporedad` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`carloshuit`@`%` SQL SECURITY DEFINER VIEW `sv_alumnosporedad` AS (select `alumno`.`carne` AS `carne`,`alumno`.`APELLIDOS` AS `APELLIDOS`,`alumno`.`NOMBRES` AS `NOMBRES`,`fn_Edad`(`alumno`.`fecha_Nacimiento`) AS `edad` from `alumno`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
