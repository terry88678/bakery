-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2023 年 09 月 12 日 16:21
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
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `id` int NOT NULL COMMENT '編號(系統自動產生)',
  `Username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳號',
  `Password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `Nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '暱稱',
  `PhotoName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '大頭照',
  `Birthday` date NOT NULL COMMENT '生日',
  `Phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '電話',
  `Email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'E-mail',
  `Uid01` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '驗證碼(註冊時不需要 登入才需要 所以一開始建立可為空值)',
  `UserState` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'true:啟用 false:停用',
  `IsAdmin` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否為管理者',
  `CreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建檔時間(系統自動產生)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`id`, `Username`, `Password`, `Nickname`, `PhotoName`, `Birthday`, `Phone`, `Email`, `Uid01`, `UserState`, `IsAdmin`, `CreateTime`) VALUES
(1, 'bakery001', 'adc399abbe56e', '管理者', NULL, '2000-01-12', '0987654456', '686868@4242.com', '4f2f241ea8', 'true', 'true', '2023-09-07 06:13:04'),
(4, 'bakery002', 'adc399abbe56e', '123456', NULL, '2000-10-10', '0987655555', '0564@0560.046540', '0bbdab85d8', 'true', 'false', '2023-09-07 06:46:58'),
(5, 'bakery003', 'adc399abbe56e', '123456', NULL, '2023-09-07', '0987654321', '686868@4242.com', NULL, 'true', 'false', '2023-09-07 06:47:54');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `Category` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '產品類別',
  `Product` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '產品名稱',
  `Price` int DEFAULT NULL COMMENT '產品售價',
  `Discount` int DEFAULT NULL COMMENT '會員價',
  `Content` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '產品內容',
  `Quantity` int DEFAULT NULL COMMENT '購買數量',
  `PhotoNeme` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '圖片名稱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`id`, `Category`, `Product`, `Price`, `Discount`, `Content`, `Quantity`, `PhotoNeme`) VALUES
(1, '烘焙原料', '鷹牌高筋麵粉', 100, 95, '一公斤', NULL, NULL),
(2, '烘焙原料', '拿破崙法國專用粉', 95, 91, '一公斤', NULL, NULL),
(3, '烘焙原料', '凱薩琳高筋麵粉', 120, 114, '一公斤', NULL, NULL),
(4, '烘焙原料', '日清百合花法國粉', 110, 105, '一公斤', NULL, NULL),
(5, '5', '2', 3, 4, '5', NULL, NULL);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '編號(系統自動產生)', AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
