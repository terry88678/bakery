-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2023 年 09 月 26 日 08:25
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
CREATE DATABASE IF NOT EXISTS `bakery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `bakery`;

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `Username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Product` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `CreateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, '烘焙原料', '糖類', 'sugar.html'),
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

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `id` int NOT NULL COMMENT '編號(系統自動產生)',
  `Username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳號',
  `Password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `Realname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '暱稱',
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

INSERT INTO `member` (`id`, `Username`, `Password`, `Realname`, `PhotoName`, `Birthday`, `Phone`, `Email`, `Uid01`, `UserState`, `IsAdmin`, `CreateTime`) VALUES
(1, 'bakery001', 'adc399abbe56e', '管理者', NULL, '2000-01-12', '0987654456', '686868@4242.com', '79241f7929', 'true', 'true', '2023-09-07 06:13:04'),
(4, 'bakery002', 'adc399abbe56e', 'test02', NULL, '2000-10-10', '0987655555', '0564@0560.046540', '3e210315e0', 'true', 'true', '2023-09-07 06:46:58'),
(5, 'bakery003', 'adc399abbe56e', 'test03', NULL, '2023-09-07', '0987654325', '686868@4242.com.tw', 'b04b336f1c', 'true', 'true', '2023-09-07 06:47:54'),
(7, 'alex123', 'adc399abbe56e', 'Alex', NULL, '1996-10-03', '0974566321', 'Alex123@hotmail.com', NULL, 'true', 'false', '2023-09-22 02:13:53'),
(8, 'benson123', 'adc399abbe56e', 'Benson', NULL, '2008-05-09', '0985123658', 'Benson123@hotmail.com', NULL, 'true', 'false', '2023-09-22 02:15:42'),
(9, 'cathy123', 'adc399abbe56e', 'Cathy', NULL, '2005-12-24', '0912658734', 'Cathy123@gmail.com', '7ae9a4f434', 'true', 'false', '2023-09-22 02:17:13');

-- --------------------------------------------------------

--
-- 資料表結構 `orderlist`
--

CREATE TABLE `orderlist` (
  `id` int NOT NULL,
  `OrderNo` int DEFAULT NULL,
  `Username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Products` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Quantities` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Prices` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Total` int DEFAULT NULL,
  `Realname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Pay` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `orderlist`
--

