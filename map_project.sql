-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 17, 2024 at 07:44 AM
-- Server version: 8.0.39-0ubuntu0.24.04.2
-- PHP Version: 8.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `map_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `markers`
--

CREATE TABLE `markers` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `marker_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `markers`
--

INSERT INTO `markers` (`id`, `title`, `date`, `image_path`, `description`, `lat`, `lng`, `marker_type`) VALUES
(23, 'titile', '2024-09-16', 'image path ', 'description ', 33.3259, 35.1096, 'marker'),
(24, 'title', '2024-09-16', 'IMAGE-PATH', 'DESC', 33.87, 35.4988, 'marker'),
(25, 'title', '2024-09-16', 'image path ', 'desc', 33.0639, 35.4529, 'marker'),
(26, '', '2024-09-16', '', '', 32.9764, 35.4282, 'marker'),
(27, '', '2024-09-16', NULL, NULL, 32.9672, 35.3046, 'marker'),
(28, '', '2024-09-16', NULL, NULL, 32.7665, 35.2112, 'marker'),
(29, '', '2024-09-16', '', '', 33.1353, 35.2359, 'marker'),
(30, '', '2024-09-16', '', '', 33.2846, 35.5353, 'marker'),
(31, '', '2024-09-16', '', '', 33.0616, 35.4309, 'marker'),
(32, '', '2024-09-16', '', '', 32.9649, 35.4062, 'marker'),
(33, 'title', '2024-09-16', 'image path', 'optional ', 32.9856, 35.582, 'marker'),
(34, '', '2024-09-16', '', '', 33.1536, 34.9228, 'marker'),
(35, '', '2024-09-16', '', '', 33.08, 35.3925, 'marker'),
(36, '', '2024-09-16', '', '', 32.9418, 35.2441, 'marker'),
(37, '', '2024-09-16', '', '', 33.0823, 35.343, 'marker'),
(38, '', '2024-09-16', '', '', 32.9764, 35.1727, 'marker'),
(39, '', '2024-09-16', '', '', 32.9995, 35.126, 'marker'),
(40, 'title', '2024-09-16', 'image path', 'desc', 32.7434, 36.8564, 'marker'),
(41, 'title', '2024-09-16', 'image path', 'desc', 32.8219, 36.8976, 'marker'),
(42, '', '2024-09-16', NULL, NULL, 32.9879, 35.1343, 'marker');

-- --------------------------------------------------------

--
-- Table structure for table `polygons`
--

