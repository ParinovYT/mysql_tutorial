-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: db
-- Время создания: Окт 28 2022 г., 05:33
-- Версия сервера: 8.0.31
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tovar`
--

-- --------------------------------------------------------

--
-- Структура таблицы `kateg`
--

CREATE TABLE `kateg` (
  `ID` int UNSIGNED NOT NULL,
  `NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `kateg`
--

INSERT INTO `kateg` (`ID`, `NAME`) VALUES
(1, 'Техника'),
(2, 'Мебель'),
(3, 'Игрушки');

-- --------------------------------------------------------

--
-- Структура таблицы `korzina`
--

CREATE TABLE `korzina` (
  `ID` int UNSIGNED NOT NULL,
  `ID_USER` int UNSIGNED NOT NULL,
  `TOVAR_ID` int UNSIGNED NOT NULL,
  `COUNT` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `korzina`
--

INSERT INTO `korzina` (`ID`, `ID_USER`, `TOVAR_ID`, `COUNT`) VALUES
(29, 1, 1, 2),
(30, 1, 1, 5),
(31, 1, 2, 999);

-- --------------------------------------------------------

--
-- Структура таблицы `tovary`
--

CREATE TABLE `tovary` (
  `ID` int UNSIGNED NOT NULL,
  `TITLE` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(2000) NOT NULL,
  `PRICE` float NOT NULL,
  `COUNT` int NOT NULL,
  `ID_CAT` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tovary`
--

INSERT INTO `tovary` (`ID`, `TITLE`, `DESCRIPTION`, `PRICE`, `COUNT`, `ID_CAT`) VALUES
(1, 'Телевизор', 'LG 60', 20000, 4, 1),
(2, 'Акула', 'Мягкая игрушка', 40000, 0, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `ID` int UNSIGNED NOT NULL,
  `LOGIN` char(32) NOT NULL,
  `PASSW` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TOKEN` char(32) NOT NULL,
  `EXPIRED` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID`, `LOGIN`, `PASSW`, `TOKEN`, `EXPIRED`) VALUES
(1, 'ParinovYT', '123', '86ff9ba8c41645a60e710b5f85a9e3eb', '2022-10-30 05:13:55'),
(3, 'sadsa', 'sads', '9aa7b9442d3d3ee1caab02a49173adc6', '2022-10-30 03:32:07'),
(4, 'tarakan', '123', 'a15ea5d5110ce209f471cf4698c116dc', '2022-10-30 04:26:45');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `kateg`
--
ALTER TABLE `kateg`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `korzina`
--
ALTER TABLE `korzina`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_USER` (`ID_USER`),
  ADD KEY `TOVAR_ID` (`TOVAR_ID`);

--
-- Индексы таблицы `tovary`
--
ALTER TABLE `tovary`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_CAT` (`ID_CAT`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `kateg`
--
ALTER TABLE `kateg`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `korzina`
--
ALTER TABLE `korzina`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `tovary`
--
ALTER TABLE `tovary`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `korzina`
--
ALTER TABLE `korzina`
  ADD CONSTRAINT `korzina_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `korzina_ibfk_2` FOREIGN KEY (`TOVAR_ID`) REFERENCES `tovary` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `tovary`
--
ALTER TABLE `tovary`
  ADD CONSTRAINT `tovary_ibfk_1` FOREIGN KEY (`ID_CAT`) REFERENCES `kateg` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