INSERT INTO `orderlist` (`id`, `OrderNo`, `Username`, `Products`, `Quantities`, `Prices`, `Total`, `Realname`, `Phone`, `Address`, `Pay`, `CreateTime`) VALUES
(1, 956871946, 'bakery002', '凱薩琳高筋麵粉1公斤, 日清紫羅蘭薄力粉1KG', '4, 4', '114, 114', 912, 'test02', '0987655555', '台中市西區美村路一段20號', '銀行轉帳', '2023-09-26 00:13:14'),
(2, 956874766, 'bakery001', '凱薩琳高筋麵粉1公斤', '5', '114', 570, '管理者', '0987654456', '12345678', '信用卡付款', '2023-09-26 00:17:56'),
(3, 956878146, '0912345678', '凱薩琳高筋麵粉1公斤', '3', '120', 360, '123', '0912345678', '12345678', '信用卡付款', '2023-09-26 00:23:34');

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
  `Sell` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否上架',
  `Photo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '圖片名稱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`id`, `Category`, `Product`, `Price`, `Discount`, `Content`, `Quantity`, `Sell`, `Photo`) VALUES
(1, '麵粉', '鷹牌高筋麵粉1kg', 100, 95, '吸水性特佳，保濕性好，\r\n攪拌穩定性佳，\r\n製作吐司組織較綿密，較有麥香味。', NULL, 'true', 'ef7d40e580_Eagle Wheat Flour.jpg'),
(2, '麵粉', '拿破崙法國專用粉1公斤', 95, 91, '小麥粒深層核心精製,\r\n膨脹性好、吸水性佳,\r\n原味麥香，脆皮持續性佳。', NULL, 'true', 'e3881f54c7_Napoleon Wheat Flour.jpg'),
(3, '麵粉', '凱薩琳高筋麵粉1公斤', 120, 114, '只萃取最高等級小麥粉心，\r\n24 小時低溫長時間研製，\r\n吸水性特高，組織不易老化。', NULL, 'true', '0d1f6ceeb4_Casarine.jpg'),
(4, '麵粉', '日清百合花法國粉1KG', 110, 105, '經長時間發酵和熟成，\r\n天然小麥香味，\r\n可烘培出外酥內軟、充滿嚼勁的法國麵包。', NULL, 'true', 'bdfe176f8e_LYS All Purpose Flour.jpg'),
(28, '鮮奶油', '總統牌動物性鮮奶油1L', 230, 219, '源自法國布列塔尼及諾曼地等地區，\r\n含有豐富的鈣質與維他命，\r\n細緻的質地，打發效果佳。', NULL, 'true', 'aa57889c59_5406.jpg'),
(29, '麵粉', '日清紫羅蘭薄力粉1KG', 120, 114, '日清製粉最具代表性的低筋用粉，\r\n具蓬鬆感及化口性佳，\r\n適用於海綿蛋糕及戚風蛋糕。', NULL, 'true', 'a994c65ef9_96f1eb07715b7c98063e0995fa92dd13.jpg'),
(30, '麵粉', '日清山茶花強力粉1KG', 110, 105, '日清最具代表性的麵包用粉，\r\n適用於吐司、甜麵包等，有淡淡奶香，\r\n也能應用在披薩及餃子。', NULL, 'true', 'e080197326_d9001d20038693d99e4a09ef4044a392.jpg'),
(31, '麵粉', '布瑟T55法國小麥粉1kg', 75, 71, '這款T55是布瑟麵粉中標準的磨坊系列麵粉，\r\n依麵包師的需求與期待，有多種類和食譜變化，\r\n可製作日常麵包與其他麵包產品都十分適合。', NULL, 'true', '92fb7f3bdb_e536b574ab9e4a27e750262da58a766a.jpg'),
(32, '麵粉', '全麥麵粉1KG(王冠牌)', 65, 62, '全麥粉，適用於製作全麥麵包、饅頭等。', NULL, 'true', '6aaa599377_869633ae5d2f7ea6cdbcedd40284c5c2.jpg'),
(34, '麵粉', '熊本熊珍珠薄力粉1kg', 120, 114, '薄力粉即為低筋麵粉、被喻為最高級菓子專用粉。\r\n水合度好不易結塊、粉體潔白且成品化口性佳、可製作出口感輕盈蓬鬆的蛋糕體、並賦予糕點漂亮出色的外型。', NULL, 'true', '5694511d77_ed0312b33934277680b75ec39f8d2a15.jpg'),
(35, '麵粉', '熊本熊皇冠高筋粉1kg', 125, 119, '熊本製粉旗下最具代表性的高筋麵粉。\r\n嚴選高品質的第一等級加拿大西部硬紅春小麥（1CWRS）、蛋白質含量高、使麵糰的延展性、操作性均相當出色。\r\n粉質潔白纖細、吸水性佳、可使麵包組織內部擁有細緻氣孔。', NULL, 'true', '815e022619_66531b449fa39fd9a1d0c9df7b512c3b.jpg'),
(36, '鮮奶油', 'TATUA噴式鮮奶油', 180, 171, '口感滑潤綿密，具奶香味，\r\n快速享用甜點蛋糕的好幫手，\r\n輕輕鬆鬆就能裝飾好美味點心。', NULL, 'true', 'ae90815866_aa31a385746cb3a36987ca4dbec53047.jpg'),
(37, '鮮奶油', '歐登堡動物鮮奶油1L', 235, 223, '來自德國特選專業畜牧飼養的乳牛所生產的高品質乳源所製成。\r\nUHT無菌包裝保留濃郁的乳香。\r\n35%的香醇厚實讓美味有更多變化', NULL, 'true', 'e57b39292f_96863b427fadbd2debbea93b840c7b34.jpg'),
(38, '鮮奶油', '法國萊思克鮮奶油35% 1L', 260, 247, '使用法國諾曼地產區的優質乳源，乳脂含量35%，\r\n乳香濃郁、清爽不膩，顛覆對鮮奶油的甜膩印象，\r\n打發率優越、穩定性極佳，烘焙新手也輕鬆上手，用途廣泛易操作。', NULL, 'true', 'faf7e9a9d3_2e95e0940262a2937a45c265d6981d34.jpg');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `layer`
--
ALTER TABLE `layer`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `orderlist`
--
ALTER TABLE `orderlist`
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
-- 使用資料表自動遞增(AUTO_INCREMENT) `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `layer`
--
ALTER TABLE `layer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '編號(系統自動產生)', AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orderlist`
--
ALTER TABLE `orderlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- 資料庫： `tcnr04`
--
CREATE DATABASE IF NOT EXISTS `tcnr04` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `tcnr04`;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `id` int NOT NULL,
  `Username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Hobby` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`id`, `Username`, `Password`, `Email`, `Hobby`) VALUES
(2, '11111', '11111111', '1111111111', '閱讀'),
(4, '11111', '11111111', '686868@4242.com', '閱讀, 電影, 爬山'),
(6, '76570', '11111111', 'vagrantseiko@hotmail.com', '閱讀, 打球, 電影, 爬山, 逛街'),
(8, 'LastTest', '12345678', 'vagrantseiko@hotmail.com', '閱讀, 電影, 逛街'),
(9, 'test1234', '11111111', 'vagrantseiko@hotmail.com', '閱讀, 打球, 爬山');

-- --------------------------------------------------------

--
-- 資料表結構 `profiles`
--

CREATE TABLE `profiles` (
  `ID` int NOT NULL,
  `Name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Old` int NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `profiles`
--

INSERT INTO `profiles` (`ID`, `Name`, `Old`, `Created_at`) VALUES
(1, 'Eden', 36, '2023-09-21 02:07:33'),
(2, 'Denny', 26, '2023-09-21 02:08:09');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`ID`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `profiles`
--
ALTER TABLE `profiles`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 資料庫： `testdb`
--
CREATE DATABASE IF NOT EXISTS `testdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `testdb`;

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `id` int NOT NULL COMMENT '編號(系統自動產生)',
  `Username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帳號',
  `Password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密碼',
  `Nickname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '暱稱',
  `PhotoName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '大頭照',
  `Birthday` date NOT NULL COMMENT '生日',
  `Phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '電話',
  `Email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'E-mail',
  `Uid01` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '驗證碼(註冊時不需要 登入才需要 所以一開始建立可為空值)',
  `UserState` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'true:啟用 false:停用',
  `CreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建檔時間(系統自動產生)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`id`, `Username`, `Password`, `Nickname`, `PhotoName`, `Birthday`, `Phone`, `Email`, `Uid01`, `UserState`, `CreateTime`) VALUES
(1, 'owner01', 'adc399abbe56e', 'Eden', NULL, '1987-10-25', '0921375925', 'vagrantseiko@gmail.com', 'a1d4595b3b', 'true', '2023-08-03 03:06:48'),
(25, 'owner02', 'adc399abbe56e', 'Luke', NULL, '1996-12-27', '0945368754', 'luke123@gmail.com', '19d65002d8', 'false', '2023-08-10 02:21:39'),
(27, 'owner03', 'adc399abbe56e', 'Denny', NULL, '1996-09-16', '0978546231', 'denny123@gmail.com', '18f3385299', 'false', '2023-08-15 05:59:46');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL COMMENT '序號',
  `proName` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '產品名稱',
  `proPrice` int NOT NULL COMMENT '產品價格',
  `proQuantity` int NOT NULL COMMENT '產品數量',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建檔時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`id`, `proName`, `proPrice`, `proQuantity`, `createTime`) VALUES
(7, '美式冰咖啡', 60, 5, '2023-07-27 05:43:09'),
(8, '美式熱咖啡', 60, 5, '2023-07-27 05:43:09'),
(9, '冰紅茶', 30, 10, '2023-07-27 05:43:29'),
(10, '冰奶茶', 35, 15, '2023-07-27 05:43:29'),
(11, '冰綠茶', 30, 10, '2023-07-27 05:43:43'),
(13, '珍珠奶茶', 50, 12, '2023-07-27 07:48:55'),
(15, '原味鬆餅', 75, 5, '2023-07-27 08:05:09'),
(16, '百香綠茶', 35, 10, '2023-07-27 08:25:12'),
(19, '冰淇淋紅茶', 60, 5, '2023-08-01 01:48:56');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '編號(系統自動產生)', AUTO_INCREMENT=30;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '序號', AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