CREATE TABLE `polygons` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_general_ci NOT NULL,
  `coordinates` text COLLATE utf8mb4_general_ci NOT NULL,
  `marker_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `polygons`
--

INSERT INTO `polygons` (`id`, `name`, `color`, `coordinates`, `marker_type`) VALUES
(12, 'name', 'green', '[[{\"lat\":33.09463357668319,\"lng\":35.10423660278321},{\"lat\":33.092620175434696,\"lng\":35.11565208435059},{\"lat\":33.09276399133878,\"lng\":35.12363433837891},{\"lat\":33.09218872631089,\"lng\":35.12895584106446},{\"lat\":33.09089436623563,\"lng\":35.135307312011726},{\"lat\":33.09218872631089,\"lng\":35.139598846435554},{\"lat\":33.09103818496278,\"lng\":35.14886856079102},{\"lat\":33.0912539126124,\"lng\":35.155563354492195},{\"lat\":33.08643586901135,\"lng\":35.15539169311524},{\"lat\":33.08650778205062,\"lng\":35.15762329101563},{\"lat\":33.08866514588219,\"lng\":35.158567428588874},{\"lat\":33.08902470137486,\"lng\":35.16088485717774},{\"lat\":33.089240433964726,\"lng\":35.16320228576661},{\"lat\":33.09053481838853,\"lng\":35.16663551330567},{\"lat\":33.09218872631089,\"lng\":35.171270370483406},{\"lat\":33.09355497460601,\"lng\":35.17247200012208},{\"lat\":33.09420213744032,\"lng\":35.17770767211915},{\"lat\":33.08988762855851,\"lng\":35.18697738647462},{\"lat\":33.08578864901153,\"lng\":35.19281387329102},{\"lat\":33.08773029472036,\"lng\":35.207233428955085},{\"lat\":33.099451171056074,\"lng\":35.21203994750977},{\"lat\":33.09851643458444,\"lng\":35.22714614868165},{\"lat\":33.09269208341614,\"lng\":35.23452758789063},{\"lat\":33.10851040943536,\"lng\":35.2932357788086},{\"lat\":33.06248555690915,\"lng\":35.345077514648445},{\"lat\":33.0555797517757,\"lng\":35.379753112792976},{\"lat\":33.061334627009195,\"lng\":35.3811264038086},{\"lat\":33.06565053653404,\"lng\":35.43090820312501},{\"lat\":33.0912539126124,\"lng\":35.44532775878907},{\"lat\":33.09010335903117,\"lng\":35.50300598144532},{\"lat\":33.1159871724451,\"lng\":35.50369262695313},{\"lat\":33.13007626521065,\"lng\":35.53287506103516},{\"lat\":33.23294427441437,\"lng\":35.53871154785157},{\"lat\":33.27285208252109,\"lng\":35.56274414062501},{\"lat\":33.29035982556356,\"lng\":35.567550659179695},{\"lat\":33.266824014208815,\"lng\":35.584030151367195},{\"lat\":33.243856132865304,\"lng\":35.62488555908204},{\"lat\":33.27170391111521,\"lng\":35.62076568603516},{\"lat\":33.28060184458917,\"lng\":35.643424987792976},{\"lat\":33.27543541298162,\"lng\":35.66024780273438},{\"lat\":33.32536477421004,\"lng\":35.714836120605476},{\"lat\":33.32651223950189,\"lng\":35.737838745117195},{\"lat\":33.3313887984149,\"lng\":35.74539184570313},{\"lat\":33.33511774753217,\"lng\":35.76942443847657},{\"lat\":33.36322314918339,\"lng\":35.81165313720704},{\"lat\":33.40536423491398,\"lng\":35.82675933837891},{\"lat\":33.42628384909871,\"lng\":35.8755111694336},{\"lat\":33.488153454942704,\"lng\":35.95344543457032},{\"lat\":33.52365123826154,\"lng\":35.94074249267579},{\"lat\":33.538819235622604,\"lng\":35.99155426025391},{\"lat\":33.58773934387021,\"lng\":36.05850219726563},{\"lat\":33.62348211873863,\"lng\":35.98331451416016},{\"lat\":33.64749293739745,\"lng\":35.9359359741211},{\"lat\":33.74946419232578,\"lng\":36.00013732910157},{\"lat\":33.80397051984991,\"lng\":36.056442260742195},{\"lat\":33.856446422184305,\"lng\":36.15325927734376},{\"lat\":33.85559109516042,\"lng\":36.247673034667976},{\"lat\":33.83021249740128,\"lng\":36.34586334228516},{\"lat\":33.853880415415176,\"lng\":36.38843536376954},{\"lat\":33.91487347147951,\"lng\":36.283378601074226},{\"lat\":33.984079047970035,\"lng\":36.33728027343751},{\"lat\":34.06119251868709,\"lng\":36.42963409423829},{\"lat\":34.12885797357789,\"lng\":36.537094116210945},{\"lat\":34.18084965137616,\"lng\":36.59854888916016},{\"lat\":34.258919002446085,\"lng\":36.58996582031251},{\"lat\":34.38141265660888,\"lng\":36.52130126953126},{\"lat\":34.40549336030765,\"lng\":36.5731430053711},{\"lat\":34.50514201455187,\"lng\":36.44577026367188},{\"lat\":34.5020297944346,\"lng\":36.3369369506836},{\"lat\":34.52126711205505,\"lng\":36.33522033691407},{\"lat\":34.55661824059181,\"lng\":36.41178131103516},{\"lat\":34.611170889697355,\"lng\":36.405258178710945},{\"lat\":34.59110646239981,\"lng\":36.43959045410157},{\"lat\":34.59647629119911,\"lng\":36.45538330078126},{\"lat\":34.611170889697355,\"lng\":36.45950317382813},{\"lat\":34.629252979439194,\"lng\":36.460189819335945},{\"lat\":34.6391399557529,\"lng\":36.46259307861329},{\"lat\":34.63207795006471,\"lng\":36.40766143798829},{\"lat\":34.63631522562999,\"lng\":36.39633178710938},{\"lat\":34.634055372264775,\"lng\":36.38122558593751},{\"lat\":34.64535402336853,\"lng\":36.36611938476563},{\"lat\":34.66032236481892,\"lng\":36.35444641113282},{\"lat\":34.680087729425246,\"lng\":36.35410308837891},{\"lat\":34.69392067828451,\"lng\":36.339340209960945},{\"lat\":34.68037005760765,\"lng\":36.31427764892579},{\"lat\":34.66116954859759,\"lng\":36.303634643554695},{\"lat\":34.647331129044176,\"lng\":36.30466461181641},{\"lat\":34.63123046897771,\"lng\":36.29470825195313},{\"lat\":34.62755795089017,\"lng\":36.24561309814454},{\"lat\":34.63688017935098,\"lng\":35.97541809082032},{\"lat\":34.54021718378472,\"lng\":35.99189758300782},{\"lat\":34.51306350502788,\"lng\":35.97610473632813},{\"lat\":34.467787705093706,\"lng\":35.899887084960945},{\"lat\":34.461843431780935,\"lng\":35.83740234375001},{\"lat\":34.45306777853789,\"lng\":35.808219909667976},{\"lat\":34.42107129982382,\"lng\":35.82126617431641},{\"lat\":34.37631232462591,\"lng\":35.739555358886726},{\"lat\":34.31083050016808,\"lng\":35.71346282958985},{\"lat\":34.311397661782244,\"lng\":35.68805694580079},{\"lat\":34.27877964630124,\"lng\":35.652694702148445},{\"lat\":34.17602117212643,\"lng\":35.63037872314454},{\"lat\":34.11009902462281,\"lng\":35.644454956054695},{\"lat\":34.03388358382995,\"lng\":35.627975463867195},{\"lat\":34.017095604460124,\"lng\":35.62488555908204},{\"lat\":34.00030430441023,\"lng\":35.64205169677735},{\"lat\":33.986356463846434,\"lng\":35.63106536865235},{\"lat\":33.986071790199205,\"lng\":35.61286926269532},{\"lat\":33.920571528675076,\"lng\":35.581283569335945},{\"lat\":33.904046113106396,\"lng\":35.562057495117195},{\"lat\":33.90547084410301,\"lng\":35.49373626708985},{\"lat\":33.899771777255694,\"lng\":35.46936035156251},{\"lat\":33.88324232926962,\"lng\":35.47279357910157},{\"lat\":33.78428375388245,\"lng\":35.474166870117195},{\"lat\":33.66463942303811,\"lng\":35.42266845703126},{\"lat\":33.59031331864653,\"lng\":35.38387298583985},{\"lat\":33.51792677420189,\"lng\":35.35469055175782},{\"lat\":33.46381188769053,\"lng\":35.297355651855476},{\"lat\":33.402498141918116,\"lng\":35.25581359863282},{\"lat\":33.32421729380816,\"lng\":35.23590087890626},{\"lat\":33.27715759082393,\"lng\":35.20912170410157},{\"lat\":33.274000238828904,\"lng\":35.19813537597657},{\"lat\":33.276583535317876,\"lng\":35.19092559814454},{\"lat\":33.265101632548216,\"lng\":35.18817901611329},{\"lat\":33.26481456563577,\"lng\":35.20465850830079},{\"lat\":33.20881849225547,\"lng\":35.20637512207032},{\"lat\":33.09959497578479,\"lng\":35.10818481445313}]]', 'polygon'),
(13, 'name', 'red', '[[{\"lat\":33.87597405825279,\"lng\":35.48884391784669},{\"lat\":33.87910946677703,\"lng\":35.50927162170411},{\"lat\":33.87219716321646,\"lng\":35.52523612976075},{\"lat\":33.86271855861567,\"lng\":35.52025794982911},{\"lat\":33.85865597734858,\"lng\":35.488157272338874}]]', 'polygon'),
(14, 'name', 'red', '[[{\"lat\":33.20881849225547,\"lng\":35.54626464843751},{\"lat\":33.29150775159364,\"lng\":36.41143798828126},{\"lat\":32.96949953291244,\"lng\":36.36199951171876},{\"lat\":32.8334428466495,\"lng\":35.49407958984376},{\"lat\":33.07082934859187,\"lng\":35.23590087890626}]]', 'polygon');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int NOT NULL,
  `marker_id` int DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mini_text` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$UpBnLRS5uU28MdS/9/WR4e5yH6/ey.7khqI8Ek7msrGcNPWvEgxjK'),
(2, 'ali', 'ali');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `polygons`
--
ALTER TABLE `polygons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marker_id` (`marker_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `polygons`
--
ALTER TABLE `polygons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`marker_id`) REFERENCES `markers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
