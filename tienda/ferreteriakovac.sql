-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2024 a las 22:53:39
-- Versión del servidor: 11.6.2-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ferreteriakovac`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add site', 1, 'add_site'),
(2, 'Can change site', 1, 'change_site'),
(3, 'Can delete site', 1, 'delete_site'),
(4, 'Can view site', 1, 'view_site'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add producto', 8, 'add_producto'),
(30, 'Can change producto', 8, 'change_producto'),
(31, 'Can delete producto', 8, 'delete_producto'),
(32, 'Can view producto', 8, 'view_producto'),
(33, 'Can add Cotización', 9, 'add_cotizacion'),
(34, 'Can change Cotización', 9, 'change_cotizacion'),
(35, 'Can delete Cotización', 9, 'delete_cotizacion'),
(36, 'Can view Cotización', 9, 'view_cotizacion'),
(37, 'Can add carrito item', 10, 'add_carritoitem'),
(38, 'Can change carrito item', 10, 'change_carritoitem'),
(39, 'Can delete carrito item', 10, 'delete_carritoitem'),
(40, 'Can view carrito item', 10, 'view_carritoitem'),
(41, 'Can add Cotización', 11, 'add_productocotizacion'),
(42, 'Can change Cotización', 11, 'change_productocotizacion'),
(43, 'Can delete Cotización', 11, 'delete_productocotizacion'),
(44, 'Can view Cotización', 11, 'view_productocotizacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$ukiW7T0eCs0J0Uu1gFxCP7$v3WFFIU1Q3rMATrj1Qhj8QuriPna7Q05h/S+PelLj8w=', '2024-12-04 15:41:44.398488', 1, 'kevinillo', '', '', '', 1, 1, '2024-11-30 17:45:25.931781'),
(2, 'pbkdf2_sha256$870000$68srP0f76GmNQtQuvr20wa$aYJzSnk7iZjqdrp2leYtiboUHnqc7PLVwhV5tqGV30I=', '2024-12-04 15:44:27.016027', 0, 'robin', 'robinson', 'ibarra', 'magallanicolove3@gmail.com', 0, 1, '2024-11-30 17:50:40.000000'),
(3, 'pbkdf2_sha256$870000$SmH3oedQkQSURqxj4mwSNk$sb1tUBTycv/qII3gHPTbWqebLT6U1XD6b7fVMF2bz5g=', '2024-12-01 17:29:50.554597', 0, 'alee', 'alee', 'duran', 'kotaix8404@gmail.com', 0, 1, '2024-12-01 02:40:54.726142'),
(4, 'pbkdf2_sha256$870000$cCpXVo3zHHGjKZvocVLRKB$IUtFDaEl6K4wbVkAccCGEecA3NmB2K3nU0Ciwh3YLsQ=', '2024-12-01 17:31:32.641503', 1, 'nico', '', '', '', 1, 1, '2024-12-01 02:42:56.763937');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-11-30 17:48:11.482065', '1', 'Interruptor Simple 9/12 10a Luzica Bticino RefPu1100', 1, '[{\"added\": {}}]', 8, 1),
(2, '2024-11-30 17:54:59.718340', '1', 'Cotización #1 - robin.id91@gmail.com - 7770.00 CLP', 2, '[]', 9, 1),
(3, '2024-11-30 18:11:03.118918', '1', 'Interruptor Simple 9/12 10a Luzica Bticino RefPu1100', 2, '[]', 8, 1),
(4, '2024-11-30 18:13:23.805457', '1', 'Cotización #1 - robin.id91@gmail.com - 7770.00 CLP', 3, '', 9, 1),
(5, '2024-11-30 18:13:37.073074', '2', 'robin', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 5, 1),
(6, '2024-11-30 18:21:24.729177', '2', 'Cotización #2 - magallanicolove3@gmail.com - 2590.00 CLP', 3, '', 9, 1),
(7, '2024-11-30 18:22:08.127025', '3', 'Cotización #3 - magallanicolove3@gmail.com - 2590.00 CLP', 3, '', 9, 1),
(8, '2024-11-30 18:27:50.594250', '1', 'Interruptor Simple 9/12 10a Luzica Bticino RefPu1100', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 8, 1),
(9, '2024-11-30 18:29:41.952236', '6', 'Cotización #6 - magallanicolove3@gmail.com - 2590.00 CLP', 3, '', 9, 1),
(10, '2024-11-30 18:29:41.952236', '5', 'Cotización #5 - magallanicolove3@gmail.com - 2590.00 CLP', 3, '', 9, 1),
(11, '2024-11-30 18:29:41.952236', '4', 'Cotización #4 - magallanicolove3@gmail.com - 2590.00 CLP', 3, '', 9, 1),
(12, '2024-11-30 18:49:40.924834', '11', 'Cotización #11 - magallanicolove3@gmail.com - 25900.00 CLP', 3, '', 9, 1),
(13, '2024-11-30 18:49:40.924834', '10', 'Cotización #10 - magallanicolove3@gmail.com - 2590.00 CLP', 3, '', 9, 1),
(14, '2024-11-30 18:49:40.924834', '9', 'Cotización #9 - magallanicolove3@gmail.com - 2590.00 CLP', 3, '', 9, 1),
(15, '2024-11-30 18:49:40.924834', '8', 'Cotización #8 - magallanicolove3@gmail.com - 2590.00 CLP', 3, '', 9, 1),
(16, '2024-11-30 18:49:40.924834', '7', 'Cotización #7 - magallanicolove3@gmail.com - 2590.00 CLP', 3, '', 9, 1),
(17, '2024-11-30 20:01:08.635788', '1', 'Interruptor Simple 9/12 10a Luzica Bticino RefPu1100', 2, '[]', 8, 1),
(18, '2024-12-01 00:37:51.779497', '1', 'Interruptor Simple 9/12 10a Luzica Bticino RefPu1100', 2, '[]', 8, 1),
(19, '2024-12-01 00:42:00.921558', '2', 'Interruptor Doble 9/15 10a Luzica Bticino Ref Pu1200', 1, '[{\"added\": {}}]', 8, 1),
(20, '2024-12-01 00:42:32.337657', '2', 'Interruptor Doble 9/15 10a Luzica Bticino Ref Pu1200', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 1),
(21, '2024-12-01 00:43:49.803406', '3', 'Interruptor Triple 9/32 10a Luzica Bticino Ref Pu1300', 1, '[{\"added\": {}}]', 8, 1),
(22, '2024-12-01 00:44:33.937130', '3', 'Interruptor Triple 9/32 10a Luzica Bticino Ref Pu1300', 2, '[]', 8, 1),
(23, '2024-12-01 00:45:25.901156', '4', 'Interruptor 9/12 + Toma 10a 250v Luzica Ref Pu1214', 1, '[{\"added\": {}}]', 8, 1),
(24, '2024-12-01 00:45:33.630576', '3', 'Interruptor Triple 9/32 10a Luzica Bticino Ref Pu1300', 2, '[{\"changed\": {\"fields\": [\"Categoria\"]}}]', 8, 1),
(25, '2024-12-01 00:47:50.572027', '5', 'Interruptor Diferencial 2x25a 30ma Lexo Certificado', 1, '[{\"added\": {}}]', 8, 1),
(26, '2024-12-01 00:48:11.306295', '5', 'Interruptor Diferencial 2x25a 30ma Lexo Certificado', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 1),
(27, '2024-12-01 00:49:05.862697', '6', 'Interruptor Diferencial 4x25a 30ma Lexo Certificado', 1, '[{\"added\": {}}]', 8, 1),
(28, '2024-12-01 00:55:56.653171', '6', 'Interruptor Diferencial 4x25a 30ma Lexo Certificado', 2, '[{\"changed\": {\"fields\": [\"Categoria\"]}}]', 8, 1),
(29, '2024-12-01 00:57:14.117715', '7', 'Interruptor Automatico Moldeado 3X50A 25ka LEXO', 1, '[{\"added\": {}}]', 8, 1),
(30, '2024-12-01 00:57:58.684815', '8', 'Interruptor Automatico Moldeado 3X100A 35ka LEXO', 1, '[{\"added\": {}}]', 8, 1),
(31, '2024-12-01 00:58:05.265864', '8', 'Interruptor Automatico Moldeado 3X100A 35ka LEXO', 2, '[{\"changed\": {\"fields\": [\"Categoria\"]}}]', 8, 1),
(32, '2024-12-01 01:00:16.191681', '9', 'Placa Armada Pulsador Timbre S44 Carbón Teclón 125x45 mm', 1, '[{\"added\": {}}]', 8, 1),
(33, '2024-12-01 01:03:33.892897', '9', 'Placa Armada Pulsador Timbre S44 Carbón Teclón 125x45 mm', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 1),
(34, '2024-12-01 01:04:20.845203', '9', 'Placa Armada Pulsador Timbre S44 Carbón Teclón 125x45 mm', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 1),
(35, '2024-12-01 01:05:40.188084', '10', 'Placa Armada S33 Noir Mate Pulsador Timbre 119x86 mm', 1, '[{\"added\": {}}]', 8, 1),
(36, '2024-12-01 01:06:46.116685', '11', 'Placa Armada S33 Noir Mate Tomacorriente 10A y Cargador USB 119x86 mm', 1, '[{\"added\": {}}]', 8, 1),
(37, '2024-12-01 01:08:07.767487', '12', 'Placa Armada S33 Noir Mate Tomacorriente Triple 10A 119x86 mm', 1, '[{\"added\": {}}]', 8, 1),
(38, '2024-12-01 03:03:31.945329', '13', 'Contratuerca Galvanizada 2\"', 1, '[{\"added\": {}}]', 8, 4),
(39, '2024-12-01 03:04:30.313563', '14', 'Contratuerca Metálica 40MM', 1, '[{\"added\": {}}]', 8, 4),
(40, '2024-12-01 03:04:47.093288', '14', 'Contratuerca Metálica 40MM', 2, '[{\"changed\": {\"fields\": [\"Categoria\"]}}]', 8, 4),
(41, '2024-12-01 03:05:52.831519', '15', 'Barra de Hilo Corrido X1MT 1/2 GALV G-2', 1, '[{\"added\": {}}]', 8, 4),
(42, '2024-12-01 03:06:35.446404', '16', 'Barra de Hilo Corrido X1MT 1/2 ZINC G-2', 1, '[{\"added\": {}}]', 8, 4),
(43, '2024-12-01 03:07:49.778233', '17', 'Barra de Hilo Corrido X1MT 1/4 ZINC G-2', 1, '[{\"added\": {}}]', 8, 4),
(44, '2024-12-01 03:08:43.471748', '18', 'Barra de Hilo Corrido X1MT 3/4 GALV G-2', 1, '[{\"added\": {}}]', 8, 4),
(45, '2024-12-01 03:11:37.089028', '19', 'Cinta Aisladora Vinilica Temflex 175 3M 19mm X 18Mts Negra', 1, '[{\"added\": {}}]', 8, 4),
(46, '2024-12-01 03:12:35.145353', '20', 'Cinta Aisladora Vinilica Temflex 175 3M 19mm X 9 Mts Negra', 1, '[{\"added\": {}}]', 8, 4),
(47, '2024-12-01 03:13:17.035935', '21', 'Pasacable Cerrado Negro 25.1x19.1 X 28.0 X 11.5mm', 1, '[{\"added\": {}}]', 8, 4),
(48, '2024-12-01 03:14:20.401580', '22', 'Kit manga termocontraible 100 piezas', 1, '[{\"added\": {}}]', 8, 4),
(49, '2024-12-01 03:15:34.490196', '21', 'Pasacable Cerrado Negro 25.1x19.1 X 28.0 X 11.5mm', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 4),
(50, '2024-12-01 03:15:51.743740', '19', 'Cinta Aisladora Vinilica Temflex 175 3M 19mm X 18Mts Negra', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 4),
(51, '2024-12-01 03:16:10.695143', '20', 'Cinta Aisladora Vinilica Temflex 175 3M 19mm X 9 Mts Negra', 2, '[]', 8, 4),
(52, '2024-12-01 03:16:14.826039', '19', 'Cinta Aisladora Vinilica Temflex 175 3M 19mm X 18Mts Negra', 2, '[]', 8, 4),
(53, '2024-12-01 03:16:24.795323', '22', 'Kit manga termocontraible 100 piezas', 2, '[]', 8, 4),
(54, '2024-12-01 03:19:43.330513', '23', 'Contactor 40A KNC1 Bobina 220V 3P+1NO 380V Stanford', 1, '[{\"added\": {}}]', 8, 4),
(55, '2024-12-01 03:20:35.363790', '24', 'Contactor 50A KNC1 Bobina 220V 3P+1NO 380V Stanford', 1, '[{\"added\": {}}]', 8, 4),
(56, '2024-12-01 03:21:35.329795', '25', 'Contacto Auxiliar', 1, '[{\"added\": {}}]', 8, 4),
(57, '2024-12-01 03:22:46.065555', '26', 'Contactor GEC1 9A Bobina 220VAC 3P AC3 380V 4KW 1NO MGC', 1, '[{\"added\": {}}]', 8, 4),
(58, '2024-12-01 03:23:09.515929', '26', 'Contactor GEC1 9A Bobina 220VAC 3P AC3 380V 4KW 1NO MGC', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 8, 4),
(59, '2024-12-01 03:28:13.617009', '27', 'Interruptor Diferencial Dx3 2x25A 30ma Legran Ref 411504', 1, '[{\"added\": {}}]', 8, 4),
(60, '2024-12-01 03:29:04.082760', '28', 'Interruptor Diferencial Dx3 2X40A 30MA LEGRAN REF 411505', 1, '[{\"added\": {}}]', 8, 4),
(61, '2024-12-01 03:30:14.512237', '29', 'Diferencial RX3 2x63A 30ma AC Legrand Ref 402026', 1, '[{\"added\": {}}]', 8, 4),
(62, '2024-12-01 03:31:20.164671', '30', 'Diferencial RX3 4x63A 30ma AC Legrand Ref 402064', 1, '[{\"added\": {}}]', 8, 4),
(63, '2024-12-01 03:37:07.033740', '31', 'Automático Tx3 1x10a 6ka C 230/400v Legrand Ref 403575', 1, '[{\"added\": {}}]', 8, 4),
(64, '2024-12-01 03:38:18.758034', '32', 'Interruptor Automático KBM 1P + N 6A D 15KA LEXO', 1, '[{\"added\": {}}]', 8, 4),
(65, '2024-12-01 03:39:15.171656', '33', 'Interruptor Automático KBM 3X6A D 15KA LEXO', 1, '[{\"added\": {}}]', 8, 4),
(66, '2024-12-01 03:41:07.051129', '34', 'Interruptor Automático KBM 4X16A D 15KA LEXO', 1, '[{\"added\": {}}]', 8, 4),
(67, '2024-12-01 03:43:47.775487', '35', 'Caja Empalme Para Medidor Enganche Riel Din Stanford', 1, '[{\"added\": {}}]', 8, 4),
(68, '2024-12-01 03:45:24.419555', '36', 'Caja Empalme Plástica Para Medidor Monofásico con Riel Din', 1, '[{\"added\": {}}]', 8, 4),
(69, '2024-12-01 03:47:26.629198', '37', 'Caja para empalme 20x40,6 cm acero', 1, '[{\"added\": {}}]', 8, 4),
(70, '2024-12-01 03:48:49.278936', '38', 'Caja Empalme Para Medidor Enganche Riel Din Stanford', 1, '[{\"added\": {}}]', 8, 4),
(71, '2024-12-01 03:49:23.088483', '38', 'Caja Empalme Para Medidor Enganche Riel Din Stanford', 3, '', 8, 4),
(72, '2024-12-01 03:50:13.920129', '39', 'Caja Empalme Reducida Plana con Riel', 1, '[{\"added\": {}}]', 8, 4),
(73, '2024-12-01 03:51:56.946799', '40', 'Caja Distribución Para Tabique Corriente 12 Salidas', 1, '[{\"added\": {}}]', 8, 4),
(74, '2024-12-01 03:52:47.175180', '41', 'Caja Distribución Para Concreto Oreja Metal 10 Salidas', 1, '[{\"added\": {}}]', 8, 4),
(75, '2024-12-01 03:57:48.306874', '42', 'Caja Embutida Para Tabique Pvc Oreja Metálica 503t Naranjo', 1, '[{\"added\": {}}]', 8, 4),
(76, '2024-12-01 03:59:38.464920', '43', 'Caja Embutida Pvc Albañilería Oreja Metálica Amarillo 503l', 1, '[{\"added\": {}}]', 8, 4),
(77, '2024-12-01 04:01:37.876189', '44', 'Caja CTR PAU Embutida 2 puertas 600X500X80 FNX', 1, '[{\"added\": {}}]', 8, 4),
(78, '2024-12-01 04:02:28.478304', '45', 'Gabinete Metálico 1 Puerta 300X200X150MM', 1, '[{\"added\": {}}]', 8, 4),
(79, '2024-12-01 04:03:13.200047', '46', 'Gabinete Metálico 2 Puertas 800X800X250MM', 1, '[{\"added\": {}}]', 8, 4),
(80, '2024-12-01 04:04:12.812939', '47', 'Caja CTR PAU Embutida 1 puerta 300X400X80MM FNX', 1, '[{\"added\": {}}]', 8, 4),
(81, '2024-12-01 04:04:40.770597', '47', 'Caja CTR PAU Embutida 1 puerta 300X400X80MM FNX', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 4),
(82, '2024-12-01 04:24:51.619255', '48', 'Tablero Plástico Embutido 8 Circuitos Puerta Transparente', 1, '[{\"added\": {}}]', 8, 4),
(83, '2024-12-01 04:26:21.935406', '49', 'Tablero embutido 4cc Forceman', 1, '[{\"added\": {}}]', 8, 4),
(84, '2024-12-01 04:27:27.142773', '50', 'Tablero embutido 6cc 30/c Forceman', 1, '[{\"added\": {}}]', 8, 4),
(85, '2024-12-01 04:28:21.858969', '51', 'Tablero embutido 18cc Forceman', 1, '[{\"added\": {}}]', 8, 4),
(86, '2024-12-01 04:29:19.228131', '52', 'Tablero Exterior Sobrepuesto 5 Circuitos Estanco Ip 65', 1, '[{\"added\": {}}]', 8, 4),
(87, '2024-12-01 04:30:24.505037', '53', 'Tablero Exterior Sobrepuesto 8 Circuitos Estanco Ip 65', 1, '[{\"added\": {}}]', 8, 4),
(88, '2024-12-01 04:31:14.218501', '54', 'Tablero Exterior Sobrepuesto 12 Circuitos Estanco Ip65', 1, '[{\"added\": {}}]', 8, 4),
(89, '2024-12-01 04:32:04.119663', '55', 'Tablero Exterior Sobrepuesto 15 Circuitos Estanco Ip65', 1, '[{\"added\": {}}]', 8, 4),
(90, '2024-12-01 04:35:50.501904', '56', 'TNAKIEX', 1, '[{\"added\": {}}]', 8, 4),
(91, '2024-12-01 04:40:42.951369', '57', 'Cable Eva 10mm LH Evaflex (h07z1-k) 100 Mts', 1, '[{\"added\": {}}]', 8, 4),
(92, '2024-12-01 05:50:27.822674', '58', 'Cable Eva 6mm LH Evaflex (h07z1-k) 100 Mts', 1, '[{\"added\": {}}]', 8, 4),
(93, '2024-12-01 05:51:23.176614', '59', 'Cable Eva 4mm LH Evaflex (h07z1-k) 100 Mts', 1, '[{\"added\": {}}]', 8, 4),
(94, '2024-12-01 05:52:20.948500', '60', 'Cable Eva 2,5mm LH Evaflex (h07z1-k) 100 Mts', 1, '[{\"added\": {}}]', 8, 4),
(95, '2024-12-01 05:52:52.456246', '60', 'Cable Eva 2,5mm LH Evaflex (h07z1-k) 100 Mts', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 4),
(96, '2024-12-01 15:23:50.849723', '60', 'Cable Eva 2,5mm LH Evaflex (h07z1-k) 100 Mts', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 4),
(97, '2024-12-01 15:34:56.033419', '61', 'Tuberia PVC Conduit 25MM x3MTS (Clase III)', 1, '[{\"added\": {}}]', 8, 4),
(98, '2024-12-01 15:35:51.647386', '62', 'Tubo conduit PVC 40mm 3mts', 1, '[{\"added\": {}}]', 8, 4),
(99, '2024-12-01 15:36:54.624065', '63', 'Tubo conduit PVC 16mm 3mts', 1, '[{\"added\": {}}]', 8, 4),
(100, '2024-12-01 15:38:02.713871', '64', 'Tubo conduit PVC 32mm 3mts', 1, '[{\"added\": {}}]', 8, 4),
(101, '2024-12-01 15:39:52.620995', '65', 'Curva 90° pvc 40mm', 1, '[{\"added\": {}}]', 8, 4),
(102, '2024-12-01 15:40:46.286806', '66', 'Curva 90° PVC 63MM', 1, '[{\"added\": {}}]', 8, 4),
(103, '2024-12-01 15:41:30.941635', '67', 'Curva 90° PVC 75MM', 1, '[{\"added\": {}}]', 8, 4),
(104, '2024-12-01 15:42:17.961362', '68', 'Curva 90° PVC 90MM', 1, '[{\"added\": {}}]', 8, 4),
(105, '2024-12-01 15:44:01.224829', '69', 'Abrazadera PVC omega 16mm', 1, '[{\"added\": {}}]', 8, 4),
(106, '2024-12-01 15:45:15.753684', '70', 'Abrazadera PVC omega 20mm', 1, '[{\"added\": {}}]', 8, 4),
(107, '2024-12-01 15:46:08.109118', '71', 'Abrazadera PVC omega 25mm', 1, '[{\"added\": {}}]', 8, 4),
(108, '2024-12-01 15:47:19.779956', '72', 'Abrazadera PVC omega 40mm', 1, '[{\"added\": {}}]', 8, 4),
(109, '2024-12-01 15:51:14.532584', '73', 'Tuberia EMT 25MM', 1, '[{\"added\": {}}]', 8, 4),
(110, '2024-12-01 15:52:06.759510', '74', 'Tubería Metálica EMT Rígida 25mm x 3 Mts IEC 4422', 1, '[{\"added\": {}}]', 8, 4),
(111, '2024-12-01 15:52:58.516240', '75', 'Tubería Metálica EMT Rígida 32mm x 3 Mts IEC 4422', 1, '[{\"added\": {}}]', 8, 4),
(112, '2024-12-01 15:53:55.578429', '76', 'Tubería Metálica EMT Rígida 50mm x 3 Mts IEC 4422', 1, '[{\"added\": {}}]', 8, 4),
(113, '2024-12-01 15:58:12.787199', '77', 'Terminal EMT 25 MM', 1, '[{\"added\": {}}]', 8, 4),
(114, '2024-12-01 16:00:41.749740', '78', 'Terminal EMT 32 MM', 1, '[{\"added\": {}}]', 8, 4),
(115, '2024-12-01 16:03:05.210237', '79', 'Curva Tuberia Emt 20mm', 1, '[{\"added\": {}}]', 8, 4),
(116, '2024-12-01 16:03:35.452709', '80', 'Curva Tuberia Emt 25mm', 1, '[{\"added\": {}}]', 8, 4),
(117, '2024-12-01 16:04:10.136653', '81', 'Curva Tuberia Emt 32mm', 1, '[{\"added\": {}}]', 8, 4),
(118, '2024-12-01 16:05:54.280733', '82', 'Copla Tuberia Emt 20mm', 1, '[{\"added\": {}}]', 8, 4),
(119, '2024-12-01 16:06:54.229765', '83', 'Copla Tuberia Emt 25mm', 1, '[{\"added\": {}}]', 8, 4),
(120, '2024-12-01 16:07:35.318986', '84', 'Copla Tuberia Emt 32mm', 1, '[{\"added\": {}}]', 8, 4),
(121, '2024-12-01 16:08:31.360661', '83', 'Copla Tuberia Emt 25mm', 2, '[{\"changed\": {\"fields\": [\"Categoria\"]}}]', 8, 4),
(122, '2024-12-01 16:09:06.774628', '82', 'Copla Tuberia Emt 20mm', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 8, 4),
(123, '2024-12-01 16:10:04.964558', '84', 'Copla Tuberia Emt 32mm', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 8, 4),
(124, '2024-12-01 16:15:09.101523', '85', 'Conector HUB 1\" ANSI.C.80 FNX', 1, '[{\"added\": {}}]', 8, 4),
(125, '2024-12-01 16:15:56.848742', '86', 'Conector HUB 1.1/2 ANSI.C.80 FNX', 1, '[{\"added\": {}}]', 8, 4),
(126, '2024-12-01 16:16:42.201339', '87', 'Conector HUB 1.1/4\" ANSI.C.80', 1, '[{\"added\": {}}]', 8, 4),
(127, '2024-12-01 16:20:12.699833', '88', 'Conector MET Recto EMT a Flexible 25MM', 1, '[{\"added\": {}}]', 8, 4),
(128, '2024-12-01 16:21:19.469948', '89', 'Conector MET Recto EMT a Flexible 20MM', 1, '[{\"added\": {}}]', 8, 4),
(129, '2024-12-01 16:23:22.656932', '90', 'Conector Recto Para Flexible 32MM', 1, '[{\"added\": {}}]', 8, 4),
(130, '2024-12-01 16:24:31.470659', '91', 'Conector Recto Para Flexible 40MM', 1, '[{\"added\": {}}]', 8, 4),
(131, '2024-12-01 16:26:26.550094', '92', 'Caja Metalica 150x150x100MM', 1, '[{\"added\": {}}]', 8, 4),
(132, '2024-12-01 16:27:34.768092', '93', 'Caja Metalica 200x200x100MM', 1, '[{\"added\": {}}]', 8, 4),
(133, '2024-12-01 16:28:35.098024', '94', 'Caja Metalica 200x100x100MM', 1, '[{\"added\": {}}]', 8, 4),
(134, '2024-12-01 16:29:39.137883', '95', 'Caja Metalica 100x100x65MM', 1, '[{\"added\": {}}]', 8, 4),
(135, '2024-12-01 16:32:04.810928', '96', 'Abrazadera Clamp EMT 1\" FNX', 1, '[{\"added\": {}}]', 8, 4),
(136, '2024-12-01 16:32:52.021720', '97', 'Abrazadera Clamp EMT 1/2\" FNX', 1, '[{\"added\": {}}]', 8, 4),
(137, '2024-12-01 16:33:54.666826', '98', 'Abrazadera Clamp EMT 3/4\" FNX', 1, '[{\"added\": {}}]', 8, 4),
(138, '2024-12-01 16:35:13.487873', '99', 'Abrazadera RUC 1\"', 1, '[{\"added\": {}}]', 8, 4),
(139, '2024-12-01 16:36:14.296611', '99', 'Abrazadera RUC 1\"', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 4),
(140, '2024-12-01 16:36:23.597381', '99', 'Abrazadera RUC 1\"', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 4),
(141, '2024-12-01 16:39:10.529320', '100', 'Tuberia Conduit Flexible Reforzado Acero/Pvc 40mm x MTS', 1, '[{\"added\": {}}]', 8, 4),
(142, '2024-12-01 16:40:31.451994', '101', 'Tuberia Conduit flexible metal/pvc 63mm Rollo 20 mts', 1, '[{\"added\": {}}]', 8, 4),
(143, '2024-12-01 16:41:56.122409', '102', 'Conector MET Curvo Flex 20MM', 1, '[{\"added\": {}}]', 8, 4),
(144, '2024-12-01 16:43:04.622335', '103', 'Conector MET Curvo Flex 40MM', 1, '[{\"added\": {}}]', 8, 4),
(145, '2024-12-01 16:46:40.734810', '104', 'Tubo galvanizado 20 mm x 3 mts ansi 80.1', 1, '[{\"added\": {}}]', 8, 4),
(146, '2024-12-01 16:47:26.072780', '105', 'Tubo galvanizado 32 mm x 3 mts ANSI 80.1', 1, '[{\"added\": {}}]', 8, 4),
(147, '2024-12-01 16:48:22.447846', '106', 'Pie Rack Galvanizado Pesado Galv 1 Via', 1, '[{\"added\": {}}]', 8, 4),
(148, '2024-12-01 16:50:02.470310', '107', 'Alambre galvanizado N°18 1 kilo', 1, '[{\"added\": {}}]', 8, 4),
(149, '2024-12-04 15:44:06.046338', '8', 'Interruptor Automatico Moldeado 3X100A 35ka LEXO', 3, '', 8, 1),
(150, '2024-12-04 15:44:06.046338', '7', 'Interruptor Automatico Moldeado 3X50A 25ka LEXO', 3, '', 8, 1),
(151, '2024-12-04 15:44:06.046338', '5', 'Interruptor Diferencial 2x25a 30ma Lexo Certificado', 3, '', 8, 1),
(152, '2024-12-04 15:44:06.046338', '6', 'Interruptor Diferencial 4x25a 30ma Lexo Certificado', 3, '', 8, 1),
(153, '2024-12-04 15:53:23.366974', '108', 'INTERRUPTOR SIMPLE 9/12 MÁS TOMA CORRIENTE 10A 250V CAFÉ ARMADO TITANIO', 1, '[{\"added\": {}}]', 8, 1),
(154, '2024-12-04 15:55:06.587285', '109', 'INTERRUPTOR PULSADOR TIMBRE 10A 250V CAFÉ ARMADO TITANIO', 1, '[{\"added\": {}}]', 8, 1),
(155, '2024-12-04 15:56:19.408270', '109', 'INTERRUPTOR PULSADOR TIMBRE 10A 250V CAFÉ ARMADO TITANIO', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 1),
(156, '2024-12-04 15:57:56.657870', '110', 'INTERRUPTOR SIMPLE 9/12 10A 250V CAFÉ ARMADO TITANIO', 1, '[{\"added\": {}}]', 8, 1),
(157, '2024-12-04 15:58:46.175499', '111', 'INTERRUPTOR TRIPLE 9/32 10A 250V CAFÉ ARMADO TITANIO', 1, '[{\"added\": {}}]', 8, 1),
(158, '2024-12-04 16:00:29.504741', '109', 'INTERRUPTOR PULSADOR TIMBRE TECLON 73 MM 10A 250V CAFÉ ARMADO', 2, '[{\"changed\": {\"fields\": [\"Nombre\", \"Imagen\", \"Sku\"]}}]', 8, 1),
(159, '2024-12-04 16:01:15.154285', '1', 'Interruptor Simple 9/12 10a Luzica Bticino RefPu1100', 2, '[{\"changed\": {\"fields\": [\"Destacado\"]}}]', 8, 1),
(160, '2024-12-04 16:04:18.855106', '112', 'Enchufe Simple 10A 250V + Toma USB Café Stanford', 1, '[{\"added\": {}}]', 8, 1),
(161, '2024-12-04 16:05:24.710052', '113', 'Toma Red Computación STANFORD Café', 1, '[{\"added\": {}}]', 8, 1),
(162, '2024-12-04 16:05:50.118548', '112', 'Enchufe Simple 10A 250V + Toma USB Café Stanford', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 1),
(163, '2024-12-04 16:06:59.723546', '114', 'Interruptor Simple (9/12) + Enchufe Simple 10A 250V Stanford Cafe', 1, '[{\"added\": {}}]', 8, 1),
(164, '2024-12-04 16:07:57.126572', '115', 'Enchufe Triple 10A 250V STANFORD Café', 1, '[{\"added\": {}}]', 8, 1),
(165, '2024-12-04 16:11:47.838506', '116', 'ENCHUFE INDUSTRIAL IP67, LIBRE DE HALOGENOS, HEMBRA SOBREPUESTA, 380V, 16A, 3P+T, BEMIS 6110435 Bemis', 1, '[{\"added\": {}}]', 8, 1),
(166, '2024-12-04 16:13:26.701093', '117', 'ENCHUFE INDUSTRIAL IP44, LIBRE DE HALOGENOS, HEMBRA SOBREPUESTA, 380V, 32A, 3P+T, BEMIS 6112635 Bemis', 1, '[{\"added\": {}}]', 8, 1),
(167, '2024-12-04 16:15:09.389512', '118', 'MACHO INDUSTRIAL SOBREPUESTO 380V 32A 3P+N+TIP67 LIBRE DE HALOGENOS 6512435 Bemis', 1, '[{\"added\": {}}]', 8, 1),
(168, '2024-12-04 16:17:21.526423', '119', 'ENCHUFE INDUSTRIAL IP67, LIBRE DE HALOGENOS, MACHO SOBREPUESTO, 220, 32A, 2P+T, BEMIS 6512035 Bemis', 1, '[{\"added\": {}}]', 8, 1),
(169, '2024-12-04 16:18:34.617088', '120', 'ENCHUFE INDUSTRIAL IP67, LIBRE DE HALOGENOS, HEMBRA SOBREPUESTA, 220V, 16A, 2P+T, BEMIS 6110235 Bemis', 1, '[{\"added\": {}}]', 8, 1),
(170, '2024-12-04 16:19:04.114393', '120', 'ENCHUFE INDUSTRIAL IP67, LIBRE DE HALOGENOS, HEMBRA SOBREPUESTA, 220V, 16A, 2P+T, BEMIS 6110235 Bemis', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 1),
(171, '2024-12-04 16:19:31.873960', '120', 'ENCHUFE INDUSTRIAL IP67, LIBRE DE HALOGENOS, HEMBRA SOBREPUESTA, 220V, 16A, 2P+T, BEMIS 6110235 Bemis', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 8, 1),
(172, '2024-12-04 16:20:33.103410', '121', 'ENCHUFE INDUSTRIAL IP44, LIBRE DE HALOGENOS, HEMBRA SOBREPUESTA, 220V, 16A, 2P+T, BEMIS 6110835 Bemis', 1, '[{\"added\": {}}]', 8, 1),
(173, '2024-12-04 16:27:57.207174', '122', 'Canoa Led Integ. Plano 36w 220V 120Cm 6500K 3000LM Stanford', 1, '[{\"added\": {}}]', 8, 1),
(174, '2024-12-04 16:29:00.798285', '123', 'Canoa Led Integ. Plano 18w 220V 61Cm 6500K 1500LM Stanford', 1, '[{\"added\": {}}]', 8, 1),
(175, '2024-12-04 16:30:22.046265', '124', 'Equipo Estanco Led 2x18w Ip65 120cm Con 2 Tubos Led', 1, '[{\"added\": {}}]', 8, 1),
(176, '2024-12-04 16:30:36.758977', '124', 'Equipo Estanco Led 2x18w Ip65 120cm Con 2 Tubos Led', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 8, 1),
(177, '2024-12-04 16:30:41.693103', '124', 'Equipo Estanco Led 2x18w Ip65 120cm Con 2 Tubos Led', 2, '[{\"changed\": {\"fields\": [\"Descripcion\"]}}]', 8, 1),
(178, '2024-12-04 16:31:40.598771', '125', 'Equipo Estanco Led 1x9w Ip65 60cm Sin Tubo', 1, '[{\"added\": {}}]', 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(10, 'ferreteria', 'carritoitem'),
(9, 'ferreteria', 'cotizacion'),
(8, 'ferreteria', 'producto'),
(11, 'ferreteria', 'productocotizacion'),
(7, 'sessions', 'session'),
(1, 'sites', 'site');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-11-30 17:45:12.704296'),
(2, 'auth', '0001_initial', '2024-11-30 17:45:12.901975'),
(3, 'admin', '0001_initial', '2024-11-30 17:45:12.953192'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-30 17:45:12.958207'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-30 17:45:12.964354'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-11-30 17:45:13.004206'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-11-30 17:45:13.030200'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-11-30 17:45:13.043223'),
(9, 'auth', '0004_alter_user_username_opts', '2024-11-30 17:45:13.048584'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-11-30 17:45:13.073883'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-11-30 17:45:13.074882'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-11-30 17:45:13.079868'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-11-30 17:45:13.094921'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-11-30 17:45:13.108881'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-11-30 17:45:13.123872'),
(16, 'auth', '0011_update_proxy_permissions', '2024-11-30 17:45:13.129049'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-11-30 17:45:13.144593'),
(18, 'ferreteria', '0001_initial', '2024-11-30 17:45:13.270495'),
(19, 'sessions', '0001_initial', '2024-11-30 17:45:13.289473'),
(20, 'sites', '0001_initial', '2024-11-30 17:45:13.296011'),
(21, 'sites', '0002_alter_domain_unique', '2024-11-30 17:45:13.310023'),
(22, 'ferreteria', '0002_alter_producto_categoria', '2024-11-30 20:00:09.024131');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('6b6rjtjrew510isegokju8nyrqwhqll9', '.eJxVjEEOwiAQAP_C2RAWCFCP3n0DWRZWqoYmpT0Z_64kPeh1ZjIvEXHfatx7WeOcxVmAOP2yhPQobYh8x3ZbJC1tW-ckRyIP2-V1yeV5Odq_QcVex5ZUAtbIVjvD1rKZIBmy2TgVHHgfiqaivOEpe48qBIKi2YQvA5dIvD_SMTdw:1tHRYU:aTKV0mGbrf873ShUhzhjhqEJGLXHWRZ-TUltbx5fgK8', '2024-12-14 17:46:54.598040'),
('9d7svajwrpyjmpfknv4i80v4wdm1ln2g', '.eJxVjEEOwiAQRe_C2pAiFBiX7j0DGWZAqgaS0q6Md7dNutDtf-_9twi4LiWsPc1hYnERRpx-t4j0THUH_MB6b5JaXeYpyl2RB-3y1ji9rof7d1Cwl612oLVibfOZxhyjyuCTcpnIKcZorAMckSj6gVkZDRY3nwDQeze4lMTnC_TZOEQ:1tHaSD:mlXu7umTM9GIRfLQERctAXlq6jfpjXZzfdSPUGvNZ6Y', '2024-12-15 03:17:01.569400'),
('ap25qceytqnq2amgiyv5b4ghql917fze', '.eJxVjEEOwiAQRe_C2hCgZaZx6d4zkIEZpGpoUtpV491tky50-997f1OB1qWEtckcRlZX5dTld4uUXlIPwE-qj0mnqS7zGPWh6JM2fZ9Y3rfT_Tso1Mpe5zR0hJQjpt5nIGPAegZOKKZ3JiZPLNaKJwdgBsseDXjM0CHsOqnPF_eNN_Y:1tHXzg:bd24860S7A6zGUqhZopnf3NyO-iqz-GinHQc8nzOpeU', '2024-12-15 00:39:24.932867'),
('dqdob0yy5nl9bqudqy2yhhj2t6or9ikv', '.eJxVjEEOwiAQAP_C2RAWCFCP3n0DWRZWqoYmpT0Z_64kPeh1ZjIvEXHfatx7WeOcxVmAOP2yhPQobYh8x3ZbJC1tW-ckRyIP2-V1yeV5Odq_QcVex5ZUAtbIVjvD1rKZIBmy2TgVHHgfiqaivOEpe48qBIKi2YQvA5dIvD_SMTdw:1tHTdn:FaqjrVtnu6a6-dgIn_qWW8WgK1a6Fb6ek93DbeTjcAk', '2024-12-14 20:00:31.076777'),
('ei48gmt9c4wymksevw0xfo4box8oyva8', '.eJxVjEEOwiAQAP_C2RAWCFCP3n0DWRZWqoYmpT0Z_64kPeh1ZjIvEXHfatx7WeOcxVmAOP2yhPQobYh8x3ZbJC1tW-ckRyIP2-V1yeV5Odq_QcVex5ZUAtbIVjvD1rKZIBmy2TgVHHgfiqaivOEpe48qBIKi2YQvA5dIvD_SMTdw:1tHSBx:wkNGg8HWxiWTqUnOs7tRAdAkqpATYH8l7y2vcR1X4_I', '2024-12-14 18:27:41.714542'),
('fzxnxz2nqp93xosxfajzqqhe2yk4tiln', '.eJxVjEEOwiAQRe_C2hCgZaZx6d4zkIEZpGpoUtpV491tky50-997f1OB1qWEtckcRlZX5dTld4uUXlIPwE-qj0mnqS7zGPWh6JM2fZ9Y3rfT_Tso1Mpe5zR0hJQjpt5nIGPAegZOKKZ3JiZPLNaKJwdgBsseDXjM0CHsOqnPF_eNN_Y:1tHRyb:DH3ASbZbVsicdPWdze4Nw-PyEkTBXEsHWxU2LN7Wn8A', '2024-12-14 18:13:53.144271'),
('gfu32cp2kt1u2bvw3aj9c4c4zvk1pqlj', '.eJxVjEEOwiAQRe_C2hCgZaZx6d4zkIEZpGpoUtpV491tky50-997f1OB1qWEtckcRlZX5dTld4uUXlIPwE-qj0mnqS7zGPWh6JM2fZ9Y3rfT_Tso1Mpe5zR0hJQjpt5nIGPAegZOKKZ3JiZPLNaKJwdgBsseDXjM0CHsOqnPF_eNN_Y:1tHS65:PugsCw7GuzQjGQB_ezT7qqfAi3Mx1zF3jrVcfx5iV2A', '2024-12-14 18:21:37.146736'),
('ih3r6m4bdyljrulpvzpxyuasg4zxi0ws', '.eJxVjEEOwiAQRe_C2hCgZaZx6d4zkIEZpGpoUtpV491tky50-997f1OB1qWEtckcRlZX5dTld4uUXlIPwE-qj0mnqS7zGPWh6JM2fZ9Y3rfT_Tso1Mpe5zR0hJQjpt5nIGPAegZOKKZ3JiZPLNaKJwdgBsseDXjM0CHsOqnPF_eNN_Y:1tHSDD:yeWDJlpXjzkkLteYVFf5k00ZRNHEPYnXKCVvOI93tfk', '2024-12-14 18:28:59.337331'),
('mod4k7e5be86pytxfs6why18iabpkh2u', '.eJxVjEEOwiAQRe_C2pAiFBiX7j0DGWZAqgaS0q6Md7dNutDtf-_9twi4LiWsPc1hYnERRpx-t4j0THUH_MB6b5JaXeYpyl2RB-3y1ji9rof7d1Cwl612oLVibfOZxhyjyuCTcpnIKcZorAMckSj6gVkZDRY3nwDQeze4lMTnC_TZOEQ:1tHZvr:l9ocpWQmZgsNb_losl_BEe9peEz3eylhTChw2tcbOJ8', '2024-12-15 02:43:35.865235'),
('na13mjpy8vfpkb9hmkzy88p8swaz0cvt', '.eJxVjEEOwiAQRe_C2pAiFBiX7j0DGWZAqgaS0q6Md7dNutDtf-_9twi4LiWsPc1hYnERRpx-t4j0THUH_MB6b5JaXeYpyl2RB-3y1ji9rof7d1Cwl612oLVibfOZxhyjyuCTcpnIKcZorAMckSj6gVkZDRY3nwDQeze4lMTnC_TZOEQ:1tHZyY:Qyy-VTw1ByJW5fyfYXA46oA5ncYu38wmfIXPfRxjTZE', '2024-12-15 02:46:22.253425'),
('nno2d0g2l52vigoz73zwg1anf9jmyg4l', '.eJxVjEEOwiAQRe_C2hCgZaZx6d4zkIEZpGpoUtpV491tky50-997f1OB1qWEtckcRlZX5dTld4uUXlIPwE-qj0mnqS7zGPWh6JM2fZ9Y3rfT_Tso1Mpe5zR0hJQjpt5nIGPAegZOKKZ3JiZPLNaKJwdgBsseDXjM0CHsOqnPF_eNN_Y:1tHYkB:avaBhDzPooy-yOwNDGNKypYWeARr_gRXaTpjVVzpr7M', '2024-12-15 01:27:27.169286'),
('o6b2aiamugc5f3x6k4mviu8ijb80o0bi', '.eJxVjEEOwiAQRe_C2pAiFBiX7j0DGWZAqgaS0q6Md7dNutDtf-_9twi4LiWsPc1hYnERRpx-t4j0THUH_MB6b5JaXeYpyl2RB-3y1ji9rof7d1Cwl612oLVibfOZxhyjyuCTcpnIKcZorAMckSj6gVkZDRY3nwDQeze4lMTnC_TZOEQ:1tHZz2:eNnrIogdke0X5FlmYhpyMAOGOwcfxuOiAmrAAYuVSfI', '2024-12-15 02:46:52.685346'),
('s3w7p4aeuifcg86hwmz0viw25e8pd220', '.eJxVjEEOwiAQAP_C2RAWCFCP3n0DWRZWqoYmpT0Z_64kPeh1ZjIvEXHfatx7WeOcxVmAOP2yhPQobYh8x3ZbJC1tW-ckRyIP2-V1yeV5Odq_QcVex5ZUAtbIVjvD1rKZIBmy2TgVHHgfiqaivOEpe48qBIKi2YQvA5dIvD_SMTdw:1tHRxx:sIkxDPRCeRci94IjfMx4JNeBvOLP0dliJBubYTM-BEE', '2024-12-14 18:13:13.999088'),
('sslkqkwuhrgdjw0j07nqq1ysikhn7tbp', '.eJxVjEEOwiAQRe_C2hCgZaZx6d4zkIEZpGpoUtpV491tky50-997f1OB1qWEtckcRlZX5dTld4uUXlIPwE-qj0mnqS7zGPWh6JM2fZ9Y3rfT_Tso1Mpe5zR0hJQjpt5nIGPAegZOKKZ3JiZPLNaKJwdgBsseDXjM0CHsOqnPF_eNN_Y:1tHS92:LqhP66jcADLdhvSGZzCbBB2F57K5-nlbJPZ8E3_9cOc', '2024-12-14 18:24:40.215163'),
('tr03yg9wavhkkgswyid2fxbug8ytkb8g', '.eJxVjEEOwiAQAP_C2RAWCFCP3n0DWRZWqoYmpT0Z_64kPeh1ZjIvEXHfatx7WeOcxVmAOP2yhPQobYh8x3ZbJC1tW-ckRyIP2-V1yeV5Odq_QcVex5ZUAtbIVjvD1rKZIBmy2TgVHHgfiqaivOEpe48qBIKi2YQvA5dIvD_SMTdw:1tHXxv:qD6TpXxvmPPGOCclh9CA5AguKx1fqwS9MNiRyKMSI3c', '2024-12-15 00:37:35.547923'),
('udpqq41gc92zb2n9vdigdq8f4w1ze2i1', '.eJxVjEEOwiAQRe_C2hCgZaZx6d4zkIEZpGpoUtpV491tky50-997f1OB1qWEtckcRlZX5dTld4uUXlIPwE-qj0mnqS7zGPWh6JM2fZ9Y3rfT_Tso1Mpe5zR0hJQjpt5nIGPAegZOKKZ3JiZPLNaKJwdgBsseDXjM0CHsOqnPF_eNN_Y:1tIrYB:Sw45rPzR27Ndkf_1WwkvNEF44BySGU-iE6dflaov10k', '2024-12-18 15:44:27.017985'),
('v1dzueaqozcvmg4dmnbwb9j193g0xruk', '.eJxVjEEOwiAQAP_C2RAWCFCP3n0DWRZWqoYmpT0Z_64kPeh1ZjIvEXHfatx7WeOcxVmAOP2yhPQobYh8x3ZbJC1tW-ckRyIP2-V1yeV5Odq_QcVex5ZUAtbIVjvD1rKZIBmy2TgVHHgfiqaivOEpe48qBIKi2YQvA5dIvD_SMTdw:1tIrVY:x-DD6A1tf9SalOxcQwZJLbKJn8MRY-fZXLxBDaHK98c', '2024-12-18 15:41:44.399490'),
('v9ql3d6fili84m97n9ioi2fyznvv3zgl', '.eJxVjEEOwiAQRe_C2hCgZaZx6d4zkIEZpGpoUtpV491tky50-997f1OB1qWEtckcRlZX5dTld4uUXlIPwE-qj0mnqS7zGPWh6JM2fZ9Y3rfT_Tso1Mpe5zR0hJQjpt5nIGPAegZOKKZ3JiZPLNaKJwdgBsseDXjM0CHsOqnPF_eNN_Y:1tIrVi:OLZAzYfaFxz-QCC8Ql_DJr_200XTadVdrRrnhFa6pk0', '2024-12-18 15:41:54.586214');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ferreteria_carritoitem`
--

