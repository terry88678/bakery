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
(1, '麵粉', '鷹牌高筋麵粉1kg', 100, 95, '吸水性特佳，保濕性好，\r\n攪拌穩定性佳，\r\n製作吐司組織較綿密，較有麥香味。', NULL, 'true', '1c1770f863_Eagle Wheat Flour.jpg'),
(2, '麵粉', '拿破崙法國專用粉1公斤', 95, 91, '小麥粒深層核心精製,\r\n膨脹性好、吸水性佳,\r\n原味麥香，脆皮持續性佳。', NULL, 'true', 'NapoleonWheatFlour.jpg'),
(3, '麵粉', '凱薩琳高筋麵粉1公斤', 120, 114, '只萃取最高等級小麥粉心，\r\n24 小時低溫長時間研製，\r\n吸水性特高，組織不易老化。', NULL, 'true', 'Casarine.jpg'),
(4, '麵粉', '日清百合花法國粉1KG', 110, 105, '經長時間發酵和熟成，\r\n天然小麥香味，\r\n可烘培出外酥內軟、充滿嚼勁的法國麵包。', NULL, 'true', '76317feb26_LYS All Purpose Flour.jpg'),
(28, '鮮奶油', '總統牌動物性鮮奶油1L', 230, 219, '源自法國布列塔尼及諾曼地等地區，\r\n含有豐富的鈣質與維他命，\r\n細緻的質地，打發效果佳。', NULL, 'true', '58d30c5f2f_5406.jpg'),
(29, '麵粉', '日清紫羅蘭薄力粉1KG', 120, 114, '日清製粉最具代表性的低筋用粉，\r\n具蓬鬆感及化口性佳，\r\n適用於海綿蛋糕及戚風蛋糕。', NULL, 'true', 'cea1012727_96f1eb07715b7c98063e0995fa92dd13.jpg'),
(30, '麵粉', '日清山茶花強力粉1KG', 110, 105, '日清最具代表性的麵包用粉，\r\n適用於吐司、甜麵包等，有淡淡奶香，\r\n也能應用在披薩及餃子。', NULL, 'true', '79b4e60576_d9001d20038693d99e4a09ef4044a392.jpg'),
(31, '麵粉', '布瑟T55法國小麥粉1kg', 75, 71, '這款T55是布瑟麵粉中標準的磨坊系列麵粉，\r\n依麵包師的需求與期待，有多種類和食譜變化，\r\n可製作日常麵包與其他麵包產品都十分適合。', NULL, 'true', '499403c011_e536b574ab9e4a27e750262da58a766a.jpg'),
(32, '麵粉', '全麥麵粉1KG(王冠牌)', 65, 62, '全麥粉，適用於製作全麥麵包、饅頭等。', NULL, 'true', '97e311dfcd_fde90b20b240cfd12a88e92731c71961.jpg'),
(34, '麵粉', '熊本熊珍珠薄力粉1kg', 120, 114, '薄力粉即為低筋麵粉、被喻為最高級菓子專用粉。\r\n水合度好不易結塊、粉體潔白且成品化口性佳、可製作出口感輕盈蓬鬆的蛋糕體、並賦予糕點漂亮出色的外型。', NULL, 'true', '6a5162b2d3_ed0312b33934277680b75ec39f8d2a15.jpg'),
(35, '麵粉', '熊本熊皇冠高筋粉1kg', 125, 119, '熊本製粉旗下最具代表性的高筋麵粉。\r\n嚴選高品質的第一等級加拿大西部硬紅春小麥（1CWRS）、蛋白質含量高、使麵糰的延展性、操作性均相當出色。\r\n粉質潔白纖細、吸水性佳、可使麵包組織內部擁有細緻氣孔。', NULL, 'true', 'cf60ad54cc_66531b449fa39fd9a1d0c9df7b512c3b.jpg'),
(36, '鮮奶油', 'TATUA噴式鮮奶油', 180, 171, '口感滑潤綿密，具奶香味，\r\n快速享用甜點蛋糕的好幫手，\r\n輕輕鬆鬆就能裝飾好美味點心。', NULL, 'true', '245b576676_aa31a385746cb3a36987ca4dbec53047.jpg'),
(37, '鮮奶油', '歐登堡動物鮮奶油1L', 235, 223, '來自德國特選專業畜牧飼養的乳牛所生產的高品質乳源所製成。\r\nUHT無菌包裝保留濃郁的乳香。\r\n35%的香醇厚實讓美味有更多變化', NULL, 'true', '0699b2f1cf_96863b427fadbd2debbea93b840c7b34.jpg'),
(38, '鮮奶油', '法國萊思克鮮奶油35% 1L', 260, 247, '使用法國諾曼地產區的優質乳源，乳脂含量35%，\r\n乳香濃郁、清爽不膩，顛覆對鮮奶油的甜膩印象，\r\n打發率優越、穩定性極佳，烘焙新手也輕鬆上手，用途廣泛易操作。', NULL, 'true', '6bf2feeb72_2e95e0940262a2937a45c265d6981d34.jpg');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
