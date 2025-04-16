-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-04-2025 a las 08:16:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pokedex`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abilities`
--

CREATE TABLE `abilities` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evolutions`
--

CREATE TABLE `evolutions` (
  `from_pokemon_id` int(11) NOT NULL,
  `to_pokemon_id` int(11) NOT NULL,
  `evolution_method` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type1` varchar(20) DEFAULT NULL,
  `type2` varchar(20) DEFAULT NULL,
  `generation` int(11) DEFAULT NULL,
  `sprite_url` varchar(255) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_legendary` tinyint(1) DEFAULT 0,
  `is_mythical` tinyint(1) DEFAULT 0,
  `is_shiny` tinyint(1) DEFAULT 0,
  `base_hp` int(11) DEFAULT NULL,
  `base_attack` int(11) DEFAULT NULL,
  `base_defense` int(11) DEFAULT NULL,
  `base_sp_attack` int(11) DEFAULT NULL,
  `base_sp_defense` int(11) DEFAULT NULL,
  `base_speed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pokemon`
--

INSERT INTO `pokemon` (`id`, `name`, `type1`, `type2`, `generation`, `sprite_url`, `height`, `weight`, `description`, `is_legendary`, `is_mythical`, `is_shiny`, `base_hp`, `base_attack`, `base_defense`, `base_sp_attack`, `base_sp_defense`, `base_speed`) VALUES
(1, 'Bulbasaur', 'Grass', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png', 0.7, 6.9, 'Este Pokémon nace con una semilla en el lomo, que brota con el paso del tiempo.', 0, 0, 0, 45, 49, 49, 65, 65, 45),
(2, 'Ivysaur', 'Grass', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png', 1, 13, 'Cuando le crece bastante el bulbo del lomo, pierde la capacidad de erguirse sobre sus patas traseras.', 0, 0, 0, 60, 62, 63, 80, 80, 60),
(3, 'Venusaur', 'Grass', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png', 2, 100, 'La planta florece cuando absorbe energía solar, lo cual le obliga a buscar siempre la luz del sol.', 0, 0, 0, 80, 82, 83, 100, 100, 80),
(4, 'Charmander', 'Fire', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png', 0.6, 8.5, 'Prefiere las cosas calientes. Dicen que cuando llueve le sale vapor de la punta de la cola.', 0, 0, 0, 39, 52, 43, 60, 50, 65),
(5, 'Charmeleon', 'Fire', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png', 1.1, 19, 'Este Pokémon de naturaleza agresiva ataca con su cola llameante y hace trizas a su rival con sus afiladas garras.', 0, 0, 0, 58, 64, 58, 80, 65, 80),
(6, 'Charizard', 'Fire', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png', 1.7, 90.5, 'Escupe un fuego tan caliente que funde las rocas. Causa incendios forestales sin querer.', 0, 0, 0, 78, 84, 78, 109, 85, 100),
(7, 'Squirtle', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png', 0.5, 9, 'Cuando retrae su largo cuello en el caparazón, dispara agua a una presión increíble.', 0, 0, 0, 44, 48, 65, 50, 64, 43),
(8, 'Wartortle', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png', 1, 22.5, 'Es reconocido como un símbolo de longevidad. Si su caparazón tiene algas, ese Wartortle es muy viejo.', 0, 0, 0, 59, 63, 80, 65, 80, 58),
(9, 'Blastoise', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png', 1.6, 85.5, 'Los chorros de agua que dispara pueden atravesar el acero. Aplasta a sus rivales con su peso.', 0, 0, 0, 79, 83, 100, 85, 105, 78),
(10, 'Caterpie', 'Bug', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png', 0.3, 2.9, 'Para protegerse, despide un hedor horrible por las antenas con el que repele a sus enemigos.', 0, 0, 0, 45, 30, 35, 20, 20, 45),
(11, 'Metapod', 'Bug', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png', 0.7, 9.9, 'Su caparazón es duro como una plancha de hierro. Dentro, Metapod no hace más que esperar el momento de su evolución.', 0, 0, 0, 50, 20, 55, 25, 25, 30),
(12, 'Butterfree', 'Bug', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png', 1.1, 32, 'En combate, bate las alas a gran velocidad para liberar polvo altamente tóxico.', 0, 0, 0, 60, 45, 50, 90, 80, 70),
(13, 'Weedle', 'Bug', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/13.png', 0.3, 3.2, 'El aguijón en su cabeza contiene un veneno potente. Este Pokémon busca comida entre la hierba y los arbustos.', 0, 0, 0, 40, 35, 30, 20, 20, 50),
(14, 'Kakuna', 'Bug', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/14.png', 0.6, 10, 'Permanece inmóvil mientras espera a evolucionar. Solo puede endurecer su caparazón para protegerse.', 0, 0, 0, 45, 25, 50, 25, 25, 35),
(15, 'Beedrill', 'Bug', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/15.png', 1, 29.5, 'Tiene tres aguijones venenosos en las patas delanteras y en la cola. Estos aguijones se utilizan para atacar repetidamente a sus enemigos.', 0, 0, 0, 65, 90, 40, 45, 80, 75),
(16, 'Pidgey', 'Normal', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/16.png', 0.3, 1.8, 'Es muy común verlo en bosques y selvas. Aletea al nivel del suelo para levantar la arena y así protegerse.', 0, 0, 0, 40, 45, 40, 35, 35, 56),
(17, 'Pidgeotto', 'Normal', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/17.png', 1.1, 30, 'Este Pokémon está lleno de vitalidad. Vuela constantemente por su territorio en busca de presas.', 0, 0, 0, 63, 60, 55, 50, 50, 71),
(18, 'Pidgeot', 'Normal', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/18.png', 1.5, 39.5, 'Este Pokémon vuela a una velocidad de 2 Mach buscando presas. Sus grandes garras son armas temibles.', 0, 0, 0, 83, 80, 75, 70, 70, 101),
(19, 'Rattata', 'Normal', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/19.png', 0.3, 3.5, 'Sus colmillos son largos y muy afilados. Crecen continuamente, por lo que roe cosas para desgastarlos.', 0, 0, 0, 30, 56, 35, 25, 35, 72),
(20, 'Raticate', 'Normal', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/20.png', 0.7, 18.5, 'Utiliza sus bigotes para mantener el equilibrio. Parece que si se los cortan, se vuelve más lento.', 0, 0, 0, 55, 81, 60, 50, 70, 97),
(21, 'Spearow', 'Normal', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/21.png', 0.3, 2, 'Tiene un pico muy afilado. Cuando detecta un peligro, vuela muy alto y lanza un grito agudo para alertar a sus compañeros.', 0, 0, 0, 40, 60, 30, 31, 31, 70),
(22, 'Fearow', 'Normal', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/22.png', 1.2, 38, 'Con sus tres cabezas, puede volar continuamente durante todo un día sin necesidad de descansar.', 0, 0, 0, 65, 90, 65, 61, 61, 100),
(23, 'Ekans', 'Poison', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/23.png', 2, 6.9, 'Se esconde en la hierba y en los agujeros de las paredes. Busca comida cuando los humanos duermen.', 0, 0, 0, 35, 60, 44, 40, 54, 55),
(24, 'Arbok', 'Poison', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/24.png', 3.5, 65, 'Los dibujos de su piel varían según la región donde habita. Intimida a sus enemigos con el dibujo de su piel.', 0, 0, 0, 60, 95, 69, 65, 79, 80),
(25, 'Pikachu', 'Electric', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png', 0.4, 6, 'Cuando se enfada, libera electricidad de las bolsas eléctricas ubicadas en sus mejillas. Estas bolsas son muy suaves y elásticas.', 0, 0, 0, 35, 55, 40, 50, 50, 90),
(26, 'Raichu', 'Electric', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/26.png', 0.8, 30, 'Su larga cola sirve como toma de tierra para protegerse a sí mismo del alto voltaje que genera su cuerpo.', 0, 0, 0, 60, 90, 55, 90, 80, 110),
(27, 'Sandshrew', 'Ground', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/27.png', 0.6, 12, 'Se enrolla en una bola para protegerse de los ataques enemigos. También se enrolla para atravesar el desierto sin perder humedad.', 0, 0, 0, 50, 75, 85, 20, 30, 40),
(28, 'Sandslash', 'Ground', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/28.png', 1, 29.5, 'Las púas de su espalda son muy duras y afiladas. Puede rodar como una bola para atacar o escapar.', 0, 0, 0, 75, 100, 110, 45, 55, 65),
(29, 'Nidoran♀', 'Poison', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/29.png', 0.4, 7, 'Aunque pequeña, su cuerno venenoso es muy peligroso. La hembra tiene un cuerno más pequeño que el macho.', 0, 0, 0, 55, 47, 52, 40, 40, 41),
(30, 'Nidorina', 'Poison', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/30.png', 0.8, 20, 'Cuando está con su familia o amigos, esconde sus púas para evitar herirlos accidentalmente.', 0, 0, 0, 70, 62, 67, 55, 55, 56),
(31, 'Nidoqueen', 'Poison', 'Ground', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/31.png', 1.3, 60, 'Su cuerpo está cubierto de escamas duras como rocas. Nidoqueen usa su fuerza para proteger a sus crías de cualquier peligro.', 0, 0, 0, 90, 92, 87, 75, 85, 76),
(32, 'Nidoran♂', 'Poison', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/32.png', 0.5, 9, 'Levanta sus grandes orejas para vigilar. Si detecta peligro, ataca inmediatamente con su cuerno venenoso.', 0, 0, 0, 46, 57, 40, 40, 40, 50),
(33, 'Nidorino', 'Poison', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/33.png', 0.9, 19.5, 'Es fácilmente reconocible por su cuerno más desarrollado que el de Nidoran. Tiene un carácter agresivo y ataca sin provocación.', 0, 0, 0, 61, 72, 57, 55, 55, 65),
(34, 'Nidoking', 'Poison', 'Ground', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/34.png', 1.4, 62, 'Su cola es tan poderosa que puede derribar un poste telefónico de un solo golpe. Una vez que atrapa a su presa, la aplasta con su cuerpo.', 0, 0, 0, 81, 102, 77, 85, 75, 85),
(35, 'Clefairy', 'Fairy', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/35.png', 0.6, 7.5, 'En las noches de luna llena, este Pokémon sale a jugar. Cuando amanece, está tan cansado que se duerme en cualquier sitio.', 0, 0, 0, 70, 45, 48, 60, 65, 35),
(36, 'Clefable', 'Fairy', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/36.png', 1.3, 40, 'Un Pokémon tímido que rara vez se deja ver por los humanos. Tiene oídos muy sensibles que pueden escuchar una aguja caer a 1 km de distancia.', 0, 0, 0, 95, 70, 73, 95, 90, 60),
(37, 'Vulpix', 'Fire', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/37.png', 0.6, 9.9, 'Cuando nace, tiene una sola cola que se divide en seis al calentarse. Su pelaje es extremadamente suave al tacto.', 0, 0, 0, 38, 41, 40, 50, 65, 65),
(38, 'Ninetales', 'Fire', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/38.png', 1.1, 19.9, 'Se dice que puede vivir hasta mil años. Según las leyendas, cada una de sus nueve colas tiene un poder mágico diferente.', 0, 0, 0, 73, 76, 75, 81, 100, 100),
(39, 'Jigglypuff', 'Normal', 'Fairy', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/39.png', 0.5, 5.5, 'Cuando sus enormes ojos se iluminan, canta una melodía misteriosa que adormece a sus enemigos.', 0, 0, 0, 115, 45, 20, 45, 25, 20),
(40, 'Wigglytuff', 'Normal', 'Fairy', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/40.png', 1, 12, 'Su cuerpo está lleno de aire. Cuando se enfada, se hincha aún más y rebota como un globo.', 0, 0, 0, 140, 70, 45, 85, 50, 45),
(41, 'Zubat', 'Poison', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/41.png', 0.8, 7.5, 'Emite ultrasonidos mientras vuela para detectar obstáculos. Durante el día, se refugia en cuevas o edificios abandonados evitando la luz solar.', 0, 0, 0, 40, 45, 35, 30, 40, 55),
(42, 'Golbat', 'Poison', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/42.png', 1.6, 55, 'Una vez que clava sus colmillos, no suelta a su presa hasta que ha succionado toda su sangre. Puede beber más de 300 ml de sangre en una noche.', 0, 0, 0, 75, 80, 70, 65, 75, 90),
(43, 'Oddish', 'Grass', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/43.png', 0.5, 5.4, 'Durante el día, se esconde del sol en lugares frescos. Expone su cara al sol para absorber energía y crecer.', 0, 0, 0, 45, 50, 55, 75, 65, 30),
(44, 'Gloom', 'Grass', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/44.png', 0.8, 8.6, 'El fluido que emite por sus pétalos contiene un olor muy desagradable. Sin embargo, para algunos insectos, este olor es delicioso.', 0, 0, 0, 60, 65, 70, 85, 75, 40),
(45, 'Vileplume', 'Grass', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/45.png', 1.2, 18.6, 'Tiene los pétalos más grandes del mundo. Camina esparciendo polen que provoca fuertes alergias.', 0, 0, 0, 75, 80, 85, 110, 90, 50),
(46, 'Paras', 'Bug', 'Grass', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/46.png', 0.3, 5.4, 'Excava en el suelo para extraer nutrientes de las raíces de los árboles. Los hongos en su espalda crecen con estos nutrientes.', 0, 0, 0, 35, 70, 55, 45, 55, 25),
(47, 'Parasect', 'Bug', 'Grass', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/47.png', 1, 29.5, 'El hongo en su espalda controla su cuerpo. Se dice que el hongo es más nutritivo que cualquier vegetal cultivado por humanos.', 0, 0, 0, 60, 95, 80, 60, 80, 30),
(48, 'Venonat', 'Bug', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/48.png', 1, 30, 'Sus grandes ojos funcionan como radar. En la oscuridad, Venonat puede ver cualquier objeto en movimiento.', 0, 0, 0, 60, 55, 50, 40, 55, 45),
(49, 'Venomoth', 'Bug', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/49.png', 1.5, 12.5, 'Las escamas de sus alas son venenosas. Si se dispersan en el aire, pueden paralizar a cualquiera que las inhale.', 0, 0, 0, 70, 65, 60, 90, 75, 90),
(50, 'Diglett', 'Ground', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/50.png', 0.2, 0.8, 'Vive bajo tierra, donde se alimenta de raíces. A veces asoma la cabeza para observar los alrededores.', 0, 0, 0, 10, 55, 25, 35, 45, 95),
(51, 'Dugtrio', 'Ground', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/51.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'Meowth', 'Normal', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/52.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'Persian', 'Normal', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/53.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'Psyduck', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/54.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'Golduck', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/55.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'Mankey', 'Fighting', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/56.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'Primeape', 'Fighting', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/57.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'Growlithe', 'Fire', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/58.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'Arcanine', 'Fire', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/59.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'Poliwag', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/60.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'Poliwhirl', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/61.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'Poliwrath', 'Water', 'Fighting', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/62.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'Abra', 'Psychic', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/63.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'Kadabra', 'Psychic', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/64.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'Alakazam', 'Psychic', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/65.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'Machop', 'Fighting', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/66.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'Machoke', 'Fighting', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/67.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'Machamp', 'Fighting', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/68.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'Bellsprout', 'Grass', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/69.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'Weepinbell', 'Grass', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/70.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'Victreebel', 'Grass', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/71.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'Tentacool', 'Water', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/72.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'Tentacruel', 'Water', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/73.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'Geodude', 'Rock', 'Ground', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/74.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'Graveler', 'Rock', 'Ground', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/75.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'Golem', 'Rock', 'Ground', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/76.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'Ponyta', 'Fire', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/77.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'Rapidash', 'Fire', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/78.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'Slowpoke', 'Water', 'Psychic', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/79.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'Slowbro', 'Water', 'Psychic', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/80.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'Magnemite', 'Electric', 'Steel', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/81.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'Magneton', 'Electric', 'Steel', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/82.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'Farfetch\'d', 'Normal', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/83.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'Doduo', 'Normal', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/84.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'Dodrio', 'Normal', 'Flying', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/85.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'Seel', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/86.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'Dewgong', 'Water', 'Ice', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/87.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'Grimer', 'Poison', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/88.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'Muk', 'Poison', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/89.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 'Shellder', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/90.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'Cloyster', 'Water', 'Ice', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/91.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'Gastly', 'Ghost', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/92.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'Haunter', 'Ghost', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/93.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 'Gengar', 'Ghost', 'Poison', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/94.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 'Onix', 'Rock', 'Ground', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/95.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 'Drowzee', 'Psychic', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/96.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 'Hypno', 'Psychic', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/97.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 'Krabby', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/98.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'Kingler', 'Water', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/99.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 'Voltorb', 'Electric', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/100.png', NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 'Electrode', 'Electric', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/101.png', 1.2, 66.6, 'Almacena tanta energía eléctrica que incluso un pequeño impacto puede hacerlo explotar. Por esta razón, vive en cuevas alejadas de la gente.', 0, 0, 0, 60, 50, 70, 80, 80, 150),
(102, 'Exeggcute', 'Grass', 'Psychic', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/102.png', 0.4, 2.5, 'Aunque parecen huevos, en realidad son semillas de un raro árbol tropical. Tienen una ligera telepatía entre ellos.', 0, 0, 0, 60, 40, 80, 60, 45, 40),
(103, 'Exeggutor', 'Grass', 'Psychic', 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/103.png', 2, 120, 'Sus tres cabezas piensan de forma independiente. Sin embargo, cuando están en peligro, las tres cabezas piensan lo mismo y cooperan.', 0, 0, 0, 95, 95, 85, 125, 75, 55),
(104, 'Cubone', 'Ground', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/104.png', 0.4, 6.5, 'Lleva puesto el cráneo de su madre fallecida. Nadie ha visto nunca su verdadero rostro, ya que siempre lleva esta máscara.', 0, 0, 0, 50, 50, 95, 40, 50, 35),
(105, 'Marowak', 'Ground', NULL, 1, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/105.png', 1, 45, 'Ha evolucionado para protegerse. Utiliza el hueso que lleva como arma para defenderse y atacar.', 0, 0, 0, 60, 80, 110, 50, 80, 45),
(152, 'Chikorita', 'Grass', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/152.png', 0.9, 6.4, 'Chikorita emite aromas agradables con la hoja que tiene en la cabeza. Le encanta tomar el sol.', 0, 0, 0, 45, 49, 65, 49, 65, 45),
(153, 'Bayleef', 'Grass', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/153.png', 1.2, 15.8, 'Bayleef tiene un collar de hojas alrededor del cuello y un brote de un árbol en cada una de ellas. La fragancia que emana de sus hojas hace que la gente se sienta animada.', 0, 0, 0, 60, 62, 80, 63, 80, 60),
(154, 'Meganium', 'Grass', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/154.png', 1.8, 100.5, 'La fragancia de la flor de Meganium aplaca y suaviza los ánimos. En combate, este Pokémon libera mayor cantidad de esencia para disminuir el ánimo de combate de su oponente.', 0, 0, 0, 80, 82, 100, 83, 100, 80),
(155, 'Cyndaquil', 'Fire', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/155.png', 0.5, 7.9, 'Cyndaquil se protege soltando llamas por el lomo. Las llamas intimidan a sus oponentes. Este Pokémon suele estar acurrucado en forma de bola.', 0, 0, 0, 39, 52, 43, 60, 50, 65),
(156, 'Quilava', 'Fire', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/156.png', 0.9, 19, 'Quilava mantiene a sus oponentes a raya con la intensidad de sus llamas y las ráfagas de aire caliente que produce al correr. Este Pokémon aplica su espectacular agilidad para esquivar ataques.', 0, 0, 0, 58, 64, 58, 80, 65, 80),
(157, 'Typhlosion', 'Fire', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/157.png', 1.7, 79.5, 'Typhlosion se oculta tras un trémulo haz de calor que crea mediante intensas y sofocantes llamaradas. Este Pokémon causa explosiones de fuego que reducen todo a cenizas.', 0, 0, 0, 78, 84, 78, 109, 85, 100),
(158, 'Totodile', 'Water', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/158.png', 0.6, 9.5, 'A pesar de su pequeño tamaño, la fuerza con la que Totodile cierra la mandíbula es tremenda. A veces, este Pokémon piensa que solo está dando un mordisquito y hace trizas a su oponente.', 0, 0, 0, 50, 65, 64, 44, 48, 43),
(159, 'Croconaw', 'Water', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/159.png', 1.1, 25, 'Una vez que Croconaw le ha clavado los colmillos a su presa, es imposible que escape porque los tiene hacia adentro como anzuelos. Cuando Croconaw hinca los dientes, no hay escapatoria.', 0, 0, 0, 65, 80, 80, 59, 63, 58),
(160, 'Feraligatr', 'Water', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/160.png', 2.3, 88.8, 'Feraligatr intimida a sus oponentes abriendo las grandes fauces que tiene. En combate, golpea el suelo bruscamente con las gruesas y fuertes patas traseras que tiene para cargar contra su oponente a una velocidad increíble.', 0, 0, 0, 85, 105, 100, 79, 83, 78),
(196, 'Espeon', 'Psychic', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/196.png', 0.9, 26.5, 'Su pelaje es tan sensible que puede detectar las corrientes de aire y predecir el tiempo o incluso los pensamientos de su oponente.', 0, 0, 0, 65, 65, 60, 130, 95, 110),
(197, 'Umbreon', 'Dark', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/197.png', 1, 27, 'Cuando se expone a la luz de la luna, los anillos de su cuerpo brillan y obtiene un misterioso poder.', 0, 0, 0, 95, 65, 110, 60, 130, 65),
(198, 'Murkrow', 'Dark', 'Flying', 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/198.png', 0.5, 2.1, 'Se dice que trae mala suerte. Muchas personas lo odian porque se lleva objetos brillantes.', 0, 0, 0, 60, 85, 42, 85, 42, 91),
(199, 'Slowking', 'Water', 'Psychic', 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/199.png', 2, 79.5, 'El veneno de Shellder ha activado neuronas en su cerebro que nunca había usado antes, otorgándole un intelecto extraordinario.', 0, 0, 0, 95, 75, 80, 100, 110, 30),
(200, 'Misdreavus', 'Ghost', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/200.png', 0.7, 1, 'Le encanta asustar a la gente. Aparece cerca de viajeros para absorber su miedo como energía.', 0, 0, 0, 60, 60, 60, 85, 85, 85),
(243, 'Raikou', 'Electric', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/243.png', 1.9, 178, 'Raikou encarna la velocidad del rayo. Los rugidos de este Pokémon envían ondas de choque por el aire y sacuden el suelo como si hubieran caído rayos.', 1, 0, 0, 90, 85, 75, 115, 100, 115),
(244, 'Entei', 'Fire', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/244.png', 2.1, 198, 'Entei encarna la pasión del magma. Se cree que este Pokémon nació de la erupción de un volcán. Lanza ráfagas de fuego que arrasan con todo lo que encuentran.', 1, 0, 0, 115, 115, 85, 90, 75, 100),
(245, 'Suicune', 'Water', NULL, 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/245.png', 2, 187, 'Suicune encarna la compasión de una corriente de agua pura. Recorre el mundo para purificar agua contaminada.', 1, 0, 0, 100, 75, 115, 90, 115, 85),
(249, 'Lugia', 'Psychic', 'Flying', 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/249.png', 5.2, 216, 'Las alas de Lugia tienen un poder devastador, con una simple sacudida puede derribar edificios enteros. Por eso, prefiere vivir en las profundidades marinas donde nadie puede herirlo.', 1, 0, 0, 106, 90, 130, 90, 154, 110),
(250, 'Ho-Oh', 'Fire', 'Flying', 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/250.png', 3.8, 199, 'Se dice que cuando Ho-Oh aparece, trae consigo un arcoíris. Según las leyendas, este Pokémon vive al pie del arcoíris.', 1, 0, 0, 106, 130, 90, 110, 154, 90),
(251, 'Celebi', 'Psychic', 'Grass', 2, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/251.png', 0.6, 5, 'Este Pokémon vino del futuro haciendo un viaje en el tiempo. Se piensa que, mientras Celebi aparezca, es un presagio de un futuro brillante y próspero.', 0, 1, 0, 100, 100, 100, 100, 100, 100),
(252, 'Treecko', 'Grass', NULL, 3, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/252.png', 0.5, 5, 'Treecko tiene unos ganchos pequeños en las plantas de los pies con los que puede escalar superficies verticales. Este Pokémon ataca dando un golpetazo con la cola.', 0, 0, 0, 40, 45, 35, 65, 55, 70),
(253, 'Grovyle', 'Grass', NULL, 3, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/253.png', 0.9, 21.6, 'Las hojas que Grovyle tiene por el cuerpo le resultan muy útiles para camuflarse en el bosque y esconderse de los enemigos. A este Pokémon no hay quien lo supere subiendo a los árboles del bosque.', 0, 0, 0, 50, 65, 45, 85, 65, 95),
(254, 'Sceptile', 'Grass', NULL, 3, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/254.png', 1.7, 52.2, 'Las hojas que Sceptile tiene por el cuerpo son muy afiladas. Este Pokémon es tremendamente ágil, va saltando de rama en rama y se lanza sobre el enemigo por la espalda.', 0, 0, 0, 70, 85, 65, 105, 85, 120),
(302, 'Sableye', 'Dark', 'Ghost', 3, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/302.png', 0.5, 11, 'Vive en cavernas oscuras. Sus ojos pueden brillar con suficiente intensidad para ver a través de la roca sólida.', 0, 0, 0, 50, 75, 75, 65, 65, 50),
(303, 'Mawile', 'Steel', 'Fairy', 3, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/303.png', 0.6, 11.5, 'Sus enormes mandíbulas se formaron como resultado de una transformación de sus cuernos. Puede abrir sus fauces en un ángulo de 180 grados.', 0, 0, 0, 50, 85, 85, 55, 55, 50),
(304, 'Aron', 'Steel', 'Rock', 3, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/304.png', 0.4, 60, 'Se alimenta de hierro para endurecer su cuerpo de acero. A veces causa problemas al comerse puentes y vías de tren.', 0, 0, 0, 50, 70, 100, 40, 40, 30),
(305, 'Lairon', 'Steel', 'Rock', 3, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/305.png', 0.9, 120, 'Para construir su cuerpo de acero, bebe agua mineral de manantiales en las montañas. A veces causa disputas territoriales con Tyranitar.', 0, 0, 0, 60, 90, 140, 50, 50, 40),
(306, 'Aggron', 'Steel', 'Rock', 3, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/306.png', 2.1, 360, 'Mientras recorre su territorio, aplasta todo lo que encuentra. Luego replanta árboles y limpia ríos para restaurar el hábitat.', 0, 0, 0, 70, 110, 180, 60, 60, 50),
(443, 'Gible', 'Dragon', 'Ground', 4, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/443.png', 0.7, 20.5, 'Vive en cuevas calientes. Su cuerpo está cubierto por escamas ásperas que pueden causar heridas a quien lo toque sin cuidado.', 0, 0, 0, 58, 70, 45, 40, 45, 42),
(444, 'Gabite', 'Dragon', 'Ground', 4, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/444.png', 1.4, 56, 'Tiene el hábito de cavar túneles en las cuevas. Es muy territorial y ataca a cualquiera que entre en su territorio.', 0, 0, 0, 68, 90, 65, 50, 55, 82),
(445, 'Garchomp', 'Dragon', 'Ground', 4, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/445.png', 1.9, 95, 'Puede volar a la misma velocidad que un avión a reacción plegando sus extremidades. Sus aletas afiladas pueden cortar cualquier cosa.', 0, 0, 0, 108, 130, 95, 80, 85, 102),
(447, 'Riolu', 'Fighting', NULL, 4, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/447.png', 0.7, 20.2, 'Tiene la capacidad de ver la aura de las personas y Pokémon. Puede comunicarse telepáticamente con otros de su especie.', 0, 0, 0, 40, 70, 40, 35, 40, 60),
(448, 'Lucario', 'Fighting', 'Steel', 4, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/448.png', 1.2, 54, 'Puede detectar auras y entender los sentimientos humanos. Libera más poder cuando está en sintonía con su entrenador.', 0, 0, 0, 70, 110, 70, 115, 70, 90),
(607, 'Litwick', 'Ghost', 'Fire', 5, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/607.png', 0.3, 3.1, 'Pretende guiar a la gente y a los Pokémon iluminando el camino, pero en realidad absorbe sus energías vitales.', 0, 0, 0, 50, 30, 55, 65, 55, 20),
(608, 'Lampent', 'Ghost', 'Fire', 5, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/608.png', 0.6, 13, 'Este Pokémon aparece en los hospitales cuando alguien está a punto de morir. Espera para llevarse el alma que se desprende del cuerpo.', 0, 0, 0, 60, 40, 60, 95, 60, 55),
(609, 'Chandelure', 'Ghost', 'Fire', 5, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/609.png', 1, 34.3, 'Las almas consumidas por sus llamas se convierten en nuevas llamas que arden en sus brazos. Hipnotiza a sus víctimas con su baile de fuego.', 0, 0, 0, 60, 55, 90, 145, 90, 80),
(610, 'Axew', 'Dragon', NULL, 5, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/610.png', 0.6, 18, 'Sus colmillos se rompen con facilidad, pero vuelven a crecer. Los colmillos rotos son apreciados como amuletos de buena suerte.', 0, 0, 0, 46, 87, 60, 30, 40, 57),
(611, 'Fraxure', 'Dragon', NULL, 5, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/611.png', 1, 36, 'Sus colmillos pueden cortar acero. Compiten entre ellos para ver quién tiene los colmillos más afilados.', 0, 0, 0, 66, 117, 70, 40, 50, 67),
(778, 'Mimikyu', 'Ghost', 'Fairy', 7, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/778.png', 0.2, 0.7, 'Se disfraza como Pikachu para hacer amigos, ya que su verdadera forma causa terror. Nadie sabe qué hay debajo del disfraz.', 0, 0, 0, 55, 90, 80, 50, 105, 96),
(780, 'Drampa', 'Normal', 'Dragon', 7, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/780.png', 3, 185, 'Vive solo en las montañas. Es amable con los niños pero implacable con quienes los maltratan, pudiendo reducir casas a cenizas.', 0, 0, 0, 78, 60, 85, 135, 91, 36),
(781, 'Dhelmise', 'Ghost', 'Grass', 7, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/781.png', 3.9, 210, 'El alga marina que cubre el ancla absorbe la energía vital de los Pokémon y personas que se ahogan en el mar.', 0, 0, 0, 70, 131, 100, 86, 90, 40),
(784, 'Kommo-o', 'Dragon', 'Fighting', 7, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/784.png', 1.6, 78.2, 'Las escamas de su cuerpo son en realidad armas de acero. Hace sonar sus escamas para intimidar a sus oponentes.', 0, 0, 0, 75, 110, 125, 100, 105, 85),
(785, 'Tapu Koko', 'Electric', 'Fairy', 7, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/785.png', 1.8, 20.5, 'Es la deidad guardiana de Melemele. Tiene un fuerte sentido de la justicia y castiga a quienes dañan la naturaleza.', 1, 0, 0, 70, 115, 85, 95, 75, 130),
(854, 'Sinistea', 'Ghost', NULL, 8, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/854.png', 0.1, 0.2, 'Este Pokémon nació cuando un espíritu poseyó una taza de té. La mayoría son falsificaciones, pero algunos son auténticos.', 0, 0, 0, 40, 45, 45, 74, 54, 50),
(855, 'Polteageist', 'Ghost', NULL, 8, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/855.png', 0.2, 0.4, 'Este Pokémon vive en teteras. Ataca añadiendo su poder a las bebidas calientes y haciendo que quien las beba se sienta poseído.', 0, 0, 0, 60, 65, 65, 134, 114, 70),
(862, 'Obstagoon', 'Dark', 'Normal', 8, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/862.png', 1.6, 46, 'Su lengua es larga, afilada y venenosa. Cruza los brazos, bloquea ataques y contraataca con su lengua.', 0, 0, 0, 93, 90, 101, 60, 81, 95),
(869, 'Alcremie', 'Fairy', NULL, 8, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/869.png', 0.3, 0.5, 'Cuando se siente feliz, segrega un dulce y cremoso líquido de sus manos que es delicioso y altamente nutritivo.', 0, 0, 0, 65, 60, 75, 110, 121, 64),
(890, 'Eternatus', 'Poison', 'Dragon', 8, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/890.png', 20, 950, 'Absorbe energía de la tierra y la libera desde todo su cuerpo. Esta energía es la fuente del fenómeno Dinamax.', 1, 0, 0, 140, 85, 95, 145, 95, 130);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon_abilities`
--

