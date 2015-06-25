-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 25-06-2015 a las 21:13:19
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `kpax`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ability`
--

CREATE TABLE IF NOT EXISTS `ability` (
  `idAbility` int(11) NOT NULL AUTO_INCREMENT,
  `nameAbility` varchar(20) NOT NULL,
  PRIMARY KEY (`idAbility`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abilityproficiency`
--

CREATE TABLE IF NOT EXISTS `abilityproficiency` (
  `idAbilityProficiency` int(11) NOT NULL AUTO_INCREMENT,
  `idAbility` int(11) NOT NULL,
  `idProficiency` int(11) NOT NULL,
  PRIMARY KEY (`idAbilityProficiency`),
  KEY `Ability` (`idAbility`),
  KEY `Proficiency` (`idProficiency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `award`
--

CREATE TABLE IF NOT EXISTS `award` (
  `idAward` int(11) NOT NULL AUTO_INCREMENT,
  `idProficiency` int(11) NOT NULL,
  `maxLevel` tinyint(1) NOT NULL,
  `idGame` int(11) NOT NULL,
  `descripAward` varchar(50) NOT NULL,
  PRIMARY KEY (`idAward`),
  KEY `Proficiency` (`idProficiency`),
  KEY `Game` (`idGame`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `awardimage`
--

CREATE TABLE IF NOT EXISTS `awardimage` (
  `idAwardImage` int(11) NOT NULL AUTO_INCREMENT,
  `idAward` int(11) NOT NULL,
  `levelAward` tinyint(1) NOT NULL,
  `imageAward` varchar(10) NOT NULL,
  PRIMARY KEY (`idAwardImage`),
  KEY `Award` (`idAward`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=160 ;

--
-- Volcado de datos para la tabla `awardimage`
--

INSERT INTO `awardimage` (`idAwardImage`, `idAward`, `levelAward`, `imageAward`) VALUES
(61, 18, 3, 'A18L3.GIF'),
(62, 18, 4, 'A18L4.GIF'),
(63, 19, 1, 'A19L1.GIF'),
(64, 19, 2, 'A19L2.GIF'),
(65, 19, 3, 'A19L3.GIF'),
(66, 19, 4, 'A19L4.GIF'),
(67, 20, 1, 'A20L1.GIF'),
(68, 20, 2, 'A20L2.GIF'),
(69, 20, 3, 'A20L3.GIF'),
(70, 21, 1, 'A21L1.GIF'),
(71, 21, 2, 'A21L2.GIF'),
(72, 21, 3, 'A21L3.GIF'),
(73, 22, 1, 'A22L1.GIF'),
(74, 22, 2, 'A22L2.GIF'),
(75, 22, 3, 'A22L3.GIF'),
(76, 23, 1, 'A23L1.GIF'),
(77, 23, 2, 'A23L2.GIF'),
(78, 23, 3, 'A23L3.GIF'),
(79, 23, 4, 'A23L4.GIF'),
(80, 24, 1, 'A24L1.GIF'),
(81, 24, 2, 'A24L2.GIF'),
(82, 24, 3, 'A24L3.GIF'),
(83, 24, 4, 'A24L4.GIF'),
(84, 25, 1, 'A25L1.GIF'),
(85, 25, 2, 'A25L2.GIF'),
(86, 25, 3, 'A25L3.GIF'),
(87, 25, 4, 'A25L4.GIF'),
(88, 26, 1, 'A26L1.GIF'),
(89, 26, 2, 'A26L2.GIF'),
(90, 26, 3, 'A26L3.GIF'),
(91, 27, 1, 'A27L1.GIF'),
(92, 27, 2, 'A27L2.GIF'),
(93, 27, 3, 'A27L3.GIF'),
(94, 27, 4, 'A27L4.GIF'),
(95, 28, 1, 'A28L1.GIF'),
(96, 28, 2, 'A28L2.GIF'),
(97, 28, 3, 'A28L3.GIF'),
(98, 29, 1, 'A29L1.GIF'),
(99, 29, 2, 'A29L2.GIF'),
(100, 29, 3, 'A29L3.GIF'),
(101, 29, 4, 'A29L4.GIF'),
(102, 30, 1, 'A30L1.GIF'),
(103, 30, 2, 'A30L2.GIF'),
(104, 30, 3, 'A30L3.GIF'),
(105, 31, 1, 'A31L1.GIF'),
(106, 31, 2, 'A31L2.GIF'),
(107, 31, 3, 'A31L3.GIF'),
(108, 32, 1, 'A32L1.GIF'),
(109, 32, 2, 'A32L2.GIF'),
(110, 32, 3, 'A32L3.GIF'),
(111, 32, 4, 'A32L4.GIF'),
(112, 33, 1, 'A33L1.GIF'),
(113, 33, 2, 'A33L2.GIF'),
(114, 33, 3, 'A33L3.GIF'),
(115, 33, 4, 'A33L4.GIF'),
(116, 34, 1, 'A34L1.GIF'),
(117, 34, 2, 'A34L2.GIF'),
(118, 34, 3, 'A34L3.GIF'),
(119, 35, 1, 'A35L1.GIF'),
(120, 35, 2, 'A35L2.GIF'),
(121, 35, 3, 'A35L3.GIF'),
(122, 36, 1, 'A36L1.GIF'),
(123, 36, 2, 'A36L2.GIF'),
(124, 36, 3, 'A36L3.GIF'),
(125, 37, 1, 'A37L1.GIF'),
(126, 37, 2, 'A37L2.GIF'),
(127, 37, 3, 'A37L3.GIF'),
(128, 37, 4, 'A37L4.GIF'),
(129, 38, 1, 'A38L1.GIF'),
(130, 38, 2, 'A38L2.GIF'),
(131, 38, 3, 'A38L3.GIF'),
(132, 38, 4, 'A38L4.GIF'),
(133, 39, 1, 'A39L1.GIF'),
(134, 39, 2, 'A39L2.GIF'),
(135, 39, 3, 'A39L3.GIF'),
(136, 40, 1, 'A40L1.GIF'),
(137, 40, 2, 'A40L2.GIF'),
(138, 40, 3, 'A40L3.GIF'),
(139, 41, 1, 'A41L1.GIF'),
(140, 41, 2, 'A41L2.GIF'),
(141, 41, 3, 'A41L3.GIF'),
(142, 41, 4, 'A41L4.GIF'),
(143, 42, 1, 'A42L1.GIF'),
(144, 42, 2, 'A42L2.GIF'),
(145, 42, 3, 'A42L3.GIF'),
(146, 43, 1, 'A43L1.GIF'),
(147, 43, 2, 'A43L2.GIF'),
(148, 43, 3, 'A43L3.GIF'),
(149, 43, 4, 'A43L4.GIF'),
(150, 44, 1, 'A44L1.GIF'),
(151, 44, 2, 'A44L2.GIF'),
(152, 44, 3, 'A44L3.GIF'),
(153, 45, 1, 'A45L1.GIF'),
(154, 45, 2, 'A45L2.GIF'),
(155, 45, 3, 'A45L3.GIF'),
(156, 46, 1, 'A46L1.GIF'),
(157, 46, 2, 'A46L2.GIF'),
(158, 46, 3, 'A46L3.GIF'),
(159, 46, 4, 'A46L4.GIF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `badge`
--

CREATE TABLE IF NOT EXISTS `badge` (
  `idBadge` int(11) NOT NULL AUTO_INCREMENT,
  `nameBadge` varchar(40) NOT NULL,
  `descripBadge` varchar(100) NOT NULL,
  `imageBadge` varchar(12) NOT NULL,
  PRIMARY KEY (`idBadge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`idCategory`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`idCategory`, `name`) VALUES
(1, 'Category 1'),
(2, 'Category 2'),
(3, 'Category 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `idComment` int(11) NOT NULL AUTO_INCREMENT,
  `idGame` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  PRIMARY KEY (`idComment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `idGame` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `grantPublicAccess` tinyint(1) DEFAULT '1',
  `secretGame` varchar(150) DEFAULT NULL,
  `privateKey` text,
  `idDeveloper` int(11) NOT NULL DEFAULT '0',
  `dateCreation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripGame` longtext,
  `idPlatform` int(11) DEFAULT '0',
  `idSkill` int(11) DEFAULT '0',
  `idCategory` int(11) DEFAULT '0',
  `urlImage` varchar(500) DEFAULT NULL,
  `csr_file` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idGame`),
  KEY `User` (`idDeveloper`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Volcado de datos para la tabla `game`
--

INSERT INTO `game` (`idGame`, `name`, `grantPublicAccess`, `secretGame`, `privateKey`, `idDeveloper`, `dateCreation`, `descripGame`, `idPlatform`, `idSkill`, `idCategory`, `urlImage`, `csr_file`) VALUES
(1, 'Joc 01', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 6, '2015-06-22 16:38:22', 'Descripció Joc 01 In pharetra tempus nisi. In hac habitasse platea dictumst. Nunc ut scelerisque tellus, placerat viverra felis. Nulla nec felis vitae tellus ullamcorper semper. Nam pharetra, mi sit amet ornare varius, lectus lacus viverra metus, nec pharetra nunc ex vitae risus. Morbi placerat vitae quam ac sagittis. Maecenas semper semper nunc a semper. Aliquam ornare odio et aliquam mattis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus eleifend, velit eu efficitur luctus, ante ante lacinia nisi, ut tincidunt justo lacus id metus. Sed et tellus eu neque feugiat feugiat. Proin lobortis vel lectus non fringilla. Fusce aliquam bibendum orci a consectetur.', 1, 2, 3, 'imatges/game01.jpg', NULL),
(2, 'Joc 02', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 6, '2015-06-22 16:38:22', 'Descripció Joc 02.Donec lectus dolor, accumsan eget urna nec, finibus ornare augue. Aenean eu laoreet nibh. Integer vel tristique est, at elementum lorem. Suspendisse ac neque in leo imperdiet pulvinar. Integer malesuada gravida nunc non placerat. Curabitur facilisis pharetra hendrerit. Etiam pretium tristique eros, ultricies dictum leo molestie ac. Sed dapibus, nunc id placerat elementum, lorem leo scelerisque arcu, vitae suscipit felis risus convallis metus. Suspendisse mattis mauris in molestie lacinia. Nunc pretium vehicula nunc, in euismod libero feugiat non. Etiam eget malesuada turpis, et convallis odio.', 1, 2, 3, 'imatges/game02.jpg', NULL),
(3, 'Joc 03', 1, 'GAME.03b434f2bdb3b056c5c10ac0027722cfb082d72a', '12a28159cfe5e8a949b1817322cab108b634585f', 6, '2015-06-25 19:52:35', '<p>I love cheese, especially red leicester cheese and biscuits. Gouda feta cheese triangles macaroni cheese cheddar caerphilly pepper jack boursin. Say cheese emmental cheddar manchego boursin cheesecake cauliflower cheese ricotta. Cheese slices hard cheese caerphilly cauliflower cheese st. agur blue cheese when the cheese comes out everybody''s happy bavarian bergkase cauliflower cheese. St. agur blue cheese when the cheese comes out everybody''s happy taleggio cheesecake cottage cheese cheese strings cottage cheese parmesan. Smelly cheese queso fromage frais queso roquefort cheeseburger cheese triangles.</p>', 2, 2, 2, 'imatges/game03.jpg', '2015/04/09/35/file/1435261955game10.jpg'),
(4, 'Joc 04', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 04 Donec lectus dolor, accumsan eget urna nec, finibus ornare augue. Aenean eu laoreet nibh. Integer vel tristique est, at elementum lorem. Suspendisse ac neque in leo imperdiet pulvinar. Integer malesuada gravida nunc non placerat. Curabitur facilisis pharetra hendrerit. Etiam pretium tristique eros, ultricies dictum leo molestie ac. Sed dapibus, nunc id placerat elementum, lorem leo scelerisque arcu, vitae suscipit felis risus convallis metus. Suspendisse mattis mauris in molestie lacinia. Nunc pretium vehicula nunc, in euismod libero feugiat non. Etiam eget malesuada turpis, et convallis odio.', 1, 2, 3, 'imatges/game04.jpg', NULL),
(5, 'Joc 05', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 05', 1, 2, 3, 'imatges/game05.jpg', NULL),
(6, 'Joc 06', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 06', 2, 3, 1, 'imatges/game06.jpg', NULL),
(7, 'Joc 07', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 07', 2, 3, 1, 'imatges/game07.jpg', NULL),
(8, 'Joc 08', 1, 'GAME.4792ced9e660763ad2a6551a66c4571c20b7aab9', 'd5206ccc247390c59c8ca545daa4a763c052c4dd', 6, '2015-06-25 17:41:41', '<p>I love cheese, especially red leicester cheese and biscuits. Gouda feta cheese triangles macaroni cheese cheddar caerphilly pepper jack boursin. Say cheese emmental cheddar manchego boursin cheesecake cauliflower cheese ricotta. Cheese slices hard cheese caerphilly cauliflower cheese st. agur blue cheese when the cheese comes out everybody''s happy bavarian bergkase cauliflower cheese. St. agur blue cheese when the cheese comes out everybody''s happy taleggio cheesecake cottage cheese cheese strings cottage cheese parmesan. Smelly cheese queso fromage frais queso roquefort cheeseburger cheese triangles.</p>', 1, 2, 2, 'imatges/game08.jpg', '2015/04/09/35/file/1435253883game25.jpg'),
(9, 'Joc 09', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 09', 2, 3, 1, 'imatges/game09.jpg', NULL),
(10, 'Joc 10', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 10', 2, 3, 1, 'imatges/game10.jpg', NULL),
(11, 'Joc 11', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 11', 3, 1, 2, 'imatges/game11.jpg', NULL),
(12, 'Joc 12', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 12', 3, 1, 2, 'imatges/game12.jpg', NULL),
(13, 'Joc 13', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 13', 3, 1, 2, 'imatges/game13.jpg', NULL),
(14, 'Joc 14', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 14', 3, 1, 2, 'imatges/game14.jpg', NULL),
(15, 'Joc 15', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 15', 3, 1, 2, 'imatges/game15.jpg', NULL),
(16, 'Joc 16', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 16', 1, 2, 3, 'imatges/game16.jpg', NULL),
(17, 'Joc 17', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 17', 1, 2, 3, 'imatges/game17.jpg', NULL),
(18, 'Joc 18', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 18', 1, 2, 3, 'imatges/game18.jpg', NULL),
(19, 'Joc 19', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 0, '2015-06-22 16:38:22', 'Descripció Joc 19', 1, 2, 3, 'imatges/game19.jpg', NULL),
(20, 'Joc 20', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 6, '2015-06-22 16:38:22', 'Descripció Joc 20', 1, 2, 3, 'imatges/game20.jpg', NULL),
(21, 'Joc 21', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 6, '2015-06-22 16:38:22', 'Descripció Joc 21', 2, 3, 1, 'imatges/game21.jpg', NULL),
(22, 'Joc 22', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 6, '2015-06-22 16:38:22', 'Descripció Joc 22', 2, 3, 1, 'imatges/game22.jpg', NULL),
(23, 'Joc 23', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 6, '2015-06-22 16:38:22', 'Descripció Joc 23', 2, 3, 1, 'imatges/game23.jpg', NULL),
(24, 'Joc 24', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 6, '2015-06-22 16:38:22', 'Descripció Joc 24', 2, 3, 1, 'imatges/game24.jpg', NULL),
(25, 'Joc 25', 1, 'GAME.45505f20ce800925b7cfb5fde1137d9f89d4c676', '8272d7a78f51059207794deefa6e6712a409c1af', 6, '2015-06-22 16:38:22', 'Descripció Joc 25', 2, 3, 1, 'imatges/game25.jpg', NULL),
(49, 'Test MB', 1, 'GAME.2f3b77fffd6de2e34e925a9dfce361fc61c1bd24', '625a314bb56e4750400ed57c05985bee5a82f529', 6, '2015-04-17 22:00:00', NULL, 1, 3, 1, NULL, NULL),
(50, 'test MB 1', 1, 'GAME.4241645fb698ef63fe8a0e04fc816af50c640268', '32497d3d71a9949589b670615c7c27aae6c4d7f2', 6, '2015-04-21 22:00:00', NULL, 2, 3, 1, NULL, NULL),
(51, 'test MB 2', 1, 'GAME.5599b4a8f11764baaa672e31f2c87f3632002aeb', '0fa4e71bfed1df75cc86d658d43de5574556775d', 6, '2015-04-21 22:00:00', NULL, 2, 3, 2, NULL, NULL),
(52, 'test MB 3', 1, 'GAME.6e2851d51206f29ff0363fe36609065faf3839b4', 'a716f1d8b2d0764812c996003fcd0f0bf13cebcd', 6, '2015-04-21 22:00:00', NULL, 1, 3, 2, NULL, NULL),
(53, 'testing test4', 1, 'GAME.a564471641aec20ac0a7559dca0b91aef7b43cc5', '933c186a7b0947d663a3fe6c834a4682dd669ba1', 6, '2015-06-23 18:21:00', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultrices est nulla. Aliquam erat volutpat. Sed varius lobortis efficitur. Nam pellentesque tincidunt sollicitudin. Aenean pulvinar metus nec enim aliquet, et porttitor turpis dictum. Mauris lobortis gravida lorem, eu lobortis turpis. Aenean nibh lorem, lacinia sit amet scelerisque ornare, fermentum nec nisl. Duis sit amet condimentum quam. Vestibulum vestibulum, mauris id gravida rutrum, arcu sapien vulputate quam, non egestas ante nisi a ipsum. Integer at lorem ac erat finibus sollicitudin. Integer ac est aliquam, posuere erat aliquam, molestie dui. Ut tempus ex velit, nec ornare est gravida quis. Etiam vitae metus finibus, pulvinar nunc non, bibendum purus. Cras volutpat, tortor at tristique blandit, risus est eleifend elit, ac varius sapien dolor tincidunt magna. Etiam id congue nunc. Fusce tempus iaculis ullamcorper.</p>', 2, 3, 2, '2015/04/09/35/file/1435072381game24.jpg', '2015/04/09/35/file/1435072381game25.jpg'),
(54, 'ttest', 0, 'GAME.f513b4edbdc2a68225187d7658e7654cde3e6fa0', '993bba2fd8da5a653e7cffb4c288132e2dd5bf90', 6, '2015-06-24 11:08:52', '<p>Fusce a urna eget est tristique imperdiet eu malesuada ex. Nulla a tortor in ligula eleifend luctus tincidunt nec felis. Vestibulum dignissim fermentum erat, vitae facilisis ligula tempus eu. Vestibulum viverra, sem at tristique tincidunt, lacus tellus molestie libero, id pretium augue erat non ex. Etiam rutrum tellus nisi, sed tincidunt quam aliquet eget. Sed vel nibh eu sapien pharetra tempus. Duis a elit iaculis, sagittis ipsum quis, ornare neque. Nam hendrerit urna sit amet urna bibendum, ac euismod neque mattis. Nullam pellentesque tincidunt quam, sed pellentesque ex varius quis. Fusce ac dui accumsan, eleifend quam eu, bibendum sem. Interdum et malesuada fames ac ante ipsum primis in faucibus. In semper molestie consectetur. Praesent nulla arcu, mollis ut faucibus quis, maximus in elit. Maecenas varius ipsum dolor, nec eleifend mi tempus eu. Fusce mattis non ipsum nec interdum.</p>', 1, 2, 2, '2015/04/09/35/file/1435144132game15.jpg', '2015/04/09/35/file/1435144132game15.jpg'),
(55, 'uoc', 1, 'GAME.df0219457b704fb14e809b6bbdf96362df9c9662', 'd563348d61eefb52c7e2e3a5006e6956a06a14a1', 6, '2015-06-25 17:58:56', '<p>I love cheese, especially red leicester cheese and biscuits. Gouda feta cheese triangles macaroni cheese cheddar caerphilly pepper jack boursin. Say cheese emmental cheddar manchego boursin cheesecake cauliflower cheese ricotta. Cheese slices hard cheese caerphilly cauliflower cheese st. agur blue cheese when the cheese comes out everybody''s happy bavarian bergkase cauliflower cheese. St. agur blue cheese when the cheese comes out everybody''s happy taleggio cheesecake cottage cheese cheese strings cottage cheese parmesan. Smelly cheese queso fromage frais queso roquefort cheeseburger cheese triangles.</p>', 3, 2, 2, '2015/04/09/35/file/1435255044game23.jpg', '2015/04/09/35/file/1435255044game25.jpg'),
(56, 'uoc2', 0, 'GAME.8bff3ab3fe76c3f31406b04537ec9a0565d44ae9', '819f30f50f461d5114ead56201aa441de1a7bc8b', 6, '2015-06-25 19:56:04', '', 1, 1, 2, '2015/04/09/35/file/1435262164game12.jpg', '2015/04/09/35/file/1435262164game12.jpg'),
(57, 'joc 305', 0, 'GAME.936df279fa5c62e694407d49c4d1f061f415091f', 'f3a91f06985a089b1832e4012774ee7b84a02f2f', 6, '2015-06-25 20:30:53', '<p>I love cheese, especially feta cheesy feet. Everyone loves stinking bishop cheese triangles cheesy feet brie chalk and cheese gouda cheese triangles. Cheese slices cheesecake parmesan cheese slices feta caerphilly fromage swiss. Boursin airedale goat feta cheesy feet cauliflower cheese croque monsieur dolcelatte. Pepper jack bocconcini cheeseburger cheesy feet cheeseburger red leicester chalk and cheese danish fontina. Edam halloumi melted cheese melted cheese roquefort everyone loves.</p>', 1, 3, 2, '2015/04/09/35/file/1435264253game09.jpg', '2015/04/09/35/file/1435264253game14.jpg'),
(58, 'Joc 333', 1, 'GAME.daae647592f66221a65bb3cfc5a1f37f8b42a63d', '695a2a54f0359e132cc5dac4023b5ed2cf6fe47f', 6, '2015-06-25 20:39:51', '<p>Cheeseburger caerphilly fondue. Cut the cheese pecorino stinking bishop gouda cauliflower cheese macaroni cheese croque monsieur dolcelatte. Camembert de normandie mozzarella feta blue castello caerphilly everyone loves dolcelatte chalk and cheese. Lancashire ricotta squirty cheese melted cheese mozzarella camembert de normandie macaroni cheese cheesy grin. Cream cheese fromage frais port-salut emmental cheese on toast the big cheese red leicester bavarian bergkase. Rubber cheese dolcelatte manchego cheese slices.</p>', 2, 2, 2, '2015/04/09/35/file/1435264620game12.jpg', '2015/04/09/35/file/1435264620game09.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gameaccess`
--

CREATE TABLE IF NOT EXISTS `gameaccess` (
  `idGroup` int(11) NOT NULL,
  `idGame` int(11) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'allow',
  `recursive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idGroup`,`idGame`),
  KEY `GameAccess_Group` (`idGroup`),
  KEY `GameAccess_Game` (`idGame`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gameinstance`
--

CREATE TABLE IF NOT EXISTS `gameinstance` (
  `idGameInstance` int(11) NOT NULL AUTO_INCREMENT,
  `idGame` int(11) NOT NULL,
  `state` longtext,
  PRIMARY KEY (`idGameInstance`),
  KEY `GameInstance_Game` (`idGame`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gamelike`
--

CREATE TABLE IF NOT EXISTS `gamelike` (
  `likeId` int(11) NOT NULL AUTO_INCREMENT,
  `gameId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `containerId` int(11) NOT NULL,
  PRIMARY KEY (`likeId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gamescore`
--

CREATE TABLE IF NOT EXISTS `gamescore` (
  `idScore` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idGame` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`idScore`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `gamesimilitudeview`
--
CREATE TABLE IF NOT EXISTS `gamesimilitudeview` (
`idGame` int(11)
,`similarToIdGame` int(11)
,`similitude` varchar(255)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `gameview`
--
CREATE TABLE IF NOT EXISTS `gameview` (
`idGame` int(11)
,`name` varchar(255)
,`grantPublicAccess` tinyint(1)
,`secretGame` varchar(150)
,`privateKey` text
,`idCategory` int(11)
,`dateCreation` timestamp
,`idSkill` int(11)
,`idPlatform` int(11)
,`descripGame` longtext
,`urlImage` varchar(500)
,`timesCommented` bigint(21)
,`popularity` bigint(21)
,`timesPlayed` bigint(21)
,`activity` bigint(21)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `idGroup` int(11) NOT NULL,
  `description` longtext,
  `idGroupParent` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGroup`),
  KEY `GROUP_GROUP` (`idGroupParent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metadata`
--

CREATE TABLE IF NOT EXISTS `metadata` (
  `idMetadata` int(11) NOT NULL AUTO_INCREMENT,
  `idGame` int(11) NOT NULL,
  `keyMeta` varchar(255) NOT NULL,
  `valueMeta` varchar(255) NOT NULL,
  PRIMARY KEY (`idMetadata`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `metadata`
--

INSERT INTO `metadata` (`idMetadata`, `idGame`, `keyMeta`, `valueMeta`) VALUES
(1, 1, 'key1', 'value01'),
(2, 2, 'key1', 'value02'),
(3, 3, 'key1', 'value03'),
(4, 4, 'key1', 'value04'),
(5, 5, 'key1', 'value05'),
(6, 6, 'key1', 'value06'),
(7, 7, 'key1', 'value07'),
(8, 8, 'key1', 'value08'),
(9, 9, 'key1', 'value09'),
(10, 10, 'key1', 'value10'),
(11, 11, 'key1', 'value11'),
(12, 12, 'key1', 'value12'),
(13, 13, 'key1', 'value13'),
(14, 14, 'key1', 'value14'),
(15, 15, 'key1', 'value15'),
(16, 16, 'key1', 'value16'),
(17, 17, 'key1', 'value17'),
(18, 18, 'key1', 'value18'),
(19, 19, 'key1', 'value19'),
(20, 20, 'key1', 'value20'),
(21, 21, 'key1', 'value21'),
(22, 22, 'key1', 'value22'),
(23, 23, 'key1', 'value23'),
(24, 24, 'key1', 'value24'),
(25, 25, 'key1', 'value25'),
(26, 1, 'key2', 'value01'),
(27, 2, 'key2', 'value01'),
(28, 3, 'key2', 'value01'),
(29, 4, 'key2', 'value01'),
(30, 5, 'key2', 'value01'),
(31, 6, 'key2', 'value01'),
(32, 7, 'key2', 'value01'),
(33, 8, 'key2', 'value01'),
(34, 9, 'key2', 'value01'),
(35, 10, 'key2', 'value01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfomance`
--

CREATE TABLE IF NOT EXISTS `perfomance` (
  `idUser` int(11) NOT NULL,
  `idGame` int(11) NOT NULL,
  `maxPoints` int(11) NOT NULL,
  `dateAchiev` date NOT NULL,
  PRIMARY KEY (`idUser`,`idGame`),
  KEY `User` (`idUser`),
  KEY `Game` (`idGame`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform`
--

CREATE TABLE IF NOT EXISTS `platform` (
  `idPlatform` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`idPlatform`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `platform`
--

INSERT INTO `platform` (`idPlatform`, `name`) VALUES
(2, 'Android'),
(1, 'Browser'),
(3, 'iOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proficiency`
--

CREATE TABLE IF NOT EXISTS `proficiency` (
  `idProficiency` int(11) NOT NULL AUTO_INCREMENT,
  `nameProficiency` varchar(20) NOT NULL,
  PRIMARY KEY (`idProficiency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realm`
--

CREATE TABLE IF NOT EXISTS `realm` (
  `idRealm` int(11) NOT NULL AUTO_INCREMENT,
  `alias` char(15) NOT NULL,
  PRIMARY KEY (`idRealm`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `realm`
--

INSERT INTO `realm` (`idRealm`, `alias`) VALUES
(1, 'ELGG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `idSession` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `startTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `campusSession` varchar(250) NOT NULL,
  PRIMARY KEY (`idSession`),
  KEY `Session_User` (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `session`
--

INSERT INTO `session` (`idSession`, `idUser`, `startTime`, `campusSession`) VALUES
(1, 6, '2015-04-11 10:25:13', '6d23368e790170a657ec27e66b24aea4f38e39a7'),
(2, 7, '2015-06-23 10:51:11', 'c35e8da5ee2f7f84dcacbc82582a4c4493f3a724');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skill`
--

CREATE TABLE IF NOT EXISTS `skill` (
  `idSkill` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`idSkill`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `skill`
--

INSERT INTO `skill` (`idSkill`, `name`) VALUES
(1, 'Skill 1'),
(2, 'Skill 2'),
(3, 'Skill 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `idTag` int(11) NOT NULL AUTO_INCREMENT,
  `idGame` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`idTag`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Volcado de datos para la tabla `tag`
--

INSERT INTO `tag` (`idTag`, `idGame`, `tag`) VALUES
(1, 1, 'tag01'),
(2, 2, 'tag02'),
(4, 4, 'tag04'),
(5, 5, 'tag05'),
(6, 6, 'tag06'),
(7, 7, 'tag07'),
(9, 9, 'tag09'),
(10, 10, 'tag10'),
(11, 11, 'tag11'),
(12, 12, 'tag12'),
(13, 13, 'tag13'),
(14, 14, 'tag14'),
(15, 15, 'tag15'),
(16, 16, 'tag16'),
(17, 17, 'tag17'),
(18, 18, 'tag18'),
(19, 19, 'tag19'),
(20, 20, 'tag20'),
(21, 21, 'tag21'),
(22, 22, 'tag22'),
(23, 23, 'tag23'),
(24, 24, 'tag24'),
(25, 25, 'tag25'),
(26, 6, 'tag01'),
(27, 7, 'tag02'),
(29, 9, 'tag04'),
(30, 10, 'tag05'),
(31, 17, 'tag01'),
(32, 18, 'tag01'),
(33, 49, 'memory'),
(34, 49, 'mental training'),
(35, 50, 'tag01'),
(36, 53, 'tag2'),
(41, 8, 'tag01'),
(42, 8, 'tag02'),
(43, 3, 'tag03'),
(44, 58, 'tag01'),
(45, 58, 'tag02');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `totalgamesimilitudeview`
--
CREATE TABLE IF NOT EXISTS `totalgamesimilitudeview` (
`idGame` int(11)
,`similarToIdGame` int(11)
,`totalSimilitude` bigint(21)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `secret` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`idUser`, `login`, `password`, `secret`) VALUES
(6, 'admin', '', 'USER.bf74f70f60e7894ec18de5388026bed5b1fa5e09'),
(7, 'developer', '', 'USER.a6be5bfacb2b526461bee93790784de7e991e992');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userability`
--

CREATE TABLE IF NOT EXISTS `userability` (
  `idUserAbility` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idAbility` int(11) NOT NULL,
  `levelAbility` tinyint(4) NOT NULL,
  PRIMARY KEY (`idUserAbility`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `useraward`
--

CREATE TABLE IF NOT EXISTS `useraward` (
  `idUser` int(11) NOT NULL,
  `idAward` int(11) NOT NULL,
  `levelAward` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idUser`,`idAward`),
  KEY `User` (`idUser`),
  KEY `Award` (`idAward`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userbadge`
--

CREATE TABLE IF NOT EXISTS `userbadge` (
  `idUserBadge` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idBadge` int(11) NOT NULL,
  `dateAchiev` date NOT NULL,
  PRIMARY KEY (`idUserBadge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usergameinstance`
--

CREATE TABLE IF NOT EXISTS `usergameinstance` (
  `idUser` int(11) NOT NULL,
  `idGameInstance` int(11) NOT NULL,
  PRIMARY KEY (`idUser`,`idGameInstance`),
  KEY `UserGameInstance_User` (`idUser`),
  KEY `UserGameInstance_GameInstance` (`idGameInstance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usergroup`
--

CREATE TABLE IF NOT EXISTS `usergroup` (
  `idUser` int(11) NOT NULL,
  `idGroup` int(11) NOT NULL,
  PRIMARY KEY (`idUser`,`idGroup`),
  KEY `UserGroup_User` (`idUser`),
  KEY `UserGroup_Group` (`idGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userrealm`
--

CREATE TABLE IF NOT EXISTS `userrealm` (
  `idUser` int(11) NOT NULL,
  `idRealm` int(11) NOT NULL,
  PRIMARY KEY (`idUser`,`idRealm`),
  KEY `UserRealm_User` (`idUser`),
  KEY `UserRealm_Realm` (`idRealm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `userrealm`
--

INSERT INTO `userrealm` (`idUser`, `idRealm`) VALUES
(6, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Estructura para la vista `gamesimilitudeview`
--
DROP TABLE IF EXISTS `gamesimilitudeview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gamesimilitudeview` AS select `tag1`.`idGame` AS `idGame`,`tag2`.`idGame` AS `similarToIdGame`,`tag1`.`tag` AS `similitude` from (`tag` `tag1` join `tag` `tag2` on(((`tag1`.`tag` = `tag2`.`tag`) and (`tag1`.`idGame` <> `tag2`.`idGame`)))) union select `game1`.`idGame` AS `idGame`,`game2`.`idGame` AS `similarToIdGame`,`category`.`name` AS `similitude` from ((`game` `game1` join `game` `game2` on(((`game1`.`idCategory` = `game2`.`idCategory`) and (`game1`.`idGame` <> `game2`.`idGame`)))) join `category` on((`game1`.`idCategory` = `category`.`idCategory`))) order by `idGame`,`similarToIdGame`;

-- --------------------------------------------------------

--
-- Estructura para la vista `gameview`
--
DROP TABLE IF EXISTS `gameview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gameview` AS select `game`.`idGame` AS `idGame`,`game`.`name` AS `name`,`game`.`grantPublicAccess` AS `grantPublicAccess`,`game`.`secretGame` AS `secretGame`,`game`.`privateKey` AS `privateKey`,`game`.`idCategory` AS `idCategory`,`game`.`dateCreation` AS `dateCreation`,`game`.`idSkill` AS `idSkill`,`game`.`idPlatform` AS `idPlatform`,`game`.`descripGame` AS `descripGame`,`game`.`urlImage` AS `urlImage`,(select count(`comment`.`idComment`) from `comment` where (`comment`.`idGame` = `game`.`idGame`)) AS `timesCommented`,(select count(`gamelike`.`likeId`) from `gamelike` where (`gamelike`.`gameId` = `game`.`idGame`)) AS `popularity`,(select count(`gamescore`.`idScore`) from `gamescore` where (`gamescore`.`idGame` = `game`.`idGame`)) AS `timesPlayed`,(select count(`gameinstance`.`idGameInstance`) from `gameinstance` where ((`gameinstance`.`idGame` = `game`.`idGame`) and (`gameinstance`.`state` = 'INIT'))) AS `activity` from `game`;

-- --------------------------------------------------------

--
-- Estructura para la vista `totalgamesimilitudeview`
--
DROP TABLE IF EXISTS `totalgamesimilitudeview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `totalgamesimilitudeview` AS select `gamesimilitudeview`.`idGame` AS `idGame`,`gamesimilitudeview`.`similarToIdGame` AS `similarToIdGame`,count(0) AS `totalSimilitude` from `gamesimilitudeview` group by `gamesimilitudeview`.`idGame`,`gamesimilitudeview`.`similarToIdGame`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
