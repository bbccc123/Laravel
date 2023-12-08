-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 04, 2023 lúc 09:32 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bandoan1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL,
  `coupon_code` varchar(30) NOT NULL,
  `coupon_type` int(11) NOT NULL,
  `coupon_amount` int(11) NOT NULL,
  `min_order` int(11) NOT NULL,
  `coupon_quantity` int(11) NOT NULL,
  `coupon_used` int(11) NOT NULL,
  `coupon_remain` int(11) NOT NULL,
  `coupon_expired` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `coupon_code`, `coupon_type`, `coupon_amount`, `min_order`, `coupon_quantity`, `coupon_used`, `coupon_remain`, `coupon_expired`) VALUES
(1, 'GIAMGIA50K', 0, 50000, 50000, 30, 0, 0, '2023-11-02'),
(2, 'GIAMGIA10%', 1, 10, 300000, 30, 6, 5, '2023-11-02'),
(3, 'GIAMGIA100K', 0, 100000, 1000000, 30, 5, 25, '2023-11-10'),
(4, 'GIAMGIA150K', 0, 150000, 500000, 30, 9, 21, '2023-11-09'),
(5, '', 0, 0, 0, 123125, 5, 123120, '2114-12-31'),
(6, 'GIAMGIATEST', 0, 120000, 1000000, 12, 0, 0, '2023-12-01'),
(10, 'GIAMGIA101K', 0, 100100, 100000, 5, 0, 5, '2023-11-02'),
(11, 'GIAMGIAT', 0, 120000, 1000000, 12, 0, 12, '2023-12-12'),
(12, 'GIAMGIA123', 0, 123000, 1230000, 15, 0, 15, '2023-11-12'),
(13, 'Giamgia10k', 0, 10000, 100000, 5, 2, 3, '2023-11-15'),
(14, 'Giam50k', 0, 50000, 100000, 5, 0, 5, '2023-11-15'),
(15, '2123', 0, 10000, 100000, 5, 0, 5, '2023-11-15'),
(20, 'GiamGia@#$10K', 0, 10000, 100000, 5, 0, 5, '2023-11-15'),
(19, '@#$', 0, 10000, 100000, 5, 0, 5, '2023-11-15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons_type`
--

CREATE TABLE `coupons_type` (
  `coupon_type` int(11) NOT NULL,
  `type_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons_type`
--

INSERT INTO `coupons_type` (`coupon_type`, `type_name`) VALUES
(0, 'Giảm theo số tiền'),
(1, 'Giảm theo tỉ lệ %');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufactures`
--

CREATE TABLE `manufactures` (
  `manu_id` int(11) NOT NULL,
  `manu_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `manufactures`
--

INSERT INTO `manufactures` (`manu_id`, `manu_name`) VALUES
(18, 'Capple.vn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `coupon_discount` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `note` varchar(150) DEFAULT NULL,
  `checkout` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `address`, `phone`, `status`, `coupon_discount`, `total`, `note`, `checkout`, `created_at`) VALUES
(245, 14, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 150000, 450000, '', 1, '2023-10-30 17:42:21'),
(244, 14, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 660000, '', 1, '2023-10-30 17:41:36'),
(243, 14, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 150000, 15000, '', 1, '2023-10-30 17:40:50'),
(242, 14, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 2, 150000, -50000, '', 0, '2023-10-30 17:25:32'),
(241, 1, '566/72/63R Nguyễn Thái Sơn, P.5, Quận Gò Vấp', '0935540795', 1, 20, 212000, '', 0, '2023-10-30 16:12:37'),
(240, 1, '566/72/63R Nguyễn Thái Sơn, P.5, Quận Gò Vấp', '0935540795', 0, 20, 376000, 'Chúc mừng sinh nhật', 1, '2023-10-30 16:11:26'),
(157, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 165000, '', 0, '2023-10-28 04:15:44'),
(158, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 120000, '', 0, '2023-10-28 04:17:30'),
(239, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 15000, 340000, '', 1, '2023-10-30 16:03:34'),
(238, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 20, 364000, '', 1, '2023-10-30 16:01:12'),
(237, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 20, 924000, '', 1, '2023-10-30 15:54:55'),
(236, 1, 'test', '0357369820', 0, 20, 308000, '', 1, '2023-10-30 14:57:59'),
(164, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 120000, '', 0, '2023-10-28 04:31:30'),
(165, 1, 'test', '0357369820', 0, 0, 165000, '', 0, '2023-10-28 04:33:48'),
(166, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 1200000, '', 1, '2023-10-28 04:35:46'),
(167, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 320000, '', 0, '2023-10-28 04:39:03'),
(168, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 355000, '', 0, '2023-10-28 06:44:03'),
(169, 1, '566/72/63R Nguyễn Thái Sơn, P.5, Quận Gò Vấp', '0935540795', 0, 0, 850000, '', 0, '2023-10-28 06:44:17'),
(170, 1, 'test', '0357369820', 0, 0, 550000, '', 0, '2023-10-28 06:45:00'),
(171, 1, 'test', '0357369820', 0, 0, 1550000, '', 1, '2023-10-28 06:56:01'),
(172, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 380000, '', 1, '2023-10-28 07:41:52'),
(173, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 190000, '', 1, '2023-10-28 07:44:48'),
(174, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 190000, '', 1, '2023-10-28 08:01:10'),
(175, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 190000, '', 1, '2023-10-28 08:04:00'),
(176, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 190000, '', 1, '2023-10-28 08:10:25'),
(177, 1, '15 An Nhon', '0935540795', 0, 0, 310000, '', 1, '2023-10-28 08:16:54'),
(178, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 190000, '', 1, '2023-10-28 08:17:55'),
(179, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 380000, '', 1, '2023-10-28 09:32:36'),
(180, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 355000, '', 1, '2023-10-29 03:24:10'),
(181, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 190000, '', 0, '2023-10-29 03:24:40'),
(182, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 165000, '', 1, '2023-10-29 03:29:24'),
(183, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 190000, '', 1, '2023-10-29 03:30:00'),
(184, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 190000, '', 0, '2023-10-29 03:31:15'),
(185, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 1200000, '', 0, '2023-10-29 03:32:32'),
(186, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 190000, '', 0, '2023-10-29 03:34:29'),
(187, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 5, 0, 100000, '', 0, '2023-10-29 03:35:56'),
(188, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 190000, '', 0, '2023-10-29 03:52:28'),
(189, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 190000, '', 1, '2023-10-29 03:53:16'),
(190, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 190000, '', 0, '2023-10-29 03:55:11'),
(191, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 190000, '', 0, '2023-10-29 04:12:05'),
(192, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 190000, '', 0, '2023-10-29 04:14:47'),
(193, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 6, 0, 190000, '', 0, '2023-10-29 04:15:27'),
(194, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 6, 0, 190000, '', 0, '2023-10-29 04:23:04'),
(195, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 165000, '', 0, '2023-10-29 04:26:09'),
(196, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 1, 0, 190000, '', 0, '2023-10-29 04:27:49'),
(197, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 1, 0, 190000, '', 1, '2023-10-29 04:31:24'),
(198, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 6, 0, 100000, '', 0, '2023-10-29 06:24:19'),
(199, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 4, 0, 190000, '', 0, '2023-10-29 06:27:52'),
(200, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 1, 0, 190000, '', 0, '2023-10-29 06:33:02'),
(201, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 190000, '', 1, '2023-10-29 06:36:33'),
(202, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 6, 0, 190000, '', 0, '2023-10-29 06:40:05'),
(203, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 3, 0, 310000, '', 0, '2023-10-29 06:45:42'),
(204, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 6, 0, 190000, '', 0, '2023-10-29 06:47:36'),
(205, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 6, 0, 190000, '', 0, '2023-10-29 07:18:21'),
(206, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 6, 0, 190000, '', 0, '2023-10-29 07:52:14'),
(207, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 1, 0, 310000, '', 0, '2023-10-29 08:01:47'),
(208, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 6, 0, 190000, '', 0, '2023-10-29 08:06:07'),
(209, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 5, 0, 190000, '', 0, '2023-10-29 08:07:42'),
(210, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 3, 0, 190000, '', 0, '2023-10-29 08:08:21'),
(211, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 5, 0, 190000, '', 0, '2023-10-29 08:10:41'),
(212, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 0, 0, 190000, '', 0, '2023-10-29 08:15:46'),
(213, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 2, 0, 190000, '', 0, '2023-10-29 08:39:48'),
(214, 1, '22 Lang Hai', '935540795', 6, 0, 120000, '', 0, '2023-10-29 08:40:03'),
(215, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 6, 0, 85000, '', 0, '2023-10-29 10:24:43'),
(216, 1, '566/72/63R Nguyen Thai Son, Phuong 5, Quan Go Vap', '0935540795', 6, 0, 120000, '', 0, '2023-10-29 10:47:12'),
(217, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 6, 0, 660000, '', 0, '2023-10-30 06:52:10'),
(218, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 6, 0, 165000, '', 0, '2023-10-30 07:00:01'),
(219, 1, 'test', '0357369820', 6, 0, 165000, '', 0, '2023-10-30 07:01:16'),
(220, 1, '190 Nguyễn Thái Sơn, Phường 4, Quận Gò Vấp', '935540795', 6, 0, 165000, '', 0, '2023-10-30 07:02:51'),
(221, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 6, 0, 240000, '', 0, '2023-10-30 07:04:08'),
(222, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 6, 0, 165000, '', 0, '2023-10-30 07:06:19'),
(223, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 6, 0, 190000, '', 0, '2023-10-30 07:08:02'),
(224, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 6, 0, 600000, '', 0, '2023-10-30 07:11:49'),
(225, 1, 'test', '0357369820', 6, 0, 0, '', 0, '2023-10-30 07:13:39'),
(226, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 6, 0, 0, '', 0, '2023-10-30 07:14:24'),
(227, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 6, 0, 330000, '', 0, '2023-10-30 07:15:05'),
(228, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 1, 0, 1005000, '', 1, '2023-10-30 07:33:49'),
(229, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 990000, '', 1, '2023-10-30 08:22:09'),
(230, 1, 'test', '0357369820', 0, 150000, 1170000, '', 1, '2023-10-30 08:37:30'),
(231, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 2, 150000, 1170000, '', 0, '2023-10-30 09:30:53'),
(232, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 1155000, '', 1, '2023-10-30 10:22:39'),
(233, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 6, 0, 990000, '', 0, '2023-10-30 10:32:50'),
(234, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 1155000, '', 1, '2023-10-30 10:39:31'),
(235, 1, '566/72/63R Nguyễn Thái Sơn, P.5, Quận Gò Vấp', '0935540795', 6, 20, 1320000, '', 0, '2023-10-30 14:31:03'),
(246, 14, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 510000, '', 1, '2023-10-31 05:32:29'),
(247, 14, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 150000, 450000, '', 1, '2023-10-31 06:47:56'),
(248, 14, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 150000, 450000, '', 1, '2023-10-31 06:50:42'),
(249, 14, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 10, 540000, '', 1, '2023-10-31 06:53:08'),
(250, 14, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 70000, '', 1, '2023-10-31 06:54:47'),
(251, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 2000000, 10170000, '', 0, '2023-10-31 09:06:06'),
(252, 14, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 6, 150000, 620000, '', 0, '2023-10-31 11:08:06'),
(253, 1, '285/6/8 Phạm Văn Chiêu, P.14, Quận Gò Vấp', '0935540795', 0, 0, 595000, '', 1, '2023-10-31 12:56:30'),
(254, 1, '566/72/63R Nguyễn Thái Sơn, P.5, Quận Gò Vấp', '0935540795', 0, 150000, 450000, '', 1, '2023-10-31 14:16:54'),
(278, 18, 'ad', '385273123', 5, 10000, 155000, 'ad', 1, '2023-12-02 01:01:06'),
(279, 25, 'add', '385273123', 0, 0, 285000, NULL, 1, '2023-12-02 08:34:40'),
(280, 18, 'ass', '385273123', 5, 0, 165000, NULL, 0, '2023-12-02 09:22:32'),
(281, 18, 'asss', '385273123', 0, 0, 285000, NULL, 1, '2023-12-02 09:24:27'),
(282, 18, 'aaaaa', '385273123', 5, 0, 835000, NULL, 1, '2023-12-02 09:31:17'),
(283, 18, 'ahaha', '385273123', 0, 0, 835000, NULL, 1, '2023-12-02 10:47:06'),
(284, 25, 'aw', '385273123', 0, 10000, 360000, NULL, 1, '2023-12-03 06:10:19'),
(285, 25, 'a123', '385273123', 0, 10000, 3240000, NULL, 1, '2023-12-03 06:16:22'),
(286, 25, 'a123', '385273123', 0, 10000, 3240000, NULL, 1, '2023-12-03 06:16:46'),
(287, 25, '123', '385273123', 0, 10000, 3240000, NULL, 1, '2023-12-03 06:17:47'),
(288, 25, 'ad123', '385273123', 0, 0, 3250000, NULL, 1, '2023-12-03 07:23:11'),
(289, 25, '123', '385273123', 0, 10000, 275000, NULL, 1, '2023-12-03 07:26:51'),
(290, 25, '123', '385273123', 0, 0, 275000, NULL, 1, '2023-12-03 07:27:28'),
(291, 18, 'ad', '385273123', 0, 0, 165000, NULL, 1, '2023-12-03 07:31:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `discount_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `product_image` varchar(150) NOT NULL,
  `orderdetail_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_name`, `discount_price`, `product_quantity`, `cost`, `product_id`, `type_id`, `product_image`, `orderdetail_id`) VALUES
(115, 'Chanh tươi Irag (kg)', 250000, 6, 1500000, 3, 3, 'chanhtuoiirag.png', 79),
(114, 'Bánh kem Matcha Nho', 320000, 1, 320000, 12, 2, 'banhkemnhomatcha.jpg', 78),
(114, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 77),
(114, 'Bánh kem Táo Hàn Quốc', 550000, 1, 550000, 17, 2, 'banhkemtao.jpg', 76),
(114, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 75),
(114, 'Bánh kem Matcha', 600000, 1, 600000, 22, 2, 'banhkemmatcha.jpg', 74),
(114, 'Nho Pháp thượng hạng (kg)', 150000, 1, 150000, 56, 1, 'nho.png', 73),
(114, 'Bánh kem bơ Pháp', 850000, 2, 1700000, 1, 2, 'banhkembophap.jpg', 72),
(113, 'Nho Pháp thượng hạng (kg)', 150000, 1, 150000, 56, 1, 'nho.png', 71),
(113, 'Ớt chuông đỏ (kg)', 60000, 1, 60000, 23, 3, 'otchuongdo.png', 70),
(113, 'Chanh tươi Irag (kg)', 250000, 2, 500000, 3, 3, 'chanhtuoiirag.png', 69),
(113, 'Bánh kem dâu Ý', 1200000, 2, 2400000, 5, 2, 'banhkemdau.jpg', 68),
(113, 'Chanh dây Nga tươi (kg)', 120000, 2, 240000, 16, 1, 'chanhday.png', 67),
(113, 'Cà tím Châu Phi (kg)', 120000, 3, 360000, 7, 3, 'catim.jpg', 66),
(113, 'Hồng đỏ Nam Mỹ (kg)', 165000, 5, 825000, 11, 1, 'hongdomy.png', 65),
(120, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 83),
(119, 'Kiwi ngọt Brazil (kg)', 190000, 3, 570000, 57, 1, 'kiwi.png', 81),
(119, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 82),
(121, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 84),
(148, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 85),
(148, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 86),
(149, 'Bánh kem Matcha', 600000, 1, 600000, 22, 2, 'banhkemmatcha.jpg', 87),
(149, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 88),
(149, 'Bánh kem dâu Ý', 1200000, 1, 1200000, 5, 2, 'banhkemdau.jpg', 89),
(150, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 90),
(150, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 91),
(151, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 92),
(151, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 93),
(152, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 94),
(153, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 95),
(154, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 96),
(154, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 97),
(155, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 98),
(155, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 99),
(156, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 100),
(157, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 101),
(158, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 102),
(159, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 103),
(160, 'Vải thiều loại to (kg)', 85000, 1, 85000, 21, 1, 'vaithieuloaito.png', 104),
(161, 'Cà rốt Bắc Mỹ (kg)', 120000, 1, 120000, 54, 3, 'carot.png', 105),
(162, 'Cà rốt Bắc Mỹ (kg)', 120000, 1, 120000, 54, 3, 'carot.png', 106),
(163, 'Vải thiều loại to (kg)', 85000, 1, 85000, 21, 1, 'vaithieuloaito.png', 107),
(164, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 108),
(165, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 109),
(166, 'Bánh kem dâu Ý', 1200000, 1, 1200000, 5, 2, 'banhkemdau.jpg', 110),
(167, 'Bánh kem Matcha Nho', 320000, 1, 320000, 12, 2, 'banhkemnhomatcha.jpg', 111),
(0, 'Bánh kem dâu Ý', 1200000, 1, 1200000, 5, 2, 'banhkemdau.jpg', 112),
(168, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 113),
(168, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 114),
(169, 'Bánh kem bơ Pháp', 850000, 1, 850000, 1, 2, 'banhkembophap.jpg', 115),
(170, 'Bánh kem Táo Hàn Quốc', 550000, 1, 550000, 17, 2, 'banhkemtao.jpg', 116),
(171, 'Bánh kem Matcha Nho', 320000, 1, 320000, 12, 2, 'banhkemnhomatcha.jpg', 117),
(171, 'Bánh kem bơ Pháp', 850000, 1, 850000, 1, 2, 'banhkembophap.jpg', 118),
(171, 'Kiwi ngọt Brazil (kg)', 190000, 2, 380000, 57, 1, 'kiwi.png', 119),
(172, 'Kiwi ngọt Brazil (kg)', 190000, 2, 380000, 57, 1, 'kiwi.png', 120),
(173, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 121),
(174, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 122),
(175, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 123),
(176, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 124),
(177, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 125),
(177, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 126),
(178, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 127),
(179, 'Kiwi ngọt Brazil (kg)', 190000, 2, 380000, 57, 1, 'kiwi.png', 128),
(180, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 129),
(180, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 130),
(181, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 131),
(182, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 132),
(183, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 133),
(184, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 134),
(185, 'Bánh kem dâu Ý', 1200000, 1, 1200000, 5, 2, 'banhkemdau.jpg', 135),
(186, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 136),
(187, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 137),
(188, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 138),
(189, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 139),
(190, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 140),
(191, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 141),
(192, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 142),
(193, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 143),
(194, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 144),
(195, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 145),
(196, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 146),
(197, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 147),
(198, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 148),
(199, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 149),
(200, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 150),
(201, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 151),
(202, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 152),
(203, 'Cà rốt Bắc Mỹ (kg)', 120000, 1, 120000, 54, 3, 'carot.png', 153),
(203, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 154),
(204, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 155),
(205, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 156),
(206, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 157),
(207, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 158),
(207, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 159),
(208, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 160),
(209, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 161),
(210, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 162),
(211, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 163),
(212, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 164),
(213, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 165),
(214, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 166),
(215, 'Vải thiều loại to (kg)', 85000, 1, 85000, 21, 1, 'vaithieuloaito.png', 167),
(216, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 168),
(217, 'Hồng đỏ Nam Mỹ (kg)', 165000, 4, 660000, 11, 1, 'hongdomy.png', 169),
(218, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 170),
(219, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 171),
(220, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 172),
(221, 'Chanh dây Nga tươi (kg)', 120000, 2, 240000, 16, 1, 'chanhday.png', 173),
(222, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 174),
(223, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 175),
(224, 'Bánh kem Matcha', 600000, 1, 600000, 22, 2, 'banhkemmatcha.jpg', 176),
(225, 'Chanh dây Nga tươi (kg)', 120000, 3, 360000, 16, 1, 'chanhday.png', 177),
(226, 'Hồng đỏ Nam Mỹ (kg)', 165000, 4, 660000, 11, 1, 'hongdomy.png', 178),
(227, 'Chanh dây Nga tươi (kg)', 120000, 4, 480000, 16, 1, 'chanhday.png', 179),
(228, 'Hồng đỏ Nam Mỹ (kg)', 165000, 7, 1155000, 11, 1, 'hongdomy.png', 180),
(229, 'Hồng đỏ Nam Mỹ (kg)', 165000, 6, 990000, 11, 1, 'hongdomy.png', 181),
(230, 'Hồng đỏ Nam Mỹ (kg)', 165000, 8, 1320000, 11, 1, 'hongdomy.png', 182),
(231, 'Hồng đỏ Nam Mỹ (kg)', 165000, 8, 1320000, 11, 1, 'hongdomy.png', 183),
(232, 'Hồng đỏ Nam Mỹ (kg)', 165000, 7, 1155000, 11, 1, 'hongdomy.png', 184),
(233, 'Hồng đỏ Nam Mỹ (kg)', 165000, 6, 990000, 11, 1, 'hongdomy.png', 185),
(234, 'Hồng đỏ Nam Mỹ (kg)', 165000, 7, 1155000, 11, 1, 'hongdomy.png', 186),
(235, 'Hồng đỏ Nam Mỹ (kg)', 165000, 10, 1650000, 11, 1, 'hongdomy.png', 187),
(236, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 188),
(236, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 189),
(236, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 190),
(237, 'Hồng đỏ Nam Mỹ (kg)', 165000, 7, 1155000, 11, 1, 'hongdomy.png', 191),
(238, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 192),
(238, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 193),
(238, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 194),
(239, 'Kiwi ngọt Brazil (kg)', 190000, 1, 190000, 57, 1, 'kiwi.png', 195),
(239, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 196),
(240, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 197),
(240, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 198),
(240, 'Vải thiều loại to (kg)', 85000, 1, 85000, 21, 1, 'vaithieuloaito.png', 199),
(240, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 200),
(241, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 201),
(241, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 202),
(242, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 203),
(243, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 204),
(244, 'Hồng đỏ Nam Mỹ (kg)', 165000, 4, 660000, 11, 1, 'hongdomy.png', 205),
(245, 'Chanh dây Nga tươi (kg)', 120000, 5, 600000, 16, 1, 'chanhday.png', 206),
(246, 'Hồng đỏ Nam Mỹ (kg)', 165000, 4, 660000, 11, 1, 'hongdomy.png', 207),
(247, 'Chanh dây Nga tươi (kg)', 120000, 5, 600000, 16, 1, 'chanhday.png', 208),
(248, 'Chanh dây Nga tươi (kg)', 120000, 5, 600000, 16, 1, 'chanhday.png', 209),
(249, 'Chanh dây Nga tươi (kg)', 120000, 5, 600000, 16, 1, 'chanhday.png', 210),
(250, 'Cải thìa Triều Tiên (kg)', 70000, 1, 70000, 53, 3, 'caithia.png', 211),
(251, 'Kiwi ngọt Brazil (kg)', 190000, 3, 570000, 57, 1, 'kiwi.png', 212),
(251, 'Dâu tây đỏ ngọt (kg)', 100000, 3, 300000, 18, 1, 'dautay.png', 213),
(251, 'Bánh kem Matcha', 600000, 5, 3000000, 22, 2, 'banhkemmatcha.jpg', 214),
(251, 'Bánh kem dâu Ý', 1200000, 6, 7200000, 5, 2, 'banhkemdau.jpg', 215),
(251, 'Bánh kem Táo Hàn Quốc', 550000, 2, 1100000, 17, 2, 'banhkemtao.jpg', 216),
(252, 'Chanh dây Nga tươi (kg)', 120000, 5, 600000, 16, 1, 'chanhday.png', 217),
(252, 'Vải thiều loại to (kg)', 85000, 2, 170000, 21, 1, 'vaithieuloaito.png', 218),
(253, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 219),
(253, 'Hồng đỏ Nam Mỹ (kg)', 165000, 3, 495000, 11, 1, 'hongdomy.png', 220),
(254, 'Chanh dây Nga tươi (kg)', 120000, 5, 600000, 16, 1, 'chanhday.png', 221),
(255, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 222),
(255, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 223),
(259, 'Hồng đỏ Nam Mỹ (kg)', 165000, 3, 495000, 11, 1, 'hongdomy.png', 224),
(260, 'Hồng đỏ Nam Mỹ (kg)', 165000, 3, 495000, 11, 1, 'hongdomy.png', 225),
(260, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 226),
(260, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 227),
(261, 'Hồng đỏ Nam Mỹ (kg)', 165000, 3, 495000, 11, 1, 'hongdomy.png', 228),
(261, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 229),
(261, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 230),
(262, 'Hồng đỏ Nam Mỹ (kg)', 165000, 3, 495000, 11, 1, 'hongdomy.png', 231),
(262, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 232),
(262, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 233),
(278, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 240),
(263, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 235),
(279, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 241),
(279, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 242),
(280, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 243),
(281, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 244),
(281, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 245),
(282, 'Hồng đỏ Nam Mỹ (kg)', 165000, 3, 495000, 11, 1, 'hongdomy.png', 246),
(282, 'Chanh dây Nga tươi (kg)', 120000, 2, 240000, 16, 1, 'chanhday.png', 247),
(282, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 248),
(283, 'Hồng đỏ Nam Mỹ (kg)', 165000, 3, 495000, 11, 1, 'hongdomy.png', 249),
(283, 'Chanh dây Nga tươi (kg)', 120000, 2, 240000, 16, 1, 'chanhday.png', 250),
(283, 'Dâu tây đỏ ngọt (kg)', 100000, 1, 100000, 18, 1, 'dautay.png', 251),
(284, 'Chanh tươi Irag (kg)', 250000, 1, 250000, 3, 3, 'chanhtuoiirag.png', 252),
(284, 'Cà tím Châu Phi (kg)', 120000, 1, 120000, 7, 3, 'catim.jpg', 253),
(285, 'Bánh kem bơ Pháp', 850000, 1, 850000, 1, 2, 'banhkembophap.jpg', 254),
(285, 'Bánh kem dâu Ý', 1200000, 2, 2400000, 5, 2, 'banhkemdau.jpg', 255),
(286, 'Bánh kem bơ Pháp', 850000, 1, 850000, 1, 2, 'banhkembophap.jpg', 256),
(286, 'Bánh kem dâu Ý', 1200000, 2, 2400000, 5, 2, 'banhkemdau.jpg', 257),
(287, 'Bánh kem bơ Pháp', 850000, 1, 850000, 1, 2, 'banhkembophap.jpg', 258),
(287, 'Bánh kem dâu Ý', 1200000, 2, 2400000, 5, 2, 'banhkemdau.jpg', 259),
(288, 'Bánh kem bơ Pháp', 850000, 1, 850000, 1, 2, 'banhkembophap.jpg', 260),
(288, 'Bánh kem dâu Ý', 1200000, 2, 2400000, 5, 2, 'banhkemdau.jpg', 261),
(289, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 262),
(289, 'Chanh dây Nga tươi (kg)', 120000, 1, 120000, 16, 1, 'chanhday.png', 263),
(291, 'Hồng đỏ Nam Mỹ (kg)', 165000, 1, 165000, 11, 1, 'hongdomy.png', 264);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `order_id` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `bankcode` varchar(50) NOT NULL,
  `content` varchar(5) NOT NULL,
  `card_type` varchar(24) NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`order_id`, `total_cost`, `bankcode`, `content`, `card_type`, `status`) VALUES
(226, 510000, 'VNPAY', '226', 'QRCODE', 'Thanh toán thất bại'),
(227, 330000, 'VNPAY', '227', 'QRCODE', 'Thanh toán thất bại'),
(233, 990000, 'VNPAY', '233', 'QRCODE', 'Thanh toán thất bại'),
(235, 1320000, 'VNPAY', '235', 'QRCODE', 'Thanh toán thất bại'),
(241, 212000, 'NCB', '241', 'ATM', 'Thanh toán thành công'),
(251, 10170000, 'NCB', '251', 'ATM', 'Thanh toán thành công'),
(252, 620000, 'VNPAY', '252', 'QRCODE', 'Thanh toán thất bại'),
(255, 285000, 'VNPAY', '255', 'QRCODE', 'Thanh toán thất bại');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `manu_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discount_price` int(11) NOT NULL,
  `pro_image` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `feature` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `manu_id`, `type_id`, `price`, `discount_price`, `pro_image`, `description`, `feature`, `created_at`) VALUES