CREATE TABLE `pokemon_abilities` (
  `pokemon_id` int(11) NOT NULL,
  `ability_id` int(11) NOT NULL,
  `is_hidden` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stats`
--

CREATE TABLE `stats` (
  `pokemon_id` int(11) NOT NULL,
  `hp` int(11) DEFAULT NULL,
  `attack` int(11) DEFAULT NULL,
  `defense` int(11) DEFAULT NULL,
  `sp_attack` int(11) DEFAULT NULL,
  `sp_defense` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abilities`
--
ALTER TABLE `abilities`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evolutions`
--
ALTER TABLE `evolutions`
  ADD PRIMARY KEY (`from_pokemon_id`,`to_pokemon_id`),
  ADD KEY `to_pokemon_id` (`to_pokemon_id`);

--
-- Indices de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pokemon_abilities`
--
ALTER TABLE `pokemon_abilities`
  ADD PRIMARY KEY (`pokemon_id`,`ability_id`),
  ADD KEY `ability_id` (`ability_id`);

--
-- Indices de la tabla `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`pokemon_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evolutions`
--
ALTER TABLE `evolutions`
  ADD CONSTRAINT `evolutions_ibfk_1` FOREIGN KEY (`from_pokemon_id`) REFERENCES `pokemon` (`id`),
  ADD CONSTRAINT `evolutions_ibfk_2` FOREIGN KEY (`to_pokemon_id`) REFERENCES `pokemon` (`id`);

--
-- Filtros para la tabla `pokemon_abilities`
--
ALTER TABLE `pokemon_abilities`
  ADD CONSTRAINT `pokemon_abilities_ibfk_1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`),
  ADD CONSTRAINT `pokemon_abilities_ibfk_2` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`id`);

--
-- Filtros para la tabla `stats`
--
ALTER TABLE `stats`
  ADD CONSTRAINT `stats_ibfk_1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
