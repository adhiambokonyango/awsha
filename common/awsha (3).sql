-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 17, 2020 at 02:50 PM
-- Server version: 8.0.21-0ubuntu0.20.04.4
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `awsha`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_privileges`
--

CREATE TABLE `access_privileges` (
  `AccessPrivilegeId` int NOT NULL,
  `AccessPrivilegeDescription` varchar(200) NOT NULL,
  `AccessPrivilegeCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `access_privileges`
--

INSERT INTO `access_privileges` (`AccessPrivilegeId`, `AccessPrivilegeDescription`, `AccessPrivilegeCode`) VALUES
(1, 'login', 1);

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `AdministratorId` int NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `MiddleName` varchar(200) NOT NULL,
  `Surname` varchar(200) NOT NULL,
  `PhoneNumber` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `GenderId` int NOT NULL,
  `NationalId` int NOT NULL,
  `EncryptedPassword` varchar(5000) NOT NULL,
  `Salt` varchar(5000) NOT NULL,
  `RegisteredDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`AdministratorId`, `FirstName`, `MiddleName`, `Surname`, `PhoneNumber`, `Email`, `GenderId`, `NationalId`, `EncryptedPassword`, `Salt`, `RegisteredDate`) VALUES
(8, '1', '1', '1', '1', '1', 1, 1, 'e8185f6db82f4c4a00834451449dc3283a0e0ccc0f37ad688af67e3c3b108a521f36d0820b972093d13a9996715f28e0acbb7c230e22ce879dfea23e038e0ec0', 'WZUgb6EGIAxNzMUwDpGIrm+EUMJeuLZndxeKUn0I8OhYcVmg2ax5wiTYs/Q0bDKjp0gLLTZjTXH8HhAfp+LYusE/pJUdmLGyp/15EsyM8HVlKLPb18HZ8omiw4+yVrw84Oy7Kcpftol3aTBqsdVl145jYVKyhDGU7e+Sxg8quM8=', '2020-09-20');

-- --------------------------------------------------------

--
-- Table structure for table `administrator_access_privileges`
--

CREATE TABLE `administrator_access_privileges` (
  `AdministratorAccessPrivilegeId` int NOT NULL,
  `AdministratorAccessPrivilegeDescription` varchar(200) NOT NULL,
  `AdministratorAccessPrivilegeCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `administrator_access_privileges`
--

INSERT INTO `administrator_access_privileges` (`AdministratorAccessPrivilegeId`, `AdministratorAccessPrivilegeDescription`, `AdministratorAccessPrivilegeCode`) VALUES
(1, 'login', 2),
(2, 'register_project', 2002);

-- --------------------------------------------------------

--
-- Table structure for table `administrator_roles`
--

