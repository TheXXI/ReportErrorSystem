-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 16 2022 г., 13:15
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `reporterrorsystem`
--

-- --------------------------------------------------------

--
-- Структура таблицы `errors`
--

CREATE TABLE `errors` (
  `id` int(10) UNSIGNED NOT NULL,
  `datatime` datetime NOT NULL DEFAULT current_timestamp(),
  `description` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `urgency` varchar(20) NOT NULL DEFAULT 'Совсем несрочно',
  `criticality` varchar(20) NOT NULL DEFAULT 'Запрос на изменение',
  `status` varchar(10) NOT NULL DEFAULT 'Новая'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `errors`
--

INSERT INTO `errors` (`id`, `datatime`, `description`, `details`, `author_id`, `urgency`, `criticality`, `status`) VALUES
(1, '2022-09-16 14:11:39', 'Новая ошибка', 'Описание новой ошибки', 1, 'Несрочно', 'Критичная', 'Закрытая'),
(2, '2022-09-16 14:12:36', 'Ошибка', 'Описание ошибки', 1, 'Очень Срочно', 'Запрос на изменение', 'Новая');

-- --------------------------------------------------------

--
-- Структура таблицы `errors_history`
--

CREATE TABLE `errors_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `datatime` datetime NOT NULL DEFAULT current_timestamp(),
  `new_status` varchar(10) NOT NULL,
  `comment` varchar(250) NOT NULL DEFAULT '',
  `author_id` int(11) UNSIGNED NOT NULL,
  `error_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `errors_history`
--

INSERT INTO `errors_history` (`id`, `datatime`, `new_status`, `comment`, `author_id`, `error_id`) VALUES
(1, '2022-09-16 14:12:06', 'Открытая', 'открыл', 1, 1),
(2, '2022-09-16 14:12:11', 'Решенная', 'решил', 1, 1),
(3, '2022-09-16 14:12:15', 'Закрытая', 'закрыл', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(250) NOT NULL,
  `name` varchar(300) NOT NULL,
  `surname` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `name`, `surname`, `password`) VALUES
(1, 'admin', 'Михаил', 'Курис', 'password');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `errors`
--
ALTER TABLE `errors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Индексы таблицы `errors_history`
--
ALTER TABLE `errors_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `error_id` (`error_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `errors`
--
ALTER TABLE `errors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `errors_history`
--
ALTER TABLE `errors_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `errors`
--
ALTER TABLE `errors`
  ADD CONSTRAINT `errors_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `errors_history`
--
ALTER TABLE `errors_history`
  ADD CONSTRAINT `errors_history_ibfk_1` FOREIGN KEY (`error_id`) REFERENCES `errors` (`id`),
  ADD CONSTRAINT `errors_history_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
