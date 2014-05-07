-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-05-2014 a las 17:21:44
-- Versión del servidor: 5.6.14
-- Versión de PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `zip_research`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alternatives`
--

CREATE TABLE IF NOT EXISTS `alternatives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questions_id` int(11) DEFAULT NULL,
  `conditions_id` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `description` text NOT NULL,
  `chosen` smallint(6) DEFAULT NULL,
  `answer_description` text,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_27` (`questions_id`),
  KEY `fk_relationship_35` (`conditions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AuthAssignment`
--

CREATE TABLE IF NOT EXISTS `AuthAssignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AuthItem`
--

CREATE TABLE IF NOT EXISTS `AuthItem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AuthItemChild`
--

CREATE TABLE IF NOT EXISTS `AuthItemChild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_14` (`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cities_id` int(11) DEFAULT NULL,
  `countries_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` enum('ACTIVE','PENDING','INACTIVE') NOT NULL,
  `registration_date` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `gender` enum('M','F') NOT NULL,
  `changed_password` enum('Y','N') NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relationship_12` (`cities_id`),
  KEY `fk_relationship_13` (`countries_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `cities_id`, `countries_id`, `name`, `lastname`, `username`, `password`, `email`, `status`, `registration_date`, `image`, `gender`, `changed_password`, `birthday`) VALUES
(1, NULL, NULL, 'joshua', 'fabara', 'joshuafabara', 'e10adc3949ba59abbe56e057f20f883e', 'joshua.fabara@aaconsulting.com.ec', 'ACTIVE', '2014-03-06 00:00:00', NULL, 'M', 'N', '1990-05-21'),
(5, NULL, NULL, 'Cristian', 'Cardenas', 'cristiancardenas', 'b08c8c585b6d67164c163767076445d6', 'cristian@gmail.com', 'ACTIVE', '2014-03-07 00:10:09', NULL, 'M', 'N', '1990-05-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_surveys`
--

CREATE TABLE IF NOT EXISTS `client_surveys` (
  `surveys_id` int(11) NOT NULL,
  `clients_id` int(11) NOT NULL,
  `completion` enum('NOTCOMPLETED','COMPLETED') NOT NULL DEFAULT 'NOTCOMPLETED',
  PRIMARY KEY (`surveys_id`,`clients_id`,`completion`),
  KEY `fk_relationship_11` (`clients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client_surveys`
--

INSERT INTO `client_surveys` (`surveys_id`, `clients_id`, `completion`) VALUES
(1, 1, 'NOTCOMPLETED'),
(2, 5, 'NOTCOMPLETED'),
(3, 5, 'NOTCOMPLETED'),
(5, 5, 'NOTCOMPLETED');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conditions`
--

CREATE TABLE IF NOT EXISTS `conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questions_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condition_group_conditions`
--

CREATE TABLE IF NOT EXISTS `condition_group_conditions` (
  `conditions_id` int(11) NOT NULL,
  `group_conditions_id` int(11) NOT NULL,
  PRIMARY KEY (`conditions_id`,`group_conditions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(20) NOT NULL,
  `capital` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faqs`
--

CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`) VALUES
(1, 'que es esto?', 'Es un sistema de encuestas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_conditions`
--

CREATE TABLE IF NOT EXISTS `group_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questions_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `headers`
--

CREATE TABLE IF NOT EXISTS `headers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `input_types`
--

CREATE TABLE IF NOT EXISTS `input_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `type` enum('ADVANCED','BASIC') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `log_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headers_id` int(11) DEFAULT NULL,
  `input_types_id` int(11) NOT NULL,
  `surveys_id` int(11) DEFAULT NULL,
  `type` enum('OPEN','CLOSE','ORDINAL','INTERVAL','RATIO','OTHER') NOT NULL,
  `weight` int(11) NOT NULL,
  `alternatives_number` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `surveys`
--

CREATE TABLE IF NOT EXISTS `surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `max_questions` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('INACTIVE','DRAFT','ACTIVE') NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `surveys`
--

INSERT INTO `surveys` (`id`, `users_id`, `bonus`, `time`, `max_questions`, `title`, `description`, `status`, `creation_date`) VALUES
(1, 1, 100, 10, 10, 'primera encuesta', 'es la primera encuesta', 'ACTIVE', '2014-03-07 16:56:00'),
(2, 1, 200, 20, 20, 'segunda encuesta', 'es la segunda encuesta', 'ACTIVE', '2014-03-07 16:56:00'),
(3, 1, 300, 30, 30, 'tercera encuesta', 'es la tercera encuesta', 'ACTIVE', '2014-03-07 16:56:00'),
(4, 1, 400, 40, 40, 'cuarta encuesta no asignada', '4ta encuesta sin asginar.', 'ACTIVE', '2014-03-07 16:56:00'),
(5, 1, 500, 50, 50, '5ta encuesta', '5ta encuesta no asignada.', 'ACTIVE', '2014-03-07 16:56:00'),
(6, 1, 1000, 20, 30, 'encuesta creada por crud', 'encuestada creada via web para probar', 'INACTIVE', '2014-03-07 16:56:00'),
(7, 1, 1, 1, 1, 'uno', 'uno duenio', 'INACTIVE', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `lastname`, `email`, `status`) VALUES
(1, 'joshua', 'd1133275ee2118be63a577af759fc052', 'joshua', 'joshua', 'joshua.fabara@aaconsulting.com.ec', 1),
(3, 'daniel', 'aa47f8215c6f30a0dcdb2a36a9f4168e', 'daniel', 'sanchez', 'daniel@gmail.com', 0),
(4, 'jorge', 'fb42b2c66e9cffc9d85b5c6455c48854', 'jorge', 'cisneros', 'jorge@gmail.com', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alternatives`
--
ALTER TABLE `alternatives`
  ADD CONSTRAINT `fk_relationship_27` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `fk_relationship_35` FOREIGN KEY (`conditions_id`) REFERENCES `conditions` (`id`);

--
-- Filtros para la tabla `AuthAssignment`
--
ALTER TABLE `AuthAssignment`
  ADD CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `AuthItemChild`
--
ALTER TABLE `AuthItemChild`
  ADD CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `fk_relationship_14` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`);

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `fk_relationship_12` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `fk_relationship_13` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`);

--
-- Filtros para la tabla `client_surveys`
--
ALTER TABLE `client_surveys`
  ADD CONSTRAINT `fk_relationship_11` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
