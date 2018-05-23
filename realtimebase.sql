-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 22 2018 г., 23:10
-- Версия сервера: 5.5.48
-- Версия PHP: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `realtimebase`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) unsigned NOT NULL,
  `header` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `header`, `article`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 'Заголовок 1', 'Статья 1 ', 1, NULL, NULL),
(2, 'Заголовк 2', 'Статаья 2', 1, NULL, NULL),
(3, 'Заголовок 3', 'Статаься 3', 2, NULL, NULL),
(4, 'заголовок 4', 'статья 4 ', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `conversations`
--

CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_reply` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `conversations`
--

INSERT INTO `conversations` (`id`, `parent_id`, `user_id`, `body`, `last_reply`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Message one', '2018-05-12 22:01:05', '2018-05-12 22:05:06', '2018-05-12 22:06:06'),
(2, 1, 2, 'reply to message one', NULL, '2018-05-12 22:03:02', '2018-05-13 00:03:03'),
(3, NULL, 2, 'message two', '2018-05-12 22:04:04', '2018-05-12 22:03:12', '2018-05-12 23:06:02'),
(4, 3, 1, 'reply to messge two', NULL, '2018-05-12 23:06:04', '2018-05-13 18:31:03'),
(5, 3, 2, 'another reply', NULL, '2018-05-13 18:07:10', '2018-05-13 18:46:35');

-- --------------------------------------------------------

--
-- Структура таблицы `conversation_user`
--

CREATE TABLE IF NOT EXISTS `conversation_user` (
  `id` int(10) unsigned NOT NULL,
  `conversation_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `conversation_user`
--

INSERT INTO `conversation_user` (`id`, `conversation_id`, `user_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 3, 1),
(4, 3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `fractals`
--

CREATE TABLE IF NOT EXISTS `fractals` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `fractals`
--

INSERT INTO `fractals` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Dima', 'beaalfa@lajf.ru', 313131, '2018-05-12 22:03:03', '2018-05-12 23:04:08'),
(2, 'tolik', 'alfj@alsjf.ru', 2414114, '2018-05-13 00:05:08', '2018-05-12 22:00:04');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_11_072625_create_conversations_table', 2),
(4, '2018_05_11_074247_create_conversation_user_table', 2),
(5, '2018_05_13_201031_create_fractals_table', 3),
(6, '2018_05_14_170526_create_articles_table', 4),
(7, '2018_05_14_172331_change_articles_table', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dima', 'bessalov88@mail.ru', '$2y$10$U7bt3u.elS78sLMx.CAFvu0ggHQ.kvD.F8lZbHvqVOL5hQp/vI2eC', 'ArNncqmb6J6wS2DtBVLDEH6pw41TiJ9axfRS6fSFoH71n2LUufEZZevikgvq', '2018-05-04 18:17:54', '2018-05-04 18:17:54'),
(2, 'Valera', 'valera@mail.ru', '$2y$10$.7ry0ZHPqt.oOov9pNIHyOk5c5p4RFYrymD74VuOBrMrQ5nyryEe6', 'ZjB7m4gmSRkknvd43uuwEXWKoVjgJSNv6Hsp3R7FVU0DHMGepnhEhI1S6vJ9', '2018-05-04 18:18:14', '2018-05-04 18:18:14');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_author_id_foreign` (`author_id`);

--
-- Индексы таблицы `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversations_parent_id_foreign` (`parent_id`),
  ADD KEY `conversations_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `conversation_user`
--
ALTER TABLE `conversation_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_user_conversation_id_foreign` (`conversation_id`),
  ADD KEY `conversation_user_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `fractals`
--
ALTER TABLE `fractals`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `conversation_user`
--
ALTER TABLE `conversation_user`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `fractals`
--
ALTER TABLE `fractals`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `fractals` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `conversation_user`
--
ALTER TABLE `conversation_user`
  ADD CONSTRAINT `conversation_user_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversation_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