CREATE TABLE `ferreteria_carritoitem` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL CHECK (`cantidad` >= 0),
  `usuario_id` int(11) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ferreteria_cotizacion`
--

CREATE TABLE `ferreteria_cotizacion` (
  `id` bigint(20) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ferreteria_cotizacion`
--

INSERT INTO `ferreteria_cotizacion` (`id`, `correo`, `total`, `fecha`, `usuario_id`) VALUES
(12, '', 1500600.00, '2024-12-01 16:58:34.553441', 4),
(13, '', 833976.00, '2024-12-01 17:14:34.769509', 4),
(14, 'kotaix8404@gmail.com', 272139.00, '2024-12-01 17:16:20.484116', 3),
(15, 'kotaix8404@gmail.com', 12668.00, '2024-12-01 17:19:24.771139', 3),
(16, 'kotaix8404@gmail.com', 16945.00, '2024-12-01 17:20:34.644773', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ferreteria_producto`
--

CREATE TABLE `ferreteria_producto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL CHECK (`stock` >= 0),
  `imagen` varchar(100) DEFAULT NULL,
  `destacado` tinyint(1) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `sku` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ferreteria_producto`
--

INSERT INTO `ferreteria_producto` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `destacado`, `categoria`, `sku`) VALUES
(1, 'Interruptor Simple 9/12 10a Luzica Bticino RefPu1100', 'Placa armada de fácil instalación y con garantía de seguridad. Posee acabado mate lo cuál es suave al tacto y fácil de limpiar. Con bornes tipo prensa aseguran la fiabilidad de la conexión.', 2590.00, 120, 'productos/M_template-bag-1-photoroom-465644_TmWRGVA.png', 0, 'bticino', 'PU1100'),
(2, 'Interruptor Doble 9/15 10a Luzica Bticino Ref Pu1200', 'Placa armada de fácil instalación y con garantía de seguridad. Posee acabado mate lo cuál es suave al tacto y fácil de limpiar. Con bornes tipo prensa aseguran la fiabilidad de la conexión.', 3590.00, 50, 'productos/X_template-bag-1-photoroom-497864.png', 0, 'bticino', 'PU1200'),
(3, 'Interruptor Triple 9/32 10a Luzica Bticino Ref Pu1300', 'Placa armada de fácil instalación y con garantía de seguridad. Posee acabado mate lo cuál es suave al tacto y fácil de limpiar. Con bornes tipo prensa aseguran la fiabilidad de la conexión.', 4590.00, 50, 'productos/X_template-bag-1-photoroom-527714.png', 0, 'bticino', 'PU1300'),
(4, 'Interruptor 9/12 + Toma 10a 250v Luzica Ref Pu1214', 'Placa armada de fácil instalación y con garantía de seguridad. Posee acabado mate lo cuál es suave al tacto y fácil de limpiar. Con bornes tipo prensa aseguran la fiabilidad de la conexión.', 3690.00, 50, 'productos/X_template-bag-1-photoroom-435512.png', 0, 'bticino', 'PU1214'),
(9, 'Placa Armada Pulsador Timbre S44 Carbón Teclón 125x45 mm', 'Queremos inspirarte a crear espacios únicos y acogedores, encontrando todos los materiales que necesitas en un solo lugar. Es por ello, que hemos desarrollado una alianza estratégica con la marca de fabricación nacional SINTHESI, en donde tomamos los interruptores y enchufes como parte del diseño, sin dejar ningún detalle al azar. Su serie S44 y nos brinda los componentes eléctricos necesarios a través de una paleta de colores monocromada y minimalista.', 10590.00, 30, 'productos/3011203-1200-auto.webp', 0, 'synthesi', 'STS-58-0490'),
(10, 'Placa Armada S33 Noir Mate Pulsador Timbre 119x86 mm', 'Queremos inspirarte a crear espacios únicos y acogedores, encontrando todos los materiales que necesitas en un solo lugar. Es por ello, que hemos desarrollado una alianza estratégica con la marca de fabricación nacional SINTHESI, en donde tomamos los interruptores y enchufes como parte del diseño, sin dejar ningún detalle al azar. Su serie S33 y nos brinda los componentes eléctricos necesarios a través de una paleta de colores monocromada y minimalista.', 4990.00, 25, 'productos/3011212-1200-auto.webp', 0, 'synthesi', 'STS-58-0501'),
(11, 'Placa Armada S33 Noir Mate Tomacorriente 10A y Cargador USB 119x86 mm', 'Queremos inspirarte a crear espacios únicos y acogedores, encontrando todos los materiales que necesitas en un solo lugar. Es por ello, que hemos desarrollado una alianza estratégica con la marca de fabricación nacional SINTHESI, en donde tomamos los interruptores y enchufes como parte del diseño, sin dejar ningún detalle al azar. Su serie S33 y nos brinda los componentes eléctricos necesarios a través de una paleta de colores monocromada y minimalista.', 19990.00, 40, 'productos/3011169-1200-auto.webp', 0, 'synthesi', 'STS-58-0508'),
(12, 'Placa Armada S33 Noir Mate Tomacorriente Triple 10A 119x86 mm', 'Queremos inspirarte a crear espacios únicos y acogedores, encontrando todos los materiales que necesitas en un solo lugar. Es por ello, que hemos desarrollado una alianza estratégica con la marca de fabricación nacional SINTHESI, en donde tomamos los interruptores y enchufes como parte del diseño, sin dejar ningún detalle al azar. Su serie S33 y nos brinda los componentes eléctricos necesarios a través de una paleta de colores monocromada y minimalista.', 7990.00, 0, 'productos/3011276-1200-auto.webp', 0, 'synthesi', 'STS-58-0505'),
(13, 'Contratuerca Galvanizada 2\"', '', 190.00, 20, 'productos/imagen-2023-06-19-0759279353437.png', 0, 'tuercas', '58111434'),
(14, 'Contratuerca Metálica 40MM', '', 300.00, 20, 'productos/imagen-2023-06-19-1134130888869.png', 0, 'tuercas', '67882632460568'),
(15, 'Barra de Hilo Corrido X1MT 1/2 GALV G-2', '', 4590.00, 30, 'productos/imagen-2023-06-19-0909143840398.png', 0, 'fijaciones', '1628277621916'),
(16, 'Barra de Hilo Corrido X1MT 1/2 ZINC G-2', '', 4500.00, 30, 'productos/imagen-2023-06-19-0920038350489.png', 0, 'fijaciones', '1628277567761'),
(17, 'Barra de Hilo Corrido X1MT 1/4 ZINC G-2', '', 4890.00, 30, 'productos/imagen-2023-06-19-0922129888946.png', 0, 'fijaciones', '1628278909808'),
(18, 'Barra de Hilo Corrido X1MT 3/4 GALV G-2', '', 5000.00, 30, 'productos/imagen-2023-06-19-0910081933436.png', 0, 'fijaciones', '1628277853531'),
(19, 'Cinta Aisladora Vinilica Temflex 175 3M 19mm X 18Mts Negra', 'La Cinta Electrica de Vinilo 3M™ Temflex™ 175 es una cinta aislante de vinilo de uso general de alto rendimiento de 7 mil de espesor.\r\nEstá diseñada para funcionar en temperaturas ambiente de hasta 194 °F (90 °C). La cinta es adaptable para aplicaciones en climas fríos hasta 19 °F (-7 °C). Tiene una excelente resistencia a la abrasión, la humedad, los álcalis, los ácidos, la corrosión del cobre y las condiciones climáticas variables. La combinación de un respaldo de PVC elástico y un adhesivo a base de caucho sensible a la presión brinda protección eléctrica y mecánica con un volumen mínimo.', 3569.00, 300, 'productos/X_template-bag-1-photoroom-2023-09-20t163807-9036396_uyCJhk1.png', 0, 'complementosaccesorios', '69522892091203'),
(20, 'Cinta Aisladora Vinilica Temflex 175 3M 19mm X 9 Mts Negra', 'La Cinta Electrica de Vinilo 3M™ Temflex™ 175 es una cinta aislante de vinilo de uso general de alto rendimiento de 7 mil de espesor.\r\nEstá diseñada para funcionar en temperaturas ambiente de hasta 194 °F (90 °C). La cinta es adaptable para aplicaciones en climas fríos hasta 19 °F (-7 °C). Tiene una excelente resistencia a la abrasión, la humedad, los álcalis, los ácidos, la corrosión del cobre y las condiciones climáticas variables. La combinación de un respaldo de PVC elástico y un adhesivo a base de caucho sensible a la presión brinda protección eléctrica y mecánica con un volumen mínimo.', 1890.00, 400, 'productos/X_template-bag-1-photoroom-2023-09-20t163831-3276880.png', 0, 'complementosaccesorios', '69522899948957'),
(21, 'Pasacable Cerrado Negro 25.1x19.1 X 28.0 X 11.5mm', 'Pasacable cerrado de inserción a presión, pueden utilizarse para convertir los bordes afilados o irregulares de los agujeros en lisos y aislados gracias a los dientes de fijación. Proporcionan una eficaz protección eléctrica y mecánica para cables, cuerdas y tubos.\r\n\r\n- Convierte los agujeros con bordes en bruto en agujeros lisos y aislados\r\n- Se encaja de forma segura en su sitio\r\n- Aísla y protege los cables mecánicos, las tuberías, etc.', 90.00, 600, 'productos/M_sca0732.png', 0, 'complementosaccesorios', '5000PC3037'),
(22, 'Kit manga termocontraible 100 piezas', 'Kit de manga termo contraíble diseñado para aplicaciones eléctricas, tales como: uniones, terminaciones y conexiones de baja tensión, así como para protección contra el medio ambiente.', 4190.00, 400, 'productos/X_20201007_1928352606.png', 0, 'complementosaccesorios', '1600623886287'),
(23, 'Contactor 40A KNC1 Bobina 220V 3P+1NO 380V Stanford', 'Contactores especialmente diseñados para circuitos de apertura y cierre remotos; para proteger el circuito de sobrecarga cuando se ensambla con relé de sobrecarga térmica.', 20190.00, 250, 'productos/X_template-bag-1-photoroom-2023-08-07t101949-8205946.png', 0, 'contactores', 'KNC1-D40'),
(24, 'Contactor 50A KNC1 Bobina 220V 3P+1NO 380V Stanford', 'Contactores especialmente diseñados para circuitos de apertura y cierre remotos; para proteger el circuito de sobrecarga cuando se ensambla con relé de sobrecarga térmica.', 22950.00, 198, 'productos/X_template-bag-1-photoroom-2023-08-07t102229-5763546.png', 0, 'contactores', 'KNC1-D50'),
(25, 'Contacto Auxiliar', 'Los contactos auxiliares de la serie F4 estan diseñados como accesorios de contactores.', 1890.00, 190, 'productos/X_template-bag-1-photoroom-2023-07-11t120605-4119372.png', 0, 'contactores', '109681'),
(26, 'Contactor GEC1 9A Bobina 220VAC 3P AC3 380V 4KW 1NO MGC', 'Contactor de potencia, con corrientes nominales entre 9 y 95 Amp. La gama de contactores está formada por una familia de 10 aparatos de potencia, subdivididos en 4 tamaños de base. La racional graduación de los calibres permite seleccionar con mejor precisión el contactor, en función de la carga a manipular.\r\nMotores trifásicos hasta 45kW y 380 Volts con partida directa o con partida por\r\nestrella triángulo hasta 75kW. en AC3, donde se pueden utilizar en todos los motores de jaulas de ardilla, ascensores, escaleras mecánicas, transportadores, elevadores, compresores, bombas, mezcladoras, unidades de aire acondicionado, etc.. Están dotados de enganche rápido a riel DIN y también con la alternativa de usar en placa de soporte.', 5890.00, 300, 'productos/X_01-photoroom8450.jpg', 0, 'contactores', 'CONFC0091'),
(27, 'Interruptor Diferencial Dx3 2x25A 30ma Legran Ref 411504', 'Diferencial Bipolar para las necesidades básicas en las obras residenciales. Garantizando la protección contra los cortocircuitos, las sobrecargas y los fallos diferenciales.', 29990.00, 100, 'productos/X_new-template-photoroom-2023-09-04t155811-9546724.png', 0, 'diferenciales', '411504'),
(28, 'Interruptor Diferencial Dx3 2X40A 30MA LEGRAN REF 411505', 'Diferencial Bipolar para las necesidades básicas en las obras residenciales. Garantizando la protección contra los cortocircuitos, las sobrecargas y los fallos diferenciales.', 48690.00, 50, 'productos/X_new-template-photoroom-2023-09-04t155553-4725877.png', 0, 'diferenciales', 'v411505'),
(29, 'Diferencial RX3 2x63A 30ma AC Legrand Ref 402026', 'La nueva gama de interruptores RX³ se presenta para proporcionar una respuesta con respecto a las necesidades básicas en las obras residenciales. Garantizando la protección contra los cortocircuitos, las sobrecargas y los fallos diferenciales.', 47190.00, 198, 'productos/X_new-template-photoroom-2023-04-21t162721-2126645.png', 0, 'diferenciales', '402026'),
(30, 'Diferencial RX3 4x63A 30ma AC Legrand Ref 402064', 'La nueva gama de interruptores RX³ se presenta para proporcionar una respuesta con respecto a las necesidades básicas en las obras residenciales. Garantizando la protección contra los cortocircuitos, las sobrecargas y los fallos diferenciales.', 87090.00, 86, 'productos/X_new-template-photoroom-2023-04-21t160422-1608746_1.png', 0, 'diferenciales', '402064'),
(31, 'Automático Tx3 1x10a 6ka C 230/400v Legrand Ref 403575', 'La nueva gama TX³, con facilidad de instalación, comodidad de cableado y operaciones de mantenimiento optimizadas, presenta numerosas ventajas para ahorrar tiempo en cada etapa de la obra. Los automáticos   TX³ garantizan la máxima protección de los bienes y las personas, posee conexión por bornas protegidas contra los contactos directos.', 6850.00, 40, 'productos/X_new-template-photoroom-2023-07-26t164204-2937397.png', 0, 'automaticos', '403575'),
(32, 'Interruptor Automático KBM 1P + N 6A D 15KA LEXO', 'Interruptor automático termomagnético con capacidad de ruptura de 15kA en curva D, está diseñado para proeger las instalaciones eléctricas de baja tensión ante una falla de sobrecarga de corriente o cortocircuito. Posee indicador frontal de estado: on/off, banda bimetálica de alta calidad y de material autoextinguible. Fácil instalación y cambio en riel DIN de  35mm.', 29289.00, 70, 'productos/X_013876.jpg', 0, 'automaticos', '5700206'),
(33, 'Interruptor Automático KBM 3X6A D 15KA LEXO', 'Interruptor automático termomagnético con capacidad de ruptura de 15kA en curva D, está diseñado para proteger las instalaciones eléctricas de baja tensión ante una falla de sobrecarga de corriente o cortocircuito. Posee indicador frontal de estado: on/off, banda bimetálica de alta calidad y de material autoextinguible. Fácil instalación y cambio en riel DIN de  35mm.', 44190.00, 50, 'productos/X_013636.jpg', 0, 'automaticos', '5700306'),
(34, 'Interruptor Automático KBM 4X16A D 15KA LEXO', 'Interruptor automático termomagnético con capacidad de ruptura de 15kA en curva D, está diseñado para proteger las instalaciones eléctricas de baja tensión ante una falla de sobrecarga de corriente o cortocircuito. Posee indicador frontal de estado: on/off, banda bimetálica de alta calidad y de material autoextinguible. Fácil instalación y cambio en riel DIN de 35mm.', 58569.00, 28, 'productos/X_016148.jpg', 0, 'automaticos', '5700416'),
(35, 'Caja Empalme Para Medidor Enganche Riel Din Stanford', 'Caja de empalme embutidas en plancha de acero, con tratamiento anticorrosivo, fosfatizado y recubrimiento termoconvertible.', 27099.00, 68, 'productos/X_014332.jpg', 0, 'cajasempalme', 'CJEM066'),
(36, 'Caja Empalme Plástica Para Medidor Monofásico con Riel Din', 'La Caja Empalme Plastica para Medidor Monofásico de Vitel Energía es una solución práctica y segura para la conexión y protección del medidor eléctrico en tu hogar o negocio. Este dispositivo es ideal para aquellos que buscan una solución eficiente y segura para su instalación eléctrica.\r\nLa caja empalme es un elemento indispensable para cualquier instalación eléctrica, ya que permite conectar y proteger el medidor eléctrico de manera adecuada. Con esta caja, podrás realizar una conexión segura y estable del medidor, evitando posibles fallos eléctricos y cortocircuitos que puedan poner en riesgo la seguridad de tu hogar o negocio.', 29018.00, 90, 'productos/dise_o_sin_t_tulo_95_.jpg', 0, 'cajasempalme', '0705115718'),
(37, 'Caja para empalme 20x40,6 cm acero', '', 25990.00, 20, 'productos/shopping.webp', 0, 'cajasempalme', '110256786'),
(39, 'Caja Empalme Reducida Plana con Riel', 'Solución compacta y segura para conectar y proteger tu medidor eléctrico. Es esencial para garantizar una conexión estable y prevenir fallos eléctricos. Su diseño eficiente ahorra espacio y su instalación es fácil y rápida. Fabricada con materiales de calidad, ofrece resistencia y durabilidad, asegurando una instalación eléctrica eficiente y segura para tu hogar o negocio.', 48790.00, 90, 'productos/caja_empalme.jpg', 0, 'cajasempalme', '8101200080086'),
(40, 'Caja Distribución Para Tabique Corriente 12 Salidas', 'Caja de distribución para instalaciones. Son cajas universales para todo tipo de materialidades, entregando asi una completa ayuda en la instalación.', 390.00, 290, 'productos/X_new-template-photoroom-2023-05-02t114856-6665854.png', 0, 'cajas', '15999254895303'),
(41, 'Caja Distribución Para Concreto Oreja Metal 10 Salidas', 'Caja de distribución para instalaciones. Son cajas universales para todo tipo de materialidades, entregando así una completa ayuda en la instalación.', 390.00, 200, 'productos/X_template-bag-1-photoroom-2024-02-15t125115-6518452.jpg', 0, 'cajas', '51578'),
(42, 'Caja Embutida Para Tabique Pvc Oreja Metálica 503t Naranjo', 'La Caja Embutida Para Tabique PVC Oreja Metálica 503T Naranjo-Vitel Energía es un elemento fundamental en cualquier instalación eléctrica. Este producto es ideal para su uso en tabiques, permitiendo la instalación de enchufes y conmutadores en cualquier pared. Además, su construcción en PVC de alta calidad, junto con la oreja metálica, asegura una protección y seguridad eléctrica óptimas.\r\nLa caja embutida cuenta con un diseño práctico y sencillo de instalar, lo que la hace perfecta tanto para profesionales como para aquellos que desean realizar su propia instalación eléctrica. Su sistema de fijación permite una rápida y fácil instalación en cualquier tabique.', 537.00, 100, 'productos/caja_embutida_naranja_2.jpg', 0, 'cajas', '0700016020'),
(43, 'Caja Embutida Pvc Albañilería Oreja Metálica Amarillo 503l', 'La Caja Embutida PVC Albañilería Oreja Metálica Amarillo 503L es un producto diseñado especialmente para proyectos de construcción. Esta caja de distribución eléctrica está fabricada con materiales de alta calidad, lo que garantiza su durabilidad y resistencia.\r\nSu diseño ergonómico facilita la instalación, lo que a su vez ayuda a ahorrar tiempo y espacio. Además, su oreja metálica permite una fijación firme a la pared, asegurando su estabilidad y seguridad.', 1480.00, 50, 'productos/caja_embutida_pvc_amarilla_2.jpg', 0, 'cajas', '0700016010'),
(44, 'Caja CTR PAU Embutida 2 puertas 600X500X80 FNX', 'Caja de terminación de red PAU, Embutida 600X500X80 FNX, 2 puertas.', 123990.00, 4, 'productos/X_imagen-2023-06-07-1559186021322.png', 0, 'gabinetes', '116050834'),
(45, 'Gabinete Metálico 1 Puerta 300X200X150MM', 'Gabinete metálico IP65, 1 puerta, 300x200x150mm.', 38900.00, 10, 'productos/X_gabinete-metalico-ip65-1-puerta-300x200x150mm4422.jpg', 0, 'gabinetes', '66949606096101'),
(46, 'Gabinete Metálico 2 Puertas 800X800X250MM', 'Gabinete metálico IP65, 2 puertas, 800x800x250mm.', 39990.00, 5, 'productos/X_imagen-2023-06-07-11121909413923580.png', 0, 'gabinetes', '1646077034075'),
(47, 'Caja CTR PAU Embutida 1 puerta 300X400X80MM FNX', 'Caja de terminación de red PAU, Embutida 300X400X80 FNX, 1 puerta.', 15990.00, 15, 'productos/X_imagen-2023-06-07-1609232415418.png', 0, 'gabinetes', '116050835'),
(48, 'Tablero Plástico Embutido 8 Circuitos Puerta Transparente', 'Tablero de PVC diseñado para distribuir la energía eléctrica y para el montaje de los elementos de protección de una instalación tipo riel DIN.', 9190.00, 24, 'productos/X_new-template-photoroom-photoroom-656462.png', 0, 'tablerosembutido', '15999749503928'),
(49, 'Tablero embutido 4cc Forceman', 'Tablero de PVC diseñado para distribuir la energía eléctrica y para el montaje de los elementos de protección de una instalación tipo riel DIN.', 5290.00, 30, 'productos/X_new-template-photoroom-photoroom-753107.png', 0, 'tablerosembutido', 'LWDF-4'),
(50, 'Tablero embutido 6cc 30/c Forceman', 'Tablero de PVC diseñado para distribuir la energía eléctrica y para el montaje de los elementos de protección de una instalación tipo riel DIN.', 6390.00, 40, 'productos/X_new-template-photoroom-photoroom-796839.png', 0, 'tablerosembutido', 'LWDF-6'),
(51, 'Tablero embutido 18cc Forceman', 'Tablero de PVC diseñado para distribuir la energía eléctrica y para el montaje de los elementos de protección de una instalación tipo riel DIN.', 16990.00, 15, 'productos/X_new-template-photoroom-photoroom-916395.png', 0, 'tablerosembutido', 'LWDF-18'),
(52, 'Tablero Exterior Sobrepuesto 5 Circuitos Estanco Ip 65', 'El tablero sobrepuesto de uso en intemperie, está diseñado para distribuir la energía eléctrica y para el montaje de los elementos de protección de una instalación tipo riel DIN. Puedo ser aplicado en sector residencial para uso en intemperie, sector comercial, áreas húmedas con una gran porcentaje de humedad.', 7290.00, 10, 'productos/X_new-template-photoroom-543410.png', 0, 'tablerossobrepuesto', '107932'),
(53, 'Tablero Exterior Sobrepuesto 8 Circuitos Estanco Ip 65', 'El tablero sobrepuesto de uso en intemperie, está diseñado para distribuir la energía eléctrica y para el montaje de los elementos de protección de una instalación tipo riel DIN. Puedo ser aplicado en sector residencial para uso en intemperie, sector comercial, áreas húmedas con una gran porcentaje de humedad.', 9990.00, 30, 'productos/X_new-template-photoroom-2023-06-07t093823-8472031.png', 0, 'tablerossobrepuesto', '107933'),
(54, 'Tablero Exterior Sobrepuesto 12 Circuitos Estanco Ip65', 'El tablero sobrepuesto de uso en intemperie, está diseñado para distribuir la energía eléctrica y para el montaje de los elementos de protección de una instalación tipo riel DIN. Puedo ser aplicado en sector residencial para uso en intemperie, sector comercial, áreas húmedas con una gran porcentaje de humedad.', 17450.00, 25, 'productos/X_new-template-photoroom-2023-06-07t093937-8705274.png', 0, 'tablerossobrepuesto', '107934'),
(55, 'Tablero Exterior Sobrepuesto 15 Circuitos Estanco Ip65', 'El tablero sobrepuesto de uso en intemperie, está diseñado para distribuir la energía eléctrica y para el montaje de los elementos de protección de una instalación tipo riel DIN. Puedo ser aplicado en sector residencial para uso en intemperie, sector comercial, áreas húmedas con una gran porcentaje de humedad.', 18950.00, 14, 'productos/X_new-template-photoroom-604827.png', 0, 'tablerossobrepuesto', '107935'),
(56, 'TNAKIEX', 'Interruptor Luz Pared Inteligente Wifi 2 Vías,color Opcional', 49900.00, 10, 'productos/shopping_JjOaGYq.webp', 0, 'smarthome', '116296350'),
(57, 'Cable Eva 10mm LH Evaflex (h07z1-k) 100 Mts', 'El cable Eva o EVAFLEX es la alternativa libre de halógenos son cables maleables de cobre flexible, con aislación de compuesto termoplástico con baja emisión de humos y gases corrosivos. La principal característica es su capacidad de no propagar las llamas en caso de incendio, a su vez que no emite gases halógenos (flúor, cloro, bromo, yodo, astato y teneso) que son altamente tóxicos e inclusivo mortales. En caso de combustión genera una baja emisión de humos permitiendo mantener la visibilidad para evacuar a las personas que se encuentran en el incendio.', 194690.00, 80, 'productos/X_x_2825005_14686990506.jpg', 0, 'cablesevaflex', '65706914928948'),
(58, 'Cable Eva 6mm LH Evaflex (h07z1-k) 100 Mts', 'El cable Eva o EVAFLEX es la alternativa libre de halógenos son cables maleables de cobre flexible, con aislación de compuesto termoplástico con baja emisión de humos y gases corrosivos. La principal característica es su capacidad de no propagar las llamas en caso de incendio, a su vez que no emite gases halógenos (flúor, cloro, bromo, yodo, astato y teneso) que son altamente tóxicos e inclusivo mortales. En caso de combustión genera una baja emisión de humos permitiendo mantener la visibilidad para evacuar a las personas que se encuentran en el incendio.', 108490.00, 4, 'productos/X_x_evablanco20212744.jpg', 0, 'cablesevaflex', '65706914898028'),
(59, 'Cable Eva 4mm LH Evaflex (h07z1-k) 100 Mts', 'El cable Eva o EVAFLEX es la alternativa libre de halógenos son cables maleables de cobre flexible, con aislación de compuesto termoplástico con baja emisión de humos y gases corrosivos. La principal característica es su capacidad de no propagar las llamas en caso de incendio, a su vez que no emite gases halógenos (flúor, cloro, bromo, yodo, astato y teneso) que son altamente tóxicos e inclusivo mortales. En caso de combustión genera una baja emisión de humos permitiendo mantener la visibilidad para evacuar a las personas que se encuentran en el incendio.', 73900.00, 30, 'productos/X_x_cabthh17200386991720.jpg', 0, 'cablesevaflex', '65706914861411'),
(60, 'Cable Eva 2,5mm LH Evaflex (h07z1-k) 100 Mts', 'El cable Eva o EVAFLEX es la alternativa libre de halógenos son cables maleables de cobre flexible, con aislación de compuesto termoplástico con baja emisión de humos y gases corrosivos. La principal característica es su capacidad de no propagar las llamas en caso de incendio, a su vez que no emite gases halógenos (flúor, cloro, bromo, yodo, astato y teneso) que son altamente tóxicos e inclusivo mortales. En caso de combustión genera una baja emisión de humos permitiendo mantener la visibilidad para evacuar a las personas que se encuentran en el incendio.', 46100.00, 67, 'productos/X_x_evanegro20211106.jpg', 0, 'cablesevaflex', '65706914814213'),
(61, 'Tuberia PVC Conduit 25MM x3MTS (Clase III)', 'Conduit rígido aislante no metálico de pared exterior e interior lisa fabricados íntegramente con PVC rígido (no plastificado).\r\nAdecuados para la conducción de cables eléctricos en instalaciones a la vista debido a sus buenas características en lo referente a resistencia a compresiones, impactos, rigidez dieléctrica y resistencia de aislamiento.)', 1190.00, 140, 'productos/tubo-pvc-conduit-tigre-naranjo-3-metros.jpg', 0, 'tuberiaspvc', '1631802201935'),
(62, 'Tubo conduit PVC 40mm 3mts', 'Conduit rígido aislante no metálico de pared exterior e interior lisa fabricados íntegramente con PVC rígido (no plastificado).\r\nAdecuados para la conducción de cables eléctricos en instalaciones a la vista debido a sus buenas características en lo referente a resistencia a compresiones, impactos, rigidez dieléctrica y resistencia de aislamiento.', 2350.00, 100, 'productos/tubo-pvc-conduit-tigre-naranjo-3-metros_FWUT3N8.jpg', 0, 'tuberiaspvc', '1620434511744'),
(63, 'Tubo conduit PVC 16mm 3mts', 'Conduit rígido aislante no metálico de pared exterior e interior lisa fabricados íntegramente con PVC rígido (no plastificado).\r\nAdecuados para la conducción de cables eléctricos en instalaciones a la vista debido a sus buenas características en lo referente a resistencia a compresiones, impactos, rigidez dieléctrica y resistencia de aislamiento.', 690.00, 230, 'productos/tubo-pvc-conduit-tigre-naranjo-3-metros_V7tXrXq.jpg', 0, 'tuberiaspvc', '16000158408249'),
(64, 'Tubo conduit PVC 32mm 3mts', 'Conduit rígido aislante no metálico de pared exterior e interior lisa fabricados íntegramente con PVC rígido (no plastificado).\r\nAdecuados para la conducción de cables eléctricos en instalaciones a la vista debido a sus buenas características en lo referente a resistencia a compresiones, impactos, rigidez dieléctrica y resistencia de aislamiento.', 1488.00, 127, 'productos/tubo-pvc-conduit-tigre-naranjo-3-metros_ukMjvae.jpg', 0, 'tuberiaspvc', '16000158411423'),
(65, 'Curva 90° pvc 40mm', 'Accesorio curvo para canalización eléctrica en PVC. Fácil y práctico de instalar, los caños se encastran mediante un sistema mecánico sencillo, se unen mediante presión.', 590.00, 320, 'productos/X_1111043011_11798.jpg', 0, 'curvaspvc', '1620435062953'),
(66, 'Curva 90° PVC 63MM', 'Accesorio curvo para canalización eléctrica en PVC. Fácil y práctico de instalar, los caños se encastran mediante un sistema mecánico sencillo, se unen mediante presión.', 2490.00, 90, 'productos/X_1111043011_11798_AuDKN9n.jpg', 0, 'curvaspvc', '69246676832998'),
(67, 'Curva 90° PVC 75MM', 'Accesorio curvo para canalización eléctrica en PVC. Fácil y práctico de instalar, los caños se encastran mediante un sistema mecánico sencillo, se unen mediante presión.', 4190.00, 48, 'productos/X_1111043011_11798_OQ37Rvl.jpg', 0, 'curvaspvc', '69246676855482'),
(68, 'Curva 90° PVC 90MM', 'Accesorio curvo para canalización eléctrica en PVC. Fácil y práctico de instalar, los caños se encastran mediante un sistema mecánico sencillo, se unen mediante presión.', 5990.00, 23, 'productos/X_1111043011_11798_qF9MEaV.jpg', 0, 'curvaspvc', '69246676859255'),
(69, 'Abrazadera PVC omega 16mm', 'Accesorio conduit diseñado para asegurar tuberías en disposición vertical u horizontal.\r\nUso: conexiones y fitting en general.', 50.00, 487, 'productos/X_abrazadera16mm7883.jpg', 0, 'abrazaderaspvc', '64884945037406'),
(70, 'Abrazadera PVC omega 20mm', 'Accesorio conduit diseñado para asegurar tuberías en disposición vertical u horizontal.\r\nUso: conexiones y fitting en general.', 80.00, 200, 'productos/X_abrazadera16mm7883_lSTxfxB.jpg', 0, 'abrazaderaspvc', '64884945064740'),
(71, 'Abrazadera PVC omega 25mm', 'Accesorio conduit diseñado para asegurar tuberías en disposición vertical u horizontal.\r\nUso: conexiones y fitting en general.', 100.00, 278, 'productos/X_abrazadera16mm7883_v2SNpKx.jpg', 0, 'abrazaderaspvc', '64884945097121'),
(72, 'Abrazadera PVC omega 40mm', 'Accesorio conduit diseñado para asegurar tuberías en disposición vertical u horizontal.\r\nUso: conexiones y fitting en general.', 350.00, 89, 'productos/X_x-photoroom-20220804-11580594325348.png', 0, 'abrazaderaspvc', '66672541310776'),
(73, 'Tuberia EMT 25MM', 'La Tubería Metálica EMT Rígida 20mmx3mts IEC es un conduit de alta calidad y resistente, diseñado para proteger y asegurar cables eléctricos en instalaciones residenciales, comerciales e industriales. Esta tubería metálica ofrece una solución segura y duradera para sus proyectos, garantizando un resultado óptimo y eficiente en el tiempo.', 5790.00, 137, 'productos/X_imagen-2023-06-23-0807273922482.png', 0, 'tuberiasemt', '1639681854942'),
(74, 'Tubería Metálica EMT Rígida 25mm x 3 Mts IEC 4422', 'La Tubería Metálica EMT Rígida 25mm x3mts IEC es un conduit de alta calidad y resistente, diseñado para proteger y asegurar cables eléctricos en instalaciones residenciales, comerciales e industriales. Esta tubería metálica ofrece una solución segura y duradera para sus proyectos, garantizando un resultado óptimo y eficiente en el tiempo.', 8336.00, 40, 'productos/X_imagen-2023-06-23-0807273922482_1Vj1bqK.png', 0, 'tuberiasemt', '1100541110PG'),
(75, 'Tubería Metálica EMT Rígida 32mm x 3 Mts IEC 4422', 'La Tubería Metálica EMT Rígida 32mm x3mts IEC es un conduit de alta calidad y resistente, diseñado para proteger y asegurar cables eléctricos en instalaciones residenciales, comerciales e industriales. Esta tubería metálica ofrece una solución segura y duradera para sus proyectos, garantizando un resultado óptimo y eficiente en el tiempo.', 13255.00, 84, 'productos/X_imagen-2023-06-23-0807273922482_2imuhBZ.png', 0, 'tuberiasemt', '1100541115'),
(76, 'Tubería Metálica EMT Rígida 50mm x 3 Mts IEC 4422', 'La Tubería Metálica EMT Rígida 50mm x3mts IEC es un conduit de alta calidad y resistente, diseñado para proteger y asegurar cables eléctricos en instalaciones residenciales, comerciales e industriales. Esta tubería metálica ofrece una solución segura y duradera para sus proyectos, garantizando un resultado óptimo y eficiente en el tiempo.', 21262.00, 42, 'productos/X_imagen-2023-06-23-0807273922482_yPlm4oT.png', 0, 'tuberiasemt', '1100541125'),
(77, 'Terminal EMT 25 MM', 'El Terminal Galvanizado para Conduit EMT 25mm IEC es un accesorio de alta calidad diseñado para ser utilizado en sistemas eléctricos. Este accesorio está fabricado con materiales de alta calidad y acabado Galvanizado , lo que le brinda una excelente resistencia a la corrosión y a las inclemencias del tiempo.', 446.00, 40, 'productos/terminal-electrogalvanizado-para-conduit-emt-25mm-iec-power-duct.jpg', 0, 'terminalesemt', '1107541232'),
(78, 'Terminal EMT 32 MM', 'Dale el toque final a tus instalaciones eléctricas con la Terminal para tubo metálico EMT 32 mm de Lexo. Fabricada en acero galvanizado, esta terminal de 32 mm de largo y ancho, y 40 mm de alto, asegura una conexión segura y confiable para tus proyectos. Su diseño robusto y fácil instalación la convierten en la opción ideal para profesionales y aficionados.', 890.00, 65, 'productos/terminal-electrogalvanizado-para-conduit-emt-25mm-iec-power-duct_o7IvoFP.jpg', 0, 'terminalesemt', '110216313'),
(79, 'Curva Tuberia Emt 20mm', 'Accesorio para Conduit EMT 20mm IEC de alta calidad diseñado para ser utilizado en sistemas eléctricos, fabricado con materiales de alta calidad y acabado Galvanizado, lo que le brinda una excelente resistencia a la corrosión y a las inclemencias del tiempo.', 850.00, 23, 'productos/X_02898_producto01x00088.jpg', 0, 'curvasemt', '15999426863156'),
(80, 'Curva Tuberia Emt 25mm', 'Accesorio para Conduit EMT 25mm IEC de alta calidad diseñado para ser utilizado en sistemas eléctricos, fabricado con materiales de alta calidad y acabado Galvanizado, lo que le brinda una excelente resistencia a la corrosión y a las inclemencias del tiempo.', 990.00, 45, 'productos/X_02898_producto01x00088_ljymaem.jpg', 0, 'curvasemt', '15999426864843'),
(81, 'Curva Tuberia Emt 32mm', 'Accesorio para Conduit EMT 32mm IEC de alta calidad diseñado para ser utilizado en sistemas eléctricos, fabricado con materiales de alta calidad y acabado Galvanizado, lo que le brinda una excelente resistencia a la corrosión y a las inclemencias del tiempo.', 1350.00, 45, 'productos/X_02898_producto01x00088_tgUsgYd.jpg', 0, 'curvasemt', '15999426865493'),
(82, 'Copla Tuberia Emt 20mm', 'Accesorio para Conduit EMT 20mm IEC de alta calidad diseñado para ser utilizado en sistemas eléctricos, fabricado con materiales de alta calidad y acabado Galvanizado, lo que le brinda una excelente resistencia a la corrosión y a las inclemencias del tiempo.\r\nEste accesorio cuenta con un sistema de acople rápido que permite unir dos tubos, o un tubo a una curva, con solo apretar los tornillos de fijación insertos en la copla. Esto elimina la necesidad de roscar los extremos, lo que significa que puedes instalarlo de manera rápida y fácil, ahorrando tiempo y esfuerzo', 350.00, 34, 'productos/X_coplaemt208847.png', 0, 'coplasemt', 'ESCP-20S'),
(83, 'Copla Tuberia Emt 25mm', 'Accesorio para Conduit EMT 25mm IEC de alta calidad diseñado para ser utilizado en sistemas eléctricos, fabricado con materiales de alta calidad y acabado Galvanizado, lo que le brinda una excelente resistencia a la corrosión y a las inclemencias del tiempo.\r\nEste accesorio cuenta con un sistema de acople rápido que permite unir dos tubos, o un tubo a una curva, con solo apretar los tornillos de fijación insertos en la copla. Esto elimina la necesidad de roscar los extremos, lo que significa que puedes instalarlo de manera rápida y fácil, ahorrando tiempo y esfuerzo.', 450.00, 45, 'productos/X_coplaemt208847_imj5RGt.png', 0, 'coplasemt', 'ESCP-25S'),
(84, 'Copla Tuberia Emt 32mm', 'Accesorio para Conduit EMT 32mm IEC de alta calidad diseñado para ser utilizado en sistemas eléctricos, fabricado con materiales de alta calidad y acabado Galvanizado, lo que le brinda una excelente resistencia a la corrosión y a las inclemencias del tiempo.', 750.00, 120, 'productos/X_photoroom-20220801_1629216552.jpg', 0, 'coplasemt', '15999404955860'),
(85, 'Conector HUB 1\" ANSI.C.80 FNX', 'Es un dispositivo que permite conectar equipos y dispositivos en red. Esa red puede ser local (LAN) y mantenerla así o conectarla a su vez a Internet.', 2006.00, 34, 'productos/X_imagen-2023-06-30-1113248602648.png', 0, 'conectorhub', '5417420334'),
(86, 'Conector HUB 1.1/2 ANSI.C.80 FNX', 'Es un dispositivo que permite conectar equipos y dispositivos en red. Esa red puede ser local (LAN) y mantenerla así o conectarla a su vez a Internet.', 4590.00, 34, 'productos/X_imagen-2023-06-30-1131548622798.png', 0, 'conectorhub', '417420534'),
(87, 'Conector HUB 1.1/4\" ANSI.C.80', 'Es un dispositivo que permite conectar equipos y dispositivos en red. Esa red puede ser local (LAN) y mantenerla así o conectarla a su vez a Internet.', 7190.00, 55, 'productos/X_imagen-2023-06-30-1109248833042.png', 0, 'conectorhub', '1635882386112'),
(88, 'Conector MET Recto EMT a Flexible 25MM', 'Permite cierto grado de movimiento o flexibilidad. Esta característica es especialmente útil para evitar daños al cableado en caso de movimientos o vibraciones imprevistas del edificio o la estructura.', 1092.00, 62, 'productos/X_imagen-2023-06-30-1204027601122.png', 0, 'conectormet', 'CONEF-25'),
(89, 'Conector MET Recto EMT a Flexible 20MM', 'Permite cierto grado de movimiento o flexibilidad. Esta característica es especialmente útil para evitar daños al cableado en caso de movimientos o vibraciones imprevistas del edificio o la estructura.', 819.00, 23, 'productos/X_imagen-2023-06-30-1204027601122_tqZQf65.png', 0, 'conectormet', '71016736879615'),
(90, 'Conector Recto Para Flexible 32MM', 'Pieza de ingeniería esencial en la conexión de tubos flexibles o extra flexibles metálicos. Su fabricación en acero, junto con su diseño recto y su adaptabilidad a diversas aplicaciones, lo convierten en una opción indispensable para una amplia variedad de industrias.', 15000.00, 25, 'productos/D_NQ_NP_2X_601472-MLC75707568041_042024-F.webp', 0, 'conectormet', 'CONECTOR RECTO 32'),
(91, 'Conector Recto Para Flexible 40MM', 'Pieza de ingeniería esencial en la conexión de tubos flexibles o extra flexibles metálicos. Su fabricación en acero, junto con su diseño recto y su adaptabilidad a diversas aplicaciones, lo convierten en una opción indispensable para una amplia variedad de industrias.', 23190.00, 15, 'productos/D_NQ_NP_2X_601472-MLC75707568041_042024-F_MBM5GXG.webp', 0, 'conectormet', 'CONECTOR RECTO 40'),
(92, 'Caja Metalica 150x150x100MM', 'Caja pre galvanizada de 150x150x100mm', 3927.00, 45, 'productos/X_imagen-2023-06-23-0821096010494.png', 0, 'cajasemt', '66267412544140'),
(93, 'Caja Metalica 200x200x100MM', 'Caja pre galvanizada de 200x200x100mm', 10990.00, 34, 'productos/X_imagen-2023-06-23-0826144025685.png', 0, 'cajasemt', '66267443058199'),
(94, 'Caja Metalica 200x100x100MM', 'Caja pre galvanizada de 200x100x100mm', 3496.00, 30, 'productos/X_imagen-2023-06-23-0825329654327.png', 0, 'cajasemt', '66267451530228'),
(95, 'Caja Metalica 100x100x65MM', 'Caja pre galvanizada de 100x100x65mm', 1642.00, 45, 'productos/X_imagen-2023-06-23-0813062127412.png', 0, 'cajasemt', '1646221304857'),
(96, 'Abrazadera Clamp EMT 1\" FNX', 'Abrazadera zincada con perno y tuerca con sistema de anclaje para canalización de instalaciones eléctricas.', 490.00, 60, 'productos/X_imagen-2023-06-22-1703248356723.png', 0, 'abrazaderasemt', '8131234'),
(97, 'Abrazadera Clamp EMT 1/2\" FNX', 'Abrazadera zincada con perno y tuerca con sistema de anclaje para canalización de instalaciones eléctricas.', 700.00, 12, 'productos/X_imagen-2023-06-22-1704192921748.png', 0, 'abrazaderasemt', '8130434'),
(98, 'Abrazadera Clamp EMT 3/4\" FNX', 'Abrazadera zincada con perno y tuerca con sistema de anclaje para canalización de instalaciones eléctricas.', 810.00, 45, 'productos/X_imagen-2023-06-22-1726062058791.png', 0, 'abrazaderasemt', '1635881750782'),
(99, 'Abrazadera RUC 1\"', 'Abrazadera con perno y tuerca con sistema de anclaje para canalización de instalaciones eléctricas.', 293.00, 32, 'productos/X_imagen-2023-06-30-1646237881470.png', 0, 'abrazaderasemt', '67215124489849'),
(100, 'Tuberia Conduit Flexible Reforzado Acero/Pvc 40mm x MTS', 'Tubo conduit certificado fabricado en acero flexible con revestimiento de PVC, ideal para proteger conductores eléctricos para cualquier tipo de instalación, interior o exterior, que requieran una mayor maniobrabilidad en su canalización.', 7760.00, 46, 'productos/X_1207097590.jpg', 0, 'tuberiasflexibles_accesorios', '120709'),
(101, 'Tuberia Conduit flexible metal/pvc 63mm Rollo 20 mts', 'Tubo flexible metálico con cubierta de PVC. Canalización de sección circular hecha de una banda metálica preformada y enrollada helicoidalmente. Cubierta de policloruro de vinilo PVC, resistente a líquidos y sustancias químicas, con propiedades aislantes, autoextinguible, no propagante a la llama.\r\nAplicación: Protección de conductores eléctricos de agentes mecánicos (vibraciones, torsión, aplastamiento).', 148790.00, 32, 'productos/X_x_conduit-flexible-metalico-revestido-en-pvc-2-bme66746893.jpg', 0, 'tuberiasflexibles_accesorios', '1650405382653'),
(102, 'Conector MET Curvo Flex 20MM', 'Unir flexible metálico a salida de motores, cajas de derivación, tableros eléctricos, donde los conductores requieran protección contra vibraciones, torsión, aplastamiento, líquidos, vapores, polvos y fibras presentes en el ambiente.', 1380.00, 56, 'productos/X_imagen-2023-06-30-1558405448556.png', 0, 'tuberiasflexibles_accesorios', 'CONECTOR CURVO 20'),
(103, 'Conector MET Curvo Flex 40MM', 'Unir flexible metálico a salida de motores, cajas de derivación, tableros eléctricos, donde los conductores requieran protección contra vibraciones, torsión, aplastamiento, líquidos, vapores, polvos y fibras presentes en el ambiente.', 3520.00, 48, 'productos/X_imagen-2023-06-30-1558405448556_HHmqPWN.png', 0, 'tuberiasflexibles_accesorios', 'CONECTOR CURVO 40'),
(104, 'Tubo galvanizado 20 mm x 3 mts ansi 80.1', 'Tubería metálica rígida de acero galvanizado por inmersión en caliente, fabricada de acuerdo a las normas IEC 61386-1 e IEC 61386-21. La superficie interior y exterior se proporciona con una pista continua y suave para facilitar la canalización de conductores eléctricos. Cuenta con roscas e incluye copla en uno de sus extremos. Su excelente ductilidad facilita la instalación mediante diversos accesorios. Está diseñado para proteger cables eléctricos en instalaciones exteriores de trabajo pesado.', 10950.00, 55, 'productos/X_tuberiagalvanida1182.jpg', 0, 'galvanizado', '64381620615309'),
(105, 'Tubo galvanizado 32 mm x 3 mts ANSI 80.1', 'Tubería metálica rígida de acero galvanizado por inmersión en caliente, fabricada de acuerdo a las normas IEC 61386-1 e IEC 61386-21. La superficie interior y exterior se proporciona con una pista continua y suave para facilitar la canalización de conductores eléctricos. Cuenta con roscas e incluye copla en uno de sus extremos. Su excelente ductilidad facilita la instalación mediante diversos accesorios. Está diseñado para proteger cables eléctricos en instalaciones exteriores de trabajo pesado.', 17490.00, 43, 'productos/X_tuberiagalvanida1182_fUhaLPc.jpg', 0, 'galvanizado', '64381620619386'),
(106, 'Pie Rack Galvanizado Pesado Galv 1 Via', 'Soporte remate pesado de acero galvanizado de 1 via', 5150.00, 78, 'productos/X_template-bag-1-photoroom-2023-08-04t134839-4084510.png', 0, 'galvanizado', '2502260'),
(107, 'Alambre galvanizado N°18 1 kilo', 'Alambre galvanizado utilizado principalmente en la industria de la construcción para el amarre de herradura, pilares, cadenas y fundaciones por su adecuada elongación.', 3790.00, 87, 'productos/X_524912-12419.jpg', 0, 'galvanizado', '1630708067143'),
(108, 'INTERRUPTOR SIMPLE 9/12 MÁS TOMA CORRIENTE 10A 250V CAFÉ ARMADO TITANIO', 'Los conjuntos armados son con placa de tecnopolímero, en terminación metalizada mate para los\r\nconjuntos color café/titanio.\r\nLa Línea Domiciliaria de Lexo Electric certcada,\r\nbajo las Normas IEC 60884-1:2006 y CEI\r\n23-50:2007-03, entre otras.\r\nPara los comandos: IEC 60669-1:2007 y\r\nNCh2011Of.2009, entre otras.', 3990.00, 50, 'productos/5380130E_890eaee8-e28e-4a70-bd48-755e39272ee6.webp', 1, 'lexo', '5380130E'),
(109, 'INTERRUPTOR PULSADOR TIMBRE TECLON 73 MM 10A 250V CAFÉ ARMADO', 'Los conjuntos armados son con placa de tecnopolímero, en terminación metalizada mate para los\r\nconjuntos color café/titanio.\r\nLa Línea Domiciliaria de Lexo Electric certcada,\r\nbajo las Normas IEC 60884-1:2006 y CEI\r\n23-50:2007-03, entre otras.\r\nPara los comandos: IEC 60669-1:2007 y\r\nNCh2011Of.2009, entre otras.', 4590.00, 50, 'productos/1331.webp', 1, 'lexo', '5380037E'),
(110, 'INTERRUPTOR SIMPLE 9/12 10A 250V CAFÉ ARMADO TITANIO', 'Los conjuntos armados son con placa de tecnopolímero, en terminación metalizada mate para los\r\nconjuntos color café/titanio.\r\nLa Línea Domiciliaria de Lexo Electric certcada,\r\nbajo las Normas IEC 60884-1:2006 y CEI\r\n23-50:2007-03, entre otras.\r\nPara los comandos: IEC 60669-1:2007 y\r\nNCh2011Of.2009, entre otras.', 2490.00, 50, 'productos/5380125E_a6071ecd-8aee-4415-a6a1-f1f9f850413c.webp', 1, 'lexo', '5380125E'),
(111, 'INTERRUPTOR TRIPLE 9/32 10A 250V CAFÉ ARMADO TITANIO', 'Los conjuntos armados son con placa de tecnopolímero, en terminación metalizada mate para los\r\nconjuntos color café/titanio.\r\nLa Línea Domiciliaria de Lexo Electric certcada,\r\nbajo las Normas IEC 60884-1:2006 y CEI\r\n23-50:2007-03, entre otras.\r\nPara los comandos: IEC 60669-1:2007 y\r\nNCh2011Of.2009, entre otras.', 4990.00, 50, 'productos/toma-de-corriente-triplex-10a-250v-cafe-titanio.jpg', 1, 'lexo', '5380127E'),
(112, 'Enchufe Simple 10A 250V + Toma USB Café Stanford', 'Las placas armadas de la línea Stanford, compuestos de aluminio lo que lo hace muy resistente a los golpes.\r\nEstá compuesto por un interruptor que le permite el control de ON/OFF (conexión y desconexión) de la corriente eléctrica en toda clase de circuitos eléctricos con cargas resistivas e inductivas.', 4990.00, 30, 'productos/Mesa-de-trabajo-1-copia-15-4-1.jpg', 0, 'stanford', '4948'),
(113, 'Toma Red Computación STANFORD Café', 'Las placas armadas de la línea Stanford, compuestos de aluminio lo que lo hace muy resistente a los golpes.\r\n\r\nEstá compuesto por un interruptor que le permite el control de ON/OFF (conexión y desconexión) de la corriente eléctrica en toda clase de circuitos eléctricos con cargas resistivas e inductivas.', 2500.00, 50, 'productos/Mesa-de-trabajo-1-copia-12-4-1.jpg', 0, 'stanford', '4943'),
(114, 'Interruptor Simple (9/12) + Enchufe Simple 10A 250V Stanford Cafe', 'Las placas armadas de la línea Stanford, compuestos de aluminio lo que lo hace muy resistente a los golpes.\r\nEstá compuesto por un interruptor que le permite el control de ON/OFF (conexión y desconexión) de la corriente eléctrica en toda clase de circuitos eléctricos con cargas resistivas e inductivas.', 3690.00, 50, 'productos/Mesa-de-trabajo-1-copia-7-16.jpg', 0, 'stanford', '4915'),
(115, 'Enchufe Triple 10A 250V STANFORD Café', 'Las placas armadas de la línea Stanford, compuestos de aluminio lo que lo hace muy resistente a los golpes.\r\nEstá compuesto por un interruptor que le permite el control de ON/OFF (conexión y desconexión) de la corriente eléctrica en toda clase de circuitos eléctricos con cargas resistivas e inductivas.', 4690.00, 50, 'productos/Mesa-de-trabajo-1-copia-7-4-1.jpg', 0, 'stanford', '4918'),
(116, 'ENCHUFE INDUSTRIAL IP67, LIBRE DE HALOGENOS, HEMBRA SOBREPUESTA, 380V, 16A, 3P+T, BEMIS 6110435 Bemis', 'El enchufe industrial de Bemis ofrece una solución resistente y segura para aplicaciones eléctricas en entornos industriales y comerciales. Con clasificación IP67, es resistente al polvo y al agua, lo que lo hace adecuado para su uso en condiciones adversas. La capacidad de corriente de 16A y la configuración de 3P+T lo hacen ideal para una variedad de equipos y maquinaria. Además, al ser libre de halógenos, contribuye a la seguridad y al medio ambiente.', 9990.00, 30, 'productos/21634730-1200-auto.webp', 0, 'sobrepuestos380', '6110435'),
(117, 'ENCHUFE INDUSTRIAL IP44, LIBRE DE HALOGENOS, HEMBRA SOBREPUESTA, 380V, 32A, 3P+T, BEMIS 6112635 Bemis', 'El enchufe industrial BEMIS proporciona una solucion robusta y confiable para las conexiones electricas en entornos industriales exigentes. Con una clasificacion IP44, esta protegido contra salpicaduras de agua y particulas solidas, garantizando un rendimiento seguro en diversas condiciones ambientales.', 6990.00, 30, 'productos/21632932-1200-auto.webp', 0, 'sobrepuestos380', '6112635'),
(118, 'MACHO INDUSTRIAL SOBREPUESTO 380V 32A 3P+N+TIP67 LIBRE DE HALOGENOS 6512435 Bemis', 'MACHO INDUSTRIAL SOBREPUESTO 380V 32A 3P+N+TIP67 LIBRE DE HALOGENOS', 10990.00, 25, 'productos/21630947-1200-auto.webp', 0, 'sobrepuestos380', '6512435'),
(119, 'ENCHUFE INDUSTRIAL IP67, LIBRE DE HALOGENOS, MACHO SOBREPUESTO, 220, 32A, 2P+T, BEMIS 6512035 Bemis', 'El enchufe industrial BEMIS ofrece una solucion robusta y segura para entornos industriales que requieren una conexion electrica confiable. Con una clasificacion IP67, esta protegido contra la entrada de polvo y agua, lo que lo hace adecuado para su uso en ambientes exteriores y condiciones ambientales adversas.', 9100.00, 25, 'productos/21627858-1200-auto.webp', 0, 'sobrepuestos220', '6512035'),
(120, 'ENCHUFE INDUSTRIAL IP67, LIBRE DE HALOGENOS, HEMBRA SOBREPUESTA, 220V, 16A, 2P+T, BEMIS 6110235 Bemis', 'Este enchufe industrial de Bemis es una opcion robusta y confiable para aplicaciones que requieren una conexion electrica segura en entornos industriales y comerciales. Con clasificacion IP67, es resistente al polvo y al agua, lo que lo hace adecuado para una variedad de condiciones ambientales adversas. La capacidad de corriente de 16A y la configuración de 2P+T lo hacen ideal para equipos y maquinaria de uso común. Además, al ser libre de halógenos, contribuye a la seguridad y al medio ambiente.', 7700.00, 30, 'productos/21600851-1200-auto.webp', 0, 'sobrepuestos220', '6110235'),
(121, 'ENCHUFE INDUSTRIAL IP44, LIBRE DE HALOGENOS, HEMBRA SOBREPUESTA, 220V, 16A, 2P+T, BEMIS 6110835 Bemis', 'El enchufe industrial BEMIS ofrece una solución confiable para aplicaciones en entornos industriales donde se requiere una conexión segura y resistente. Con una clasificación IP44, este enchufe es adecuado para su uso en areas donde puede estar expuesto a condiciones ambientales adversas.', 4800.00, 25, 'productos/21602715-1200-auto.webp', 0, 'sobrepuestos220', '6110835'),
(122, 'Canoa Led Integ. Plano 36w 220V 120Cm 6500K 3000LM Stanford', 'Luminaria LED con tubo integrado plano. De fácil instalación y gran resistencia a  golpes, vibraciones, ahorro de energía de hasta 50%, reduce costos de mantenimiento.', 4500.00, 30, 'productos/X_sin-t-tulo-12105.png', 0, 'equipocanoa', 'HL-PL36'),
(123, 'Canoa Led Integ. Plano 18w 220V 61Cm 6500K 1500LM Stanford', 'Luminaria LED con tubo integrado plano. De fácil instalación y gran resistencia a  golpes, vibraciones, ahorro de energía de hasta 50%, reduce costos de mantenimiento.', 5200.00, 30, 'productos/X_080955.png', 0, 'equipocanoa', 'HL-PL18'),
(124, 'Equipo Estanco Led 2x18w Ip65 120cm Con 2 Tubos Led', 'Equipo Estanco Led 2x18w Ip65 120cm Con 2 Tubos Led,\r\nequipo hermético contra polvo y humedad, ideal para el uso en parques, planta de fabricas, estacionamiento, etc. Con sistema de fijación incluido', 14690.00, 20, 'productos/X_photoroom-20220420_1937118484.jpg', 0, 'equipoestanco', '1605733814062'),
(125, 'Equipo Estanco Led 1x9w Ip65 60cm Sin Tubo', 'Equipo hermético contra polvo y humedad, ideal para el uso en parques, planta de fabricas, estacionamiento, etc. Con sistema de fijación incluido', 6500.00, 30, 'productos/X_photoroom-20220419_1128422462.jpg', 0, 'equipoestanco', 'sm-109');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ferreteria_productocotizacion`
--

CREATE TABLE `ferreteria_productocotizacion` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL CHECK (`cantidad` >= 0),
  `sku` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cotizacion_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ferreteria_productocotizacion`
--

INSERT INTO `ferreteria_productocotizacion` (`id`, `nombre`, `cantidad`, `sku`, `precio`, `cotizacion_id`) VALUES
(12, 'Curva 90° PVC 90MM', 23, NULL, 5990.00, 12),
(13, 'Cable Eva 10mm LH Evaflex (h07z1-k) 100 Mts', 7, NULL, 194690.00, 12),
(14, 'Interruptor Doble 9/15 10a Luzica Bticino Ref Pu1200', 5, NULL, 3590.00, 13),
(15, 'Cable Eva 2,5mm LH Evaflex (h07z1-k) 100 Mts', 1, NULL, 46100.00, 13),
(16, 'TNAKIEX', 1, NULL, 49900.00, 13),
(17, 'Placa Armada S33 Noir Mate Tomacorriente 10A y Cargador USB 119x86 mm', 2, NULL, 19990.00, 13),
(18, 'Placa Armada Pulsador Timbre S44 Carbón Teclón 125x45 mm', 5, NULL, 10590.00, 13),
(19, 'Contactor 40A KNC1 Bobina 220V 3P+1NO 380V Stanford', 1, NULL, 20190.00, 13),
(20, 'Contactor GEC1 9A Bobina 220VAC 3P AC3 380V 4KW 1NO MGC', 1, NULL, 5890.00, 13),
(21, 'Tablero Exterior Sobrepuesto 15 Circuitos Estanco Ip65', 1, NULL, 18950.00, 13),
(22, 'Abrazadera PVC omega 20mm', 1, NULL, 80.00, 13),
(23, 'Abrazadera PVC omega 16mm', 1, NULL, 50.00, 13),
(24, 'Conector MET Curvo Flex 40MM', 1, NULL, 3520.00, 13),
(25, 'Tuberia Conduit flexible metal/pvc 63mm Rollo 20 mts', 2, NULL, 148790.00, 13),
(26, 'Tuberia Conduit Flexible Reforzado Acero/Pvc 40mm x MTS', 6, NULL, 7760.00, 13),
(27, 'Interruptor Automático KBM 4X16A D 15KA LEXO', 4, NULL, 58569.00, 13),
(28, 'Interruptor 9/12 + Toma 10a 250v Luzica Ref Pu1214', 1, NULL, 3690.00, 14),
(29, 'Interruptor Doble 9/15 10a Luzica Bticino Ref Pu1200', 1, NULL, 3590.00, 14),
(30, 'Interruptor Simple 9/12 10a Luzica Bticino RefPu1100', 1, NULL, 2590.00, 14),
(31, 'Interruptor Triple 9/32 10a Luzica Bticino Ref Pu1300', 1, NULL, 4590.00, 14),
(32, 'Interruptor Automático KBM 1P + N 6A D 15KA LEXO', 1, NULL, 29289.00, 14),
(33, 'Interruptor Automático KBM 4X16A D 15KA LEXO', 1, NULL, 58569.00, 14),
(34, 'Tablero Exterior Sobrepuesto 5 Circuitos Estanco Ip 65', 1, NULL, 7290.00, 14),
(35, 'Tablero Exterior Sobrepuesto 15 Circuitos Estanco Ip65', 1, NULL, 18950.00, 14),
(36, 'Caja Empalme Plástica Para Medidor Monofásico con Riel Din', 1, NULL, 29018.00, 14),
(37, 'Caja Empalme Para Medidor Enganche Riel Din Stanford', 1, NULL, 27099.00, 14),
(38, 'Caja Empalme Reducida Plana con Riel', 1, NULL, 48790.00, 14),
(39, 'Caja para empalme 20x40,6 cm acero', 1, NULL, 25990.00, 14),
(40, 'Caja Embutida Para Tabique Pvc Oreja Metálica 503t Naranjo', 2, NULL, 537.00, 14),
(41, 'Caja Distribución Para Tabique Corriente 12 Salidas', 1, NULL, 390.00, 14),
(42, 'Caja Distribución Para Concreto Oreja Metal 10 Salidas', 6, NULL, 390.00, 14),
(43, 'Caja Embutida Pvc Albañilería Oreja Metálica Amarillo 503l', 6, NULL, 1480.00, 14),
(44, 'Caja Embutida Pvc Albañilería Oreja Metálica Amarillo 503l', 5, NULL, 1480.00, 15),
(45, 'Caja Distribución Para Tabique Corriente 12 Salidas', 4, NULL, 390.00, 15),
(46, 'Caja Distribución Para Concreto Oreja Metal 10 Salidas', 4, NULL, 390.00, 15),
(47, 'Caja Embutida Para Tabique Pvc Oreja Metálica 503t Naranjo', 4, NULL, 537.00, 15),
(48, 'Caja Distribución Para Tabique Corriente 12 Salidas', 5, NULL, 390.00, 16),
(49, 'Caja Distribución Para Concreto Oreja Metal 10 Salidas', 5, NULL, 390.00, 16),
(50, 'Caja Embutida Para Tabique Pvc Oreja Metálica 503t Naranjo', 5, NULL, 537.00, 16),
(51, 'Caja Embutida Pvc Albañilería Oreja Metálica Amarillo 503l', 7, NULL, 1480.00, 16);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indices de la tabla `ferreteria_carritoitem`
--
ALTER TABLE `ferreteria_carritoitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ferreteria_carritoitem_usuario_id_3eb5f37e_fk_auth_user_id` (`usuario_id`),
  ADD KEY `ferreteria_carritoit_producto_id_182e3a77_fk_ferreteri` (`producto_id`);

--
-- Indices de la tabla `ferreteria_cotizacion`
--
ALTER TABLE `ferreteria_cotizacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ferreteria_cotizacion_usuario_id_087008f9_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `ferreteria_producto`
--
ALTER TABLE `ferreteria_producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indices de la tabla `ferreteria_productocotizacion`
--
ALTER TABLE `ferreteria_productocotizacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ferreteria_productoc_cotizacion_id_e6d7ec97_fk_ferreteri` (`cotizacion_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ferreteria_carritoitem`
--
ALTER TABLE `ferreteria_carritoitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ferreteria_cotizacion`
--
ALTER TABLE `ferreteria_cotizacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ferreteria_producto`
--
ALTER TABLE `ferreteria_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de la tabla `ferreteria_productocotizacion`
--
ALTER TABLE `ferreteria_productocotizacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `ferreteria_carritoitem`
--
ALTER TABLE `ferreteria_carritoitem`
  ADD CONSTRAINT `ferreteria_carritoit_producto_id_182e3a77_fk_ferreteri` FOREIGN KEY (`producto_id`) REFERENCES `ferreteria_producto` (`id`),
  ADD CONSTRAINT `ferreteria_carritoitem_usuario_id_3eb5f37e_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `ferreteria_cotizacion`
--
ALTER TABLE `ferreteria_cotizacion`
  ADD CONSTRAINT `ferreteria_cotizacion_usuario_id_087008f9_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `ferreteria_productocotizacion`
--
ALTER TABLE `ferreteria_productocotizacion`
  ADD CONSTRAINT `ferreteria_productoc_cotizacion_id_e6d7ec97_fk_ferreteri` FOREIGN KEY (`cotizacion_id`) REFERENCES `ferreteria_cotizacion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
