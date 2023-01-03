-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-01-2023 a las 04:59:38
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `congreso`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id_admin` int(11) NOT NULL,
  `correo_admin` varchar(60) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombre_admin` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `eliminacion` varchar(20) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_admin`, `correo_admin`, `nombre_admin`, `eliminacion`, `id_user`) VALUES
(1, 'admin', 'administrador', '1', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_carreras`
--

CREATE TABLE `admin_carreras` (
  `id_adminCarrera` int(11) NOT NULL,
  `nombre_adminCarrera` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `estado_registro` int(11) NOT NULL,
  `carrera` varchar(60) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_imagen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `admin_carreras`
--

INSERT INTO `admin_carreras` (`id_adminCarrera`, `nombre_adminCarrera`, `estado_registro`, `carrera`, `id_user`, `id_imagen`) VALUES
(5, 'Ing. Russell Renan Luit Manzanero', 0, 'IngenierÃ­a en sistemas computacionales', 55, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumno` int(11) NOT NULL,
  `nombre_alumno` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellido_alumno` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `matricula` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `semestre_grupo` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `status_alumno` int(2) NOT NULL,
  `comentarios` varchar(200) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_adminCarrera` int(11) NOT NULL,
  `id_taller` int(11) DEFAULT NULL,
  `id_concurso` int(11) DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `grupo_etnico` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `promediolengua` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `nombre_alumno`, `apellido_alumno`, `matricula`, `semestre_grupo`, `status_alumno`, `comentarios`, `id_user`, `id_adminCarrera`, `id_taller`, `id_concurso`, `id_equipo`, `grupo_etnico`, `promediolengua`) VALUES
(23, 'Jesus Alberto', 'Medina Dzib', '16070022', '3Âº B', 1, NULL, 58, 5, 7, 8, 2, '', ''),
(24, 'karina', 'Chiguil', '16070014', '8Âº A', 1, NULL, 59, 5, NULL, 8, 2, '', ''),
(25, 'Minelle', 'Ciau', '16070010', '7Âº A', 1, NULL, 69, 5, 7, 2, NULL, '', ''),
(26, 'Maria', 'Mercedez', '16070088', '7Âº B', 1, NULL, 70, 5, 7, 8, 3, '', ''),
(35, 'felipe', 'lopez', '18070026', '9Â° A', 0, '                ', 89, 5, NULL, NULL, NULL, 'CHOL', 'Porcentaje del idioma Étnico que hablas:'),
(37, 'Miguel Aurelio', 'Oxte Tzuc', '18070032', '9Â° A', 1, NULL, 92, 5, NULL, NULL, NULL, 'NINGUNO', 'No hablo'),
(49, 'Vanessa Guadalupe ', 'Tuz Acosta', '22070100', '3Âº B', 1, NULL, 123, 5, NULL, NULL, NULL, 'Grupo étnico al que perteneces', 'Porcentaje del idioma Étnico que hablas:'),
(51, 'jimena', 'acosta', '20000001', '3Âº B', 1, NULL, 125, 5, NULL, NULL, NULL, 'Grupo étnico al que perteneces', 'Porcentaje del idioma Étnico que hablas:'),
(55, 'maria', 'Acosta', '202022', '3Âº B', 0, NULL, 129, 5, NULL, NULL, NULL, 'Grupo étnico al que perteneces', 'Porcentaje del idioma Étnico que hablas:'),
(57, 'sofia', 'Tuz Jesus', '18070079', '3Âº B', 0, NULL, 131, 5, NULL, NULL, NULL, 'Grupo étnico al que perteneces', 'Porcentaje del idioma Étnico que hablas:'),
(64, 'Jesus reyes', 'Che Ek', '', '3Âº B', 0, NULL, 140, 5, NULL, NULL, NULL, 'Grupo étnico al que perteneces', 'Porcentaje del idioma Étnico que hablas:'),
(65, 'manuel', 'landeros', '2207023', '3Âº B', 0, NULL, 144, 5, NULL, NULL, NULL, 'Grupo étnico al que perteneces', 'Porcentaje del idioma Étnico que hablas:');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_conferencias`
--

CREATE TABLE `alumnos_conferencias` (
  `id_alumno` int(11) NOT NULL,
  `id_conferencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `alumnos_conferencias`
--

INSERT INTO `alumnos_conferencias` (`id_alumno`, `id_conferencia`) VALUES
(23, 3),
(24, 3),
(25, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avisos`
--

CREATE TABLE `avisos` (
  `id_aviso` int(11) NOT NULL,
  `descripcion` varchar(1000) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_adminCarrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concursos`
--

CREATE TABLE `concursos` (
  `id_concurso` int(11) NOT NULL,
  `nombre_concurso` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `imagen_concurso` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `lugar_concurso` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion_concurso` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `cupo_concurso` int(11) NOT NULL,
  `modalidad` int(2) DEFAULT NULL COMMENT '1=Individual, 2=grupal',
  `max_alumnos_grupal` int(11) DEFAULT NULL,
  `id_instructor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `concursos`
--

INSERT INTO `concursos` (`id_concurso`, `nombre_concurso`, `imagen_concurso`, `lugar_concurso`, `descripcion_concurso`, `cupo_concurso`, `modalidad`, `max_alumnos_grupal`, `id_instructor`) VALUES
(2, 'Primer concurso Virtual de programaciÃ³n ', '853612.jpg', 'Virtual', '<p>asd</p>\r\n', 5, 1, NULL, 6),
(3, 'Concurso de programaciÃ³n', '2781850.jpg', 'Virtual', '<p>asd</p>\r\n', 12, 2, 4, 1),
(8, 'Concurso de programaciÃ³n', '257860.jpg', 'Virtual', '<p>a</p>\r\n\r\n<p>&nbsp;</p>\r\n', 2, 2, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conferencias`
--

CREATE TABLE `conferencias` (
  `id_conferencia` int(11) NOT NULL,
  `nombre_conferencia` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `imagen_conferencia` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `lugar_conferencia` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion_conferencia` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `cupo_conferencia` int(11) NOT NULL,
  `id_instructor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `conferencias`
--

INSERT INTO `conferencias` (`id_conferencia`, `nombre_conferencia`, `imagen_conferencia`, `lugar_conferencia`, `descripcion_conferencia`, `cupo_conferencia`, `id_instructor`) VALUES
(2, 'Tips para emprendedores', '2323240.jpg', 'Zoom', '<p>a</p>\r\n', 15, 1),
(3, 'Tips para emprendedores II', '1242581.jpg', 'A1', '<p>asd</p>\r\n', 15, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correos`
--

CREATE TABLE `correos` (
  `id_correo` int(3) NOT NULL,
  `correo` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `correos`
--

INSERT INTO `correos` (`id_correo`, `correo`) VALUES
(4, '@gmail.com'),
(3, '@itsva.com'),
(2, '@itsva.edu.mx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas`
--

CREATE TABLE `encuestas` (
  `id_encuesta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `titulo` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `fecha_inicio` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_final` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `encuestas`
--

INSERT INTO `encuestas` (`id_encuesta`, `id_usuario`, `titulo`, `descripcion`, `estado`, `fecha_inicio`, `fecha_final`) VALUES
(15, 55, 'Encuesta de Servicio 2', 'Antes de obtener tu reconocimiento, favor de realizar la siguiente encuesta de servicio y de taller', 1, '2022-11-20 02:35:34', '2022-11-20 01:31:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
  `nomEquipo` varchar(200) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_jefe_equipo` int(11) NOT NULL,
  `id_concurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `nomEquipo`, `id_jefe_equipo`, `id_concurso`) VALUES
(2, 'Java', 23, 8),
(3, 'C++', 26, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_etnico`
--

CREATE TABLE `grupo_etnico` (
  `id_grupo_etnico` int(11) NOT NULL,
  `grupo_etnico` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo_etnico`
--

INSERT INTO `grupo_etnico` (`id_grupo_etnico`, `grupo_etnico`) VALUES
(1, 'Grupo étnico al que perteneces '),
(2, 'NINGUNO'),
(3, 'MAYA'),
(4, 'CHOL'),
(5, 'NAHUAT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructores`
--

CREATE TABLE `instructores` (
  `id_instructor` int(11) NOT NULL,
  `nombre_instructor` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellido_instructor` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `status_instructor` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_adminCarrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `instructores`
--

INSERT INTO `instructores` (`id_instructor`, `nombre_instructor`, `apellido_instructor`, `clave`, `status_instructor`, `id_user`, `id_adminCarrera`) VALUES
(1, 'Jorge', 'Pool', '4444', 1, 60, 5),
(5, 'Felipe ', 'Chan', ' ', 1, 65, 5),
(6, 'Pablo Martin ', 'Ramirez Chan', ' ', 1, 66, 5),
(7, 'ING MATILDE ', 'TUN CHI', ' ', 0, 67, 5),
(8, 'Yessenia', 'Cetina Marrufo', ' ', 1, 68, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logos`
--

CREATE TABLE `logos` (
  `id_imagen` int(11) NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `logos`
--

INSERT INTO `logos` (`id_imagen`, `imagen`) VALUES
(9, '2466398.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `id_opcion` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `valor` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `respuesta` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id_opcion`, `id_pregunta`, `valor`, `respuesta`) VALUES
(55, 71, '5.Totalmente de acuerdo', ''),
(56, 71, '4.Parcialmente de acuerdo', ''),
(57, 71, '3.Indiferente', ''),
(58, 71, '2.Parcialmente en desacuerdo', ''),
(59, 71, '1.En desacuerdo', ''),
(60, 72, '5.Totalmente de acuerdo', ''),
(61, 72, '4.Parcialmente de acuerdo', ''),
(62, 72, '3.Indiferente', ''),
(63, 72, '2.Parcialmente en desacuerdo', ''),
(64, 72, '1.En desacuerdo', ''),
(65, 73, '5.Totalmente de acuerdo', ''),
(66, 73, '4.Parcialmente de acuerdo', ''),
(67, 73, '3.Indiferente', ''),
(68, 73, '2.Parcialmente en desacuerdo', ''),
(69, 73, '1.En desacuerdo', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `passwords`
--

CREATE TABLE `passwords` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(200) NOT NULL,
  `codigo` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `passwords`
--

INSERT INTO `passwords` (`id`, `email`, `token`, `codigo`, `fecha`) VALUES
(44, 'jesusreyestuzacosta@gmail.com', 'fc9a556b3c', 9944, '2022-11-29 05:07:30'),
(45, 'jesusreyestuzacosta@gmail.com', '7d496969ad', 3318, '2022-12-14 07:22:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL,
  `id_encuesta` int(11) NOT NULL,
  `titulo` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `id_tipo_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id_pregunta`, `id_encuesta`, `titulo`, `id_tipo_pregunta`) VALUES
(71, 15, 'Expuso el objetivo y temario del curso.', 1),
(72, 15, 'Mostró dominio del contenido abordado.', 1),
(73, 15, 'Fomentó la participación del grupo.', 1),
(91, 15, 'COMENTARIOS O SUGERENCIAS', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(60,2) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `precio`, `descripcion`, `imagen`) VALUES
(1, 'Jornada Academica', '250.00', 'Pago para poder inscribirce a la jornada academica.', 'https://i.pinimg.com/736x/43/fc/4c/43fc4cbbf0eb9f77025098a113274037.jpg'),
(2, 'Jornada Gestion Empresarial', '1000.00', 'Pago para jornada de administracion itsva', 'https://conceptoabc.com/wp-content/uploads/2021/09/Administracion.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promediolengua`
--

CREATE TABLE `promediolengua` (
  `id_promediolengua` int(100) NOT NULL,
  `promediolengua` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `promediolengua`
--

INSERT INTO `promediolengua` (`id_promediolengua`, `promediolengua`) VALUES
(1, 'Porcentaje del idioma Étnico que hablas:'),
(2, 'No hablo'),
(3, 'Menos del 10%'),
(4, 'Entre el 11% al 30%'),
(5, 'Entre el 31% al 50%'),
(6, 'Entre el 51% al 70%'),
(7, 'Entre el% 71 al 90%'),
(8, 'Mas del 90%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id_encueta` int(50) NOT NULL,
  `nombre_completo` varchar(120) NOT NULL,
  `matricula` int(20) NOT NULL,
  `respuesta` varchar(5000) NOT NULL,
  `email` varchar(120) NOT NULL,
  `semestre_grupo` varchar(100) NOT NULL,
  `nombree_taller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id_encueta`, `nombre_completo`, `matricula`, `respuesta`, `email`, `semestre_grupo`, `nombree_taller`) VALUES
(0, 'kskjsk', 0, 'Jesus@gmail.com', '3Âº B', '', ''),
(0, 'susus', 0, 'j@gmail.om', '3Âº B', '', ''),
(0, 'jesus', 0, 'jesus@gmail', '7Âº A', '', ''),
(0, 'reyes', 0, 'leel', 'a@gamil', '3Âº B', ''),
(0, 'r', 0, 'ssss', 'a@gmial', '3Âº B', ''),
(0, 'je', 0, 'hola', 'R@gmail', '7Âº A', ''),
(0, 'ef', 0, 'mwmw@h¿gmao', 'wf', 'wef', 'php'),
(0, 'wef', 0, 'werwrw ew h whrowgfewiofwgui gowgwf foigho fe ofiwg foffg wofe wof fewoif wfiowfweofwi gfewofg weof wfgwfgowefwgif wof owifowefgoiw fogigoo df', 'wfewfwfwflkw', 'wm,f mwef wef,wfw w', 'lkwnlfnlkwefklwflknwefnwflwnfkwkfwflenwf nlflw flwe nfw nlkfnflwflknlk'),
(0, 'j', 0, 'php', 'ca@hmail', '7Âº A', ''),
(0, 'a', 0, 'ALV', 'c@mIL', '3Âº B', ''),
(0, 'jsus', 0, 'yu', 'j@gmail', '3Âº B', ''),
(0, 'jsus', 0, 'hola', 'jesustuzaosta@gmail', '3Âº B', ''),
(15, 'jesus', 0, 'Alv prrrr', 'acosta@gmial', '7Âº A', ''),
(15, 'nombre', 0, 'ñll', 'c@maul', 'Elige tu Semestre/Grupo', ''),
(15, 'd', 0, 's', 'j@mail', '7Âº A', ''),
(15, 'mmm', 0, 'a', 'wfw@je', 'Elige tu Semestre/Grupo', 'Elige tu taller'),
(15, 'jsus', 0, 'aver que p2', 'jsus@gmail.com', '3Âº B', ''),
(15, 'h', 0, 'f', 's@mail', 'Elige tu Semestre/Grupo', 'PHP CON FRAMEWORK YII2'),
(15, 'Reyes Jesus', 0, 'vamos a ver si funciona', 'Jesusreyestuzacosta@gmail.com', '7Âº A', 'MolÃ©culas de agua'),
(15, 'h', 0, 'asd', 'h@mail', '3Âº B', 'MolÃ©culas de agua'),
(15, 'soy sofia ', 0, 'asa', 'abc@gamil.com', '3Âº B', 'PHP CON FRAMEWORK YII2'),
(15, 's', 0, 'as', 's@gamil.com', 'Elige tu Semestre/Grupo', 'PHP CON FRAMEWORK YII2'),
(15, 'rth', 0, 'sc', 'Jesus@gmail.com', '3Âº B', 'Herramientas para la nube'),
(15, 'as', 0, 'asd', 'sa@mail.com', 'Elige tu Semestre/Grupo', 'PHP CON FRAMEWORK YII2'),
(15, 'sxc', 0, 's', 'kmaul@gmail.com', 'Elige tu Semestre/Grupo', 'PHP CON FRAMEWORK YII2'),
(15, 'sd', 0, 'sd', 'sd@mail.com', 'Elige tu Semestre/Grupo', 'PHP CON FRAMEWORK YII2'),
(15, 'as', 0, 'dqd', 'z@gmail.com', 'Elige tu Semestre/Grupo', 'PHP CON FRAMEWORK YII2'),
(15, 'jesus rta', 12346567, 'as', 'jrta@gmail.com', '7Âº A', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `id_resultado` int(11) NOT NULL,
  `id_opcion` int(11) NOT NULL,
  `respuesta` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol`) VALUES
(1, 'administrador'),
(2, 'administrador_carrera'),
(4, 'alumno'),
(3, 'instructor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre_grupo`
--

CREATE TABLE `semestre_grupo` (
  `id_semestre_grupo` int(11) NOT NULL,
  `semestre_grupo` varchar(20) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `semestre_grupo`
--

INSERT INTO `semestre_grupo` (`id_semestre_grupo`, `semestre_grupo`) VALUES
(1, '3Âº B'),
(2, '7Âº A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talleres`
--

CREATE TABLE `talleres` (
  `id_taller` int(11) NOT NULL,
  `nombre_taller` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `imagen_taller` varchar(200) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `lugar_taller` varchar(200) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `cupo_taller` int(11) NOT NULL,
  `descripcion_taller` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_instructor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `talleres`
--

INSERT INTO `talleres` (`id_taller`, `nombre_taller`, `imagen_taller`, `lugar_taller`, `cupo_taller`, `descripcion_taller`, `id_instructor`) VALUES
(7, 'PHP CON FRAMEWORK YII2', '1127394.jpg', 'VIDEOCONFERENCIA', 13, '<p>lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et&nbsp;</p>\r\n', 8),
(8, 'Herramientas para la nube ', '852454.jpg', 'VIDEOCONFERENCIA', 1, '<p>lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et&nbsp;lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et&nbsp;</p>\r\n', 1),
(9, 'MolÃ©culas de agua ', '886399.jpg', 'VIDEOCONFERENCIA', 15, '<p>lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et&nbsp;</p>\r\n', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `td_curso_usuario`
--

CREATE TABLE `td_curso_usuario` (
  `curd_id` int(11) NOT NULL,
  `cur_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `fech_crea` datetime NOT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `td_curso_usuario`
--

INSERT INTO `td_curso_usuario` (`curd_id`, `cur_id`, `usu_id`, `fech_crea`, `est`) VALUES
(191, 1, 1, '2021-11-03 23:11:34', 1),
(192, 1, 2, '2021-11-03 23:11:34', 1),
(193, 1, 3, '2021-11-03 23:11:34', 1),
(194, 1, 4, '2021-11-03 23:11:34', 1),
(195, 2, 4, '2021-11-03 23:16:50', 1),
(196, 3, 4, '2021-11-03 23:16:56', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pregunta`
--

CREATE TABLE `tipo_pregunta` (
  `id_tipo_pregunta` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_pregunta`
--

INSERT INTO `tipo_pregunta` (`id_tipo_pregunta`, `nombre`, `descripcion`) VALUES
(1, 'Selecion Multiple', 'El usuario tiene la opcion de elejir la respuesta que se le opte mejor de las que se encuentre'),
(2, 'Pregunta Abierta ', 'El usuario escribe su opinion y/o respuesta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'admin-carrera'),
(3, 'instructor'),
(4, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_categoria`
--

CREATE TABLE `tm_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_nom` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_categoria`
--

INSERT INTO `tm_categoria` (`cat_id`, `cat_nom`, `fech_crea`, `est`) VALUES
(1, 'PROGRAMACIÓN', '2021-04-26 20:27:52', 1),
(2, 'MARKETING', '2021-04-26 20:27:52', 1),
(3, 'NEGOCIOS', '2021-04-26 20:27:52', 1),
(4, 'EDUCACION', '2021-04-26 20:27:52', 1),
(5, 'test categoria', '2021-08-17 20:46:37', 0),
(6, '22222', '2021-08-17 20:47:07', 0),
(7, '4444', '2021-08-17 20:53:12', 0),
(8, '5555', '2021-08-17 20:53:22', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_curso`
--

CREATE TABLE `tm_curso` (
  `cur_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cur_nom` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `cur_descrip` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `cur_fechini` date DEFAULT NULL,
  `cur_fechfin` date DEFAULT NULL,
  `inst_id` int(11) NOT NULL,
  `cur_img` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_curso`
--

INSERT INTO `tm_curso` (`cur_id`, `cat_id`, `cur_nom`, `cur_descrip`, `cur_fechini`, `cur_fechfin`, `inst_id`, `cur_img`, `fech_crea`, `est`) VALUES
(1, 1, 'CURSO DE HTML5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 1, '../../public/1987173689.jpg', '2021-04-26 20:32:32', 1),
(2, 2, 'INTRODUCCION DE LOS NEGOCIOS', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '../../public/2.png', '2021-04-26 20:32:32', 1),
(3, 2, 'PHP', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '../../public/3.png', '2021-04-26 20:32:32', 1),
(19, 1, 'LARAVEL y MYSQL', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 1, '../../public/4.png', '2021-04-26 20:32:32', 1),
(20, 2, 'CURSO3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '../../public/1.png', '2021-04-26 20:32:32', 1),
(21, 2, 'CURSO4', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '../../public/1.png', '2021-04-26 20:32:32', 1),
(22, 2, 'CURSO5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '../../public/1613003806.png', '2021-04-26 20:32:32', 1),
(23, 2, 'CURSO6', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '../../public/957232075.png', '2021-04-26 20:32:32', 1),
(24, 2, 'CURSO7', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-04-01', '2021-04-30', 2, '../../public/1127664046.png', '2021-04-26 20:32:32', 1),
(25, 1, 'ESTUDIO DE MERCADO', 'CURSO de MERCADO', '2021-08-22', '2021-09-22', 1, '../../public/28629721.png', '2021-08-22 14:54:50', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_instructor`
--

CREATE TABLE `tm_instructor` (
  `inst_id` int(11) NOT NULL,
  `inst_nom` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `inst_apep` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `inst_apem` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `inst_correo` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `inst_sex` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `inst_telf` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_instructor`
--

INSERT INTO `tm_instructor` (`inst_id`, `inst_nom`, `inst_apep`, `inst_apem`, `inst_correo`, `inst_sex`, `inst_telf`, `fech_crea`, `est`) VALUES
(1, 'RICARDO', 'PALMA', 'PALMA', 'RPALMA@TEST.COM.PE', 'M', '5555555', '2021-04-26 20:24:06', 1),
(2, 'CESAR', 'VALLEJO', 'MEDRANO', 'CVALLEJO@MEDRANO.COM.PE', 'M', '5555555', '2021-04-26 20:24:06', 1),
(3, 'asda', 'asd', 'asd', 'test@test.com', 'M', '111111', '2021-08-17 21:27:40', 0),
(4, 'ddd', 'dd', 'ddd', 'test@test.com', 'M', '111111', '2021-08-17 21:31:26', 0),
(5, 'www', 'www', 'www', 'test@test.com', 'F', '111111', '2021-08-17 21:31:32', 0),
(6, 'aaaa', 'aaa', 'aaaa', 'aaaa@www.com', 'F', '123123123123', '2021-08-17 21:32:55', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_usuario`
--

CREATE TABLE `tm_usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_nom` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `usu_apep` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `usu_apem` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `usu_correo` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `usu_pass` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `usu_sex` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  `usu_telf` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `rol_id` int(11) NOT NULL,
  `usu_dni` int(11) DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_usuario`
--

INSERT INTO `tm_usuario` (`usu_id`, `usu_nom`, `usu_apep`, `usu_apem`, `usu_correo`, `usu_pass`, `usu_sex`, `usu_telf`, `rol_id`, `usu_dni`, `fech_crea`, `est`) VALUES
(1, 'ANDERSON', 'BASTIDAS', 'VICENTE', 'DAVIS_ANDERSON_87@HOTMAIL.COM', '123456', 'M', '989898989', 1, 1122334, '2021-04-26 20:14:08', 1),
(2, 'DAVIS', 'CASTILLO', 'FUJIMORI', 'FUJICASTI@HOTMAIL.COM', '123456', 'M', '989898989', 1, 4445462, '2021-04-26 20:14:08', 1),
(3, 'BULMA', 'VEGETA', 'SAYAYIN', 'GOKU@GMAIL.COM', '123456', 'F', '989898989', 1, 2233445, '2021-04-26 20:14:08', 1),
(4, 'ADMIN', 'SISTEMA', 'SIS', 'sistemas', '1234567', 'M', '989898989', 2, 4445464, '2021-04-26 20:14:08', 1),
(9, 'USU2', 'USU2', 'USU2', 'USU2@ADMIN.COM', '123456', 'M', '989898989', 1, 4445465, '2021-04-26 20:14:08', 1),
(10, 'USU3', 'USU3', 'USU3', 'USU3@ADMIN.COM', '123456', 'M', '989898989', 1, 4445466, '2021-04-26 20:14:08', 1),
(11, 'USU4', 'USU4', 'USU4', '4@ADMIN.COM', '123456', 'M', '989898989', 1, 4445467, '2021-04-26 20:14:08', 1),
(12, 'USU5', 'USU5', 'USU5', '5@ADMIN.COM', '123456', 'M', '989898989', 1, 4445468, '2021-04-26 20:14:08', 1),
(140, 'Jesus reey', 'Che Ek', '', 'jesusreyestuzacosta@gmail.com', '', 'M', '1234567899', 1, 4445469, '2023-01-01 10:58:43', 1),
(144, 'manuel', 'landeros', '', 'manuellandero@gmail.com', '', '', '', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id_transaccion` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio_unitario` decimal(60,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descargado` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`id_transaccion`, `id_venta`, `id_producto`, `precio_unitario`, `cantidad`, `descargado`, `id_alumno`) VALUES
(1, 36, 1, '250.00', 1, 0, 27),
(2, 37, 1, '250.00', 1, 0, 27),
(3, 38, 1, '250.00', 1, 0, 27),
(7, 43, 1, '250.00', 1, 0, 27),
(8, 44, 1, '250.00', 1, 0, 27),
(9, 45, 1, '250.00', 1, 0, 27),
(10, 46, 1, '250.00', 1, 0, 27),
(11, 47, 1, '250.00', 1, 0, 28),
(12, 48, 1, '250.00', 1, 0, 27),
(13, 49, 1, '250.00', 1, 0, 27),
(14, 50, 1, '250.00', 1, 0, 27),
(15, 51, 1, '250.00', 1, 0, 28),
(16, 52, 1, '250.00', 1, 0, 27),
(17, 53, 1, '250.00', 1, 0, 27),
(18, 54, 1, '250.00', 1, 0, 27),
(19, 55, 1, '250.00', 1, 0, 28),
(20, 56, 1, '250.00', 1, 0, 27),
(21, 57, 1, '250.00', 1, 0, 27),
(22, 58, 1, '250.00', 1, 0, 27),
(23, 59, 1, '250.00', 1, 0, 27),
(24, 60, 1, '250.00', 1, 0, 28),
(25, 61, 1, '250.00', 1, 0, 28),
(26, 62, 1, '250.00', 1, 0, 27),
(27, 63, 1, '250.00', 1, 0, 27),
(28, 64, 1, '250.00', 1, 0, 28),
(29, 65, 1, '250.00', 1, 0, 27),
(30, 66, 1, '250.00', 1, 0, 27),
(31, 67, 1, '250.00', 1, 0, 27),
(33, 69, 2, '500.00', 1, 0, 29),
(34, 70, 2, '1000.00', 1, 0, 29),
(35, 71, 1, '250.00', 1, 0, 29),
(36, 72, 2, '1000.00', 1, 0, 29),
(37, 73, 2, '1000.00', 1, 0, 29),
(38, 74, 2, '1000.00', 1, 0, 29),
(39, 75, 2, '1000.00', 1, 0, 28),
(40, 76, 2, '1000.00', 1, 0, 28),
(41, 77, 2, '1000.00', 1, 0, 29),
(42, 78, 2, '1000.00', 1, 0, 29),
(43, 79, 2, '1000.00', 1, 0, 29),
(44, 80, 2, '1000.00', 1, 0, 29),
(45, 81, 2, '1000.00', 1, 0, 29),
(46, 82, 1, '250.00', 1, 0, 27),
(47, 83, 1, '250.00', 1, 0, 27),
(48, 84, 2, '1000.00', 1, 0, 64);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `correo_user` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `password` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `correo_user`, `password`, `id_rol`) VALUES
(6, 'administrador', '$2y$15$NnBPMH0zWmEl4s4k52fgmOMgAQU6/mcks62HO2nx4HY9j552l7Kfi', 1),
(55, 'sistemas', '$2y$15$NnBPMH0zWmEl4s4k52fgmOMgAQU6/mcks62HO2nx4HY9j552l7Kfi', 2),
(58, 'medina@itsva.edu.mx', '$2y$15$2y.357dNX1VzGd4q6wMo/us4.DXEK3BDaLvN2E8liHq9HProtW3Ga', 4),
(59, 'karina@itsva.edu.mx', '$2y$15$SuVwx1G0Rw76TgGaW/n50uuawFD28YAOdiowtZZ4XB76ywg10m0xO', 4),
(60, 'jorge@itsva.edu.mx', '$2y$15$wql9xoQNkzTMamHUrHwNAOYHo2Wdxa3gvgKLm3PhF25Xn7YHe5cVa', 3),
(65, 'felipe@itsva.edu.mx', '$2y$15$WjtDrTGs2YnukpZk4YpJJ.LdUNts.CBFpXU6Exs9zYRjG1.CsAmQ.', 3),
(66, 'pablo@itsva.edu.mx', '$2y$15$VH7fCuv/Brm1HPg.r0WjCu1NOCcx1a6JAaUCy2Uvgj4lZj7jjKAlW', 3),
(67, 'matilde.tc@gmail.com', '$2y$15$9PlFt.thsZMScjTjPn5/8.NI2dZeKa8oZ8QdN4qJ8l3sqOUsPDGxe', 3),
(68, 'yessenia@itsva.edu.mx', '$2y$15$NnBPMH0zWmEl4s4k52fgmOMgAQU6/mcks62HO2nx4HY9j552l7Kfi', 3),
(69, 'minelle@itsva.edu.mx', '$2y$15$mG7cmtvkL4eyOQkeVnPQA.glPk6AcjW8fC/b//u9vA5l7qYAq0NLa', 4),
(70, 'maria@itsva.edu.mx', '$2y$15$40E82NyUuXJj8Ft.epTjTukBoJMTh0cfe09N.aeMiCU7UoFZKRuou', 4),
(89, 'mendezfelipe451@gmail.com', '$2y$15$qgNiRsnBn1fS6DcP2erDQOq.moJXJLrZ18eWlgvmdmQ4TyD6ZlQ9C', 4),
(92, 'miguel.oxtetzuc@itsva.edu.mx', '$2y$15$samNBptMgBTrC221ji6hS..bjg.0NcoJSi/HXKMeFjIDOLHQJ/F/a', 4),
(123, 'vanessaguadalupetuzacosta@gmail.com', '$2y$15$jdMuXtfhujnZ.ticfUxD/ujrAyueDBE1uJqd1Riei/1TPeiWc6ZPu', 4),
(125, 'jesus@gmail.com', '$2y$15$lTvkkmFVIdObIjF7M7ZGoeCjKGPhQahNRT4h3W6OAR.hgF1rQwk1.', 4),
(129, 'maria@gmail.com', '$2y$15$/461UTuufBQXq9TY1R2PBuHGrBndnWvI8ixMe5/SJDoSD6rPmVl9i', 4),
(131, 'soysofia@gmail.com', '$2y$15$SdmCCoh6XknHEcNuMfwOIedyaN3TGfDEH2dpv/oa60U4Wu0bxqkIW', 4),
(140, 'jesusreyestuzacosta@gmail.com', '$2y$15$d0GK8.220YhkP1BfldMJe.XT4QJhtFxEanvczJtzNgicyvzTQbZQ6', 4),
(144, 'manuellandero@gmail.com', '$2y$15$GSs.MepevbbUQE6w8ItuM.A.A.mMhrxhAWDedZlsB4qzXoMmQVG9S', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  `matricula` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `semestre_grupo` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `clave`, `nombres`, `apellidos`, `email`, `id_tipo_usuario`, `matricula`, `semestre_grupo`) VALUES
('123', '$2y$15$jdMuXtfhujnZ.ticfUxD/ujrAyueDBE1uJqd1Riei/1', 'Vanessa Guadalupe ', 'Tuz Acosta', 'vanessaguadalupetuzacosta@gmail.com', 4, '22070100', '3Âº B'),
('131', '$2y$15$SdmCCoh6XknHEcNuMfwOIedyaN3TGfDEH2dpv/oa60U', 'sofia', 'Tuz Jesus', 'soysofia@gmail.com', 4, '18070079', '3Âº B'),
('134', '$2y$15$I4TqVVprr3SXWCp8480/bubAjNJRbW4bWDMIAUZhLen', 'Jesus re', 'acosta ', 'jesusre@gmail.com', 4, '2505205', '3Âº B'),
('135', '$2y$15$XRgxBcpCLdxXdwTwOKyOVOPt5hVUdZhLvkeC2BlFZqS', 'Jesus Reyes', 'Tuz Acosta', 'jesusreyestuzacosta@gmail.com', 4, '18070100', '7Âº A'),
('138', '$2y$15$qeYkgLpFqGTTuH08eBhbwOugmphVDNXl2vIOR80eFxa', 'Jesus', 'Tuz Acosta', 'jesusreyestuzacosta@gmail.com', 4, '18070123', '3Âº B'),
('140', '$2y$15$d0GK8.220YhkP1BfldMJe.XT4QJhtFxEanvczJtzNgi', 'Jesus reey', 'Che Ek', 'jesusreyestuzacosta@gmail.com', 4, '12345678', '3Âº B'),
('144', '$2y$15$GSs.MepevbbUQE6w8ItuM.A.A.mMhrxhAWDedZlsB4q', 'manuel', 'landeros', 'manuellandero@gmail.com', 4, '2207023', '3Âº B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_encuestas`
--

CREATE TABLE `usuarios_encuestas` (
  `id_usuario` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `id_encuesta` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `matricula` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `semestre_grupo` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios_encuestas`
--

INSERT INTO `usuarios_encuestas` (`id_usuario`, `id_encuesta`, `nombre`, `apellidos`, `email`, `matricula`, `semestre_grupo`) VALUES
('131', 15, 'sofia Tuz Jesus', '', 'soysofia@gmail.com', '18070079', '3Âº B'),
('135', 15, 'Jesus Reyes Tuz Acosta', '', 'jesusreyestuzacosta@gmail.com', '18070100', '7Âº A'),
('140', 15, 'Jesus reey Che Ek', '', 'jesusreyestuzacosta@gmail.com', '12345678', '3Âº B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `clave_transaccion` varchar(255) NOT NULL,
  `paypal_datos` text NOT NULL,
  `fecha` datetime NOT NULL,
  `correo` varchar(5000) NOT NULL,
  `total` decimal(60,2) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `clave_transaccion`, `paypal_datos`, `fecha`, `correo`, `total`, `status`) VALUES
(1, 'l422khpapo7dgbee8ce5mp9ia9', '', '2022-09-27 15:28:05', 'migueloxte@gmail.com', '250.00', 'Pendiente'),
(2, 'l422khpapo7dgbee8ce5mp9ia9', '', '2022-09-27 15:28:43', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(3, 'l422khpapo7dgbee8ce5mp9ia9', '', '2022-09-27 15:30:58', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(4, 'l422khpapo7dgbee8ce5mp9ia9', '', '2022-09-27 15:31:17', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(5, 'l422khpapo7dgbee8ce5mp9ia9', '', '2022-09-27 15:35:56', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(6, 'l422khpapo7dgbee8ce5mp9ia9', '', '2022-09-27 15:49:49', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(7, 'l422khpapo7dgbee8ce5mp9ia9', '', '2022-09-27 15:52:39', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(8, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 11:41:44', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(9, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 11:43:41', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(10, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 11:44:57', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(11, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 11:45:29', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(12, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 12:14:17', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(13, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 12:15:37', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(14, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 12:16:07', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(15, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 12:16:34', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(16, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 12:17:23', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(17, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 12:18:14', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(18, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 12:18:40', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(19, '7s4f000js5eavi4mm1airslv93', '', '2022-09-29 12:26:01', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(20, 'b2urm2tnfcr1secj5j8dcm0bq0', '', '2022-09-29 12:40:57', 'miguel.oxtetzuc@itsva.edu.mx', '1588.60', 'Pendiente'),
(21, 'b2urm2tnfcr1secj5j8dcm0bq0', '', '2022-09-29 12:45:34', 'miguel.oxtetzuc@itsva.edu.mx', '1588.60', 'Pendiente'),
(22, 'b2urm2tnfcr1secj5j8dcm0bq0', '', '2022-09-29 12:47:50', 'miguel.oxtetzuc@itsva.edu.mx', '1588.60', 'Pendiente'),
(23, 'b2urm2tnfcr1secj5j8dcm0bq0', '', '2022-09-29 12:48:41', 'miguel.oxtetzuc@itsva.edu.mx', '1588.60', 'Pendiente'),
(24, 'b2urm2tnfcr1secj5j8dcm0bq0', '', '2022-09-29 12:49:26', 'miguel.oxtetzuc@itsva.edu.mx', '1588.60', 'Pendiente'),
(25, 'b2urm2tnfcr1secj5j8dcm0bq0', '', '2022-09-29 12:51:47', 'miguel.oxtetzuc@itsva.edu.mx', '1588.60', 'Pendiente'),
(26, 'b2urm2tnfcr1secj5j8dcm0bq0', '', '2022-09-29 12:53:46', 'miguel.oxtetzuc@itsva.edu.mx', '1588.60', 'Pendiente'),
(27, 'b2urm2tnfcr1secj5j8dcm0bq0', '', '2022-09-29 12:56:15', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(28, 'b2urm2tnfcr1secj5j8dcm0bq0', '', '2022-09-29 12:58:54', 'migueloxte@gmail.com', '250.00', 'Pendiente'),
(29, 'b2urm2tnfcr1secj5j8dcm0bq0', '', '2022-09-29 13:05:57', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(30, 'vh89in5ag09bsm4esga9sju40s', '', '2022-09-29 18:54:13', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(31, 'vh89in5ag09bsm4esga9sju40s', '', '2022-09-29 19:00:25', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(32, 'vh89in5ag09bsm4esga9sju40s', '', '2022-09-29 19:01:58', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(33, 'vh89in5ag09bsm4esga9sju40s', '', '2022-09-29 19:42:06', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(34, 'vh89in5ag09bsm4esga9sju40s', '', '2022-09-29 19:48:53', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(35, 'vh89in5ag09bsm4esga9sju40s', '', '2022-09-29 20:00:17', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(36, 'vh89in5ag09bsm4esga9sju40s', '', '2022-09-29 20:02:05', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(37, 'ee48p63vuk9k2hcunhc0tr744o', '', '2022-09-30 17:05:07', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(38, 'ee48p63vuk9k2hcunhc0tr744o', '', '2022-09-30 17:09:13', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(39, 'ee48p63vuk9k2hcunhc0tr744o', '', '2022-09-30 17:16:32', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(40, 'ee48p63vuk9k2hcunhc0tr744o', '', '2022-09-30 17:20:48', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(41, 'ee48p63vuk9k2hcunhc0tr744o', '', '2022-09-30 17:53:53', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(42, 'ee48p63vuk9k2hcunhc0tr744o', '', '2022-09-30 17:57:29', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(43, '1rloi0dqcfdlal2ptlc270fvid', '', '2022-10-01 16:51:08', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(44, '1rloi0dqcfdlal2ptlc270fvid', '', '2022-10-01 16:52:56', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(45, '1rloi0dqcfdlal2ptlc270fvid', '', '2022-10-01 16:54:43', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(46, '1rloi0dqcfdlal2ptlc270fvid', '', '2022-10-01 17:53:45', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(47, '1rloi0dqcfdlal2ptlc270fvid', '', '2022-10-01 17:56:42', 'jesus.tuzacosta@itsva.edu.mx', '250.00', 'Pendiente'),
(48, '00dhoivsfpsl89vsi356eaqpvi', '', '2022-10-04 09:51:21', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(49, '8p2chtc17f7ed7lh8j7cn7l30n', '', '2022-10-04 11:00:45', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(50, '9rkm6uhtl3sg8ebft70l0jq4fe', '{\"id\":\"PAYID-MM7AQYI6TS614432A010715F\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"8C315565VD508670P\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"9rkm6uhtl3sg8ebft70l0jq4fe#WyR31l3LdueiSvAqlAKZwA==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"1F875386XU733973S\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MM7AQYI6TS614432A010715F\",\"create_time\":\"2022-10-05T22:43:04Z\",\"update_time\":\"2022-10-05T22:43:04Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/1F875386XU733973S\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/1F875386XU733973S/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MM7AQYI6TS614432A010715F\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-10-05T22:42:41Z\",\"update_time\":\"2022-10-05T22:43:04Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MM7AQYI6TS614432A010715F\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-10-05 17:42:31', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'completo'),
(51, '9rkm6uhtl3sg8ebft70l0jq4fe', '{\"id\":\"PAYID-MM7ATOQ5JD902417N699625R\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"2M4999138D5113339\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"9rkm6uhtl3sg8ebft70l0jq4fe#S6Xyngukpqd/GsNzVHClyg==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"0B893163HR1214213\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MM7ATOQ5JD902417N699625R\",\"create_time\":\"2022-10-05T22:48:38Z\",\"update_time\":\"2022-10-05T22:48:38Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/0B893163HR1214213\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/0B893163HR1214213/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MM7ATOQ5JD902417N699625R\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-10-05T22:48:26Z\",\"update_time\":\"2022-10-05T22:48:38Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MM7ATOQ5JD902417N699625R\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-10-05 17:48:18', 'jesus.tuzacosta@itsva.edu.mx', '250.00', 'completo'),
(52, '9rkm6uhtl3sg8ebft70l0jq4fe', '{\"id\":\"PAYID-MM7AUQI17276679EN7177835\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"4C729608A5894851Y\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"9rkm6uhtl3sg8ebft70l0jq4fe#+XP955smeOGGg8HPrZvoXA==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"93M740333T260733B\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MM7AUQI17276679EN7177835\",\"create_time\":\"2022-10-05T22:50:52Z\",\"update_time\":\"2022-10-05T22:50:52Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/93M740333T260733B\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/93M740333T260733B/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MM7AUQI17276679EN7177835\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-10-05T22:50:41Z\",\"update_time\":\"2022-10-05T22:50:52Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MM7AUQI17276679EN7177835\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-10-05 17:50:34', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'completo'),
(53, '9rkm6uhtl3sg8ebft70l0jq4fe', '{\"id\":\"PAYID-MM7A6ZQ9MR4635555159771N\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"062069038R816791L\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"9rkm6uhtl3sg8ebft70l0jq4fe#JEix51+A96nstGcSDxnVdw==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"02U10124308410501\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MM7A6ZQ9MR4635555159771N\",\"create_time\":\"2022-10-05T23:13:00Z\",\"update_time\":\"2022-10-05T23:13:00Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/02U10124308410501\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/02U10124308410501/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MM7A6ZQ9MR4635555159771N\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-10-05T23:12:38Z\",\"update_time\":\"2022-10-05T23:13:00Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MM7A6ZQ9MR4635555159771N\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-10-05 18:12:31', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'completo'),
(54, 'slbk6afiohmtev9tdlpsqe0noe', '{\"id\":\"PAYID-MNMKMUI9BJ49848DC9069149\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"1VX53561J6668383U\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"slbk6afiohmtev9tdlpsqe0noe#/Kqz+C05N8XYuvp28Yd+xg==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"95X022067P579720P\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MNMKMUI9BJ49848DC9069149\",\"create_time\":\"2022-10-26T03:15:51Z\",\"update_time\":\"2022-10-26T03:15:51Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/95X022067P579720P\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/95X022067P579720P/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNMKMUI9BJ49848DC9069149\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-10-26T03:15:29Z\",\"update_time\":\"2022-10-26T03:15:51Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNMKMUI9BJ49848DC9069149\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-10-25 22:14:39', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'completo'),
(55, 'slbk6afiohmtev9tdlpsqe0noe', '{\"id\":\"PAYID-MNMKVDA5N567804RU1623413\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"0FC87896C5003172G\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"slbk6afiohmtev9tdlpsqe0noe#dLBFaFCXr7cGbn7S9I82Jw==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"2P382041F38936351\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MNMKVDA5N567804RU1623413\",\"create_time\":\"2022-10-26T03:33:52Z\",\"update_time\":\"2022-10-26T03:33:52Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/2P382041F38936351\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/2P382041F38936351/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNMKVDA5N567804RU1623413\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-10-26T03:33:32Z\",\"update_time\":\"2022-10-26T03:33:52Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNMKVDA5N567804RU1623413\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-10-25 22:32:50', 'jesus.tuzacosta@itsva.edu.mx', '250.00', 'completo'),
(56, 'slbk6afiohmtev9tdlpsqe0noe', '{\"id\":\"PAYID-MNMKYSY1KA19505087750844\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"4HU543535S200644D\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"slbk6afiohmtev9tdlpsqe0noe#zuZ7kQQiTKd6IQ+4R3GK/g==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"47C74854W14032405\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MNMKYSY1KA19505087750844\",\"create_time\":\"2022-10-26T03:41:13Z\",\"update_time\":\"2022-10-26T03:41:13Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/47C74854W14032405\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/47C74854W14032405/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNMKYSY1KA19505087750844\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-10-26T03:40:59Z\",\"update_time\":\"2022-10-26T03:41:13Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNMKYSY1KA19505087750844\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-10-25 22:40:53', 'migueloxtee@gmail.com', '250.00', 'completo'),
(57, 'slbk6afiohmtev9tdlpsqe0noe', '{\"id\":\"PAYID-MNMKZQA6NN15232K57637901\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"5DE64948MP0310411\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"slbk6afiohmtev9tdlpsqe0noe#iiT0NLxflMmgaKweFIeXVA==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"8HT14482AY224881L\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MNMKZQA6NN15232K57637901\",\"create_time\":\"2022-10-26T03:43:10Z\",\"update_time\":\"2022-10-26T03:43:10Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/8HT14482AY224881L\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/8HT14482AY224881L/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNMKZQA6NN15232K57637901\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-10-26T03:42:56Z\",\"update_time\":\"2022-10-26T03:43:10Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNMKZQA6NN15232K57637901\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-10-25 22:42:49', 'migueloxtee@outlook.com', '250.00', 'completo'),
(58, 'slbk6afiohmtev9tdlpsqe0noe', '', '2022-10-25 22:52:07', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(59, 'slbk6afiohmtev9tdlpsqe0noe', '', '2022-10-25 22:54:16', 'migueloxtee@outlook.com', '250.00', 'Pendiente'),
(60, 'slbk6afiohmtev9tdlpsqe0noe', '', '2022-10-25 22:56:58', 'jesus.tuzacosta@itsva.edu.mx', '250.00', 'Pendiente'),
(61, 'slbk6afiohmtev9tdlpsqe0noe', '', '2022-10-25 23:00:16', 'jesus.tuzacosta@itsva.edu.mx', '250.00', 'Pendiente'),
(62, 'slbk6afiohmtev9tdlpsqe0noe', '', '2022-10-25 23:07:25', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(63, 'slbk6afiohmtev9tdlpsqe0noe', '', '2022-10-25 23:11:13', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(64, '4nhjugfgm1dr2hrfho26ep2edd', '', '2022-10-25 23:18:49', 'jesus.tuzacosta@itsva.edu.mx', '250.00', 'Pendiente'),
(65, 'smoe1uem3670ne7e6l6kuk3aut', '{\"id\":\"PAYID-MNMT67Q7SE188150E332131G\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"7N345875XU9473140\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"smoe1uem3670ne7e6l6kuk3aut#zbis9SEFSuf2DmghWx0PhA==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"96L12563TT294700P\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MNMT67Q7SE188150E332131G\",\"create_time\":\"2022-10-26T14:13:49Z\",\"update_time\":\"2022-10-26T14:13:49Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/96L12563TT294700P\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/96L12563TT294700P/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNMT67Q7SE188150E332131G\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-10-26T14:09:02Z\",\"update_time\":\"2022-10-26T14:13:49Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNMT67Q7SE188150E332131G\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-10-26 09:08:49', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'completo'),
(66, 'g8cgdl0u6bbdoha9mjimamqa94', '{\"id\":\"PAYID-MNRQDVA7H404362N83946401\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"63E14173RB254263M\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"g8cgdl0u6bbdoha9mjimamqa94#HguhvU76JfvNAG1nfCtcjw==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"5FE97708TK067151H\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MNRQDVA7H404362N83946401\",\"create_time\":\"2022-11-02T23:48:57Z\",\"update_time\":\"2022-11-02T23:48:57Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/5FE97708TK067151H\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/5FE97708TK067151H/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNRQDVA7H404362N83946401\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-11-02T23:48:36Z\",\"update_time\":\"2022-11-02T23:48:57Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNRQDVA7H404362N83946401\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-11-02 17:48:29', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'completo'),
(67, 'g8cgdl0u6bbdoha9mjimamqa94', '{\"id\":\"PAYID-MNRQFJA8F940825JM1287841\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"7GT009884S642305T\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"g8cgdl0u6bbdoha9mjimamqa94#3uXzFpz7ClWv4kXYPTClkw==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"1BM76463BT563671X\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MNRQFJA8F940825JM1287841\",\"create_time\":\"2022-11-02T23:52:29Z\",\"update_time\":\"2022-11-02T23:52:29Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/1BM76463BT563671X\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/1BM76463BT563671X/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNRQFJA8F940825JM1287841\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-11-02T23:52:04Z\",\"update_time\":\"2022-11-02T23:52:29Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MNRQFJA8F940825JM1287841\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-11-02 17:51:57', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'completo'),
(69, 'ps8nbkpueql5helsesf65to0mh', '{\"id\":\"PAYID-MN3QF6A86F4972260966683E\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"3LN463586X275581P\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"500.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"500.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"ps8nbkpueql5helsesf65to0mh#Vc50Y8JcYsvEK3S/J4pxcw==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"35B5178043451154K\",\"state\":\"completed\",\"amount\":{\"total\":\"500.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"500.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"27.54\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MN3QF6A86F4972260966683E\",\"create_time\":\"2022-11-18T03:59:16Z\",\"update_time\":\"2022-11-18T03:59:16Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/35B5178043451154K\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/35B5178043451154K/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MN3QF6A86F4972260966683E\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-11-18T03:58:48Z\",\"update_time\":\"2022-11-18T03:59:16Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MN3QF6A86F4972260966683E\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-11-17 21:58:38', 'nicole.calderonchuc@itsva.edu.mx', '500.00', 'completo'),
(70, 'rr9g52vtm3fmb21akq37e9343l', '{\"id\":\"PAYID-MN6ZILI42E32769XW163273L\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"6JY36909WE415701K\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"rr9g52vtm3fmb21akq37e9343l#sRFhBcyDBYnHibD1MrK01g==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"36415661MY2430053\",\"state\":\"completed\",\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"50.44\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MN6ZILI42E32769XW163273L\",\"create_time\":\"2022-11-23T03:34:10Z\",\"update_time\":\"2022-11-23T03:34:10Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/36415661MY2430053\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/36415661MY2430053/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MN6ZILI42E32769XW163273L\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-11-23T03:31:57Z\",\"update_time\":\"2022-11-23T03:34:10Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MN6ZILI42E32769XW163273L\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-11-22 21:31:49', 'nicole.calderonchuc@itsva.edu.mx', '1000.00', 'completo'),
(71, 'rr9g52vtm3fmb21akq37e9343l', '{\"id\":\"PAYID-MN6ZMEA69127971SM624354L\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"1F396005F9220441N\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"rr9g52vtm3fmb21akq37e9343l#vfx6CicvhE3kgZDg07nQcA==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"7WR32585LY5398543\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MN6ZMEA69127971SM624354L\",\"create_time\":\"2022-11-23T03:40:13Z\",\"update_time\":\"2022-11-23T03:40:13Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/7WR32585LY5398543\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/7WR32585LY5398543/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MN6ZMEA69127971SM624354L\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-11-23T03:40:00Z\",\"update_time\":\"2022-11-23T03:40:13Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MN6ZMEA69127971SM624354L\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-11-22 21:39:54', 'nicole.calderonchuc@itsva.edu.mx', '250.00', 'completo'),
(72, 'rr9g52vtm3fmb21akq37e9343l', '{\"id\":\"PAYID-MN6ZNNI21A44522YW8158013\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"18W68688YY926102D\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"rr9g52vtm3fmb21akq37e9343l#QC6fNM1VB/Jd8rsLZkFdIw==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"2TN490180K8750238\",\"state\":\"completed\",\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"50.44\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MN6ZNNI21A44522YW8158013\",\"create_time\":\"2022-11-23T03:42:58Z\",\"update_time\":\"2022-11-23T03:42:58Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/2TN490180K8750238\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/2TN490180K8750238/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MN6ZNNI21A44522YW8158013\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-11-23T03:42:45Z\",\"update_time\":\"2022-11-23T03:42:58Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MN6ZNNI21A44522YW8158013\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-11-22 21:42:39', 'nicole.calderonchuc@itsva.edu.mx', '1000.00', 'completo');
INSERT INTO `ventas` (`id_venta`, `clave_transaccion`, `paypal_datos`, `fecha`, `correo`, `total`, `status`) VALUES
(73, 'fbk7lff77cmt7cpgsiqisv2h31', '{\"id\":\"PAYID-MOEXLAY0XK66774VX622722T\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"6YG773309U851984W\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"fbk7lff77cmt7cpgsiqisv2h31#MHLkNXKahLfWi48WSl93xA==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"62T41575PG766690L\",\"state\":\"completed\",\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"50.44\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MOEXLAY0XK66774VX622722T\",\"create_time\":\"2022-12-02T03:50:50Z\",\"update_time\":\"2022-12-02T03:50:50Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/62T41575PG766690L\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/62T41575PG766690L/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXLAY0XK66774VX622722T\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-12-02T03:48:19Z\",\"update_time\":\"2022-12-02T03:50:50Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXLAY0XK66774VX622722T\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-12-01 21:48:13', 'nicole.calderonchuc@itsva.edu.mx', '1000.00', 'completo'),
(74, 'fbk7lff77cmt7cpgsiqisv2h31', '{\"id\":\"PAYID-MOEXNAA0H446850VB520950M\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"34R09648S4136741P\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"fbk7lff77cmt7cpgsiqisv2h31#o6yE5OBADAQ0D1U474kgWQ==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"2DC356954F888013K\",\"state\":\"completed\",\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"50.44\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MOEXNAA0H446850VB520950M\",\"create_time\":\"2022-12-02T03:52:45Z\",\"update_time\":\"2022-12-02T03:52:45Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/2DC356954F888013K\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/2DC356954F888013K/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXNAA0H446850VB520950M\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-12-02T03:52:32Z\",\"update_time\":\"2022-12-02T03:52:45Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXNAA0H446850VB520950M\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-12-01 21:52:26', 'nicole.calderonchuc@itsva.edu.mx', '1000.00', 'completo'),
(75, 'fbk7lff77cmt7cpgsiqisv2h31', '{\"id\":\"PAYID-MOEXOCA9AW22817TN078423B\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"1WE30227MK9439050\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"fbk7lff77cmt7cpgsiqisv2h31#9/cotgBr/M5X7dBfKzAblg==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"72M234752D583781C\",\"state\":\"completed\",\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"50.44\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MOEXOCA9AW22817TN078423B\",\"create_time\":\"2022-12-02T03:55:03Z\",\"update_time\":\"2022-12-02T03:55:03Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/72M234752D583781C\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/72M234752D583781C/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXOCA9AW22817TN078423B\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-12-02T03:54:48Z\",\"update_time\":\"2022-12-02T03:55:03Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXOCA9AW22817TN078423B\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-12-01 21:54:42', 'jesus.tuzacosta@itsva.edu.mx', '1000.00', 'completo'),
(76, 'fbk7lff77cmt7cpgsiqisv2h31', '{\"id\":\"PAYID-MOEXOWQ3KX93667J9473253X\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"95T28677S6426482R\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"fbk7lff77cmt7cpgsiqisv2h31#EvX3kgF4UzWx89dOz6iRlQ==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"6XR59178LM443903V\",\"state\":\"completed\",\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"50.44\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MOEXOWQ3KX93667J9473253X\",\"create_time\":\"2022-12-02T03:56:22Z\",\"update_time\":\"2022-12-02T03:56:22Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/6XR59178LM443903V\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/6XR59178LM443903V/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXOWQ3KX93667J9473253X\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-12-02T03:56:10Z\",\"update_time\":\"2022-12-02T03:56:22Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXOWQ3KX93667J9473253X\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-12-01 21:56:05', 'jesus.tuzacosta@itsva.edu.mx', '1000.00', 'completo'),
(77, 'fbk7lff77cmt7cpgsiqisv2h31', '{\"id\":\"PAYID-MOEXQ2A5D1727495E9706907\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"4AX47903K2180070T\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"fbk7lff77cmt7cpgsiqisv2h31#euC57XvxvV/ojRHZPEEgug==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"1K0057272X224271J\",\"state\":\"completed\",\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"50.44\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MOEXQ2A5D1727495E9706907\",\"create_time\":\"2022-12-02T04:00:54Z\",\"update_time\":\"2022-12-02T04:00:54Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/1K0057272X224271J\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/1K0057272X224271J/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXQ2A5D1727495E9706907\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-12-02T04:00:40Z\",\"update_time\":\"2022-12-02T04:00:54Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXQ2A5D1727495E9706907\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-12-01 22:00:32', 'nicole.calderonchuc@itsva.edu.mx', '1000.00', 'completo'),
(78, 'fbk7lff77cmt7cpgsiqisv2h31', '{\"id\":\"PAYID-MOEXRZA55902555MP410960E\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"9M974778T0289511R\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"fbk7lff77cmt7cpgsiqisv2h31#dkN1ZB85gBbzA2nBgp6/2g==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"3EK75136HW508583M\",\"state\":\"completed\",\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"50.44\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MOEXRZA55902555MP410960E\",\"create_time\":\"2022-12-02T04:02:57Z\",\"update_time\":\"2022-12-02T04:02:57Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/3EK75136HW508583M\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/3EK75136HW508583M/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXRZA55902555MP410960E\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-12-02T04:02:44Z\",\"update_time\":\"2022-12-02T04:02:57Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXRZA55902555MP410960E\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-12-01 22:02:35', 'nicole.calderonchuc@itsva.edu.mx', '1000.00', 'completo'),
(79, 'fbk7lff77cmt7cpgsiqisv2h31', '{\"id\":\"PAYID-MOEXTLQ8EF747245D573433F\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"40X32810YU1139648\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"fbk7lff77cmt7cpgsiqisv2h31#bajtb6u65xrNt9l+r+bYXQ==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"975245212E723613G\",\"state\":\"completed\",\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"50.44\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MOEXTLQ8EF747245D573433F\",\"create_time\":\"2022-12-02T04:06:21Z\",\"update_time\":\"2022-12-02T04:06:21Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/975245212E723613G\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/975245212E723613G/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXTLQ8EF747245D573433F\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-12-02T04:06:06Z\",\"update_time\":\"2022-12-02T04:06:21Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXTLQ8EF747245D573433F\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-12-01 22:05:58', 'nicole.calderonchuc@itsva.edu.mx', '1000.00', 'completo'),
(80, 'fbk7lff77cmt7cpgsiqisv2h31', '{\"id\":\"PAYID-MOEXUSA04L42360L0073160N\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"7RK60336WY3269629\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"fbk7lff77cmt7cpgsiqisv2h31#ce1anRbCREGYVBzckKgBTw==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"127858749F355160F\",\"state\":\"completed\",\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"50.44\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MOEXUSA04L42360L0073160N\",\"create_time\":\"2022-12-02T04:08:53Z\",\"update_time\":\"2022-12-02T04:08:53Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/127858749F355160F\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/127858749F355160F/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXUSA04L42360L0073160N\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-12-02T04:08:40Z\",\"update_time\":\"2022-12-02T04:08:53Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOEXUSA04L42360L0073160N\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-12-01 22:08:15', 'nicole.calderonchuc@itsva.edu.mx', '1000.00', 'completo'),
(81, 'ev7hr6j69cbmoqh3n4sdofubac', '{\"id\":\"PAYID-MOL7NBI4HY835442X7942348\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"14V98218MC7024118\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"ev7hr6j69cbmoqh3n4sdofubac#/W+gsYtj4nmwJJo50WunwQ==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"0BY454734N6669305\",\"state\":\"completed\",\"amount\":{\"total\":\"1000.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"1000.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"50.44\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MOL7NBI4HY835442X7942348\",\"create_time\":\"2022-12-13T03:51:46Z\",\"update_time\":\"2022-12-13T03:51:46Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/0BY454734N6669305\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/0BY454734N6669305/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOL7NBI4HY835442X7942348\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-12-13T03:50:29Z\",\"update_time\":\"2022-12-13T03:51:46Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOL7NBI4HY835442X7942348\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-12-12 21:50:22', 'nicole.calderonchuc@itsva.edu.mx', '1000.00', 'completo'),
(82, '9kme3gl7h7m4f1i54k5fjacdl6', '', '2022-12-13 22:01:39', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'Pendiente'),
(83, '9kme3gl7h7m4f1i54k5fjacdl6', '{\"id\":\"PAYID-MOMVDHY8SS40517LH602404S\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"99769972MY373494L\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"migueloxtee@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"T4B8Z4TWA7JN4\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"},\"phone\":\"9397746839\",\"country_code\":\"MX\"}},\"transactions\":[{\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"7QCTTZQC22H4A\",\"email\":\"migueloxtee@business.example.com\"},\"description\":\"Compra de productos a Develoteca:$\",\"custom\":\"9kme3gl7h7m4f1i54k5fjacdl6#VA/b9E13iAsvmE8FsKR1IA==\",\"soft_descriptor\":\"PAYPAL *TEST STORE\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Calle Juarez 1\",\"line2\":\"Col. Cuauhtemoc\",\"city\":\"Miguel Hidalgo\",\"state\":\"Ciudad de Mexico\",\"postal_code\":\"11580\",\"country_code\":\"MX\"}},\"related_resources\":[{\"sale\":{\"id\":\"8AR625025V1737607\",\"state\":\"completed\",\"amount\":{\"total\":\"250.00\",\"currency\":\"MXN\",\"details\":{\"subtotal\":\"250.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\",\"discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"16.09\",\"currency\":\"MXN\"},\"parent_payment\":\"PAYID-MOMVDHY8SS40517LH602404S\",\"create_time\":\"2022-12-14T04:35:45Z\",\"update_time\":\"2022-12-14T04:35:45Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/8AR625025V1737607\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/8AR625025V1737607/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOMVDHY8SS40517LH602404S\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *TEST STORE\"}}]}],\"create_time\":\"2022-12-14T04:31:27Z\",\"update_time\":\"2022-12-14T04:35:45Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-MOMVDHY8SS40517LH602404S\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2022-12-13 22:30:28', 'miguel.oxtetzuc@itsva.edu.mx', '250.00', 'completo'),
(84, '85f6t0u8j3hf3etc1reskk8qd0', '', '2023-01-01 20:13:26', 'jesusreyestuzacosta@gmail.com', '1000.00', 'Pendiente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `id_admin` (`id_admin`),
  ADD UNIQUE KEY `correo_admin` (`correo_admin`),
  ADD KEY `IX_Relationship2` (`id_user`);

--
-- Indices de la tabla `admin_carreras`
--
ALTER TABLE `admin_carreras`
  ADD PRIMARY KEY (`id_adminCarrera`),
  ADD UNIQUE KEY `id_adminCarrera` (`id_adminCarrera`),
  ADD UNIQUE KEY `carrera` (`carrera`),
  ADD KEY `IX_Relationship4` (`id_user`),
  ADD KEY `IX_Relationship7` (`id_imagen`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`,`id_adminCarrera`),
  ADD UNIQUE KEY `id_alumno` (`id_alumno`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `IX_Relationship5` (`id_user`),
  ADD KEY `Relationship21` (`id_adminCarrera`);

--
-- Indices de la tabla `alumnos_conferencias`
--
ALTER TABLE `alumnos_conferencias`
  ADD PRIMARY KEY (`id_alumno`,`id_conferencia`),
  ADD KEY `Relationship25` (`id_conferencia`);

--
-- Indices de la tabla `avisos`
--
ALTER TABLE `avisos`
  ADD PRIMARY KEY (`id_aviso`,`id_adminCarrera`),
  ADD UNIQUE KEY `id_aviso` (`id_aviso`),
  ADD KEY `Relationship8` (`id_adminCarrera`);

--
-- Indices de la tabla `concursos`
--
ALTER TABLE `concursos`
  ADD PRIMARY KEY (`id_concurso`,`id_instructor`),
  ADD UNIQUE KEY `id_concurso` (`id_concurso`),
  ADD KEY `Relationship13` (`id_instructor`);

--
-- Indices de la tabla `conferencias`
--
ALTER TABLE `conferencias`
  ADD PRIMARY KEY (`id_instructor`,`id_conferencia`),
  ADD UNIQUE KEY `id_conferencias` (`id_conferencia`);

--
-- Indices de la tabla `correos`
--
ALTER TABLE `correos`
  ADD PRIMARY KEY (`id_correo`),
  ADD UNIQUE KEY `id_correo` (`id_correo`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  ADD PRIMARY KEY (`id_encuesta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`,`id_concurso`),
  ADD UNIQUE KEY `id_equipo` (`id_equipo`),
  ADD KEY `Relationship20` (`id_concurso`);

--
-- Indices de la tabla `grupo_etnico`
--
ALTER TABLE `grupo_etnico`
  ADD PRIMARY KEY (`id_grupo_etnico`);

--
-- Indices de la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD PRIMARY KEY (`id_instructor`,`id_adminCarrera`),
  ADD UNIQUE KEY `id_instructor` (`id_instructor`),
  ADD KEY `IX_Relationship6` (`id_user`),
  ADD KEY `Relationship22` (`id_adminCarrera`);

--
-- Indices de la tabla `logos`
--
ALTER TABLE `logos`
  ADD PRIMARY KEY (`id_imagen`),
  ADD UNIQUE KEY `id_imagen` (`id_imagen`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`id_opcion`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `passwords`
--
ALTER TABLE `passwords`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_pregunta`),
  ADD KEY `id_encuesta` (`id_encuesta`),
  ADD KEY `id_tipo_pregunta` (`id_tipo_pregunta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `promediolengua`
--
ALTER TABLE `promediolengua`
  ADD PRIMARY KEY (`id_promediolengua`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`id_resultado`),
  ADD KEY `id_opcion` (`id_opcion`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `id_rol` (`id_rol`),
  ADD UNIQUE KEY `rol` (`rol`);

--
-- Indices de la tabla `semestre_grupo`
--
ALTER TABLE `semestre_grupo`
  ADD PRIMARY KEY (`id_semestre_grupo`);

--
-- Indices de la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD PRIMARY KEY (`id_taller`,`id_instructor`),
  ADD UNIQUE KEY `id_taller` (`id_taller`),
  ADD KEY `Relationship12` (`id_instructor`);

--
-- Indices de la tabla `td_curso_usuario`
--
ALTER TABLE `td_curso_usuario`
  ADD PRIMARY KEY (`curd_id`);

--
-- Indices de la tabla `tipo_pregunta`
--
ALTER TABLE `tipo_pregunta`
  ADD PRIMARY KEY (`id_tipo_pregunta`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indices de la tabla `tm_categoria`
--
ALTER TABLE `tm_categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `tm_curso`
--
ALTER TABLE `tm_curso`
  ADD PRIMARY KEY (`cur_id`);

--
-- Indices de la tabla `tm_instructor`
--
ALTER TABLE `tm_instructor`
  ADD PRIMARY KEY (`inst_id`);

--
-- Indices de la tabla `tm_usuario`
--
ALTER TABLE `tm_usuario`
  ADD PRIMARY KEY (`usu_id`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id_transaccion`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_alumno` (`id_alumno`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`,`id_rol`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD UNIQUE KEY `correo_user` (`correo_user`),
  ADD KEY `Relationship1` (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_tipo_usuario` (`id_tipo_usuario`);

--
-- Indices de la tabla `usuarios_encuestas`
--
ALTER TABLE `usuarios_encuestas`
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_encuesta` (`id_encuesta`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `admin_carreras`
--
ALTER TABLE `admin_carreras`
  MODIFY `id_adminCarrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `avisos`
--
ALTER TABLE `avisos`
  MODIFY `id_aviso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `concursos`
--
ALTER TABLE `concursos`
  MODIFY `id_concurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `conferencias`
--
ALTER TABLE `conferencias`
  MODIFY `id_conferencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `correos`
--
ALTER TABLE `correos`
  MODIFY `id_correo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  MODIFY `id_encuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `grupo_etnico`
--
ALTER TABLE `grupo_etnico`
  MODIFY `id_grupo_etnico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `instructores`
--
ALTER TABLE `instructores`
  MODIFY `id_instructor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `logos`
--
ALTER TABLE `logos`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `id_opcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `passwords`
--
ALTER TABLE `passwords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `promediolengua`
--
ALTER TABLE `promediolengua`
  MODIFY `id_promediolengua` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `id_resultado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `semestre_grupo`
--
ALTER TABLE `semestre_grupo`
  MODIFY `id_semestre_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `talleres`
--
ALTER TABLE `talleres`
  MODIFY `id_taller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `td_curso_usuario`
--
ALTER TABLE `td_curso_usuario`
  MODIFY `curd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tm_categoria`
--
ALTER TABLE `tm_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tm_curso`
--
ALTER TABLE `tm_curso`
  MODIFY `cur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `tm_instructor`
--
ALTER TABLE `tm_instructor`
  MODIFY `inst_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tm_usuario`
--
ALTER TABLE `tm_usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id_transaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `Relationship2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `admin_carreras`
--
ALTER TABLE `admin_carreras`
  ADD CONSTRAINT `Relationship4` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `Relationship7` FOREIGN KEY (`id_imagen`) REFERENCES `logos` (`id_imagen`);

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `Relationship21` FOREIGN KEY (`id_adminCarrera`) REFERENCES `admin_carreras` (`id_adminCarrera`),
  ADD CONSTRAINT `Relationship5` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `alumnos_conferencias`
--
ALTER TABLE `alumnos_conferencias`
  ADD CONSTRAINT `Relationship24` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`),
  ADD CONSTRAINT `Relationship25` FOREIGN KEY (`id_conferencia`) REFERENCES `conferencias` (`id_conferencia`);

--
-- Filtros para la tabla `avisos`
--
ALTER TABLE `avisos`
  ADD CONSTRAINT `Relationship8` FOREIGN KEY (`id_adminCarrera`) REFERENCES `admin_carreras` (`id_adminCarrera`);

--
-- Filtros para la tabla `concursos`
--
ALTER TABLE `concursos`
  ADD CONSTRAINT `Relationship13` FOREIGN KEY (`id_instructor`) REFERENCES `instructores` (`id_instructor`);

--
-- Filtros para la tabla `conferencias`
--
ALTER TABLE `conferencias`
  ADD CONSTRAINT `Relationship14` FOREIGN KEY (`id_instructor`) REFERENCES `instructores` (`id_instructor`);

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `Relationship20` FOREIGN KEY (`id_concurso`) REFERENCES `concursos` (`id_concurso`);

--
-- Filtros para la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD CONSTRAINT `Relationship22` FOREIGN KEY (`id_adminCarrera`) REFERENCES `admin_carreras` (`id_adminCarrera`),
  ADD CONSTRAINT `Relationship6` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD CONSTRAINT `opciones_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id_pregunta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`id_tipo_pregunta`) REFERENCES `tipo_pregunta` (`id_tipo_pregunta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `preguntas_ibfk_2` FOREIGN KEY (`id_encuesta`) REFERENCES `encuestas` (`id_encuesta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`id_opcion`) REFERENCES `opciones` (`id_opcion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD CONSTRAINT `Relationship12` FOREIGN KEY (`id_instructor`) REFERENCES `instructores` (`id_instructor`);

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `Relationship1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios_encuestas`
--
ALTER TABLE `usuarios_encuestas`
  ADD CONSTRAINT `usuarios_encuestas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_encuestas_ibfk_2` FOREIGN KEY (`id_encuesta`) REFERENCES `encuestas` (`id_encuesta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
