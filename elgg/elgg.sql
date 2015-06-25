-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 25-06-2015 a las 21:13:47
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `elgg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_access_collections`
--

CREATE TABLE IF NOT EXISTS `elgg_access_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `site_guid` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner_guid` (`owner_guid`),
  KEY `site_guid` (`site_guid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_access_collection_membership`
--

CREATE TABLE IF NOT EXISTS `elgg_access_collection_membership` (
  `user_guid` int(11) NOT NULL,
  `access_collection_id` int(11) NOT NULL,
  PRIMARY KEY (`user_guid`,`access_collection_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_annotations`
--

CREATE TABLE IF NOT EXISTS `elgg_annotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` bigint(20) unsigned NOT NULL,
  `name_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  `value_type` enum('integer','text') NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entity_guid` (`entity_guid`),
  KEY `name_id` (`name_id`),
  KEY `value_id` (`value_id`),
  KEY `owner_guid` (`owner_guid`),
  KEY `access_id` (`access_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_api_users`
--

CREATE TABLE IF NOT EXISTS `elgg_api_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_guid` bigint(20) unsigned DEFAULT NULL,
  `api_key` varchar(40) DEFAULT NULL,
  `secret` varchar(40) NOT NULL,
  `active` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_key` (`api_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `elgg_api_users`
--

INSERT INTO `elgg_api_users` (`id`, `site_guid`, `api_key`, `secret`, `active`) VALUES
(1, 1, 'fe940300d892473582f99e9967c17f029feed1af', 'd77e63dd3d10a94f6cf826ba66e9073e2da1168a', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_config`
--

CREATE TABLE IF NOT EXISTS `elgg_config` (
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `site_guid` int(11) NOT NULL,
  PRIMARY KEY (`name`,`site_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `elgg_config`
--

INSERT INTO `elgg_config` (`name`, `value`, `site_guid`) VALUES
('view', 's:7:"default";', 1),
('language', 's:2:"en";', 1),
('default_access', 's:1:"1";', 1),
('allow_registration', 'b:1;', 1),
('walled_garden', 'b:0;', 1),
('allow_user_default_access', 's:0:"";', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_datalists`
--

CREATE TABLE IF NOT EXISTS `elgg_datalists` (
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `elgg_datalists`
--

INSERT INTO `elgg_datalists` (`name`, `value`) VALUES
('filestore_run_once', '1428583055'),
('plugin_run_once', '1428583055'),
('elgg_widget_run_once', '1428583055'),
('installed', '1428583135'),
('path', 'E:/wamp/www/elgg-1.8.14/'),
('dataroot', 'E:/wamp/www/elggdata/'),
('default_site', '1'),
('version', '2013030600'),
('simplecache_enabled', '0'),
('system_cache_enabled', '0'),
('processed_upgrades', 'a:41:{i:0;s:14:"2008100701.php";i:1;s:14:"2008101303.php";i:2;s:14:"2009022701.php";i:3;s:14:"2009041701.php";i:4;s:14:"2009070101.php";i:5;s:14:"2009102801.php";i:6;s:14:"2010010501.php";i:7;s:14:"2010033101.php";i:8;s:14:"2010040201.php";i:9;s:14:"2010052601.php";i:10;s:14:"2010060101.php";i:11;s:14:"2010060401.php";i:12;s:14:"2010061501.php";i:13;s:14:"2010062301.php";i:14;s:14:"2010062302.php";i:15;s:14:"2010070301.php";i:16;s:14:"2010071001.php";i:17;s:14:"2010071002.php";i:18;s:14:"2010111501.php";i:19;s:14:"2010121601.php";i:20;s:14:"2010121602.php";i:21;s:14:"2010121701.php";i:22;s:14:"2010123101.php";i:23;s:14:"2011010101.php";i:24;s:61:"2011021800-1.8_svn-goodbye_walled_garden-083121a656d06894.php";i:25;s:61:"2011022000-1.8_svn-custom_profile_fields-390ac967b0bb5665.php";i:26;s:60:"2011030700-1.8_svn-blog_status_metadata-4645225d7b440876.php";i:27;s:51:"2011031300-1.8_svn-twitter_api-12b832a5a7a3e1bd.php";i:28;s:57:"2011031600-1.8_svn-datalist_grows_up-0b8aec5a55cc1e1c.php";i:29;s:61:"2011032000-1.8_svn-widgets_arent_plugins-61836261fa280a5c.php";i:30;s:59:"2011032200-1.8_svn-admins_like_widgets-7f19d2783c1680d3.php";i:31;s:14:"2011052801.php";i:32;s:60:"2011061200-1.8b1-sites_need_a_site_guid-6d9dcbf46c0826cc.php";i:33;s:62:"2011092500-1.8.0.1-forum_reply_river_view-5758ce8d86ac56ce.php";i:34;s:54:"2011123100-1.8.2-fix_friend_river-b17e7ff8345c2269.php";i:35;s:53:"2011123101-1.8.2-fix_blog_status-b14c2a0e7b9e7d55.php";i:36;s:50:"2012012000-1.8.3-ip_in_syslog-87fe0f068cf62428.php";i:37;s:50:"2012012100-1.8.3-system_cache-93100e7d55a24a11.php";i:38;s:59:"2012041800-1.8.3-dont_filter_passwords-c0ca4a18b38ae2bc.php";i:39;s:58:"2012041801-1.8.3-multiple_user_tokens-852225f7fd89f6c5.php";i:40;s:59:"2013030600-1.8.13-update_user_location-8999eb8bf1bdd9a3.php";}'),
('admin_registered', '1'),
('simplecache_lastupdate_default', '1429784982'),
('simplecache_lastcached_default', '1429784982'),
('__site_secret__', '6d0c65aa64903f3dff7bdbe23ed8541c'),
('simplecache_lastupdate_failsafe', '0'),
('simplecache_lastcached_failsafe', '0'),
('simplecache_lastupdate_foaf', '0'),
('simplecache_lastcached_foaf', '0'),
('simplecache_lastupdate_ical', '0'),
('simplecache_lastcached_ical', '0'),
('simplecache_lastupdate_installation', '0'),
('simplecache_lastcached_installation', '0'),
('simplecache_lastupdate_json', '0'),
('simplecache_lastcached_json', '0'),
('simplecache_lastupdate_opendd', '0'),
('simplecache_lastcached_opendd', '0'),
('simplecache_lastupdate_php', '0'),
('simplecache_lastcached_php', '0'),
('simplecache_lastupdate_rss', '0'),
('simplecache_lastcached_rss', '0'),
('simplecache_lastupdate_xml', '0'),
('simplecache_lastcached_xml', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_entities`
--

CREATE TABLE IF NOT EXISTS `elgg_entities` (
  `guid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('object','user','group','site') NOT NULL,
  `subtype` int(11) DEFAULT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `site_guid` bigint(20) unsigned NOT NULL,
  `container_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `time_updated` int(11) NOT NULL,
  `last_action` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`guid`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`),
  KEY `owner_guid` (`owner_guid`),
  KEY `site_guid` (`site_guid`),
  KEY `container_guid` (`container_guid`),
  KEY `access_id` (`access_id`),
  KEY `time_created` (`time_created`),
  KEY `time_updated` (`time_updated`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Volcado de datos para la tabla `elgg_entities`
--

INSERT INTO `elgg_entities` (`guid`, `type`, `subtype`, `owner_guid`, `site_guid`, `container_guid`, `access_id`, `time_created`, `time_updated`, `last_action`, `enabled`) VALUES
(1, 'site', 0, 0, 1, 0, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(2, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(3, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(4, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(5, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(6, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(7, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(8, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(9, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(10, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(11, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(12, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(13, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(14, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(15, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(16, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(17, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(18, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(19, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(20, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(21, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(22, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(23, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(24, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(25, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(26, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(27, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(28, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(29, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(30, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(31, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(32, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(33, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(34, 'object', 2, 1, 1, 1, 2, 1428583135, 1428583135, 1428583135, 'yes'),
(35, 'user', 0, 0, 1, 0, 2, 1428583163, 1435261823, 1434998895, 'yes'),
(36, 'object', 3, 35, 1, 35, 0, 1428583163, 1428583163, 1428583163, 'yes'),
(37, 'object', 3, 35, 1, 35, 0, 1428583163, 1428583163, 1428583163, 'yes'),
(38, 'object', 3, 35, 1, 35, 0, 1428583163, 1428583163, 1428583163, 'yes'),
(39, 'object', 3, 35, 1, 35, 0, 1428583163, 1428583163, 1428583163, 'yes'),
(40, 'object', 3, 35, 1, 35, 0, 1428583163, 1428583163, 1428583163, 'yes'),
(41, 'object', 2, 1, 1, 1, 2, 1428583216, 1428583216, 1428583216, 'yes'),
(42, 'object', 2, 1, 1, 1, 2, 1428583216, 1428583216, 1428583216, 'yes'),
(43, 'object', 2, 1, 1, 1, 2, 1428583216, 1428583216, 1428583216, 'yes'),
(44, 'object', 2, 1, 1, 1, 2, 1428583216, 1428583216, 1428583216, 'yes'),
(45, 'object', 2, 1, 1, 1, 2, 1428583216, 1428583216, 1428583216, 'yes'),
(46, 'object', 2, 1, 1, 1, 2, 1428583216, 1428583216, 1428583216, 'yes'),
(47, 'object', 6, 35, 1, 35, 2, 1428583257, 1428583257, 1428583257, 'yes'),
(48, 'object', 7, 35, 1, 35, 1, 1429356232, 1429356232, 1429356232, 'yes'),
(49, 'object', 7, 35, 1, 35, 1, 1429381278, 1429381278, 1429381278, 'yes'),
(50, 'object', 7, 35, 1, 35, 1, 1429727144, 1429727144, 1429727144, 'yes'),
(51, 'object', 7, 35, 1, 35, 1, 1429727655, 1429727655, 1429727655, 'yes'),
(52, 'object', 7, 35, 1, 35, 1, 1429727737, 1429727737, 1429727737, 'yes'),
(53, 'object', 7, 35, 1, 35, 1, 1429727865, 1429727865, 1429727865, 'yes'),
(54, 'user', 0, 0, 1, 0, 2, 1429784859, 1435056844, 1429784859, 'yes'),
(55, 'object', 4, 35, 1, 35, 1, 1432577919, 1432577919, 1432577919, 'yes'),
(56, 'object', 7, 35, 1, 35, 1, 1432906994, 1432906994, 1432906994, 'yes'),
(57, 'object', 7, 35, 1, 35, 1, 1433318736, 1433318736, 1433318736, 'yes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_entity_relationships`
--

CREATE TABLE IF NOT EXISTS `elgg_entity_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid_one` bigint(20) unsigned NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `guid_two` bigint(20) unsigned NOT NULL,
  `time_created` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid_one` (`guid_one`,`relationship`,`guid_two`),
  KEY `relationship` (`relationship`),
  KEY `guid_two` (`guid_two`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Volcado de datos para la tabla `elgg_entity_relationships`
--

INSERT INTO `elgg_entity_relationships` (`id`, `guid_one`, `relationship`, `guid_two`, `time_created`) VALUES
(1, 2, 'active_plugin', 1, 1428583135),
(2, 3, 'active_plugin', 1, 1428583135),
(3, 11, 'active_plugin', 1, 1428583135),
(4, 12, 'active_plugin', 1, 1428583135),
(5, 13, 'active_plugin', 1, 1428583135),
(6, 14, 'active_plugin', 1, 1428583135),
(7, 15, 'active_plugin', 1, 1428583135),
(24, 41, 'active_plugin', 1, 1428583227),
(9, 17, 'active_plugin', 1, 1428583135),
(10, 18, 'active_plugin', 1, 1428583135),
(11, 19, 'active_plugin', 1, 1428583135),
(12, 20, 'active_plugin', 1, 1428583135),
(13, 21, 'active_plugin', 1, 1428583135),
(14, 22, 'active_plugin', 1, 1428583135),
(15, 24, 'active_plugin', 1, 1428583135),
(16, 25, 'active_plugin', 1, 1428583135),
(17, 26, 'active_plugin', 1, 1428583135),
(18, 27, 'active_plugin', 1, 1428583135),
(19, 29, 'active_plugin', 1, 1428583135),
(20, 30, 'active_plugin', 1, 1428583135),
(21, 33, 'active_plugin', 1, 1428583135),
(22, 34, 'active_plugin', 1, 1428583135),
(23, 35, 'member_of_site', 1, 1428583163),
(25, 43, 'active_plugin', 1, 1428583534),
(26, 46, 'active_plugin', 1, 1428583542),
(27, 42, 'active_plugin', 1, 1428583548),
(28, 44, 'active_plugin', 1, 1428583561),
(29, 7, 'active_plugin', 1, 1429727679),
(30, 54, 'member_of_site', 1, 1429784859);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_entity_subtypes`
--

CREATE TABLE IF NOT EXISTS `elgg_entity_subtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('object','user','group','site') NOT NULL,
  `subtype` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`subtype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `elgg_entity_subtypes`
--

INSERT INTO `elgg_entity_subtypes` (`id`, `type`, `subtype`, `class`) VALUES
(1, 'object', 'file', 'ElggFile'),
(2, 'object', 'plugin', 'ElggPlugin'),
(3, 'object', 'widget', 'ElggWidget'),
(4, 'object', 'blog', 'ElggBlog'),
(5, 'object', 'thewire', 'ElggWire'),
(6, 'object', 'api_key', ''),
(7, 'object', 'kpax', 'ElggKpax');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_geocode_cache`
--

CREATE TABLE IF NOT EXISTS `elgg_geocode_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(128) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `long` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location` (`location`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_groups_entity`
--

CREATE TABLE IF NOT EXISTS `elgg_groups_entity` (
  `guid` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `name` (`name`(50)),
  KEY `description` (`description`(50)),
  FULLTEXT KEY `name_2` (`name`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_hmac_cache`
--

CREATE TABLE IF NOT EXISTS `elgg_hmac_cache` (
  `hmac` varchar(255) NOT NULL,
  `ts` int(11) NOT NULL,
  PRIMARY KEY (`hmac`),
  KEY `ts` (`ts`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_metadata`
--

CREATE TABLE IF NOT EXISTS `elgg_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` bigint(20) unsigned NOT NULL,
  `name_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  `value_type` enum('integer','text') NOT NULL,
  `owner_guid` bigint(20) unsigned NOT NULL,
  `access_id` int(11) NOT NULL,
  `time_created` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `entity_guid` (`entity_guid`),
  KEY `name_id` (`name_id`),
  KEY `value_id` (`value_id`),
  KEY `owner_guid` (`owner_guid`),
  KEY `access_id` (`access_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Volcado de datos para la tabla `elgg_metadata`
--

INSERT INTO `elgg_metadata` (`id`, `entity_guid`, `name_id`, `value_id`, `value_type`, `owner_guid`, `access_id`, `time_created`, `enabled`) VALUES
(1, 1, 1, 2, 'text', 0, 2, 1428583135, 'yes'),
(2, 35, 3, 4, 'text', 35, 2, 1428583163, 'yes'),
(3, 35, 5, 4, 'text', 0, 2, 1428583163, 'yes'),
(4, 35, 6, 7, 'text', 0, 2, 1428583163, 'yes'),
(5, 47, 8, 9, 'text', 35, 2, 1428583257, 'yes'),
(6, 48, 10, 4, 'text', 35, 1, 1429356232, 'yes'),
(7, 48, 11, 12, 'text', 35, 1, 1429356232, 'yes'),
(8, 49, 10, 4, 'text', 35, 1, 1429381278, 'yes'),
(9, 49, 11, 13, 'text', 35, 1, 1429381278, 'yes'),
(10, 49, 14, 15, 'text', 35, 1, 1429381278, 'yes'),
(11, 49, 14, 16, 'text', 35, 1, 1429381278, 'yes'),
(12, 50, 10, 4, 'text', 35, 1, 1429727144, 'yes'),
(13, 50, 11, 17, 'text', 35, 1, 1429727144, 'yes'),
(14, 50, 14, 18, 'text', 35, 1, 1429727144, 'yes'),
(15, 51, 10, 19, 'text', 35, 1, 1429727655, 'yes'),
(16, 51, 11, 20, 'text', 35, 1, 1429727655, 'yes'),
(17, 51, 14, 18, 'text', 35, 1, 1429727655, 'yes'),
(18, 52, 10, 19, 'text', 35, 1, 1429727737, 'yes'),
(19, 52, 11, 21, 'text', 35, 1, 1429727737, 'yes'),
(20, 52, 14, 18, 'text', 35, 1, 1429727737, 'yes'),
(21, 53, 10, 4, 'text', 35, 1, 1429727865, 'yes'),
(22, 53, 11, 22, 'text', 35, 1, 1429727865, 'yes'),
(23, 54, 3, 4, 'text', 54, 2, 1429784859, 'yes'),
(24, 54, 23, 4, 'text', 54, 2, 1429784859, 'yes'),
(25, 54, 24, 25, 'integer', 54, 2, 1429784859, 'yes'),
(26, 55, 26, 27, 'text', 35, 1, 1432577919, 'yes'),
(27, 55, 28, 29, 'text', 35, 1, 1432577919, 'yes'),
(28, 55, 30, 31, 'text', 35, 1, 1432577919, 'yes'),
(29, 55, 14, 31, 'text', 35, 1, 1432577919, 'yes'),
(30, 56, 11, 32, 'text', 35, 1, 1432906994, 'yes'),
(31, 56, 14, 18, 'text', 35, 1, 1432906994, 'yes'),
(41, 35, 37, 34, 'integer', 35, 2, 1434998895, 'yes'),
(40, 35, 36, 34, 'integer', 35, 2, 1434998895, 'yes'),
(39, 35, 35, 34, 'integer', 35, 2, 1434998895, 'yes'),
(38, 35, 33, 34, 'integer', 35, 2, 1434998895, 'yes'),
(37, 57, 11, 40, 'text', 35, 1, 1433318736, 'yes'),
(42, 35, 38, 41, 'integer', 35, 2, 1434998895, 'yes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_metastrings`
--

CREATE TABLE IF NOT EXISTS `elgg_metastrings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `string` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string` (`string`(50))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Volcado de datos para la tabla `elgg_metastrings`
--

INSERT INTO `elgg_metastrings` (`id`, `string`) VALUES
(1, 'email'),
(2, 'mbarcelo@uoc.edu'),
(3, 'notification:method:email'),
(4, '1'),
(5, 'validated'),
(6, 'validated_method'),
(7, 'admin_user'),
(8, 'public'),
(9, 'fe940300d892473582f99e9967c17f029feed1af'),
(10, 'idCategory'),
(11, 'dateCreation'),
(12, '18-04-2015 11:09:20'),
(13, '18-04-2015 18:16:17'),
(14, 'tags'),
(15, 'memory'),
(16, 'mental training'),
(17, '22-04-2015 18:24:18'),
(18, 'tag01'),
(19, '2'),
(20, '22-04-2015 18:33:22'),
(21, '22-04-2015 18:35:09'),
(22, '22-04-2015 18:37:06'),
(23, 'admin_created'),
(24, 'created_by_guid'),
(25, '35'),
(26, 'status'),
(27, 'published'),
(28, 'comments_on'),
(29, 'On'),
(30, 'excerpt'),
(31, 'test'),
(32, ''),
(33, 'x1'),
(34, '0'),
(35, 'x2'),
(36, 'y1'),
(37, 'y2'),
(38, 'icontime'),
(39, '1432907327'),
(40, '1951/12/03 2121:07:12'),
(41, '1434998895');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_objects_entity`
--

CREATE TABLE IF NOT EXISTS `elgg_objects_entity` (
  `guid` bigint(20) unsigned NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`guid`),
  FULLTEXT KEY `title` (`title`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `elgg_objects_entity`
--

INSERT INTO `elgg_objects_entity` (`guid`, `title`, `description`) VALUES
(2, 'blog', ''),
(3, 'bookmarks', ''),
(4, 'categories', ''),
(5, 'custom_index', ''),
(6, 'dashboard', ''),
(7, 'developers', ''),
(8, 'diagnostics', ''),
(9, 'embed', ''),
(10, 'externalpages', ''),
(11, 'file', ''),
(12, 'garbagecollector', ''),
(13, 'groups', ''),
(14, 'htmlawed', ''),
(15, 'invitefriends', ''),
(16, 'likes', ''),
(17, 'logbrowser', ''),
(18, 'logrotate', ''),
(19, 'members', ''),
(20, 'messageboard', ''),
(21, 'messages', ''),
(22, 'notifications', ''),
(23, 'oauth_api', ''),
(24, 'pages', ''),
(25, 'profile', ''),
(26, 'reportedcontent', ''),
(27, 'search', ''),
(28, 'tagcloud', ''),
(29, 'thewire', ''),
(30, 'tinymce', ''),
(31, 'twitter', ''),
(32, 'twitter_api', ''),
(33, 'uservalidationbyemail', ''),
(34, 'zaudio', ''),
(36, '', ''),
(37, '', ''),
(38, '', ''),
(39, '', ''),
(40, '', ''),
(41, 'apiadmin', ''),
(42, 'html5', ''),
(43, 'kpax', ''),
(44, 'kpax_theme_responsive', ''),
(45, 'likeKpax', ''),
(46, 'loginrequired', ''),
(47, 'kpax', ''),
(48, '', ''),
(49, 'Test MB', '<p>Lorem ipsum</p>'),
(50, 'test MB 1', '<p>fskdng&ntilde;awngwngpwenpwerp</p>'),
(51, 'test MB 2', '<p>kwemr&ntilde;qwmer&ntilde;leqwre</p>'),
(52, 'test MB 3', '<p>dmsf&ntilde;lamf&ntilde;ldam&ntilde;flasf</p>'),
(53, '3241341', '<p>4132414</p>'),
(55, 'test', '<p>test</p>'),
(56, 'Joc 01', '<p>Descripci&oacute; Joc 01</p>'),
(57, 'test MB 2', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_private_settings`
--

CREATE TABLE IF NOT EXISTS `elgg_private_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_guid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity_guid` (`entity_guid`,`name`),
  KEY `name` (`name`),
  KEY `value` (`value`(50))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

--
-- Volcado de datos para la tabla `elgg_private_settings`
--

INSERT INTO `elgg_private_settings` (`id`, `entity_guid`, `name`, `value`) VALUES
(1, 2, 'elgg:internal:priority', '1'),
(2, 3, 'elgg:internal:priority', '2'),
(3, 4, 'elgg:internal:priority', '3'),
(4, 5, 'elgg:internal:priority', '4'),
(5, 6, 'elgg:internal:priority', '5'),
(6, 7, 'elgg:internal:priority', '6'),
(7, 8, 'elgg:internal:priority', '7'),
(8, 9, 'elgg:internal:priority', '8'),
(9, 10, 'elgg:internal:priority', '9'),
(10, 11, 'elgg:internal:priority', '10'),
(11, 12, 'elgg:internal:priority', '11'),
(12, 13, 'elgg:internal:priority', '12'),
(13, 14, 'elgg:internal:priority', '13'),
(14, 15, 'elgg:internal:priority', '14'),
(15, 16, 'elgg:internal:priority', '15'),
(16, 17, 'elgg:internal:priority', '16'),
(17, 18, 'elgg:internal:priority', '17'),
(18, 19, 'elgg:internal:priority', '18'),
(19, 20, 'elgg:internal:priority', '19'),
(20, 21, 'elgg:internal:priority', '20'),
(21, 22, 'elgg:internal:priority', '21'),
(22, 23, 'elgg:internal:priority', '22'),
(23, 24, 'elgg:internal:priority', '23'),
(24, 25, 'elgg:internal:priority', '24'),
(25, 26, 'elgg:internal:priority', '25'),
(26, 27, 'elgg:internal:priority', '26'),
(27, 28, 'elgg:internal:priority', '27'),
(28, 29, 'elgg:internal:priority', '28'),
(29, 30, 'elgg:internal:priority', '29'),
(30, 31, 'elgg:internal:priority', '30'),
(31, 32, 'elgg:internal:priority', '31'),
(32, 33, 'elgg:internal:priority', '32'),
(33, 34, 'elgg:internal:priority', '33'),
(34, 36, 'handler', 'control_panel'),
(35, 36, 'context', 'admin'),
(36, 36, 'column', '1'),
(37, 36, 'order', '0'),
(38, 37, 'handler', 'admin_welcome'),
(39, 37, 'context', 'admin'),
(40, 37, 'order', '10'),
(41, 37, 'column', '1'),
(42, 38, 'handler', 'online_users'),
(43, 38, 'context', 'admin'),
(44, 38, 'column', '2'),
(45, 38, 'order', '0'),
(46, 39, 'handler', 'new_users'),
(47, 39, 'context', 'admin'),
(48, 39, 'order', '10'),
(49, 39, 'column', '2'),
(50, 40, 'handler', 'content_stats'),
(51, 40, 'context', 'admin'),
(52, 40, 'order', '20'),
(53, 40, 'column', '2'),
(54, 38, 'num_display', '8'),
(55, 39, 'num_display', '5'),
(56, 40, 'num_display', '8'),
(57, 41, 'elgg:internal:priority', '34'),
(58, 42, 'elgg:internal:priority', '35'),
(59, 43, 'elgg:internal:priority', '36'),
(60, 44, 'elgg:internal:priority', '37'),
(61, 45, 'elgg:internal:priority', '38'),
(62, 46, 'elgg:internal:priority', '39'),
(63, 7, 'display_errors', '0'),
(64, 7, 'screen_log', '0'),
(65, 7, 'show_strings', '0'),
(66, 7, 'wrap_views', '1'),
(67, 7, 'log_events', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_river`
--

CREATE TABLE IF NOT EXISTS `elgg_river` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(8) NOT NULL,
  `subtype` varchar(32) NOT NULL,
  `action_type` varchar(32) NOT NULL,
  `access_id` int(11) NOT NULL,
  `view` text NOT NULL,
  `subject_guid` int(11) NOT NULL,
  `object_guid` int(11) NOT NULL,
  `annotation_id` int(11) NOT NULL,
  `posted` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `action_type` (`action_type`),
  KEY `access_id` (`access_id`),
  KEY `subject_guid` (`subject_guid`),
  KEY `object_guid` (`object_guid`),
  KEY `annotation_id` (`annotation_id`),
  KEY `posted` (`posted`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `elgg_river`
--

INSERT INTO `elgg_river` (`id`, `type`, `subtype`, `action_type`, `access_id`, `view`, `subject_guid`, `object_guid`, `annotation_id`, `posted`) VALUES
(1, 'object', 'blog', 'create', 1, 'river/object/blog/create', 35, 55, 0, 1432577919),
(3, 'user', '', 'update', 2, 'river/user/default/profileiconupdate', 35, 35, 0, 1434998895);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_sites_entity`
--

CREATE TABLE IF NOT EXISTS `elgg_sites_entity` (
  `guid` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  UNIQUE KEY `url` (`url`),
  FULLTEXT KEY `name` (`name`,`description`,`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `elgg_sites_entity`
--

INSERT INTO `elgg_sites_entity` (`guid`, `name`, `description`, `url`) VALUES
(1, 'Kpax', '', 'http://localhost/elgg-1.8.14/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_system_log`
--

CREATE TABLE IF NOT EXISTS `elgg_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `object_class` varchar(50) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `object_subtype` varchar(50) NOT NULL,
  `event` varchar(50) NOT NULL,
  `performed_by_guid` int(11) NOT NULL,
  `owner_guid` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `time_created` int(11) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `object_class` (`object_class`),
  KEY `object_type` (`object_type`),
  KEY `object_subtype` (`object_subtype`),
  KEY `event` (`event`),
  KEY `performed_by_guid` (`performed_by_guid`),
  KEY `access_id` (`access_id`),
  KEY `time_created` (`time_created`),
  KEY `river_key` (`object_type`,`object_subtype`,`event`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=167 ;

--
-- Volcado de datos para la tabla `elgg_system_log`
--

INSERT INTO `elgg_system_log` (`id`, `object_id`, `object_class`, `object_type`, `object_subtype`, `event`, `performed_by_guid`, `owner_guid`, `access_id`, `enabled`, `time_created`, `ip_address`) VALUES
(1, 2, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(2, 3, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(3, 4, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(4, 5, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(5, 6, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(6, 7, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(7, 8, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(8, 9, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(9, 10, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(10, 11, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(11, 12, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(12, 13, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(13, 14, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(14, 15, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(15, 16, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(16, 17, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(17, 18, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(18, 19, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(19, 20, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(20, 21, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(21, 22, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(22, 23, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(23, 24, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(24, 25, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(25, 26, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(26, 27, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(27, 28, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(28, 29, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(29, 30, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(30, 31, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(31, 32, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(32, 33, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(33, 34, 'ElggPlugin', 'object', 'plugin', 'create', 0, 1, 2, 'yes', 1428583135, '127.0.0.1'),
(34, 1, 'ElggRelationship', 'relationship', 'active_plugin', 'create', 0, 0, 2, 'yes', 1428583135, '127.0.0.1'),
(35, 23, 'ElggRelationship', 'relationship', 'member_of_site', 'create', 0, 0, 2, 'yes', 1428583163, '127.0.0.1'),
(36, 35, 'ElggUser', 'user', '', 'create', 0, 0, 2, 'yes', 1428583163, '127.0.0.1'),
(37, 2, 'ElggMetadata', 'metadata', 'notification:method:email', 'create', 0, 35, 2, 'yes', 1428583163, '127.0.0.1'),
(38, 36, 'ElggWidget', 'object', 'widget', 'create', 0, 35, 0, 'yes', 1428583163, '127.0.0.1'),
(39, 37, 'ElggWidget', 'object', 'widget', 'create', 0, 35, 0, 'yes', 1428583163, '127.0.0.1'),
(40, 38, 'ElggWidget', 'object', 'widget', 'create', 0, 35, 0, 'yes', 1428583163, '127.0.0.1'),
(41, 39, 'ElggWidget', 'object', 'widget', 'create', 0, 35, 0, 'yes', 1428583163, '127.0.0.1'),
(42, 40, 'ElggWidget', 'object', 'widget', 'create', 0, 35, 0, 'yes', 1428583163, '127.0.0.1'),
(43, 35, 'ElggUser', 'user', '', 'make_admin', 0, 0, 2, 'yes', 1428583163, '127.0.0.1'),
(44, 3, 'ElggMetadata', 'metadata', 'validated', 'create', 0, 0, 2, 'yes', 1428583163, '127.0.0.1'),
(45, 4, 'ElggMetadata', 'metadata', 'validated_method', 'create', 0, 0, 2, 'yes', 1428583163, '127.0.0.1'),
(46, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1428583163, '127.0.0.1'),
(47, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1428583163, '127.0.0.1'),
(48, 8, 'ElggRelationship', 'relationship', 'active_plugin', 'delete', 35, 0, 2, 'yes', 1428583180, '127.0.0.1'),
(49, 41, 'ElggPlugin', 'object', 'plugin', 'create', 35, 1, 2, 'yes', 1428583216, '127.0.0.1'),
(50, 42, 'ElggPlugin', 'object', 'plugin', 'create', 35, 1, 2, 'yes', 1428583216, '127.0.0.1'),
(51, 43, 'ElggPlugin', 'object', 'plugin', 'create', 35, 1, 2, 'yes', 1428583216, '127.0.0.1'),
(52, 44, 'ElggPlugin', 'object', 'plugin', 'create', 35, 1, 2, 'yes', 1428583216, '127.0.0.1'),
(53, 45, 'ElggPlugin', 'object', 'plugin', 'create', 35, 1, 2, 'yes', 1428583216, '127.0.0.1'),
(54, 46, 'ElggPlugin', 'object', 'plugin', 'create', 35, 1, 2, 'yes', 1428583216, '127.0.0.1'),
(55, 24, 'ElggRelationship', 'relationship', 'active_plugin', 'create', 35, 0, 2, 'yes', 1428583227, '127.0.0.1'),
(56, 5, 'ElggMetadata', 'metadata', 'public', 'create', 35, 35, 2, 'yes', 1428583257, '127.0.0.1'),
(57, 47, 'ElggObject', 'object', 'api_key', 'create', 35, 35, 2, 'yes', 1428583257, '127.0.0.1'),
(58, 25, 'ElggRelationship', 'relationship', 'active_plugin', 'create', 35, 0, 2, 'yes', 1428583534, '127.0.0.1'),
(59, 26, 'ElggRelationship', 'relationship', 'active_plugin', 'create', 35, 0, 2, 'yes', 1428583542, '127.0.0.1'),
(60, 27, 'ElggRelationship', 'relationship', 'active_plugin', 'create', 35, 0, 2, 'yes', 1428583548, '127.0.0.1'),
(61, 28, 'ElggRelationship', 'relationship', 'active_plugin', 'create', 35, 0, 2, 'yes', 1428583561, '127.0.0.1'),
(62, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1429261307, '127.0.0.1'),
(63, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1429261307, '127.0.0.1'),
(64, 6, 'ElggMetadata', 'metadata', 'idCategory', 'create', 35, 35, 1, 'yes', 1429356232, '127.0.0.1'),
(65, 7, 'ElggMetadata', 'metadata', 'dateCreation', 'create', 35, 35, 1, 'yes', 1429356232, '127.0.0.1'),
(66, 48, 'ElggObject', 'object', 'kpax', 'create', 35, 35, 1, 'yes', 1429356232, '127.0.0.1'),
(67, 8, 'ElggMetadata', 'metadata', 'idCategory', 'create', 35, 35, 1, 'yes', 1429381278, '127.0.0.1'),
(68, 9, 'ElggMetadata', 'metadata', 'dateCreation', 'create', 35, 35, 1, 'yes', 1429381278, '127.0.0.1'),
(69, 10, 'ElggMetadata', 'metadata', 'tags', 'create', 35, 35, 1, 'yes', 1429381278, '127.0.0.1'),
(70, 11, 'ElggMetadata', 'metadata', 'tags', 'create', 35, 35, 1, 'yes', 1429381278, '127.0.0.1'),
(71, 49, 'ElggObject', 'object', 'kpax', 'create', 35, 35, 1, 'yes', 1429381278, '127.0.0.1'),
(72, 12, 'ElggMetadata', 'metadata', 'idCategory', 'create', 35, 35, 1, 'yes', 1429727144, '127.0.0.1'),
(73, 13, 'ElggMetadata', 'metadata', 'dateCreation', 'create', 35, 35, 1, 'yes', 1429727144, '127.0.0.1'),
(74, 14, 'ElggMetadata', 'metadata', 'tags', 'create', 35, 35, 1, 'yes', 1429727144, '127.0.0.1'),
(75, 50, 'ElggObject', 'object', 'kpax', 'create', 35, 35, 1, 'yes', 1429727144, '127.0.0.1'),
(76, 15, 'ElggMetadata', 'metadata', 'idCategory', 'create', 35, 35, 1, 'yes', 1429727655, '127.0.0.1'),
(77, 16, 'ElggMetadata', 'metadata', 'dateCreation', 'create', 35, 35, 1, 'yes', 1429727655, '127.0.0.1'),
(78, 17, 'ElggMetadata', 'metadata', 'tags', 'create', 35, 35, 1, 'yes', 1429727655, '127.0.0.1'),
(79, 51, 'ElggObject', 'object', 'kpax', 'create', 35, 35, 1, 'yes', 1429727655, '127.0.0.1'),
(80, 29, 'ElggRelationship', 'relationship', 'active_plugin', 'create', 35, 0, 2, 'yes', 1429727679, '127.0.0.1'),
(81, 18, 'ElggMetadata', 'metadata', 'idCategory', 'create', 35, 35, 1, 'yes', 1429727737, '127.0.0.1'),
(82, 19, 'ElggMetadata', 'metadata', 'dateCreation', 'create', 35, 35, 1, 'yes', 1429727737, '127.0.0.1'),
(83, 20, 'ElggMetadata', 'metadata', 'tags', 'create', 35, 35, 1, 'yes', 1429727737, '127.0.0.1'),
(84, 52, 'ElggObject', 'object', 'kpax', 'create', 35, 35, 1, 'yes', 1429727737, '127.0.0.1'),
(85, 21, 'ElggMetadata', 'metadata', 'idCategory', 'create', 35, 35, 1, 'yes', 1429727865, '127.0.0.1'),
(86, 22, 'ElggMetadata', 'metadata', 'dateCreation', 'create', 35, 35, 1, 'yes', 1429727865, '127.0.0.1'),
(87, 53, 'ElggObject', 'object', 'kpax', 'create', 35, 35, 1, 'yes', 1429727865, '127.0.0.1'),
(88, 30, 'ElggRelationship', 'relationship', 'member_of_site', 'create', 35, 0, 2, 'yes', 1429784859, '127.0.0.1'),
(89, 54, 'ElggUser', 'user', '', 'create', 35, 0, 2, 'yes', 1429784859, '127.0.0.1'),
(90, 23, 'ElggMetadata', 'metadata', 'notification:method:email', 'create', 35, 54, 2, 'yes', 1429784859, '127.0.0.1'),
(91, 54, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1429784859, '127.0.0.1'),
(92, 24, 'ElggMetadata', 'metadata', 'admin_created', 'create', 35, 54, 2, 'yes', 1429784859, '127.0.0.1'),
(93, 25, 'ElggMetadata', 'metadata', 'created_by_guid', 'create', 35, 54, 2, 'yes', 1429784859, '127.0.0.1'),
(94, 31, 'ElggRelationship', 'relationship', 'active_plugin', 'create', 35, 0, 2, 'yes', 1429784929, '127.0.0.1'),
(95, 31, 'ElggRelationship', 'relationship', 'active_plugin', 'delete', 35, 0, 2, 'yes', 1429784982, '127.0.0.1'),
(96, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1431454745, '127.0.0.1'),
(97, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1431454745, '127.0.0.1'),
(98, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1431966829, '127.0.0.1'),
(99, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1431966829, '127.0.0.1'),
(100, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1432027377, '127.0.0.1'),
(101, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1432027377, '127.0.0.1'),
(102, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1432054021, '127.0.0.1'),
(103, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1432054021, '127.0.0.1'),
(104, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1432055221, '127.0.0.1'),
(105, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1432055221, '127.0.0.1'),
(106, 26, 'ElggMetadata', 'metadata', 'status', 'create', 35, 35, 1, 'yes', 1432577919, '127.0.0.1'),
(107, 27, 'ElggMetadata', 'metadata', 'comments_on', 'create', 35, 35, 1, 'yes', 1432577919, '127.0.0.1'),
(108, 28, 'ElggMetadata', 'metadata', 'excerpt', 'create', 35, 35, 1, 'yes', 1432577919, '127.0.0.1'),
(109, 29, 'ElggMetadata', 'metadata', 'tags', 'create', 35, 35, 1, 'yes', 1432577919, '127.0.0.1'),
(110, 55, 'ElggBlog', 'object', 'blog', 'create', 35, 35, 1, 'yes', 1432577919, '127.0.0.1'),
(111, 55, 'ElggBlog', 'object', 'blog', 'publish', 35, 35, 1, 'yes', 1432577919, '127.0.0.1'),
(112, 30, 'ElggMetadata', 'metadata', 'dateCreation', 'create', 35, 35, 1, 'yes', 1432906994, '127.0.0.1'),
(113, 31, 'ElggMetadata', 'metadata', 'tags', 'create', 35, 35, 1, 'yes', 1432906994, '127.0.0.1'),
(114, 56, 'ElggObject', 'object', 'kpax', 'create', 35, 35, 1, 'yes', 1432906994, '127.0.0.1'),
(115, 32, 'ElggMetadata', 'metadata', 'x1', 'create', 35, 35, 2, 'yes', 1432907327, '127.0.0.1'),
(116, 33, 'ElggMetadata', 'metadata', 'x2', 'create', 35, 35, 2, 'yes', 1432907327, '127.0.0.1'),
(117, 34, 'ElggMetadata', 'metadata', 'y1', 'create', 35, 35, 2, 'yes', 1432907327, '127.0.0.1'),
(118, 35, 'ElggMetadata', 'metadata', 'y2', 'create', 35, 35, 2, 'yes', 1432907327, '127.0.0.1'),
(119, 36, 'ElggMetadata', 'metadata', 'icontime', 'create', 35, 35, 2, 'yes', 1432907327, '127.0.0.1'),
(120, 35, 'ElggUser', 'user', '', 'profileiconupdate', 35, 0, 2, 'yes', 1432907327, '127.0.0.1'),
(121, 32, 'ElggMetadata', 'metadata', 'x1', 'delete', 35, 35, 2, 'yes', 1432907366, '127.0.0.1'),
(122, 33, 'ElggMetadata', 'metadata', 'x2', 'delete', 35, 35, 2, 'yes', 1432907366, '127.0.0.1'),
(123, 34, 'ElggMetadata', 'metadata', 'y1', 'delete', 35, 35, 2, 'yes', 1432907366, '127.0.0.1'),
(124, 35, 'ElggMetadata', 'metadata', 'y2', 'delete', 35, 35, 2, 'yes', 1432907366, '127.0.0.1'),
(125, 36, 'ElggMetadata', 'metadata', 'icontime', 'delete', 35, 35, 2, 'yes', 1432907366, '127.0.0.1'),
(126, 37, 'ElggMetadata', 'metadata', 'dateCreation', 'create', 35, 35, 1, 'yes', 1433318736, '127.0.0.1'),
(127, 57, 'ElggObject', 'object', 'kpax', 'create', 35, 35, 1, 'yes', 1433318736, '127.0.0.1'),
(128, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1434370556, '127.0.0.1'),
(129, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1434370556, '127.0.0.1'),
(130, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1434963207, '127.0.0.1'),
(131, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1434963207, '127.0.0.1'),
(132, 38, 'ElggMetadata', 'metadata', 'x1', 'create', 35, 35, 2, 'yes', 1434998895, '127.0.0.1'),
(133, 39, 'ElggMetadata', 'metadata', 'x2', 'create', 35, 35, 2, 'yes', 1434998895, '127.0.0.1'),
(134, 40, 'ElggMetadata', 'metadata', 'y1', 'create', 35, 35, 2, 'yes', 1434998895, '127.0.0.1'),
(135, 41, 'ElggMetadata', 'metadata', 'y2', 'create', 35, 35, 2, 'yes', 1434998895, '127.0.0.1'),
(136, 42, 'ElggMetadata', 'metadata', 'icontime', 'create', 35, 35, 2, 'yes', 1434998895, '127.0.0.1'),
(137, 35, 'ElggUser', 'user', '', 'profileiconupdate', 35, 0, 2, 'yes', 1434998895, '127.0.0.1'),
(138, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435047124, '127.0.0.1'),
(139, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1435047124, '127.0.0.1'),
(140, 35, 'ElggUser', 'user', '', 'logout', 35, 0, 2, 'yes', 1435049828, '127.0.0.1'),
(141, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435049828, '127.0.0.1'),
(142, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435049836, '127.0.0.1'),
(143, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1435049836, '127.0.0.1'),
(144, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435051640, '127.0.0.1'),
(145, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1435051640, '127.0.0.1'),
(146, 54, 'ElggUser', 'user', '', 'update', 54, 0, 2, 'yes', 1435056600, '127.0.0.1'),
(147, 54, 'ElggUser', 'user', '', 'login', 54, 0, 2, 'yes', 1435056600, '127.0.0.1'),
(148, 54, 'ElggUser', 'user', '', 'logout', 54, 0, 2, 'yes', 1435056844, '127.0.0.1'),
(149, 54, 'ElggUser', 'user', '', 'update', 54, 0, 2, 'yes', 1435056844, '127.0.0.1'),
(150, 35, 'ElggUser', 'user', '', 'logout', 35, 0, 2, 'yes', 1435252647, '127.0.0.1'),
(151, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435252647, '127.0.0.1'),
(152, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435252648, '127.0.0.1'),
(153, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435252655, '127.0.0.1'),
(154, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1435252655, '127.0.0.1'),
(155, 35, 'ElggUser', 'user', '', 'logout', 35, 0, 2, 'yes', 1435261336, '127.0.0.1'),
(156, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435261336, '127.0.0.1'),
(157, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435261424, '127.0.0.1'),
(158, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1435261424, '127.0.0.1'),
(159, 35, 'ElggUser', 'user', '', 'logout', 35, 0, 2, 'yes', 1435261587, '127.0.0.1'),
(160, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435261587, '127.0.0.1'),
(161, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435261621, '127.0.0.1'),
(162, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1435261621, '127.0.0.1'),
(163, 35, 'ElggUser', 'user', '', 'logout', 35, 0, 2, 'yes', 1435261793, '127.0.0.1'),
(164, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435261793, '127.0.0.1'),
(165, 35, 'ElggUser', 'user', '', 'update', 35, 0, 2, 'yes', 1435261823, '127.0.0.1'),
(166, 35, 'ElggUser', 'user', '', 'login', 35, 0, 2, 'yes', 1435261823, '127.0.0.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_users_apisessions`
--

CREATE TABLE IF NOT EXISTS `elgg_users_apisessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_guid` bigint(20) unsigned NOT NULL,
  `site_guid` bigint(20) unsigned NOT NULL,
  `token` varchar(40) DEFAULT NULL,
  `expires` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_guid` (`user_guid`,`site_guid`),
  KEY `token` (`token`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_users_entity`
--
-- en uso(#145 - Table '.\elgg\elgg_users_entity' is marked as crashed and should be repaired)
-- Error leyendo datos: (#145 - Table '.\elgg\elgg_users_entity' is marked as crashed and should be repaired)

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elgg_users_sessions`
--
-- en uso(#145 - Table '.\elgg\elgg_users_sessions' is marked as crashed and should be repaired)
-- Error leyendo datos: (#145 - Table '.\elgg\elgg_users_sessions' is marked as crashed and should be repaired)

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