CREATE TABLE `administrator_roles` (
  `AdministratorRoleId` int NOT NULL,
  `AdministratorRoleDescription` varchar(200) NOT NULL,
  `AdministratorRoleCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `administrator_roles`
--

INSERT INTO `administrator_roles` (`AdministratorRoleId`, `AdministratorRoleDescription`, `AdministratorRoleCode`) VALUES
(1, 'finance', 1);

-- --------------------------------------------------------

--
-- Table structure for table `administrator_session_activities`
--

CREATE TABLE `administrator_session_activities` (
  `AdministratorSessionActivityId` int NOT NULL,
  `AdministratorSessionActivityDescription` varchar(200) NOT NULL,
  `AdministratorSessionActivityCode` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `administrator_session_activities`
--

INSERT INTO `administrator_session_activities` (`AdministratorSessionActivityId`, `AdministratorSessionActivityDescription`, `AdministratorSessionActivityCode`) VALUES
(1, 'login', 'A001');

-- --------------------------------------------------------

--
-- Table structure for table `administrator_session_logs`
--

CREATE TABLE `administrator_session_logs` (
  `AdministratorSessionLogId` int NOT NULL,
  `AdministratorId` int NOT NULL,
  `AdministratorSessionStartDate` date NOT NULL,
  `AdministratorSessionEndDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `administrator_session_logs`
--

INSERT INTO `administrator_session_logs` (`AdministratorSessionLogId`, `AdministratorId`, `AdministratorSessionStartDate`, `AdministratorSessionEndDate`) VALUES
(15, 8, '2020-09-19', '2020-09-19'),
(16, 8, '2020-09-19', '2020-09-19'),
(17, 8, '2020-09-21', '2020-09-21'),
(18, 8, '2020-09-21', '2020-09-21'),
(19, 8, '2020-09-21', '2020-09-21'),
(20, 8, '2020-09-29', '2020-09-29'),
(21, 8, '2020-09-29', '2020-09-29'),
(22, 8, '2020-09-30', '2020-09-30'),
(23, 8, '2020-09-30', '2020-09-30'),
(24, 8, '2020-10-01', '2020-10-01'),
(25, 8, '2020-10-01', '2020-10-01'),
(26, 8, '2020-10-01', '2020-10-01'),
(27, 8, '2020-10-02', '2020-10-02'),
(28, 8, '2020-10-06', '2020-10-06'),
(29, 8, '2020-10-06', '2020-10-06'),
(30, 8, '2020-10-06', '2020-10-06'),
(31, 8, '2020-10-06', '2020-10-06'),
(32, 8, '2020-10-06', '2020-10-06'),
(33, 8, '2020-10-07', '2020-10-07'),
(34, 8, '2020-10-07', '2020-10-07'),
(35, 8, '2020-10-07', '2020-10-07'),
(36, 8, '2020-10-07', '2020-10-07'),
(37, 8, '2020-10-07', '2020-10-07'),
(38, 8, '2020-10-07', '2020-10-07'),
(39, 8, '2020-10-07', '2020-10-07'),
(40, 8, '2020-10-12', '2020-10-12'),
(41, 8, '2020-10-12', '2020-10-12'),
(42, 8, '2020-10-12', '2020-10-12'),
(43, 8, '2020-10-13', '2020-10-13'),
(44, 8, '2020-10-13', '2020-10-13'),
(45, 8, '2020-10-15', '2020-10-15'),
(46, 8, '2020-10-15', '2020-10-15'),
(47, 8, '2020-10-15', '2020-10-15'),
(48, 8, '2020-10-15', '2020-10-15'),
(49, 8, '2020-10-15', '2020-10-15'),
(50, 8, '2020-10-16', '2020-10-16'),
(51, 8, '2020-10-16', '2020-10-16'),
(52, 8, '2020-10-16', '2020-10-16'),
(53, 8, '2020-10-16', '2020-10-16');

-- --------------------------------------------------------

--
-- Table structure for table `administrator_user_access_privileges`
--

CREATE TABLE `administrator_user_access_privileges` (
  `AdministratorUserAccessPrivilegeId` int NOT NULL,
  `AdministratorId` int NOT NULL,
  `AdministratorUserRoleId` int NOT NULL,
  `AdministratorAccessPrivilegeId` int NOT NULL,
  `AdministratorPermissionStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `administrator_user_access_privileges`
--

INSERT INTO `administrator_user_access_privileges` (`AdministratorUserAccessPrivilegeId`, `AdministratorId`, `AdministratorUserRoleId`, `AdministratorAccessPrivilegeId`, `AdministratorPermissionStatus`) VALUES
(6, 8, 10, 1, 1),
(7, 8, 10, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `administrator_user_roles`
--

CREATE TABLE `administrator_user_roles` (
  `AdministratorUserRoleId` int NOT NULL,
  `AdministratorId` int NOT NULL,
  `AdministratorRoleId` int NOT NULL,
  `AdministratorConfirmationStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `administrator_user_roles`
--

INSERT INTO `administrator_user_roles` (`AdministratorUserRoleId`, `AdministratorId`, `AdministratorRoleId`, `AdministratorConfirmationStatus`) VALUES
(10, 8, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `administrator_user_session_activities`
--

CREATE TABLE `administrator_user_session_activities` (
  `AdministratorUserSessionActivityId` int NOT NULL,
  `AdministratorSessionLogId` int NOT NULL,
  `AdministratorSessionActivityId` int NOT NULL,
  `AdministratorSessionActivityDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `administrator_user_session_activities`
--

INSERT INTO `administrator_user_session_activities` (`AdministratorUserSessionActivityId`, `AdministratorSessionLogId`, `AdministratorSessionActivityId`, `AdministratorSessionActivityDate`) VALUES
(15, 15, 1, '2020-09-19'),
(16, 16, 1, '2020-09-19'),
(17, 17, 1, '2020-09-21'),
(18, 18, 1, '2020-09-21'),
(19, 19, 1, '2020-09-21'),
(20, 20, 1, '2020-09-29'),
(21, 21, 1, '2020-09-29'),
(22, 22, 1, '2020-09-30'),
(23, 23, 1, '2020-09-30'),
(24, 24, 1, '2020-10-01'),
(25, 25, 1, '2020-10-01'),
(26, 26, 1, '2020-10-01'),
(27, 27, 1, '2020-10-02'),
(28, 28, 1, '2020-10-06'),
(29, 29, 1, '2020-10-06'),
(30, 30, 1, '2020-10-06'),
(31, 31, 1, '2020-10-06'),
(32, 32, 1, '2020-10-06'),
(33, 33, 1, '2020-10-07'),
(34, 34, 1, '2020-10-07'),
(35, 35, 1, '2020-10-07'),
(36, 36, 1, '2020-10-07'),
(37, 37, 1, '2020-10-07'),
(38, 38, 1, '2020-10-07'),
(39, 39, 1, '2020-10-07'),
(40, 40, 1, '2020-10-12'),
(41, 41, 1, '2020-10-12'),
(42, 42, 1, '2020-10-12'),
(43, 43, 1, '2020-10-13'),
(44, 44, 1, '2020-10-13'),
(45, 45, 1, '2020-10-15'),
(46, 46, 1, '2020-10-15'),
(47, 47, 1, '2020-10-15'),
(48, 48, 1, '2020-10-15'),
(49, 49, 1, '2020-10-15'),
(50, 50, 1, '2020-10-16'),
(51, 51, 1, '2020-10-16'),
(52, 52, 1, '2020-10-16'),
(53, 53, 1, '2020-10-16');

-- --------------------------------------------------------

--
-- Table structure for table `admin_session_activities`
--

CREATE TABLE `admin_session_activities` (
  `AdminSessionActivityId` int NOT NULL,
  `AdminSessionActivityDescription` varchar(200) NOT NULL,
  `AdminSessionActivityCode` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_session_activities`
--

INSERT INTO `admin_session_activities` (`AdminSessionActivityId`, `AdminSessionActivityDescription`, `AdminSessionActivityCode`) VALUES
(1, 'login', 'SA001'),
(2, 'user_registration', 'SA002');

-- --------------------------------------------------------

--
-- Table structure for table `admin_session_logs`
--

CREATE TABLE `admin_session_logs` (
  `AdminSessionLogId` int NOT NULL,
  `AdminId` int NOT NULL,
  `AdminSessionStartDate` datetime NOT NULL,
  `AdminSessionEndDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_session_logs`
--

INSERT INTO `admin_session_logs` (`AdminSessionLogId`, `AdminId`, `AdminSessionStartDate`, `AdminSessionEndDate`) VALUES
(134, 9, '2020-09-19 00:00:00', '2020-09-19 00:00:00'),
(135, 9, '2020-09-19 00:00:00', '2020-09-19 00:00:00'),
(136, 9, '2020-09-19 00:00:00', '2020-09-19 00:00:00'),
(137, 9, '2020-09-21 00:00:00', '2020-09-21 00:00:00'),
(138, 9, '2020-09-21 00:00:00', '2020-09-21 00:00:00'),
(139, 9, '2020-09-21 00:00:00', '2020-09-21 00:00:00'),
(140, 9, '2020-09-21 00:00:00', '2020-09-21 00:00:00'),
(141, 9, '2020-09-21 00:00:00', '2020-09-21 00:00:00'),
(142, 9, '2020-09-21 00:00:00', '2020-09-21 00:00:00'),
(143, 9, '2020-09-21 00:00:00', '2020-09-21 00:00:00'),
(144, 9, '2020-09-21 00:00:00', '2020-09-21 00:00:00'),
(145, 9, '2020-09-21 15:05:55', '2020-09-21 15:05:55'),
(146, 9, '2020-09-21 15:07:06', '2020-09-21 15:07:06'),
(147, 9, '2020-09-21 15:10:48', '2020-09-21 15:10:48'),
(148, 9, '2020-09-21 15:13:25', '2020-09-21 15:13:25'),
(149, 9, '2020-09-25 18:57:21', '2020-09-25 18:57:21'),
(150, 9, '2020-09-25 19:15:56', '2020-09-25 19:15:56'),
(151, 9, '2020-09-28 20:53:04', '2020-09-28 20:53:04'),
(152, 9, '2020-09-29 18:37:12', '2020-09-29 18:37:12'),
(153, 9, '2020-09-29 18:42:50', '2020-09-29 18:42:50'),
(154, 9, '2020-09-29 20:49:00', '2020-09-29 20:49:00'),
(155, 9, '2020-09-29 20:56:28', '2020-09-29 20:56:28'),
(156, 9, '2020-09-29 21:01:56', '2020-09-29 21:01:56'),
(157, 9, '2020-10-07 19:37:13', '2020-10-07 19:37:13'),
(158, 9, '2020-10-07 19:38:44', '2020-10-07 19:38:44'),
(159, 9, '2020-10-07 19:39:26', '2020-10-07 19:39:26'),
(160, 9, '2020-10-07 19:40:10', '2020-10-07 19:40:10'),
(161, 9, '2020-10-07 19:42:30', '2020-10-07 19:42:30'),
(162, 9, '2020-10-07 19:43:50', '2020-10-07 19:43:50'),
(163, 9, '2020-10-07 19:45:17', '2020-10-07 19:45:17'),
(164, 9, '2020-10-07 19:45:56', '2020-10-07 19:45:56'),
(165, 9, '2020-10-07 19:46:21', '2020-10-07 19:46:21'),
(166, 9, '2020-10-07 19:47:31', '2020-10-07 19:47:31'),
(167, 9, '2020-10-07 19:48:15', '2020-10-07 19:48:15'),
(168, 9, '2020-10-07 19:48:55', '2020-10-07 19:48:55'),
(169, 9, '2020-10-07 19:49:35', '2020-10-07 19:49:35'),
(170, 9, '2020-10-07 19:50:49', '2020-10-07 19:50:49'),
(171, 9, '2020-10-07 19:52:00', '2020-10-07 19:52:00'),
(172, 9, '2020-10-07 19:52:57', '2020-10-07 19:52:57'),
(173, 9, '2020-10-07 19:54:20', '2020-10-07 19:54:20'),
(174, 9, '2020-10-07 19:56:42', '2020-10-07 19:56:42'),
(175, 9, '2020-10-07 19:57:54', '2020-10-07 19:57:54'),
(176, 9, '2020-10-07 19:58:41', '2020-10-07 19:58:41'),
(177, 9, '2020-10-07 20:00:27', '2020-10-07 20:00:27'),
(178, 9, '2020-10-07 20:02:17', '2020-10-07 20:02:17'),
(179, 9, '2020-10-07 20:03:37', '2020-10-07 20:03:37'),
(180, 9, '2020-10-07 20:04:55', '2020-10-07 20:04:55'),
(181, 9, '2020-10-07 20:05:42', '2020-10-07 20:05:42'),
(182, 9, '2020-10-07 20:12:48', '2020-10-07 20:12:48'),
(183, 9, '2020-10-07 20:21:44', '2020-10-07 20:21:44'),
(184, 9, '2020-10-07 20:23:34', '2020-10-07 20:23:34'),
(185, 9, '2020-10-07 20:24:49', '2020-10-07 20:24:49'),
(186, 9, '2020-10-07 20:26:03', '2020-10-07 20:26:03'),
(187, 9, '2020-10-07 20:27:53', '2020-10-07 20:27:53'),
(188, 9, '2020-10-07 20:32:38', '2020-10-07 20:32:38'),
(189, 9, '2020-10-07 20:32:55', '2020-10-07 20:32:55'),
(190, 9, '2020-10-07 20:41:32', '2020-10-07 20:41:32'),
(191, 9, '2020-10-15 17:52:27', '2020-10-15 17:52:27'),
(192, 9, '2020-10-15 17:54:50', '2020-10-15 17:54:50'),
(193, 9, '2020-10-15 18:06:12', '2020-10-15 18:06:12'),
(194, 9, '2020-10-15 20:56:34', '2020-10-15 20:56:34');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_access_privileges`
--

CREATE TABLE `admin_user_access_privileges` (
  `AdminUserAccessPrivilegeId` int NOT NULL,
  `AdminId` int NOT NULL,
  `AdminUserRoleId` int NOT NULL,
  `AdminAccessPrivilegeId` int NOT NULL,
  `AdminPermissionStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_user_access_privileges`
--

INSERT INTO `admin_user_access_privileges` (`AdminUserAccessPrivilegeId`, `AdminId`, `AdminUserRoleId`, `AdminAccessPrivilegeId`, `AdminPermissionStatus`) VALUES
(6, 9, 8, 1, 1),
(7, 9, 8, 2, 1),
(8, 9, 8, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_roles`
--

CREATE TABLE `admin_user_roles` (
  `AdminUserRoleId` int NOT NULL,
  `AdminId` int NOT NULL,
  `AdminRoleId` int NOT NULL,
  `AdminConfirmationStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_user_roles`
--

INSERT INTO `admin_user_roles` (`AdminUserRoleId`, `AdminId`, `AdminRoleId`, `AdminConfirmationStatus`) VALUES
(8, 9, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_session_activities`
--

CREATE TABLE `admin_user_session_activities` (
  `AdminUserSessionActivityId` int NOT NULL,
  `AdminSessionLogId` int NOT NULL,
  `AdminSessionActivityId` int NOT NULL,
  `AdminSessionActivityDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_user_session_activities`
--

INSERT INTO `admin_user_session_activities` (`AdminUserSessionActivityId`, `AdminSessionLogId`, `AdminSessionActivityId`, `AdminSessionActivityDate`) VALUES
(134, 134, 1, '2020-09-19'),
(135, 135, 1, '2020-09-19'),
(136, 136, 1, '2020-09-19'),
(137, 137, 1, '2020-09-21'),
(138, 138, 1, '2020-09-21'),
(139, 139, 1, '2020-09-21'),
(140, 140, 1, '2020-09-21'),
(141, 141, 1, '2020-09-21'),
(142, 142, 1, '2020-09-21'),
(143, 143, 1, '2020-09-21'),
(144, 144, 1, '2020-09-21'),
(145, 145, 1, '2020-09-21'),
(146, 146, 1, '2020-09-21'),
(147, 147, 1, '2020-09-21'),
(148, 148, 1, '2020-09-21'),
(149, 149, 1, '2020-09-25'),
(150, 150, 1, '2020-09-25'),
(151, 151, 1, '2020-09-28'),
(152, 152, 1, '2020-09-29'),
(153, 153, 1, '2020-09-29'),
(154, 154, 1, '2020-09-29'),
(155, 155, 1, '2020-09-29'),
(156, 156, 1, '2020-09-29'),
(157, 157, 1, '2020-10-07'),
(158, 158, 1, '2020-10-07'),
(159, 159, 1, '2020-10-07'),
(160, 160, 1, '2020-10-07'),
(161, 161, 1, '2020-10-07'),
(162, 162, 1, '2020-10-07'),
(163, 163, 1, '2020-10-07'),
(164, 164, 1, '2020-10-07'),
(165, 165, 1, '2020-10-07'),
(166, 166, 1, '2020-10-07'),
(167, 167, 1, '2020-10-07'),
(168, 168, 1, '2020-10-07'),
(169, 169, 1, '2020-10-07'),
(170, 170, 1, '2020-10-07'),
(171, 171, 1, '2020-10-07'),
(172, 172, 1, '2020-10-07'),
(173, 173, 1, '2020-10-07'),
(174, 174, 1, '2020-10-07'),
(175, 175, 1, '2020-10-07'),
(176, 176, 1, '2020-10-07'),
(177, 177, 1, '2020-10-07'),
(178, 178, 1, '2020-10-07'),
(179, 179, 1, '2020-10-07'),
(180, 180, 1, '2020-10-07'),
(181, 181, 1, '2020-10-07'),
(182, 182, 1, '2020-10-07'),
(183, 183, 1, '2020-10-07'),
(184, 184, 1, '2020-10-07'),
(185, 185, 1, '2020-10-07'),
(186, 186, 1, '2020-10-07'),
(187, 187, 1, '2020-10-07'),
(188, 188, 1, '2020-10-07'),
(189, 189, 1, '2020-10-07'),
(190, 190, 1, '2020-10-07'),
(191, 191, 1, '2020-10-15'),
(192, 192, 1, '2020-10-15'),
(193, 193, 1, '2020-10-15'),
(194, 194, 1, '2020-10-15');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `BranchId` int NOT NULL,
  `BranchName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`BranchId`, `BranchName`) VALUES
(1, 'gpo'),
(2, 'westlands');

-- --------------------------------------------------------

--
-- Table structure for table `branch_activation`
--

CREATE TABLE `branch_activation` (
  `BranchActivationId` int NOT NULL,
  `BranchId` int NOT NULL,
  `UserId` int NOT NULL,
  `BranchActivationStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `branch_activation`
--

INSERT INTO `branch_activation` (`BranchActivationId`, `BranchId`, `UserId`, `BranchActivationStatus`) VALUES
(1, 1, 16, 0),
(2, 2, 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `branch_projects`
--

CREATE TABLE `branch_projects` (
  `BranchProjectId` int NOT NULL,
  `ProjectId` int NOT NULL,
  `BranchId` int NOT NULL,
  `BranchProjectStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `branch_projects`
--

INSERT INTO `branch_projects` (`BranchProjectId`, `ProjectId`, `BranchId`, `BranchProjectStatus`) VALUES
(3, 44, 1, 0),
(4, 44, 2, 0),
(7, 46, 1, 0),
(8, 46, 2, 0),
(22, 56, 1, 0),
(23, 56, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `GenderId` int NOT NULL,
  `GenderTitle` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`GenderId`, `GenderTitle`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `objectives`
--

CREATE TABLE `objectives` (
  `ObjectiveId` int NOT NULL,
  `ProjectId` int NOT NULL,
  `ObjectiveDescription` varchar(2000) NOT NULL,
  `ObjectivePercentage` int NOT NULL,
  `IsCheckBoxChecked` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `objectives`
--

INSERT INTO `objectives` (`ObjectiveId`, `ProjectId`, `ObjectiveDescription`, `ObjectivePercentage`, `IsCheckBoxChecked`) VALUES
(5, 44, 'test is check box checked', 10, 1),
(6, 46, 'test response', 50, 1),
(7, 56, 'Objective Tester', 10, 1),
(8, 44, 'fetch reset', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `ProjectId` int NOT NULL,
  `ProjectTitle` varchar(200) NOT NULL,
  `ProjectDescription` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProjectProgress` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`ProjectId`, `ProjectTitle`, `ProjectDescription`, `ProjectProgress`) VALUES
(44, 'test project', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 30),
(46, 'response', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 50),
(56, 'Final Test', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 20);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `RoleId` int NOT NULL,
  `RoleDescription` varchar(200) NOT NULL,
  `RoleCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RoleId`, `RoleDescription`, `RoleCode`) VALUES
(1, 'user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `session_activities`
--

CREATE TABLE `session_activities` (
  `SessionActivityId` int NOT NULL,
  `SessionActivityDescription` varchar(200) NOT NULL,
  `SessionActivityCode` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `session_activities`
--

INSERT INTO `session_activities` (`SessionActivityId`, `SessionActivityDescription`, `SessionActivityCode`) VALUES
(1, 'login', 'U001');

-- --------------------------------------------------------

--
-- Table structure for table `session_logs`
--

CREATE TABLE `session_logs` (
  `SessionLogId` int NOT NULL,
  `UserId` int NOT NULL,
  `SessionStartDate` datetime NOT NULL,
  `SessionEndDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `session_logs`
--

INSERT INTO `session_logs` (`SessionLogId`, `UserId`, `SessionStartDate`, `SessionEndDate`) VALUES
(43, 14, '2020-09-06 21:00:38', '2020-09-06 21:00:38'),
(44, 14, '2020-09-06 21:09:21', '2020-09-06 21:09:21'),
(45, 14, '2020-09-11 19:21:09', '2020-09-11 19:21:09'),
(46, 14, '2020-09-14 18:24:18', '2020-09-14 18:24:18'),
(47, 14, '2020-09-14 18:24:55', '2020-09-14 18:24:55'),
(48, 14, '2020-09-14 18:24:57', '2020-09-14 18:24:57'),
(49, 14, '2020-09-14 18:25:22', '2020-09-14 18:25:22'),
(50, 14, '2020-09-14 18:25:36', '2020-09-14 18:25:36'),
(51, 14, '2020-09-14 18:28:45', '2020-09-14 18:28:45'),
(52, 14, '2020-09-14 18:29:58', '2020-09-14 18:29:58'),
(53, 14, '2020-09-14 18:30:28', '2020-09-14 18:30:28'),
(54, 14, '2020-09-14 18:32:54', '2020-09-14 18:32:54'),
(55, 14, '2020-09-17 15:01:29', '2020-09-17 15:01:29'),
(56, 14, '2020-09-17 15:16:50', '2020-09-17 15:16:50'),
(57, 14, '2020-09-17 15:17:54', '2020-09-17 15:17:54'),
(58, 14, '2020-09-18 17:43:06', '2020-09-18 17:43:06'),
(59, 14, '2020-09-19 18:27:40', '2020-09-19 18:27:40'),
(60, 14, '2020-09-19 18:29:39', '2020-09-19 18:29:39'),
(61, 14, '2020-09-19 18:33:18', '2020-09-19 18:33:18'),
(62, 14, '2020-09-19 18:37:02', '2020-09-19 18:37:02'),
(63, 14, '2020-09-19 18:38:32', '2020-09-19 18:38:32'),
(64, 14, '2020-09-19 18:39:01', '2020-09-19 18:39:01'),
(65, 14, '2020-09-19 18:41:53', '2020-09-19 18:41:53'),
(66, 14, '2020-09-19 18:44:31', '2020-09-19 18:44:31'),
(67, 14, '2020-09-19 18:45:18', '2020-09-19 18:45:18'),
(68, 14, '2020-09-19 18:47:43', '2020-09-19 18:47:43'),
(69, 14, '2020-09-19 18:48:45', '2020-09-19 18:48:45'),
(70, 14, '2020-09-19 18:55:28', '2020-09-19 18:55:28'),
(71, 14, '2020-09-19 19:00:20', '2020-09-19 19:00:20'),
(72, 14, '2020-09-19 19:04:27', '2020-09-19 19:04:27'),
(73, 14, '2020-09-19 19:43:51', '2020-09-19 19:43:51'),
(74, 14, '2020-09-19 19:44:44', '2020-09-19 19:44:44'),
(75, 14, '2020-09-19 19:45:39', '2020-09-19 19:45:39'),
(76, 17, '2020-09-19 22:54:34', '2020-09-19 22:54:34'),
(77, 17, '2020-09-19 22:56:20', '2020-09-19 22:56:20'),
(78, 17, '2020-09-21 10:23:38', '2020-09-21 10:23:38'),
(79, 17, '2020-09-21 12:02:45', '2020-09-21 12:02:45'),
(80, 17, '2020-09-21 12:02:48', '2020-09-21 12:02:48'),
(81, 17, '2020-09-29 18:42:31', '2020-09-29 18:42:31'),
(82, 17, '2020-09-29 18:42:34', '2020-09-29 18:42:34'),
(83, 17, '2020-09-30 19:17:36', '2020-09-30 19:17:36'),
(84, 17, '2020-09-30 19:19:17', '2020-09-30 19:19:17'),
(85, 17, '2020-10-01 10:00:48', '2020-10-01 10:00:48'),
(86, 17, '2020-10-01 10:05:00', '2020-10-01 10:05:00'),
(87, 17, '2020-10-01 17:39:55', '2020-10-01 17:39:55'),
(88, 17, '2020-10-02 20:13:58', '2020-10-02 20:13:58'),
(89, 17, '2020-10-06 16:27:16', '2020-10-06 16:27:16'),
(90, 17, '2020-10-06 17:42:30', '2020-10-06 17:42:30'),
(91, 17, '2020-10-06 17:58:53', '2020-10-06 17:58:53'),
(92, 17, '2020-10-06 18:14:48', '2020-10-06 18:14:48'),
(93, 17, '2020-10-06 18:49:19', '2020-10-06 18:49:19'),
(94, 17, '2020-10-07 10:17:42', '2020-10-07 10:17:42'),
(95, 17, '2020-10-07 19:25:58', '2020-10-07 19:25:58'),
(96, 14, '2020-10-07 20:28:14', '2020-10-07 20:28:14'),
(97, 14, '2020-10-07 20:29:18', '2020-10-07 20:29:18'),
(98, 17, '2020-10-07 20:31:12', '2020-10-07 20:31:12'),
(99, 17, '2020-10-07 20:31:34', '2020-10-07 20:31:34'),
(100, 17, '2020-10-07 20:33:14', '2020-10-07 20:33:14'),
(101, 17, '2020-10-07 20:36:54', '2020-10-07 20:36:54'),
(102, 17, '2020-10-07 20:43:24', '2020-10-07 20:43:24'),
(103, 17, '2020-10-12 13:13:59', '2020-10-12 13:13:59'),
(104, 17, '2020-10-12 19:31:39', '2020-10-12 19:31:39'),
(105, 17, '2020-10-12 19:45:38', '2020-10-12 19:45:38'),
(106, 17, '2020-10-13 11:54:15', '2020-10-13 11:54:15'),
(107, 17, '2020-10-13 13:37:01', '2020-10-13 13:37:01'),
(108, 17, '2020-10-15 12:09:14', '2020-10-15 12:09:14'),
(109, 14, '2020-10-15 17:54:41', '2020-10-15 17:54:41'),
(110, 14, '2020-10-15 17:55:35', '2020-10-15 17:55:35'),
(111, 17, '2020-10-15 18:05:46', '2020-10-15 18:05:46'),
(112, 17, '2020-10-15 18:06:27', '2020-10-15 18:06:27'),
(113, 17, '2020-10-15 20:57:43', '2020-10-15 20:57:43'),
(114, 17, '2020-10-15 22:04:57', '2020-10-15 22:04:57'),
(115, 17, '2020-10-16 11:20:37', '2020-10-16 11:20:37'),
(116, 17, '2020-10-16 11:39:01', '2020-10-16 11:39:01'),
(117, 17, '2020-10-16 11:43:01', '2020-10-16 11:43:01'),
(118, 17, '2020-10-16 21:13:52', '2020-10-16 21:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `system_admin`
--

CREATE TABLE `system_admin` (
  `AdminId` int NOT NULL,
  `FirstName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MiddleName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Surname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PhoneNumber` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(200) NOT NULL,
  `GenderId` int NOT NULL,
  `NationalId` int NOT NULL,
  `EncryptedPassword` varchar(5000) NOT NULL,
  `Salt` varchar(5000) NOT NULL,
  `RegisteredDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `system_admin`
--

INSERT INTO `system_admin` (`AdminId`, `FirstName`, `MiddleName`, `Surname`, `PhoneNumber`, `Email`, `GenderId`, `NationalId`, `EncryptedPassword`, `Salt`, `RegisteredDate`) VALUES
(9, 'admin', '1', '1', '1', 'admin', 1, 1, 'cbae0c515f08203cc281c433b68ffae762d27b38fb5d3c864c09cc6f00ca2d0b8a9379a393c6ab9b50aa1181828180e9966dfa2558644521ee295682ca735c43', 'cATl0EUjMgLWYTGwnCRKD28UDtJ/Awc/gQkPRsNmS+qPsvZ8DeeUnsNK2S5wi66ILgBSl9xR7fJ3/ii7gHxeKQUMjGHp6ftmCcw1I/LhkSjFYPh4RvRx7f5c0DM/i3kny4cJ6Fcr8922P9PI2KWR4d4Ctsq6sxx2Ja1PSnPN/bo=', '2020-09-20');

-- --------------------------------------------------------

--
-- Table structure for table `system_admin_access_privileges`
--

CREATE TABLE `system_admin_access_privileges` (
  `AdminAccessPrivilegeId` int NOT NULL,
  `AdminAccessPrivilegeDescription` varchar(200) NOT NULL,
  `AdminAccessPrivilegeCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `system_admin_access_privileges`
--

INSERT INTO `system_admin_access_privileges` (`AdminAccessPrivilegeId`, `AdminAccessPrivilegeDescription`, `AdminAccessPrivilegeCode`) VALUES
(1, 'login', 1),
(2, 'user_registration', 1002),
(3, 'administrator_registration', 1003);

-- --------------------------------------------------------

--
-- Table structure for table `system_admin_roles`
--

CREATE TABLE `system_admin_roles` (
  `AdminRoleId` int NOT NULL,
  `AdminRoleDescription` varchar(200) NOT NULL,
  `AdminRoleCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `system_admin_roles`
--

INSERT INTO `system_admin_roles` (`AdminRoleId`, `AdminRoleDescription`, `AdminRoleCode`) VALUES
(1, 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `TeamId` int NOT NULL,
  `TeamName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`TeamId`, `TeamName`) VALUES
(1, 'team one'),
(2, 'team two');

-- --------------------------------------------------------

--
-- Table structure for table `team_leaders`
--

CREATE TABLE `team_leaders` (
  `TeamLeaderId` int NOT NULL,
  `TeamId` int NOT NULL,
  `AdministratorId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `team_leaders`
--

INSERT INTO `team_leaders` (`TeamLeaderId`, `TeamId`, `AdministratorId`) VALUES
(2, 1, 8),
(3, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `TeamMemberId` int NOT NULL,
  `TeamId` int NOT NULL,
  `UserId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`TeamMemberId`, `TeamId`, `UserId`) VALUES
(2, 2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `MiddleName` varchar(200) NOT NULL,
  `Surname` varchar(200) NOT NULL,
  `PhoneNumber` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `GenderId` int NOT NULL,
  `NationalId` int NOT NULL,
  `EncryptedPassword` varchar(5000) NOT NULL,
  `Salt` varchar(5000) NOT NULL,
  `RegisteredDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `FirstName`, `MiddleName`, `Surname`, `PhoneNumber`, `Email`, `GenderId`, `NationalId`, `EncryptedPassword`, `Salt`, `RegisteredDate`) VALUES
(14, 'user', '1', '1', '1', 'user', 1, 1, '7f09be43b46b2b0aa77d3c59cd7f2dc781a0dc2b5001135eaaa7b05a883623edeee37838e63ab4681b0ff0c47238c48afec4e23a9e6bff3f8f573ce2f3420ed0', 'f8uLl3KtU0Xlbw1YNakrfnPEQrFD5q0dWY4okf/Uvk0F5WGky2s6TZSJASbUCVvaeEEVuxxGa3gm/y4xSiMow68Wrh4/oJ7ruXUdR8IQQAaLjoji9mNGJBPPOhN7kusPFzFBeWg2XLI0ZXiLyaPaIB49Zi4RnI+DG8q/vieT8XU=', '2020-08-17'),
(15, 'regular_user', '1', '1', '1', 'regular_user', 1, 1, '6ae5da6165bc3877eb12d22ea145b5d7370e36c1ce81dbca61584ae344c8e67b9edb9cfc7dbd1eefa75603dfe585e0a8a03b693e7f486f8d5a9905379f52ea87', '0JTTDBX6zudlEqcMsVLMWoGJHbpDJaaTzhbtTz+AHxMnMbJVIbNejHRgIsU6RdaENvTxx6IuYdh0xZo9CFMww5Me9OBpUoVoaKJn4pRip98/cSTuyTiOL4AjzbmcoGeu1xd7zzQcg9mJEJ72LU6AshGOM3ZLz0EAzZjOvOlH5ao=', '2020-08-17'),
(16, 'user5', '1', '1', '1', 'user5', 1, 1, '295ade885858bbc493d73c826294befef5c4e5510de97f07a0a469b76dfe0c3e5ae32a53e729a5d4f8224cd911c89640c1324c6a76dfea63a6a41450f5f87c19', '8MXiv8WaAMcg/5KbHqD3E5W1VWp5/bCvlrlKOHOcgxal7RWC8dUJD1VzxHfuyL/1+QpB32CLzF32nlX7S2+smnXQrYs+Y2LMk0GgfuWozuNCZ4bNs7jdIXAEV3Cklz9BQsNDfJIp0q/k3g0pjv929ypbHG7z0lyG99c/O9KGxjQ=', '2020-08-28'),
(17, '1', '1', '1', '1', '1', 1, 1, '51bd17cc0da9bd83f5138b55109081d582ba8f7c420e22946971eb4c0518dd871442119deca9c4762280e763fdeaa9803ab1dd9e500dec3f6c06ed9fd9e1f63a', '5gAYOh1Oq4zxC+22ovzu9/GCyRuBFLNH1dxO8X9l+g6bwzFPiw+DXY0ycq23II63JmCua96ikJKIyTmZ0C24aQZr6RdKIvavS9NxeCuRKzPPclyQE37eJfz7NvKeAl+9Wso2QcQgfLSZkvZb8LFFawEiy9k+1FJTI0CdA7MaHt4=', '2020-09-17'),
(18, '1', '1', '1', '1', '5', 1, 1, '03c71750449f95fac3365b8941e55b1ac98788ed1277e5dab1aceb9dd34b589842148617b2a28154df81e9de7edb63e4328de38443fc75e385e2e3fb9d8cbe4f', '9Wy+dqrd5NC+zPVOwECwz8PUi8yqCY7pyY3OOv3PHC84KQfpbaLcH4aC8ilk1pj4zeykuWm23udnma9gI/uDRfqhQG1luqVQeppCLHJJ1ik6iDG+TmovT4U4Qb4NoavBzB18vMX0eio86JiyHuup3f0u7Mzi9N2sqxZ71xbDxi0=', '2020-09-17');

-- --------------------------------------------------------

--
-- Table structure for table `users_objectives`
--

CREATE TABLE `users_objectives` (
  `UsersObectivesId` int NOT NULL,
  `UserId` int NOT NULL,
  `ObjectiveId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_access_privileges`
--

CREATE TABLE `user_access_privileges` (
  `UserAccessPrivilegeId` int NOT NULL,
  `UserId` int NOT NULL,
  `UserRoleId` int NOT NULL,
  `AccessPrivilegeId` int NOT NULL,
  `PermissionStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_access_privileges`
--

INSERT INTO `user_access_privileges` (`UserAccessPrivilegeId`, `UserId`, `UserRoleId`, `AccessPrivilegeId`, `PermissionStatus`) VALUES
(15, 14, 8, 1, 0),
(17, 15, 9, 1, 0),
(19, 16, 10, 1, 0),
(21, 17, 11, 1, 0),
(22, 18, 12, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `UserRoleId` int NOT NULL,
  `UserId` int NOT NULL,
  `RoleId` int NOT NULL,
  `ConfirmationStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`UserRoleId`, `UserId`, `RoleId`, `ConfirmationStatus`) VALUES
(8, 14, 1, 0),
(9, 15, 1, 0),
(10, 16, 1, 0),
(11, 17, 1, 0),
(12, 18, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_session_activities`
--

CREATE TABLE `user_session_activities` (
  `UserSessionActivityId` int NOT NULL,
  `SessionLogId` int NOT NULL,
  `SessionActivityId` int NOT NULL,
  `SessionActivityDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_session_activities`
--

INSERT INTO `user_session_activities` (`UserSessionActivityId`, `SessionLogId`, `SessionActivityId`, `SessionActivityDate`) VALUES
(1, 43, 1, '2020-09-06 21:00:38'),
(2, 44, 1, '2020-09-06 21:09:21'),
(3, 45, 1, '2020-09-11 19:21:09'),
(4, 46, 1, '2020-09-14 18:24:18'),
(5, 47, 1, '2020-09-14 18:24:55'),
(6, 48, 1, '2020-09-14 18:24:57'),
(7, 49, 1, '2020-09-14 18:25:22'),
(8, 50, 1, '2020-09-14 18:25:36'),
(9, 51, 1, '2020-09-14 18:28:45'),
(10, 52, 1, '2020-09-14 18:29:58'),
(11, 53, 1, '2020-09-14 18:30:28'),
(12, 54, 1, '2020-09-14 18:32:54'),
(13, 55, 1, '2020-09-17 15:01:29'),
(14, 56, 1, '2020-09-17 15:16:50'),
(15, 57, 1, '2020-09-17 15:17:54'),
(16, 58, 1, '2020-09-18 17:43:06'),
(17, 59, 1, '2020-09-19 18:27:40'),
(18, 60, 1, '2020-09-19 18:29:39'),
(19, 61, 1, '2020-09-19 18:33:18'),
(20, 62, 1, '2020-09-19 18:37:02'),
(21, 63, 1, '2020-09-19 18:38:32'),
(22, 64, 1, '2020-09-19 18:39:01'),
(23, 65, 1, '2020-09-19 18:41:53'),
(24, 66, 1, '2020-09-19 18:44:31'),
(25, 67, 1, '2020-09-19 18:45:18'),
(26, 68, 1, '2020-09-19 18:47:43'),
(27, 69, 1, '2020-09-19 18:48:45'),
(28, 70, 1, '2020-09-19 18:55:28'),
(29, 71, 1, '2020-09-19 19:00:20'),
(30, 72, 1, '2020-09-19 19:04:27'),
(31, 73, 1, '2020-09-19 19:43:51'),
(32, 74, 1, '2020-09-19 19:44:44'),
(33, 75, 1, '2020-09-19 19:45:39'),
(34, 76, 1, '2020-09-19 22:54:34'),
(35, 77, 1, '2020-09-19 22:56:20'),
(36, 78, 1, '2020-09-21 10:23:38'),
(37, 79, 1, '2020-09-21 12:02:45'),
(38, 80, 1, '2020-09-21 12:02:48'),
(39, 81, 1, '2020-09-29 18:42:31'),
(40, 82, 1, '2020-09-29 18:42:34'),
(41, 83, 1, '2020-09-30 19:17:36'),
(42, 84, 1, '2020-09-30 19:19:17'),
(43, 85, 1, '2020-10-01 10:00:48'),
(44, 86, 1, '2020-10-01 10:05:00'),
(45, 87, 1, '2020-10-01 17:39:55'),
(46, 88, 1, '2020-10-02 20:13:58'),
(47, 89, 1, '2020-10-06 16:27:16'),
(48, 90, 1, '2020-10-06 17:42:30'),
(49, 91, 1, '2020-10-06 17:58:53'),
(50, 92, 1, '2020-10-06 18:14:48'),
(51, 93, 1, '2020-10-06 18:49:19'),
(52, 94, 1, '2020-10-07 10:17:42'),
(53, 95, 1, '2020-10-07 19:25:58'),
(54, 96, 1, '2020-10-07 20:28:14'),
(55, 97, 1, '2020-10-07 20:29:18'),
(56, 98, 1, '2020-10-07 20:31:12'),
(57, 99, 1, '2020-10-07 20:31:34'),
(58, 100, 1, '2020-10-07 20:33:14'),
(59, 101, 1, '2020-10-07 20:36:54'),
(60, 102, 1, '2020-10-07 20:43:24'),
(61, 103, 1, '2020-10-12 13:13:59'),
(62, 104, 1, '2020-10-12 19:31:39'),
(63, 105, 1, '2020-10-12 19:45:38'),
(64, 106, 1, '2020-10-13 11:54:15'),
(65, 107, 1, '2020-10-13 13:37:01'),
(66, 108, 1, '2020-10-15 12:09:14'),
(67, 109, 1, '2020-10-15 17:54:41'),
(68, 110, 1, '2020-10-15 17:55:35'),
(69, 111, 1, '2020-10-15 18:05:46'),
(70, 112, 1, '2020-10-15 18:06:27'),
(71, 113, 1, '2020-10-15 20:57:43'),
(72, 114, 1, '2020-10-15 22:04:57'),
(73, 115, 1, '2020-10-16 11:20:37'),
(74, 116, 1, '2020-10-16 11:39:01'),
(75, 117, 1, '2020-10-16 11:43:01'),
(76, 118, 1, '2020-10-16 21:13:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_privileges`
--
ALTER TABLE `access_privileges`
  ADD PRIMARY KEY (`AccessPrivilegeId`);

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`AdministratorId`),
  ADD KEY `GenderId` (`GenderId`);

--
-- Indexes for table `administrator_access_privileges`
--
ALTER TABLE `administrator_access_privileges`
  ADD PRIMARY KEY (`AdministratorAccessPrivilegeId`);

--
-- Indexes for table `administrator_roles`
--
ALTER TABLE `administrator_roles`
  ADD PRIMARY KEY (`AdministratorRoleId`);

--
-- Indexes for table `administrator_session_activities`
--
ALTER TABLE `administrator_session_activities`
  ADD PRIMARY KEY (`AdministratorSessionActivityId`);

--
-- Indexes for table `administrator_session_logs`
--
ALTER TABLE `administrator_session_logs`
  ADD PRIMARY KEY (`AdministratorSessionLogId`),
  ADD KEY `AdministratorId` (`AdministratorId`);

--
-- Indexes for table `administrator_user_access_privileges`
--
ALTER TABLE `administrator_user_access_privileges`
  ADD PRIMARY KEY (`AdministratorUserAccessPrivilegeId`),
  ADD KEY `AdministratorId` (`AdministratorId`),
  ADD KEY `AdministratorUserRoleId` (`AdministratorUserRoleId`),
  ADD KEY `AdministratorAccessPrivilegeId` (`AdministratorAccessPrivilegeId`);

--
-- Indexes for table `administrator_user_roles`
--
ALTER TABLE `administrator_user_roles`
  ADD PRIMARY KEY (`AdministratorUserRoleId`),
  ADD KEY `AdministratorId` (`AdministratorId`),
  ADD KEY `AdministratorRoleId` (`AdministratorRoleId`);

--
-- Indexes for table `administrator_user_session_activities`
--
ALTER TABLE `administrator_user_session_activities`
  ADD PRIMARY KEY (`AdministratorUserSessionActivityId`),
  ADD KEY `AdministratorSessionLogId` (`AdministratorSessionLogId`),
  ADD KEY `AdministratorSessionActivityId` (`AdministratorSessionActivityId`);

--
-- Indexes for table `admin_session_activities`
--
ALTER TABLE `admin_session_activities`
  ADD PRIMARY KEY (`AdminSessionActivityId`);

--
-- Indexes for table `admin_session_logs`
--
ALTER TABLE `admin_session_logs`
  ADD PRIMARY KEY (`AdminSessionLogId`),
  ADD KEY `AdminId` (`AdminId`);

--
-- Indexes for table `admin_user_access_privileges`
--
ALTER TABLE `admin_user_access_privileges`
  ADD PRIMARY KEY (`AdminUserAccessPrivilegeId`),
  ADD KEY `AdminId` (`AdminId`),
  ADD KEY `AdminUserRoleId` (`AdminUserRoleId`),
  ADD KEY `AdminAccessPrivilegeId` (`AdminAccessPrivilegeId`);

--
-- Indexes for table `admin_user_roles`
--
ALTER TABLE `admin_user_roles`
  ADD PRIMARY KEY (`AdminUserRoleId`),
  ADD KEY `AdminId` (`AdminId`),
  ADD KEY `AdminRoleId` (`AdminRoleId`);

--
-- Indexes for table `admin_user_session_activities`
--
ALTER TABLE `admin_user_session_activities`
  ADD PRIMARY KEY (`AdminUserSessionActivityId`),
  ADD KEY `AdminSessionLogId` (`AdminSessionLogId`),
  ADD KEY `AdminSessionActivityId` (`AdminSessionActivityId`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`BranchId`);

--
-- Indexes for table `branch_activation`
--
ALTER TABLE `branch_activation`
  ADD PRIMARY KEY (`BranchActivationId`),
  ADD KEY `BranchId` (`BranchId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `branch_projects`
--
ALTER TABLE `branch_projects`
  ADD PRIMARY KEY (`BranchProjectId`),
  ADD KEY `BranchId` (`BranchId`),
  ADD KEY `ProjectId` (`ProjectId`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`GenderId`);

--
-- Indexes for table `objectives`
--
ALTER TABLE `objectives`
  ADD PRIMARY KEY (`ObjectiveId`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`ProjectId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `session_activities`
--
ALTER TABLE `session_activities`
  ADD PRIMARY KEY (`SessionActivityId`);

--
-- Indexes for table `session_logs`
--
ALTER TABLE `session_logs`
  ADD PRIMARY KEY (`SessionLogId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `system_admin`
--
ALTER TABLE `system_admin`
  ADD PRIMARY KEY (`AdminId`),
  ADD KEY `GenderId` (`GenderId`);

--
-- Indexes for table `system_admin_access_privileges`
--
ALTER TABLE `system_admin_access_privileges`
  ADD PRIMARY KEY (`AdminAccessPrivilegeId`);

--
-- Indexes for table `system_admin_roles`
--
ALTER TABLE `system_admin_roles`
  ADD PRIMARY KEY (`AdminRoleId`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`TeamId`);

--
-- Indexes for table `team_leaders`
--
ALTER TABLE `team_leaders`
  ADD PRIMARY KEY (`TeamLeaderId`),
  ADD KEY `TeamId` (`TeamId`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`TeamMemberId`),
  ADD KEY `TeamId` (`TeamId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `GenderId` (`GenderId`);

--
-- Indexes for table `users_objectives`
--
ALTER TABLE `users_objectives`
  ADD PRIMARY KEY (`UsersObectivesId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `ObjectiveId` (`ObjectiveId`);

--
-- Indexes for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  ADD PRIMARY KEY (`UserAccessPrivilegeId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `UserRoleId` (`UserRoleId`),
  ADD KEY `AccessPrivilegeId` (`AccessPrivilegeId`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`UserRoleId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `RoleId` (`RoleId`);

--
-- Indexes for table `user_session_activities`
--
ALTER TABLE `user_session_activities`
  ADD PRIMARY KEY (`UserSessionActivityId`),
  ADD KEY `SessionLogId` (`SessionLogId`),
  ADD KEY `SessionActivityId` (`SessionActivityId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_privileges`
--
ALTER TABLE `access_privileges`
  MODIFY `AccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `AdministratorId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `administrator_access_privileges`
--
ALTER TABLE `administrator_access_privileges`
  MODIFY `AdministratorAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `administrator_roles`
--
ALTER TABLE `administrator_roles`
  MODIFY `AdministratorRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `administrator_session_activities`
--
ALTER TABLE `administrator_session_activities`
  MODIFY `AdministratorSessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `administrator_session_logs`
--
ALTER TABLE `administrator_session_logs`
  MODIFY `AdministratorSessionLogId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `administrator_user_access_privileges`
--
ALTER TABLE `administrator_user_access_privileges`
  MODIFY `AdministratorUserAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `administrator_user_roles`
--
ALTER TABLE `administrator_user_roles`
  MODIFY `AdministratorUserRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `administrator_user_session_activities`
--
ALTER TABLE `administrator_user_session_activities`
  MODIFY `AdministratorUserSessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `admin_session_activities`
--
ALTER TABLE `admin_session_activities`
  MODIFY `AdminSessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_session_logs`
--
ALTER TABLE `admin_session_logs`
  MODIFY `AdminSessionLogId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `admin_user_access_privileges`
--
ALTER TABLE `admin_user_access_privileges`
  MODIFY `AdminUserAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_user_roles`
--
ALTER TABLE `admin_user_roles`
  MODIFY `AdminUserRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_user_session_activities`
--
ALTER TABLE `admin_user_session_activities`
  MODIFY `AdminUserSessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `BranchId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `branch_activation`
--
ALTER TABLE `branch_activation`
  MODIFY `BranchActivationId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `branch_projects`
--
ALTER TABLE `branch_projects`
  MODIFY `BranchProjectId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `GenderId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `objectives`
--
ALTER TABLE `objectives`
  MODIFY `ObjectiveId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `ProjectId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `session_activities`
--
ALTER TABLE `session_activities`
  MODIFY `SessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `session_logs`
--
ALTER TABLE `session_logs`
  MODIFY `SessionLogId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `system_admin`
--
ALTER TABLE `system_admin`
  MODIFY `AdminId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `system_admin_access_privileges`
--
ALTER TABLE `system_admin_access_privileges`
  MODIFY `AdminAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_admin_roles`
--
ALTER TABLE `system_admin_roles`
  MODIFY `AdminRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `TeamId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `team_leaders`
--
ALTER TABLE `team_leaders`
  MODIFY `TeamLeaderId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `TeamMemberId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users_objectives`
--
ALTER TABLE `users_objectives`
  MODIFY `UsersObectivesId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  MODIFY `UserAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `UserRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_session_activities`
--
ALTER TABLE `user_session_activities`
  MODIFY `UserSessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`GenderId`) REFERENCES `gender` (`GenderId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `administrator_session_logs`
--
ALTER TABLE `administrator_session_logs`
  ADD CONSTRAINT `administrator_session_logs_ibfk_1` FOREIGN KEY (`AdministratorId`) REFERENCES `administrator` (`AdministratorId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `administrator_user_access_privileges`
--
ALTER TABLE `administrator_user_access_privileges`
  ADD CONSTRAINT `administrator_user_access_privileges_ibfk_1` FOREIGN KEY (`AdministratorId`) REFERENCES `administrator` (`AdministratorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrator_user_access_privileges_ibfk_2` FOREIGN KEY (`AdministratorUserRoleId`) REFERENCES `administrator_user_roles` (`AdministratorUserRoleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrator_user_access_privileges_ibfk_3` FOREIGN KEY (`AdministratorAccessPrivilegeId`) REFERENCES `administrator_access_privileges` (`AdministratorAccessPrivilegeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `administrator_user_roles`
--
ALTER TABLE `administrator_user_roles`
  ADD CONSTRAINT `administrator_user_roles_ibfk_1` FOREIGN KEY (`AdministratorId`) REFERENCES `administrator` (`AdministratorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrator_user_roles_ibfk_2` FOREIGN KEY (`AdministratorRoleId`) REFERENCES `administrator_roles` (`AdministratorRoleId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `administrator_user_session_activities`
--
ALTER TABLE `administrator_user_session_activities`
  ADD CONSTRAINT `administrator_user_session_activities_ibfk_1` FOREIGN KEY (`AdministratorSessionLogId`) REFERENCES `administrator_session_logs` (`AdministratorSessionLogId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administrator_user_session_activities_ibfk_2` FOREIGN KEY (`AdministratorSessionActivityId`) REFERENCES `administrator_session_activities` (`AdministratorSessionActivityId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin_session_logs`
--
ALTER TABLE `admin_session_logs`
  ADD CONSTRAINT `admin_session_logs_ibfk_1` FOREIGN KEY (`AdminId`) REFERENCES `system_admin` (`AdminId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin_user_access_privileges`
--
ALTER TABLE `admin_user_access_privileges`
  ADD CONSTRAINT `admin_user_access_privileges_ibfk_1` FOREIGN KEY (`AdminId`) REFERENCES `system_admin` (`AdminId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_user_access_privileges_ibfk_2` FOREIGN KEY (`AdminUserRoleId`) REFERENCES `admin_user_roles` (`AdminUserRoleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_user_access_privileges_ibfk_3` FOREIGN KEY (`AdminAccessPrivilegeId`) REFERENCES `system_admin_access_privileges` (`AdminAccessPrivilegeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin_user_roles`
--
ALTER TABLE `admin_user_roles`
  ADD CONSTRAINT `admin_user_roles_ibfk_1` FOREIGN KEY (`AdminId`) REFERENCES `system_admin` (`AdminId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_user_roles_ibfk_2` FOREIGN KEY (`AdminRoleId`) REFERENCES `system_admin_roles` (`AdminRoleId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin_user_session_activities`
--
ALTER TABLE `admin_user_session_activities`
  ADD CONSTRAINT `admin_user_session_activities_ibfk_1` FOREIGN KEY (`AdminSessionLogId`) REFERENCES `admin_session_logs` (`AdminSessionLogId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_user_session_activities_ibfk_2` FOREIGN KEY (`AdminSessionActivityId`) REFERENCES `admin_session_activities` (`AdminSessionActivityId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_activation`
--
ALTER TABLE `branch_activation`
  ADD CONSTRAINT `branch_activation_ibfk_1` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`BranchId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_activation_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_projects`
--
ALTER TABLE `branch_projects`
  ADD CONSTRAINT `branch_projects_ibfk_1` FOREIGN KEY (`BranchId`) REFERENCES `branches` (`BranchId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_projects_ibfk_2` FOREIGN KEY (`ProjectId`) REFERENCES `projects` (`ProjectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session_logs`
--
ALTER TABLE `session_logs`
  ADD CONSTRAINT `session_logs_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `system_admin`
--
ALTER TABLE `system_admin`
  ADD CONSTRAINT `system_admin_ibfk_1` FOREIGN KEY (`GenderId`) REFERENCES `gender` (`GenderId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_leaders`
--
ALTER TABLE `team_leaders`
  ADD CONSTRAINT `team_leaders_ibfk_1` FOREIGN KEY (`TeamId`) REFERENCES `teams` (`TeamId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_members`
--
ALTER TABLE `team_members`
  ADD CONSTRAINT `team_members_ibfk_1` FOREIGN KEY (`TeamId`) REFERENCES `teams` (`TeamId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`GenderId`) REFERENCES `gender` (`GenderId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_objectives`
--
ALTER TABLE `users_objectives`
  ADD CONSTRAINT `users_objectives_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`),
  ADD CONSTRAINT `users_objectives_ibfk_2` FOREIGN KEY (`ObjectiveId`) REFERENCES `objectives` (`ObjectiveId`);

--
-- Constraints for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  ADD CONSTRAINT `user_access_privileges_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_access_privileges_ibfk_2` FOREIGN KEY (`UserRoleId`) REFERENCES `user_roles` (`UserRoleId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_access_privileges_ibfk_3` FOREIGN KEY (`AccessPrivilegeId`) REFERENCES `access_privileges` (`AccessPrivilegeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`RoleId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_session_activities`
--
ALTER TABLE `user_session_activities`
  ADD CONSTRAINT `user_session_activities_ibfk_1` FOREIGN KEY (`SessionLogId`) REFERENCES `session_logs` (`SessionLogId`),
  ADD CONSTRAINT `user_session_activities_ibfk_2` FOREIGN KEY (`SessionActivityId`) REFERENCES `session_activities` (`SessionActivityId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