(1, 'Bánh kem bơ Pháp', 18, 2, 850000, 0, 'banhkembophap.jpg', 'Vẫn sở hữu phần cốt bánh bông lan xốp mịn, điều làm cho những chiếc bánh kem này trở nên đặc biệt và cuốn hút nằm ở phần kem bơ.\r\n\r\nKem bơ Pháp được làm từ những nguyên liệu gồm lòng đỏ trứng, syrup đường và bơ lạt. Nhờ sử dụng thêm lòng đỏ trứng, thành phẩm kem bơ sẽ có hương vị cực kì thơm ngon, mềm mượt và tan ngay khi vào miệng.\r\n\r\nNhững người thợ tài hoa của Grand Castella còn tận dụng phần kem bơ này, sáng tạo nên những hình ảnh trang trí độc đáo, giúp chiếc bánh kem đã ngon nay trở nên xinh đẹp hơn.', 1, '2021-10-22 04:15:10'),
(53, 'Cải thìa Triều Tiên (kg)', 18, 3, 0, 70000, 'caithia.png', 'Cải thìa Triều Tiên do ông Kim trồng ăn rất ngon nhé. Mua ăn thử đi biết', 1, '2022-11-18 08:20:02'),
(54, 'Cà rốt Bắc Mỹ (kg)', 18, 3, 0, 120000, 'carot.png', 'Cà rốt Bắc Mỹ do ông Donald Trump đích thân trồng tại nông trại. Không qua bất cứ máy móc và hóa chất. Nên rất ngon và đắt', 1, '2022-11-18 08:19:55'),
(55, 'Cà chua Nhật Bản (kg)', 18, 3, 0, 110000, 'cachua.png', 'Do Thiên Hoàng Minh Trị trồng từ thời chiến tranh thế giới thứ 2. Đặc biệt loại này không dính phóng xạ nên ăn bổ lắm nha.', 0, '2022-11-18 08:19:46'),
(3, 'Chanh tươi Irag (kg)', 18, 3, 0, 250000, 'chanhtuoiirag.png', 'Loại tranh xuất xứ từ những anh Iran, Irag đẹp trai. Khủng b*, nên chanh này ăn ngon và hấp dẫn. Tận hưởng những phút giây như bị kh**g bố khi ăn nó', 0, '2022-11-18 08:22:41'),
(5, 'Bánh kem dâu Ý', 18, 2, 0, 1200000, 'banhkemdau.jpg', 'Xuất xứ từ Ý, du nhập Việt Nam năm 2022. Mới lạ và đang là xu hướng', 1, '2022-11-18 08:22:28'),
(7, 'Cà tím Châu Phi (kg)', 18, 3, 0, 120000, 'catim.jpg', 'Loại cà tím Châu Phi này to thì khỏi phải nói :)). Ăn thì cũng ngon, làm ngất ngây bao nhiêu chị em. Mua ăn thử bạn nhé', 1, '2022-11-18 08:22:20'),
(11, 'Hồng đỏ Nam Mỹ (kg)', 18, 1, 225000, 0, 'hongdomy.png', 'Hồng đỏ tươi Nam Mỹ, cung cấp nhiều khoáng chất tốt cho cơ thể', 1, '2022-11-18 08:22:12'),
(12, 'Bánh kem Matcha Nho', 18, 2, 0, 320000, 'banhkemnhomatcha.jpg', 'Sản phẩm tốt với giá thành rẻ. Ngon mà đẹp, thích hợp với sinh viên', 1, '2022-11-18 08:21:53'),
(13, 'Dưa leo Ấn Độ (kg)', 18, 3, 0, 50000, 'dualeoando.png', 'Dưa leo Ấn Độ chỉ được trồng ở Ấn Độ. Không xuất khẩu, nay có ở Việt Nam nhờ tui buôn l*u. Mua ăn đi nhé!!!', 1, '2022-11-18 08:21:34'),
(16, 'Chanh dây Nga tươi (kg)', 18, 1, 120000, 0, 'chanhday.png', 'Loại chanh dây đặc biệt này chỉ trồng được ở nước Hàn Đới như Nga, nên đừng thắc ắc giá cả. Mua ăn liền đi nhé!!!', 1, '2022-11-18 08:21:23'),
(17, 'Bánh kem Táo Hàn Quốc', 18, 2, 0, 550000, 'banhkemtao.jpg', 'Bánh kem táo Hàn Quốc siêu đẹp và ngon', 1, '2022-11-18 08:21:15'),
(18, 'Dâu tây đỏ ngọt (kg)', 18, 1, 0, 100000, 'dautay.png', 'Loại dâu tây này siêu ngọt và thơm. Ăn ngon nhé bạn', 1, '2022-11-18 08:21:01'),
(21, 'Vải thiều loại to (kg)', 18, 1, 0, 85000, 'vaithieuloaito.png', 'Vải thiều loại to, tươi mới mỗi ngày. Cung cấp Vitamin tốt cho sức khỏe', 1, '2022-11-18 08:20:52'),
(22, 'Bánh kem Matcha', 18, 2, 0, 600000, 'banhkemmatcha.jpg', 'Bánh kem matcha trà xanh, cực kỳ thơm ngon. Được khá nhiều người ưa chuộng', 1, '2022-11-18 08:22:01'),
(23, 'Ớt chuông đỏ (kg)', 18, 3, 0, 60000, 'otchuongdo.png', 'Ớt chuông đỏ cung cấp nhiều Vitamin D. Loại này ít cay nhưng ngon khi xào chung với Mực', 1, '2022-11-18 08:20:15'),
(92, 'hj', 18, 2, 120000, 80000, 'image1700137512-hj.jpg', 'sưaE', 0, '2023-11-14 13:29:57'),
(94, 'Anh Test', 18, 1, 150000, 0, 'image1701712888-Anh Test.jpg', 'hagggagag', 1, '2023-12-04 18:01:28'),
(95, 'Anh Test', 18, 3, 150000, 0, 'image1701712925-Anh Test.jpg', 'qwerty', 1, '2023-12-04 18:02:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `protypes`
--

CREATE TABLE `protypes` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `protypes`
--

INSERT INTO `protypes` (`type_id`, `type_name`) VALUES
(1, 'Trái cây tươi'),
(2, 'Bánh ngọt'),
(3, 'Rau củ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status`
--

CREATE TABLE `status` (
  `status` int(11) NOT NULL,
  `status_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `status`
--

INSERT INTO `status` (`status`, `status_name`) VALUES
(0, 'Đang gói hàng'),
(1, 'Đã giao hàng'),
(2, 'Đang thanh toán'),
(3, 'Đã thanh toán'),
(4, 'Đang giao hàng'),
(5, 'Đơn đã hủy'),
(6, 'Đã hủy thanh toán');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `image` varchar(150) DEFAULT NULL,
  `First_name` varchar(100) NOT NULL,
  `Last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `image`, `First_name`, `Last_name`, `email`, `phone`, `username`, `password`, `role_id`) VALUES
(1, 'admin.jpg', 'Hồ ', 'Duy Hoàng', '', 935540795, 'hoang', '202cb962ac59075b964b07152d234b70', 1),
(14, 'avatar3.jpg', 'Nguyễn ', 'Quốc Huy', '', 123456, 'huy', '202cb962ac59075b964b07152d234b70', 2),
(17, NULL, 'Đàm ', 'Vinh Quang', '', 999777333, 'quang', '202cb962ac59075b964b07152d234b70', 1),
(18, 'avatar7.png', 'Dam', 'Vinh Quang', 'damquang149@gmail.com', 385273123, 'vipz111', '$2y$10$tn02J7KA3ilsVB1YhjBnXuHd/lD0.CzEx0PrPOqeLFHRMfOXRSxBW', 1),
(19, NULL, 'Quang', 'shinro', 'damquang1491@gmail.com', 385273875, 'shin', '$2y$10$pharB.we1uwLZ3LKyFWW4OZkreEf5olgzbibXj1xnt.1zdTFtHD0q', 2),
(20, NULL, 'Quang', 'shinro', 'damquang1492@gmail.com', 385273875, 'shin123', '$2y$10$Migx4ZM6yjxc3OgD81Bk.eI.ymYa6g7erYs5JWBvWTzml479RiEf2', 1),
(22, NULL, 'c123', 'v', 'damquang@gmail.com', 374568503, 'vipz1', '$2y$10$tI9jOWbiod9HHY4Mpawwauk8bz4XajYpJdU07tyLvhWvmFQZUYOkW', 2),
(25, 'image1701294146-.jpg', 'Dam', 'Vinh Quang', 'damquang1493@gmail.com', 385273123, 'vipz11', '$2y$10$pGa2C1oKdk2qJHxwOK0mneL1B2D7iSsHdxtz5jmzlyTgasLw2dM7.', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`,`coupon_code`),
  ADD UNIQUE KEY `coupon_code` (`coupon_code`);

--
-- Chỉ mục cho bảng `coupons_type`
--
ALTER TABLE `coupons_type`
  ADD PRIMARY KEY (`coupon_type`);

--
-- Chỉ mục cho bảng `manufactures`
--
ALTER TABLE `manufactures`
  ADD PRIMARY KEY (`manu_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`orderdetail_id`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `protypes`
--
ALTER TABLE `protypes`
  ADD PRIMARY KEY (`type_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `manufactures`
--
ALTER TABLE `manufactures`
  MODIFY `manu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `orderdetail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT cho bảng `protypes`
--
ALTER TABLE `protypes`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
