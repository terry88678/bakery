-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2023 年 09 月 21 日 16:26
-- 伺服器版本： 8.0.34-0ubuntu0.22.04.1
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `bakery`
--

-- --------------------------------------------------------

--
-- 資料表結構 `layer`
--

CREATE TABLE `layer` (
  `id` int NOT NULL,
  `Sort` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Category` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WebUrl` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `layer`
--

INSERT INTO `layer` (`id`, `Sort`, `Category`, `WebUrl`) VALUES
(1, '烘焙原料', '麵粉', 'flour.html'),
(2, '烘焙原料', '糖類', NULL),
(3, '烘焙原料', '蛋白霜', NULL),
(4, '烘焙原料', '吉利丁', NULL),
(5, '烘焙原料', '色素', NULL),
(6, '乳製品', '鮮奶油', 'whitebutter.html'),
(7, '乳製品', '奶油', NULL),
(8, '乳製品', '乳酪', NULL),
(9, '乳製品', '鮮奶', NULL),
(10, '模具器具', '攪拌機', NULL),
(11, '模具器具', '電子秤', NULL),
(12, '裝飾包材', '烘焙紙材', NULL),
(13, '裝飾包材', '蛋糕禮盒', NULL),
(14, '裝飾包材', '包裝材料', NULL),
(15, '餡料', '巧克力', NULL),
(16, '餡料', '果醬', NULL),
(17, '餡料', '果乾', NULL),
(18, '模具器具', '刀具', NULL);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `layer`
--
ALTER TABLE `layer`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `layer`
--
ALTER TABLE `layer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
