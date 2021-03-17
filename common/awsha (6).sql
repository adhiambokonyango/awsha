-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 17, 2021 at 04:45 PM
-- Server version: 8.0.22-0ubuntu0.20.04.3
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
(8, 'Trezer', '1', 'Konyango', '1', 'supervisor', 1, 1, 'e8185f6db82f4c4a00834451449dc3283a0e0ccc0f37ad688af67e3c3b108a521f36d0820b972093d13a9996715f28e0acbb7c230e22ce879dfea23e038e0ec0', 'WZUgb6EGIAxNzMUwDpGIrm+EUMJeuLZndxeKUn0I8OhYcVmg2ax5wiTYs/Q0bDKjp0gLLTZjTXH8HhAfp+LYusE/pJUdmLGyp/15EsyM8HVlKLPb18HZ8omiw4+yVrw84Oy7Kcpftol3aTBqsdVl145jYVKyhDGU7e+Sxg8quM8=', '2020-09-20'),
(9, 'peter', '1', 'kimemia', '1', 'lead', 1, 1, '83cd9d7c6ace84c9588b9fb4c219be8471714a2173cd9177d01ecdeb96e26bb00a789c388fb639139de1ef71666042bc15faba4606da9b84116199edb08620e0', 'dVNBCO0yiy+ORv1g3zNG1sIeoThDJykUC0UQNXJgXAg5tiaoyfr+xw6eKMasXGjHGDp6NH6qfyksSF2ZFiDxvEOsuSGcVsIpokL0mQKmXV3AGPd3QuJPTh/htOzq01V/r2YDhWbYqBXmbImj9DpLTduAFbnnATdLF2AFbxvC89A=', '2020-10-25'),
(10, 'mary', 'adhiambo', 'konyango', '1', '1', 2, 1, '1', '1', '2021-01-20');

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
(53, 8, '2020-10-16', '2020-10-16'),
(54, 8, '2020-10-18', '2020-10-18'),
(55, 8, '2020-10-18', '2020-10-18'),
(56, 8, '2020-10-21', '2020-10-21'),
(57, 8, '2020-10-22', '2020-10-22'),
(58, 8, '2020-10-23', '2020-10-23'),
(59, 8, '2020-10-23', '2020-10-23'),
(60, 8, '2020-10-23', '2020-10-23'),
(61, 8, '2020-10-23', '2020-10-23'),
(62, 8, '2020-10-23', '2020-10-23'),
(63, 8, '2020-10-24', '2020-10-24'),
(64, 8, '2020-10-24', '2020-10-24'),
(65, 8, '2020-10-25', '2020-10-25'),
(66, 8, '2020-10-25', '2020-10-25'),
(67, 8, '2020-10-25', '2020-10-25'),
(68, 8, '2020-10-25', '2020-10-25'),
(69, 8, '2020-10-26', '2020-10-26'),
(70, 8, '2020-10-26', '2020-10-26'),
(71, 8, '2020-10-26', '2020-10-26'),
(72, 8, '2020-10-27', '2020-10-27'),
(73, 8, '2020-10-27', '2020-10-27'),
(74, 8, '2020-10-27', '2020-10-27'),
(75, 8, '2020-10-27', '2020-10-27'),
(76, 8, '2020-10-27', '2020-10-27'),
(77, 8, '2020-10-27', '2020-10-27'),
(78, 8, '2020-10-27', '2020-10-27'),
(79, 8, '2020-10-27', '2020-10-27'),
(80, 9, '2020-10-27', '2020-10-27'),
(81, 8, '2020-10-27', '2020-10-27'),
(82, 8, '2020-10-27', '2020-10-27'),
(83, 8, '2020-10-27', '2020-10-27'),
(84, 8, '2020-10-27', '2020-10-27'),
(85, 8, '2020-10-27', '2020-10-27'),
(86, 8, '2020-10-27', '2020-10-27'),
(87, 8, '2020-10-27', '2020-10-27'),
(88, 8, '2020-10-27', '2020-10-27'),
(89, 9, '2020-10-27', '2020-10-27'),
(90, 8, '2020-10-27', '2020-10-27'),
(91, 8, '2020-10-27', '2020-10-27'),
(92, 8, '2020-10-27', '2020-10-27'),
(93, 8, '2020-10-27', '2020-10-27'),
(94, 8, '2020-10-28', '2020-10-28'),
(95, 9, '2020-10-28', '2020-10-28'),
(96, 9, '2020-10-28', '2020-10-28'),
(97, 8, '2020-10-28', '2020-10-28'),
(98, 9, '2020-10-28', '2020-10-28'),
(99, 8, '2020-10-28', '2020-10-28'),
(100, 9, '2020-10-28', '2020-10-28'),
(101, 9, '2020-10-28', '2020-10-28'),
(102, 9, '2020-10-28', '2020-10-28'),
(103, 8, '2020-10-28', '2020-10-28'),
(104, 9, '2020-10-28', '2020-10-28'),
(105, 9, '2020-10-28', '2020-10-28'),
(106, 9, '2020-10-28', '2020-10-28'),
(107, 8, '2020-10-28', '2020-10-28'),
(108, 8, '2020-10-28', '2020-10-28'),
(109, 8, '2020-10-28', '2020-10-28'),
(110, 8, '2020-10-28', '2020-10-28'),
(111, 8, '2020-10-28', '2020-10-28'),
(112, 8, '2020-10-29', '2020-10-29'),
(113, 8, '2020-10-29', '2020-10-29'),
(114, 8, '2020-10-30', '2020-10-30'),
(115, 8, '2020-10-30', '2020-10-30'),
(116, 8, '2020-10-30', '2020-10-30'),
(117, 8, '2020-10-30', '2020-10-30'),
(118, 8, '2020-10-30', '2020-10-30'),
(119, 8, '2020-10-30', '2020-10-30'),
(120, 8, '2020-10-30', '2020-10-30'),
(121, 8, '2020-10-30', '2020-10-30'),
(122, 8, '2020-10-31', '2020-10-31'),
(123, 8, '2020-10-31', '2020-10-31'),
(124, 8, '2020-10-31', '2020-10-31'),
(125, 8, '2020-10-31', '2020-10-31'),
(126, 8, '2020-12-16', '2020-12-16');

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
(7, 8, 10, 2, 1),
(8, 9, 11, 1, 0),
(9, 9, 11, 2, 0);

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
(10, 8, 1, 0),
(11, 9, 1, 0);

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
(53, 53, 1, '2020-10-16'),
(54, 54, 1, '2020-10-18'),
(55, 55, 1, '2020-10-18'),
(56, 56, 1, '2020-10-21'),
(57, 57, 1, '2020-10-22'),
(58, 58, 1, '2020-10-23'),
(59, 59, 1, '2020-10-23'),
(60, 60, 1, '2020-10-23'),
(61, 61, 1, '2020-10-23'),
(62, 62, 1, '2020-10-23'),
(63, 63, 1, '2020-10-24'),
(64, 64, 1, '2020-10-24'),
(65, 65, 1, '2020-10-25'),
(66, 66, 1, '2020-10-25'),
(67, 67, 1, '2020-10-25'),
(68, 68, 1, '2020-10-25'),
(69, 69, 1, '2020-10-26'),
(70, 70, 1, '2020-10-26'),
(71, 71, 1, '2020-10-26'),
(72, 72, 1, '2020-10-27'),
(73, 73, 1, '2020-10-27'),
(74, 74, 1, '2020-10-27'),
(75, 75, 1, '2020-10-27'),
(76, 76, 1, '2020-10-27'),
(77, 77, 1, '2020-10-27'),
(78, 78, 1, '2020-10-27'),
(79, 79, 1, '2020-10-27'),
(80, 80, 1, '2020-10-27'),
(81, 81, 1, '2020-10-27'),
(82, 82, 1, '2020-10-27'),
(83, 83, 1, '2020-10-27'),
(84, 84, 1, '2020-10-27'),
(85, 85, 1, '2020-10-27'),
(86, 86, 1, '2020-10-27'),
(87, 87, 1, '2020-10-27'),
(88, 88, 1, '2020-10-27'),
(89, 89, 1, '2020-10-27'),
(90, 90, 1, '2020-10-27'),
(91, 91, 1, '2020-10-27'),
(92, 92, 1, '2020-10-27'),
(93, 93, 1, '2020-10-27'),
(94, 94, 1, '2020-10-28'),
(95, 95, 1, '2020-10-28'),
(96, 96, 1, '2020-10-28'),
(97, 97, 1, '2020-10-28'),
(98, 98, 1, '2020-10-28'),
(99, 99, 1, '2020-10-28'),
(100, 100, 1, '2020-10-28'),
(101, 101, 1, '2020-10-28'),
(102, 102, 1, '2020-10-28'),
(103, 103, 1, '2020-10-28'),
(104, 104, 1, '2020-10-28'),
(105, 105, 1, '2020-10-28'),
(106, 106, 1, '2020-10-28'),
(107, 107, 1, '2020-10-28'),
(108, 108, 1, '2020-10-28'),
(109, 109, 1, '2020-10-28'),
(110, 110, 1, '2020-10-28'),
(111, 111, 1, '2020-10-28'),
(112, 112, 1, '2020-10-29'),
(113, 113, 1, '2020-10-29'),
(114, 114, 1, '2020-10-30'),
(115, 115, 1, '2020-10-30'),
(116, 116, 1, '2020-10-30'),
(117, 117, 1, '2020-10-30'),
(118, 118, 1, '2020-10-30'),
(119, 119, 1, '2020-10-30'),
(120, 120, 1, '2020-10-30'),
(121, 121, 1, '2020-10-30'),
(122, 122, 1, '2020-10-31'),
(123, 123, 1, '2020-10-31'),
(124, 124, 1, '2020-10-31'),
(125, 125, 1, '2020-10-31'),
(126, 126, 1, '2020-12-16');

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
(194, 9, '2020-10-15 20:56:34', '2020-10-15 20:56:34'),
(195, 9, '2020-10-21 20:20:59', '2020-10-21 20:20:59'),
(196, 9, '2020-10-21 20:21:55', '2020-10-21 20:21:55'),
(197, 9, '2020-10-22 23:40:05', '2020-10-22 23:40:05'),
(198, 9, '2020-10-22 23:49:51', '2020-10-22 23:49:51'),
(199, 9, '2020-10-22 23:51:58', '2020-10-22 23:51:58'),
(200, 9, '2020-10-22 23:53:03', '2020-10-22 23:53:03'),
(201, 9, '2020-10-23 12:08:30', '2020-10-23 12:08:30'),
(202, 9, '2020-10-24 23:31:23', '2020-10-24 23:31:23'),
(203, 9, '2020-10-25 00:35:13', '2020-10-25 00:35:13'),
(204, 9, '2020-10-27 11:39:54', '2020-10-27 11:39:54'),
(205, 9, '2020-10-27 11:42:19', '2020-10-27 11:42:19'),
(206, 9, '2020-10-27 11:48:39', '2020-10-27 11:48:39'),
(207, 9, '2020-10-27 11:57:43', '2020-10-27 11:57:43'),
(208, 9, '2020-10-27 12:15:02', '2020-10-27 12:15:02'),
(209, 9, '2020-10-27 12:23:18', '2020-10-27 12:23:18'),
(210, 9, '2020-10-27 12:24:37', '2020-10-27 12:24:37'),
(211, 9, '2020-10-27 12:39:00', '2020-10-27 12:39:00'),
(212, 9, '2020-10-27 12:42:26', '2020-10-27 12:42:26'),
(213, 9, '2020-10-27 12:51:00', '2020-10-27 12:51:00'),
(214, 9, '2020-10-27 12:54:52', '2020-10-27 12:54:52'),
(215, 9, '2020-10-27 12:55:55', '2020-10-27 12:55:55'),
(216, 9, '2020-10-27 13:22:49', '2020-10-27 13:22:49'),
(217, 9, '2020-10-28 12:35:45', '2020-10-28 12:35:45'),
(218, 9, '2020-10-28 12:36:11', '2020-10-28 12:36:11'),
(219, 9, '2020-10-28 12:45:47', '2020-10-28 12:45:47'),
(220, 9, '2020-10-28 12:45:52', '2020-10-28 12:45:52'),
(221, 9, '2020-10-28 12:46:06', '2020-10-28 12:46:06'),
(222, 9, '2020-10-28 12:46:58', '2020-10-28 12:46:58'),
(223, 9, '2020-10-28 12:47:47', '2020-10-28 12:47:47'),
(224, 9, '2020-10-28 12:49:00', '2020-10-28 12:49:00'),
(225, 9, '2020-10-28 12:56:09', '2020-10-28 12:56:09'),
(226, 9, '2020-10-28 12:57:32', '2020-10-28 12:57:32'),
(227, 9, '2020-10-28 13:00:37', '2020-10-28 13:00:37'),
(228, 9, '2020-10-28 14:38:53', '2020-10-28 14:38:53'),
(229, 9, '2020-10-28 14:44:36', '2020-10-28 14:44:36'),
(230, 9, '2020-10-28 15:11:58', '2020-10-28 15:11:58'),
(231, 9, '2020-10-28 16:18:03', '2020-10-28 16:18:03'),
(232, 9, '2020-10-29 15:57:08', '2020-10-29 15:57:08'),
(233, 9, '2020-10-30 14:40:30', '2020-10-30 14:40:30'),
(234, 9, '2020-10-31 12:36:39', '2020-10-31 12:36:39'),
(235, 9, '2020-12-16 13:37:32', '2020-12-16 13:37:32'),
(236, 9, '2020-12-16 13:38:27', '2020-12-16 13:38:27'),
(237, 9, '2020-12-16 13:45:53', '2020-12-16 13:45:53'),
(238, 9, '2020-12-16 13:53:27', '2020-12-16 13:53:27'),
(239, 9, '2020-12-16 14:04:35', '2020-12-16 14:04:35'),
(240, 9, '2020-12-16 14:07:58', '2020-12-16 14:07:58'),
(241, 9, '2020-12-16 20:26:25', '2020-12-16 20:26:25'),
(242, 9, '2020-12-21 08:50:50', '2020-12-21 08:50:50'),
(243, 9, '2021-01-09 13:42:16', '2021-01-09 13:42:16'),
(244, 9, '2021-01-09 13:42:16', '2021-01-09 13:42:16'),
(245, 9, '2021-01-09 13:43:03', '2021-01-09 13:43:03'),
(246, 9, '2021-01-09 15:08:53', '2021-01-09 15:08:53'),
(247, 9, '2021-01-09 15:11:35', '2021-01-09 15:11:35'),
(248, 9, '2021-01-09 16:42:44', '2021-01-09 16:42:44'),
(249, 9, '2021-01-09 19:46:10', '2021-01-09 19:46:10'),
(250, 9, '2021-01-09 19:46:33', '2021-01-09 19:46:33'),
(251, 9, '2021-01-09 19:47:05', '2021-01-09 19:47:05'),
(252, 9, '2021-01-09 19:47:29', '2021-01-09 19:47:29'),
(253, 9, '2021-01-09 19:47:41', '2021-01-09 19:47:41'),
(254, 9, '2021-01-09 19:48:14', '2021-01-09 19:48:14'),
(255, 9, '2021-01-10 13:53:51', '2021-01-10 13:53:51'),
(256, 9, '2021-01-10 13:57:21', '2021-01-10 13:57:21'),
(257, 9, '2021-01-10 14:05:14', '2021-01-10 14:05:14'),
(258, 9, '2021-01-10 14:34:25', '2021-01-10 14:34:25'),
(259, 9, '2021-01-10 14:35:51', '2021-01-10 14:35:51'),
(260, 9, '2021-01-10 17:17:50', '2021-01-10 17:17:50'),
(261, 9, '2021-01-10 17:18:54', '2021-01-10 17:18:54'),
(262, 9, '2021-01-10 17:33:42', '2021-01-10 17:33:42'),
(263, 9, '2021-01-10 17:55:58', '2021-01-10 17:55:58'),
(264, 9, '2021-01-10 17:56:21', '2021-01-10 17:56:21');

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
(194, 194, 1, '2020-10-15'),
(195, 195, 1, '2020-10-21'),
(196, 196, 1, '2020-10-21'),
(197, 197, 1, '2020-10-22'),
(198, 198, 1, '2020-10-22'),
(199, 199, 1, '2020-10-22'),
(200, 200, 1, '2020-10-22'),
(201, 201, 1, '2020-10-23'),
(202, 202, 1, '2020-10-24'),
(203, 203, 1, '2020-10-25'),
(204, 204, 1, '2020-10-27'),
(205, 205, 1, '2020-10-27'),
(206, 206, 1, '2020-10-27'),
(207, 207, 1, '2020-10-27'),
(208, 208, 1, '2020-10-27'),
(209, 209, 1, '2020-10-27'),
(210, 210, 1, '2020-10-27'),
(211, 211, 1, '2020-10-27'),
(212, 212, 1, '2020-10-27'),
(213, 213, 1, '2020-10-27'),
(214, 214, 1, '2020-10-27'),
(215, 215, 1, '2020-10-27'),
(216, 216, 1, '2020-10-27'),
(217, 217, 1, '2020-10-28'),
(218, 218, 1, '2020-10-28'),
(219, 219, 1, '2020-10-28'),
(220, 220, 1, '2020-10-28'),
(221, 221, 1, '2020-10-28'),
(222, 222, 1, '2020-10-28'),
(223, 223, 1, '2020-10-28'),
(224, 224, 1, '2020-10-28'),
(225, 225, 1, '2020-10-28'),
(226, 226, 1, '2020-10-28'),
(227, 227, 1, '2020-10-28'),
(228, 228, 1, '2020-10-28'),
(229, 229, 1, '2020-10-28'),
(230, 230, 1, '2020-10-28'),
(231, 231, 1, '2020-10-28'),
(232, 232, 1, '2020-10-29'),
(233, 233, 1, '2020-10-30'),
(234, 234, 1, '2020-10-31'),
(235, 235, 1, '2020-12-16'),
(236, 236, 1, '2020-12-16'),
(237, 237, 1, '2020-12-16'),
(238, 238, 1, '2020-12-16'),
(239, 239, 1, '2020-12-16'),
(240, 240, 1, '2020-12-16'),
(241, 241, 1, '2020-12-16'),
(242, 242, 1, '2020-12-21'),
(243, 244, 1, '2021-01-09'),
(244, 243, 1, '2021-01-09'),
(245, 245, 1, '2021-01-09'),
(246, 246, 1, '2021-01-09'),
(247, 247, 1, '2021-01-09'),
(248, 248, 1, '2021-01-09'),
(249, 249, 1, '2021-01-09'),
(250, 250, 1, '2021-01-09'),
(251, 251, 1, '2021-01-09'),
(252, 252, 1, '2021-01-09'),
(253, 253, 1, '2021-01-09'),
(254, 254, 1, '2021-01-09'),
(255, 255, 1, '2021-01-10'),
(256, 256, 1, '2021-01-10'),
(257, 257, 1, '2021-01-10'),
(258, 258, 1, '2021-01-10'),
(259, 259, 1, '2021-01-10'),
(260, 260, 1, '2021-01-10'),
(261, 261, 1, '2021-01-10'),
(262, 262, 1, '2021-01-10'),
(263, 263, 1, '2021-01-10'),
(264, 264, 1, '2021-01-10');

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
(11, 1, 23, 0),
(12, 2, 23, 0),
(41, 1, 38, 0),
(42, 2, 38, 0),
(43, 1, 39, 0),
(44, 2, 39, 0),
(45, 1, 40, 0),
(46, 2, 40, 0),
(47, 1, 41, 0),
(48, 2, 41, 0),
(49, 1, 42, 0),
(50, 2, 42, 0),
(51, 1, 43, 0),
(52, 2, 43, 0),
(53, 1, 44, 0),
(54, 2, 44, 0),
(55, 1, 45, 0),
(56, 2, 45, 0),
(57, 1, 46, 0),
(58, 2, 46, 0),
(59, 1, 47, 0),
(60, 2, 47, 0);

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
-- Table structure for table `catalogue_items`
--

CREATE TABLE `catalogue_items` (
  `CatalogueItemId` int NOT NULL,
  `ProductId` int NOT NULL,
  `LotId` int NOT NULL,
  `UserId` int NOT NULL,
  `Code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Status` int NOT NULL,
  `ExpiryStatus` int NOT NULL,
  `RegisteredDate` datetime NOT NULL,
  `Counter` int NOT NULL,
  `HasManyItems` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(1, 'male'),
(2, 'female');

-- --------------------------------------------------------

--
-- Table structure for table `lots`
--

CREATE TABLE `lots` (
  `LotId` int NOT NULL,
  `ProductId` int NOT NULL,
  `UserId` int NOT NULL,
  `RegisteredDate` date NOT NULL,
  `ExpiryDate` date NOT NULL,
  `ItemCount` int NOT NULL,
  `ExpiredItemCount` int NOT NULL,
  `Expired` int NOT NULL,
  `CountOfCheckedOutItems` int NOT NULL,
  `Depleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lots`
--

INSERT INTO `lots` (`LotId`, `ProductId`, `UserId`, `RegisteredDate`, `ExpiryDate`, `ItemCount`, `ExpiredItemCount`, `Expired`, `CountOfCheckedOutItems`, `Depleted`) VALUES
(149, 51, 45, '2021-03-17', '2021-03-17', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lot_item`
--

CREATE TABLE `lot_item` (
  `LotItemId` int NOT NULL,
  `LotId` int NOT NULL,
  `CatalogueItemId` int NOT NULL,
  `ExpiryStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_users`
--

CREATE TABLE `mobile_users` (
  `UserId` int NOT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `Surname` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mobile_users`
--

INSERT INTO `mobile_users` (`UserId`, `FirstName`, `MiddleName`, `Surname`, `Email`) VALUES
(9, 'e', 'e', 'e', 'e'),
(10, 'e', 'e', 'e', 'e'),
(11, 'd', 'd', 'd', 'd'),
(12, 'mary', 'g', 'g', 'e'),
(13, 'h', 'h', 'h', 'h'),
(14, NULL, NULL, NULL, NULL);

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
(8, 44, 'fetch reset', 20, 1),
(9, 56, 'final objective test', 45, 0),
(10, 46, 'Response Find', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductId` int NOT NULL,
  `UserId` int NOT NULL,
  `ProductName` varchar(200) NOT NULL,
  `Price` int NOT NULL,
  `InStock` int NOT NULL,
  `CheckedOut` int NOT NULL,
  `BuyingPrice` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductId`, `UserId`, `ProductName`, `Price`, `InStock`, `CheckedOut`, `BuyingPrice`) VALUES
(3, 46, 'black pepper ', 70, 0, 0, 60),
(5, 46, 'tuzo', 50, 0, 0, 45),
(6, 45, 'sheen', 70, 2, 0, 50),
(8, 45, 'turmeric ', 20, 0, 1, 15),
(9, 47, 'chocolate ', 70, 0, 0, 67),
(10, 45, 'cocacola', 30, 1, 4, 25),
(32, 45, 'vaseline ', 50, 2, 1, 35),
(43, 45, 'cocoa ', 70, 0, 0, 65),
(51, 45, 'cocoa ', 70, 1, 0, 65);

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
(44, 'test project', 'This product targets project management in government institutions.\r\n                                  Enables quick analysis of project progress.Modules available in this\r\n                                  project include.', 30),
(46, 'response', 'This product targets project management in government institutions.\r\n                                  Enables quick analysis of project progress.Modules available in this\r\n                                  project include.', 60),
(56, 'Final Test', 'This product targets project management in government institutions.\r\n                                  Enables quick analysis of project progress.Modules available in this\r\n                                  project include.', 20);

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
-- Table structure for table `scan`
--

CREATE TABLE `scan` (
  `id` int NOT NULL,
  `code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `scan`
--

INSERT INTO `scan` (`id`, `code`) VALUES
(1, '6166000146439'),
(2, '6902176035098'),
(3, '867738030437690'),
(4, '6902176035098'),
(5, '320895328992'),
(6, '6902176035098'),
(7, '6902176035098'),
(8, '6902176035098'),
(9, '6902176035098'),
(10, '6902176035098'),
(11, '6902176035098'),
(12, '6902176035098'),
(13, '6161100600157'),
(14, '6161100600157'),
(15, '02322193');

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
(118, 17, '2020-10-16 21:13:52', '2020-10-16 21:13:52'),
(119, 17, '2020-10-18 10:01:09', '2020-10-18 10:01:09'),
(122, 14, '2020-10-21 20:21:38', '2020-10-21 20:21:38'),
(123, 14, '2020-10-21 20:21:41', '2020-10-21 20:21:41'),
(124, 14, '2020-10-27 11:41:34', '2020-10-27 11:41:34'),
(125, 14, '2020-10-27 11:44:07', '2020-10-27 11:44:07'),
(126, 14, '2020-10-27 12:14:42', '2020-10-27 12:14:42'),
(129, 14, '2020-10-28 12:57:05', '2020-10-28 12:57:05'),
(130, 14, '2020-10-28 12:57:08', '2020-10-28 12:57:08'),
(131, 14, '2020-10-28 12:57:21', '2020-10-28 12:57:21'),
(133, 14, '2020-10-28 12:59:17', '2020-10-28 12:59:17'),
(134, 14, '2020-10-28 13:01:06', '2020-10-28 13:01:06'),
(135, 14, '2020-10-28 13:01:09', '2020-10-28 13:01:09'),
(136, 14, '2020-10-28 13:01:16', '2020-10-28 13:01:16'),
(137, 14, '2020-10-28 13:01:37', '2020-10-28 13:01:37'),
(138, 14, '2020-10-28 14:38:40', '2020-10-28 14:38:40'),
(139, 14, '2020-10-28 14:38:44', '2020-10-28 14:38:44'),
(140, 14, '2020-10-28 14:39:24', '2020-10-28 14:39:24'),
(143, 14, '2020-10-28 14:43:49', '2020-10-28 14:43:49'),
(144, 14, '2020-10-28 14:43:52', '2020-10-28 14:43:52'),
(146, 14, '2020-10-28 15:09:08', '2020-10-28 15:09:08'),
(148, 14, '2021-01-14 16:36:55', '2021-01-14 16:36:55'),
(149, 14, '2021-01-14 16:56:23', '2021-01-14 16:56:23'),
(150, 14, '2021-01-14 18:21:28', '2021-01-14 18:21:28'),
(151, 14, '2021-01-14 18:27:05', '2021-01-14 18:27:05'),
(152, 14, '2021-01-14 18:41:42', '2021-01-14 18:41:42'),
(153, 14, '2021-01-14 18:43:30', '2021-01-14 18:43:30'),
(154, 14, '2021-01-14 19:00:33', '2021-01-14 19:00:33'),
(155, 14, '2021-01-14 19:00:33', '2021-01-14 19:00:33'),
(156, 14, '2021-01-14 19:05:07', '2021-01-14 19:05:07'),
(157, 14, '2021-01-14 19:05:07', '2021-01-14 19:05:07'),
(158, 14, '2021-01-14 20:22:52', '2021-01-14 20:22:52'),
(159, 14, '2021-01-14 20:24:17', '2021-01-14 20:24:17'),
(160, 14, '2021-01-14 22:01:19', '2021-01-14 22:01:19'),
(161, 14, '2021-01-25 15:53:36', '2021-01-25 15:53:36'),
(162, 14, '2021-01-25 15:53:53', '2021-01-25 15:53:53'),
(163, 14, '2021-01-25 15:54:39', '2021-01-25 15:54:39'),
(164, 14, '2021-01-25 16:00:46', '2021-01-25 16:00:46'),
(165, 14, '2021-01-25 16:03:58', '2021-01-25 16:03:58'),
(166, 14, '2021-01-25 16:04:29', '2021-01-25 16:04:29'),
(167, 14, '2021-01-25 16:26:56', '2021-01-25 16:26:56'),
(168, 14, '2021-01-25 16:33:48', '2021-01-25 16:33:48'),
(169, 14, '2021-01-25 18:24:23', '2021-01-25 18:24:23'),
(170, 14, '2021-01-25 18:33:46', '2021-01-25 18:33:46'),
(171, 14, '2021-01-25 18:37:57', '2021-01-25 18:37:57'),
(172, 14, '2021-01-25 18:42:45', '2021-01-25 18:42:45'),
(173, 14, '2021-01-25 20:18:47', '2021-01-25 20:18:47'),
(174, 14, '2021-01-25 20:20:38', '2021-01-25 20:20:38'),
(175, 14, '2021-01-25 20:22:47', '2021-01-25 20:22:47'),
(176, 14, '2021-01-25 20:39:01', '2021-01-25 20:39:01'),
(177, 14, '2021-01-25 20:56:58', '2021-01-25 20:56:58'),
(178, 14, '2021-01-25 20:57:45', '2021-01-25 20:57:45'),
(179, 14, '2021-01-25 21:24:31', '2021-01-25 21:24:31'),
(180, 14, '2021-01-25 22:10:16', '2021-01-25 22:10:16'),
(181, 14, '2021-01-25 22:21:17', '2021-01-25 22:21:17'),
(182, 14, '2021-01-26 14:20:44', '2021-01-26 14:20:44'),
(183, 14, '2021-01-26 14:25:13', '2021-01-26 14:25:13'),
(184, 14, '2021-01-26 14:29:01', '2021-01-26 14:29:01'),
(185, 14, '2021-01-26 14:37:46', '2021-01-26 14:37:46'),
(186, 14, '2021-01-26 14:45:36', '2021-01-26 14:45:36'),
(187, 14, '2021-01-26 17:09:34', '2021-01-26 17:09:34'),
(188, 14, '2021-01-26 17:12:57', '2021-01-26 17:12:57'),
(189, 14, '2021-01-26 17:16:09', '2021-01-26 17:16:09'),
(190, 14, '2021-01-26 17:37:03', '2021-01-26 17:37:03'),
(191, 14, '2021-01-26 17:40:58', '2021-01-26 17:40:58'),
(192, 14, '2021-01-26 17:44:23', '2021-01-26 17:44:23'),
(193, 14, '2021-01-26 17:47:08', '2021-01-26 17:47:08'),
(194, 14, '2021-01-26 21:34:34', '2021-01-26 21:34:34'),
(195, 14, '2021-01-26 21:45:47', '2021-01-26 21:45:47'),
(196, 14, '2021-01-26 21:49:20', '2021-01-26 21:49:20'),
(197, 14, '2021-01-26 22:11:59', '2021-01-26 22:11:59'),
(198, 14, '2021-01-26 22:15:20', '2021-01-26 22:15:20'),
(199, 14, '2021-01-26 22:18:46', '2021-01-26 22:18:46'),
(200, 14, '2021-01-26 22:28:48', '2021-01-26 22:28:48'),
(201, 14, '2021-01-26 22:33:48', '2021-01-26 22:33:48'),
(202, 14, '2021-01-26 22:52:00', '2021-01-26 22:52:00'),
(203, 14, '2021-01-26 22:56:30', '2021-01-26 22:56:30'),
(204, 14, '2021-01-26 22:59:56', '2021-01-26 22:59:56'),
(205, 14, '2021-01-26 23:05:01', '2021-01-26 23:05:01'),
(206, 14, '2021-01-26 23:07:03', '2021-01-26 23:07:03'),
(207, 14, '2021-01-26 23:14:43', '2021-01-26 23:14:43'),
(208, 14, '2021-01-26 23:22:21', '2021-01-26 23:22:21'),
(209, 14, '2021-01-26 23:26:46', '2021-01-26 23:26:46'),
(210, 14, '2021-01-26 23:27:28', '2021-01-26 23:27:28'),
(211, 14, '2021-01-26 23:32:51', '2021-01-26 23:32:51'),
(212, 14, '2021-01-26 23:36:52', '2021-01-26 23:36:52'),
(213, 14, '2021-01-26 23:44:38', '2021-01-26 23:44:38'),
(214, 14, '2021-01-26 23:48:45', '2021-01-26 23:48:45'),
(215, 14, '2021-01-27 00:03:53', '2021-01-27 00:03:53'),
(216, 14, '2021-01-27 00:13:01', '2021-01-27 00:13:01'),
(217, 14, '2021-01-27 00:19:49', '2021-01-27 00:19:49'),
(218, 14, '2021-01-27 10:54:21', '2021-01-27 10:54:21'),
(219, 14, '2021-01-27 11:10:43', '2021-01-27 11:10:43'),
(220, 14, '2021-01-27 11:18:26', '2021-01-27 11:18:26'),
(221, 14, '2021-01-27 11:20:59', '2021-01-27 11:20:59'),
(222, 14, '2021-01-27 11:24:32', '2021-01-27 11:24:32'),
(223, 14, '2021-01-27 11:43:42', '2021-01-27 11:43:42'),
(224, 14, '2021-01-27 12:02:48', '2021-01-27 12:02:48'),
(225, 14, '2021-01-27 12:06:41', '2021-01-27 12:06:41'),
(226, 14, '2021-01-27 12:07:49', '2021-01-27 12:07:49'),
(227, 14, '2021-01-27 12:26:52', '2021-01-27 12:26:52'),
(228, 14, '2021-01-27 12:29:59', '2021-01-27 12:29:59'),
(229, 14, '2021-01-27 12:36:17', '2021-01-27 12:36:17'),
(230, 14, '2021-01-27 12:40:56', '2021-01-27 12:40:56'),
(231, 14, '2021-01-27 12:44:14', '2021-01-27 12:44:14'),
(232, 14, '2021-01-27 12:48:01', '2021-01-27 12:48:01'),
(233, 14, '2021-01-27 12:50:55', '2021-01-27 12:50:55'),
(234, 14, '2021-01-27 12:55:15', '2021-01-27 12:55:15'),
(235, 14, '2021-01-27 12:57:58', '2021-01-27 12:57:58'),
(236, 14, '2021-01-27 13:01:32', '2021-01-27 13:01:32'),
(237, 14, '2021-01-27 15:37:07', '2021-01-27 15:37:07'),
(238, 14, '2021-01-27 16:01:02', '2021-01-27 16:01:02'),
(239, 14, '2021-01-27 16:33:45', '2021-01-27 16:33:45'),
(240, 14, '2021-01-27 16:37:34', '2021-01-27 16:37:34'),
(241, 14, '2021-01-27 16:38:33', '2021-01-27 16:38:33'),
(242, 14, '2021-01-27 16:40:31', '2021-01-27 16:40:31'),
(243, 14, '2021-01-27 16:43:19', '2021-01-27 16:43:19'),
(244, 14, '2021-01-27 16:45:18', '2021-01-27 16:45:18'),
(245, 14, '2021-01-27 16:48:42', '2021-01-27 16:48:42'),
(246, 14, '2021-01-27 18:01:55', '2021-01-27 18:01:55'),
(247, 14, '2021-01-28 11:06:47', '2021-01-28 11:06:47'),
(248, 14, '2021-01-28 11:33:43', '2021-01-28 11:33:43'),
(249, 14, '2021-01-28 11:37:31', '2021-01-28 11:37:31'),
(250, 14, '2021-01-28 11:43:53', '2021-01-28 11:43:53'),
(251, 14, '2021-01-28 13:14:28', '2021-01-28 13:14:28'),
(252, 14, '2021-01-29 18:30:52', '2021-01-29 18:30:52'),
(253, 14, '2021-01-30 19:32:10', '2021-01-30 19:32:10'),
(254, 14, '2021-01-30 19:32:54', '2021-01-30 19:32:54'),
(255, 14, '2021-01-30 21:24:21', '2021-01-30 21:24:21'),
(256, 14, '2021-01-30 21:28:28', '2021-01-30 21:28:28'),
(257, 14, '2021-01-30 21:44:12', '2021-01-30 21:44:12'),
(258, 14, '2021-01-30 21:48:51', '2021-01-30 21:48:51'),
(259, 14, '2021-01-30 21:50:12', '2021-01-30 21:50:12'),
(260, 14, '2021-01-30 22:04:34', '2021-01-30 22:04:34'),
(261, 14, '2021-01-30 22:10:39', '2021-01-30 22:10:39'),
(262, 14, '2021-01-30 22:16:37', '2021-01-30 22:16:37'),
(263, 14, '2021-01-30 22:22:32', '2021-01-30 22:22:32'),
(264, 14, '2021-01-30 22:26:46', '2021-01-30 22:26:46'),
(265, 14, '2021-01-31 09:09:04', '2021-01-31 09:09:04'),
(266, 14, '2021-01-31 09:11:24', '2021-01-31 09:11:24'),
(267, 14, '2021-01-31 09:16:09', '2021-01-31 09:16:09'),
(268, 14, '2021-01-31 09:41:42', '2021-01-31 09:41:42'),
(269, 14, '2021-01-31 09:42:22', '2021-01-31 09:42:22'),
(270, 14, '2021-01-31 11:03:04', '2021-01-31 11:03:04'),
(271, 14, '2021-01-31 12:37:28', '2021-01-31 12:37:28'),
(272, 14, '2021-01-31 13:23:46', '2021-01-31 13:23:46'),
(273, 14, '2021-01-31 13:45:40', '2021-01-31 13:45:40'),
(274, 14, '2021-01-31 13:52:11', '2021-01-31 13:52:11'),
(275, 14, '2021-01-31 13:52:54', '2021-01-31 13:52:54'),
(276, 14, '2021-01-31 13:52:58', '2021-01-31 13:52:58'),
(277, 14, '2021-01-31 13:57:02', '2021-01-31 13:57:02'),
(278, 14, '2021-01-31 13:57:26', '2021-01-31 13:57:26'),
(279, 14, '2021-01-31 13:57:30', '2021-01-31 13:57:30'),
(280, 14, '2021-01-31 14:08:19', '2021-01-31 14:08:19'),
(281, 14, '2021-01-31 14:08:35', '2021-01-31 14:08:35'),
(282, 14, '2021-01-31 14:12:13', '2021-01-31 14:12:13'),
(283, 14, '2021-01-31 14:16:11', '2021-01-31 14:16:11'),
(284, 14, '2021-01-31 15:21:38', '2021-01-31 15:21:38'),
(285, 14, '2021-01-31 15:26:39', '2021-01-31 15:26:39'),
(286, 14, '2021-01-31 15:26:57', '2021-01-31 15:26:57'),
(287, 14, '2021-01-31 15:30:41', '2021-01-31 15:30:41'),
(288, 14, '2021-02-01 18:03:30', '2021-02-01 18:03:30'),
(289, 14, '2021-02-01 18:40:39', '2021-02-01 18:40:39'),
(290, 14, '2021-02-01 18:58:58', '2021-02-01 18:58:58'),
(291, 14, '2021-02-01 19:01:57', '2021-02-01 19:01:57'),
(292, 14, '2021-02-01 19:08:20', '2021-02-01 19:08:20'),
(293, 14, '2021-02-02 11:36:36', '2021-02-02 11:36:36'),
(294, 14, '2021-02-02 11:41:02', '2021-02-02 11:41:02'),
(295, 14, '2021-02-02 11:42:57', '2021-02-02 11:42:57'),
(296, 14, '2021-02-02 12:45:36', '2021-02-02 12:45:36'),
(297, 14, '2021-02-02 12:50:28', '2021-02-02 12:50:28'),
(298, 14, '2021-02-02 12:55:13', '2021-02-02 12:55:13'),
(299, 14, '2021-02-02 12:55:40', '2021-02-02 12:55:40'),
(300, 14, '2021-02-02 12:59:03', '2021-02-02 12:59:03'),
(301, 14, '2021-02-02 13:05:08', '2021-02-02 13:05:08'),
(302, 14, '2021-02-02 13:11:00', '2021-02-02 13:11:00'),
(303, 14, '2021-02-02 13:15:05', '2021-02-02 13:15:05'),
(304, 14, '2021-02-02 13:18:52', '2021-02-02 13:18:52'),
(305, 14, '2021-02-02 13:20:09', '2021-02-02 13:20:09'),
(306, 14, '2021-02-02 13:20:59', '2021-02-02 13:20:59'),
(307, 14, '2021-02-02 13:26:51', '2021-02-02 13:26:51'),
(308, 14, '2021-02-02 13:29:14', '2021-02-02 13:29:14'),
(309, 14, '2021-02-02 13:32:10', '2021-02-02 13:32:10'),
(310, 14, '2021-02-02 13:34:52', '2021-02-02 13:34:52'),
(311, 14, '2021-02-02 13:41:07', '2021-02-02 13:41:07'),
(312, 14, '2021-02-02 13:47:04', '2021-02-02 13:47:04'),
(313, 14, '2021-02-02 15:12:03', '2021-02-02 15:12:03'),
(314, 14, '2021-02-02 15:34:49', '2021-02-02 15:34:49'),
(315, 14, '2021-02-02 18:05:04', '2021-02-02 18:05:04'),
(316, 14, '2021-02-03 11:01:04', '2021-02-03 11:01:04'),
(317, 14, '2021-02-03 11:05:47', '2021-02-03 11:05:47'),
(318, 14, '2021-02-03 11:11:34', '2021-02-03 11:11:34'),
(319, 14, '2021-02-03 11:14:22', '2021-02-03 11:14:22'),
(320, 14, '2021-02-03 11:20:07', '2021-02-03 11:20:07'),
(321, 14, '2021-02-03 11:24:43', '2021-02-03 11:24:43'),
(322, 14, '2021-02-03 11:28:02', '2021-02-03 11:28:02'),
(323, 14, '2021-02-03 12:35:22', '2021-02-03 12:35:22'),
(324, 14, '2021-02-03 12:36:38', '2021-02-03 12:36:38'),
(325, 14, '2021-02-03 13:29:56', '2021-02-03 13:29:56'),
(326, 14, '2021-02-03 14:12:15', '2021-02-03 14:12:15'),
(327, 14, '2021-02-03 14:21:31', '2021-02-03 14:21:31'),
(328, 14, '2021-02-03 16:23:42', '2021-02-03 16:23:42'),
(329, 14, '2021-02-03 16:24:59', '2021-02-03 16:24:59'),
(330, 14, '2021-02-03 16:30:57', '2021-02-03 16:30:57'),
(331, 14, '2021-02-03 16:35:38', '2021-02-03 16:35:38'),
(332, 14, '2021-02-03 16:35:53', '2021-02-03 16:35:53'),
(333, 14, '2021-02-03 16:36:53', '2021-02-03 16:36:53'),
(334, 14, '2021-02-03 16:38:29', '2021-02-03 16:38:29'),
(335, 14, '2021-02-03 16:45:03', '2021-02-03 16:45:03'),
(336, 14, '2021-02-03 16:45:27', '2021-02-03 16:45:27'),
(337, 14, '2021-02-03 16:51:58', '2021-02-03 16:51:58'),
(338, 14, '2021-02-03 17:12:56', '2021-02-03 17:12:56'),
(339, 14, '2021-02-03 17:22:00', '2021-02-03 17:22:00'),
(340, 14, '2021-02-03 17:41:25', '2021-02-03 17:41:25'),
(341, 14, '2021-02-03 18:45:31', '2021-02-03 18:45:31'),
(342, 14, '2021-02-03 18:49:34', '2021-02-03 18:49:34'),
(343, 14, '2021-02-03 18:56:04', '2021-02-03 18:56:04'),
(344, 14, '2021-02-03 19:00:47', '2021-02-03 19:00:47'),
(345, 14, '2021-02-04 09:49:55', '2021-02-04 09:49:55'),
(346, 14, '2021-02-04 09:50:46', '2021-02-04 09:50:46'),
(347, 14, '2021-02-04 09:58:38', '2021-02-04 09:58:38'),
(348, 14, '2021-02-04 10:01:54', '2021-02-04 10:01:54'),
(349, 14, '2021-02-04 10:10:37', '2021-02-04 10:10:37'),
(350, 14, '2021-02-04 10:10:56', '2021-02-04 10:10:56'),
(351, 14, '2021-02-04 10:14:10', '2021-02-04 10:14:10'),
(352, 14, '2021-02-04 13:39:50', '2021-02-04 13:39:50'),
(353, 14, '2021-02-04 13:46:28', '2021-02-04 13:46:28'),
(354, 14, '2021-02-04 13:50:19', '2021-02-04 13:50:19'),
(355, 14, '2021-02-04 14:11:43', '2021-02-04 14:11:43'),
(356, 14, '2021-02-04 14:19:15', '2021-02-04 14:19:15'),
(357, 14, '2021-02-04 14:26:45', '2021-02-04 14:26:45'),
(358, 14, '2021-02-04 14:31:34', '2021-02-04 14:31:34'),
(359, 14, '2021-02-04 14:37:22', '2021-02-04 14:37:22'),
(360, 14, '2021-02-04 14:38:15', '2021-02-04 14:38:15'),
(361, 14, '2021-02-04 17:40:18', '2021-02-04 17:40:18'),
(362, 14, '2021-02-04 17:51:45', '2021-02-04 17:51:45'),
(363, 14, '2021-02-04 18:45:48', '2021-02-04 18:45:48'),
(364, 14, '2021-02-04 18:55:15', '2021-02-04 18:55:15'),
(365, 14, '2021-02-04 18:58:52', '2021-02-04 18:58:52'),
(366, 14, '2021-02-04 19:01:15', '2021-02-04 19:01:15'),
(367, 14, '2021-02-04 19:05:06', '2021-02-04 19:05:06'),
(368, 14, '2021-02-04 21:51:23', '2021-02-04 21:51:23'),
(369, 14, '2021-02-04 21:55:50', '2021-02-04 21:55:50'),
(370, 14, '2021-02-04 22:01:17', '2021-02-04 22:01:17'),
(371, 14, '2021-02-04 22:13:16', '2021-02-04 22:13:16'),
(372, 14, '2021-02-04 22:18:29', '2021-02-04 22:18:29'),
(373, 14, '2021-02-04 22:28:43', '2021-02-04 22:28:43'),
(374, 14, '2021-02-04 22:32:57', '2021-02-04 22:32:57'),
(375, 14, '2021-02-04 22:33:53', '2021-02-04 22:33:53'),
(376, 14, '2021-02-04 22:34:48', '2021-02-04 22:34:48'),
(377, 14, '2021-02-05 11:24:04', '2021-02-05 11:24:04'),
(378, 14, '2021-02-05 11:37:06', '2021-02-05 11:37:06'),
(379, 14, '2021-02-06 16:03:18', '2021-02-06 16:03:18'),
(380, 14, '2021-02-06 16:15:17', '2021-02-06 16:15:17'),
(381, 14, '2021-02-06 16:22:00', '2021-02-06 16:22:00'),
(382, 14, '2021-02-06 16:29:10', '2021-02-06 16:29:10'),
(383, 14, '2021-02-06 17:01:47', '2021-02-06 17:01:47'),
(384, 14, '2021-02-06 17:02:16', '2021-02-06 17:02:16'),
(385, 14, '2021-02-06 17:13:07', '2021-02-06 17:13:07'),
(386, 14, '2021-02-06 17:18:35', '2021-02-06 17:18:35'),
(387, 14, '2021-02-06 17:26:43', '2021-02-06 17:26:43'),
(388, 14, '2021-02-06 17:33:03', '2021-02-06 17:33:03'),
(389, 14, '2021-02-06 17:53:19', '2021-02-06 17:53:19'),
(390, 14, '2021-02-06 17:54:50', '2021-02-06 17:54:50'),
(391, 14, '2021-02-06 17:57:35', '2021-02-06 17:57:35'),
(392, 14, '2021-02-06 17:59:51', '2021-02-06 17:59:51'),
(393, 14, '2021-02-06 18:01:54', '2021-02-06 18:01:54'),
(394, 14, '2021-02-06 18:47:23', '2021-02-06 18:47:23'),
(395, 14, '2021-02-06 18:51:00', '2021-02-06 18:51:00'),
(396, 14, '2021-02-06 18:52:29', '2021-02-06 18:52:29'),
(397, 14, '2021-02-06 18:58:34', '2021-02-06 18:58:34'),
(398, 14, '2021-02-06 19:01:39', '2021-02-06 19:01:39'),
(399, 14, '2021-02-07 12:37:50', '2021-02-07 12:37:50'),
(400, 14, '2021-02-07 12:42:33', '2021-02-07 12:42:33'),
(401, 14, '2021-02-07 13:01:38', '2021-02-07 13:01:38'),
(402, 14, '2021-02-07 13:14:56', '2021-02-07 13:14:56'),
(403, 14, '2021-02-07 13:28:55', '2021-02-07 13:28:55'),
(404, 14, '2021-02-07 13:36:54', '2021-02-07 13:36:54'),
(405, 14, '2021-02-08 10:44:22', '2021-02-08 10:44:22'),
(406, 14, '2021-02-08 10:54:10', '2021-02-08 10:54:10'),
(407, 14, '2021-02-09 10:37:28', '2021-02-09 10:37:28'),
(408, 14, '2021-02-09 10:37:30', '2021-02-09 10:37:30'),
(409, 14, '2021-02-09 10:38:38', '2021-02-09 10:38:38'),
(410, 14, '2021-02-09 10:44:29', '2021-02-09 10:44:29'),
(411, 14, '2021-02-09 10:46:43', '2021-02-09 10:46:43'),
(412, 14, '2021-02-09 10:53:53', '2021-02-09 10:53:53'),
(413, 14, '2021-02-09 11:06:39', '2021-02-09 11:06:39'),
(414, 14, '2021-02-09 11:07:25', '2021-02-09 11:07:25'),
(415, 14, '2021-02-09 11:45:47', '2021-02-09 11:45:47'),
(416, 14, '2021-02-09 11:46:44', '2021-02-09 11:46:44'),
(417, 14, '2021-02-09 12:02:20', '2021-02-09 12:02:20'),
(418, 14, '2021-02-09 14:01:08', '2021-02-09 14:01:08'),
(419, 14, '2021-02-09 14:03:16', '2021-02-09 14:03:16'),
(420, 14, '2021-02-09 14:06:30', '2021-02-09 14:06:30'),
(421, 14, '2021-02-09 17:40:45', '2021-02-09 17:40:45'),
(422, 14, '2021-02-09 17:48:58', '2021-02-09 17:48:58'),
(423, 14, '2021-02-09 17:49:10', '2021-02-09 17:49:10'),
(424, 14, '2021-02-09 17:49:15', '2021-02-09 17:49:15'),
(425, 14, '2021-02-09 17:49:18', '2021-02-09 17:49:18'),
(426, 14, '2021-02-09 17:53:17', '2021-02-09 17:53:17'),
(427, 14, '2021-02-09 17:53:24', '2021-02-09 17:53:24'),
(428, 14, '2021-02-09 17:53:47', '2021-02-09 17:53:47'),
(429, 14, '2021-02-09 17:53:50', '2021-02-09 17:53:50'),
(430, 14, '2021-02-09 17:54:12', '2021-02-09 17:54:12'),
(431, 14, '2021-02-09 17:54:35', '2021-02-09 17:54:35'),
(432, 14, '2021-02-09 17:54:42', '2021-02-09 17:54:42'),
(433, 14, '2021-02-09 18:18:08', '2021-02-09 18:18:08'),
(434, 14, '2021-02-09 18:18:20', '2021-02-09 18:18:20'),
(435, 14, '2021-02-09 18:21:44', '2021-02-09 18:21:44'),
(436, 14, '2021-02-09 18:22:02', '2021-02-09 18:22:02'),
(437, 14, '2021-02-09 18:22:07', '2021-02-09 18:22:07'),
(438, 14, '2021-02-09 18:22:07', '2021-02-09 18:22:07'),
(439, 14, '2021-02-09 18:27:49', '2021-02-09 18:27:49'),
(440, 14, '2021-02-09 18:34:36', '2021-02-09 18:34:36'),
(441, 14, '2021-02-09 18:42:09', '2021-02-09 18:42:09'),
(442, 14, '2021-02-09 18:44:46', '2021-02-09 18:44:46'),
(443, 14, '2021-02-09 18:46:20', '2021-02-09 18:46:20'),
(444, 14, '2021-02-09 18:48:20', '2021-02-09 18:48:20'),
(445, 14, '2021-02-09 19:02:00', '2021-02-09 19:02:00'),
(446, 14, '2021-02-09 19:09:11', '2021-02-09 19:09:11'),
(447, 14, '2021-02-09 19:12:58', '2021-02-09 19:12:58'),
(448, 14, '2021-02-09 19:17:26', '2021-02-09 19:17:26'),
(449, 14, '2021-02-09 19:17:45', '2021-02-09 19:17:45'),
(450, 14, '2021-02-09 19:25:24', '2021-02-09 19:25:24'),
(451, 14, '2021-02-09 19:35:56', '2021-02-09 19:35:56'),
(452, 14, '2021-02-09 19:39:08', '2021-02-09 19:39:08'),
(453, 14, '2021-02-09 19:40:50', '2021-02-09 19:40:50'),
(454, 14, '2021-02-09 19:42:36', '2021-02-09 19:42:36'),
(455, 14, '2021-02-09 21:35:58', '2021-02-09 21:35:58'),
(456, 14, '2021-02-09 21:36:20', '2021-02-09 21:36:20'),
(457, 14, '2021-02-09 21:37:19', '2021-02-09 21:37:19'),
(458, 14, '2021-02-09 21:38:37', '2021-02-09 21:38:37'),
(459, 14, '2021-02-09 21:41:47', '2021-02-09 21:41:47'),
(460, 14, '2021-02-09 21:42:38', '2021-02-09 21:42:38'),
(461, 14, '2021-02-09 21:47:45', '2021-02-09 21:47:45'),
(462, 14, '2021-02-09 21:48:06', '2021-02-09 21:48:06'),
(463, 14, '2021-02-09 21:57:05', '2021-02-09 21:57:05'),
(464, 14, '2021-02-09 22:00:53', '2021-02-09 22:00:53'),
(465, 14, '2021-02-09 22:05:42', '2021-02-09 22:05:42'),
(466, 14, '2021-02-09 22:09:01', '2021-02-09 22:09:01'),
(467, 14, '2021-02-09 22:19:55', '2021-02-09 22:19:55'),
(468, 14, '2021-02-09 22:25:26', '2021-02-09 22:25:26'),
(469, 14, '2021-02-09 22:29:23', '2021-02-09 22:29:23'),
(470, 14, '2021-02-09 22:29:38', '2021-02-09 22:29:38'),
(471, 14, '2021-02-10 12:57:43', '2021-02-10 12:57:43'),
(472, 14, '2021-02-10 13:05:43', '2021-02-10 13:05:43'),
(473, 14, '2021-02-10 13:08:29', '2021-02-10 13:08:29'),
(474, 14, '2021-02-10 13:18:18', '2021-02-10 13:18:18'),
(475, 14, '2021-02-10 13:28:40', '2021-02-10 13:28:40'),
(476, 14, '2021-02-10 13:29:42', '2021-02-10 13:29:42'),
(477, 14, '2021-02-10 13:35:33', '2021-02-10 13:35:33'),
(478, 14, '2021-02-10 13:36:26', '2021-02-10 13:36:26'),
(479, 14, '2021-02-10 13:38:55', '2021-02-10 13:38:55'),
(480, 14, '2021-02-10 13:50:27', '2021-02-10 13:50:27'),
(481, 14, '2021-02-10 14:03:25', '2021-02-10 14:03:25'),
(482, 14, '2021-02-10 14:21:49', '2021-02-10 14:21:49'),
(483, 14, '2021-02-10 14:28:56', '2021-02-10 14:28:56'),
(484, 14, '2021-02-10 14:28:57', '2021-02-10 14:28:57'),
(485, 14, '2021-02-10 14:33:36', '2021-02-10 14:33:36'),
(486, 14, '2021-02-10 14:39:11', '2021-02-10 14:39:11'),
(487, 14, '2021-02-10 14:46:56', '2021-02-10 14:46:56'),
(488, 14, '2021-02-10 14:49:19', '2021-02-10 14:49:19'),
(489, 14, '2021-02-10 15:01:12', '2021-02-10 15:01:12'),
(490, 14, '2021-02-10 15:05:26', '2021-02-10 15:05:26'),
(491, 14, '2021-02-10 15:09:15', '2021-02-10 15:09:15'),
(492, 14, '2021-02-10 18:47:58', '2021-02-10 18:47:58'),
(493, 14, '2021-02-10 18:55:22', '2021-02-10 18:55:22'),
(494, 14, '2021-02-10 18:56:09', '2021-02-10 18:56:09'),
(495, 14, '2021-02-10 19:01:56', '2021-02-10 19:01:56'),
(496, 14, '2021-02-10 23:53:57', '2021-02-10 23:53:57'),
(497, 14, '2021-02-10 23:55:21', '2021-02-10 23:55:21'),
(498, 14, '2021-02-11 00:14:55', '2021-02-11 00:14:55'),
(499, 14, '2021-02-11 12:18:05', '2021-02-11 12:18:05'),
(500, 14, '2021-02-11 12:22:03', '2021-02-11 12:22:03'),
(501, 14, '2021-02-11 12:30:23', '2021-02-11 12:30:23'),
(502, 14, '2021-02-11 12:31:51', '2021-02-11 12:31:51'),
(503, 14, '2021-02-11 12:51:48', '2021-02-11 12:51:48'),
(504, 14, '2021-02-11 12:52:58', '2021-02-11 12:52:58'),
(505, 14, '2021-02-11 16:53:47', '2021-02-11 16:53:47'),
(506, 14, '2021-02-11 17:00:04', '2021-02-11 17:00:04'),
(507, 14, '2021-02-11 17:07:15', '2021-02-11 17:07:15'),
(508, 14, '2021-02-11 17:11:31', '2021-02-11 17:11:31'),
(509, 14, '2021-02-11 17:25:29', '2021-02-11 17:25:29'),
(510, 14, '2021-02-11 17:30:20', '2021-02-11 17:30:20'),
(511, 14, '2021-02-11 17:41:04', '2021-02-11 17:41:04'),
(512, 14, '2021-02-11 17:46:34', '2021-02-11 17:46:34'),
(513, 14, '2021-02-11 18:03:01', '2021-02-11 18:03:01'),
(514, 14, '2021-02-11 18:03:34', '2021-02-11 18:03:34'),
(515, 14, '2021-02-11 18:19:26', '2021-02-11 18:19:26'),
(516, 14, '2021-02-11 23:08:38', '2021-02-11 23:08:38'),
(517, 14, '2021-02-11 23:13:38', '2021-02-11 23:13:38'),
(518, 14, '2021-02-11 23:15:32', '2021-02-11 23:15:32'),
(519, 14, '2021-02-11 23:23:07', '2021-02-11 23:23:07'),
(520, 14, '2021-02-11 23:23:30', '2021-02-11 23:23:30'),
(521, 14, '2021-02-11 23:28:41', '2021-02-11 23:28:41'),
(522, 14, '2021-02-11 23:32:30', '2021-02-11 23:32:30'),
(523, 14, '2021-02-11 23:50:41', '2021-02-11 23:50:41'),
(524, 14, '2021-02-12 00:09:04', '2021-02-12 00:09:04'),
(525, 14, '2021-02-12 00:11:53', '2021-02-12 00:11:53'),
(526, 14, '2021-02-12 00:15:32', '2021-02-12 00:15:32'),
(527, 14, '2021-02-13 11:57:27', '2021-02-13 11:57:27'),
(528, 14, '2021-02-13 12:01:07', '2021-02-13 12:01:07'),
(529, 14, '2021-02-13 12:05:24', '2021-02-13 12:05:24'),
(530, 14, '2021-02-13 12:12:58', '2021-02-13 12:12:58'),
(531, 14, '2021-02-13 12:47:08', '2021-02-13 12:47:08'),
(532, 14, '2021-02-13 12:59:11', '2021-02-13 12:59:11'),
(533, 14, '2021-02-13 13:09:56', '2021-02-13 13:09:56'),
(534, 14, '2021-02-13 13:17:52', '2021-02-13 13:17:52'),
(535, 14, '2021-02-13 13:34:48', '2021-02-13 13:34:48'),
(536, 14, '2021-02-13 13:35:42', '2021-02-13 13:35:42'),
(537, 14, '2021-02-13 13:44:22', '2021-02-13 13:44:22'),
(538, 14, '2021-02-13 13:44:29', '2021-02-13 13:44:29'),
(539, 14, '2021-02-13 13:53:14', '2021-02-13 13:53:14'),
(540, 14, '2021-02-13 13:55:44', '2021-02-13 13:55:44'),
(541, 14, '2021-02-13 13:59:13', '2021-02-13 13:59:13'),
(542, 14, '2021-02-13 14:01:56', '2021-02-13 14:01:56'),
(543, 14, '2021-02-13 14:13:38', '2021-02-13 14:13:38'),
(544, 14, '2021-02-13 15:38:45', '2021-02-13 15:38:45'),
(545, 14, '2021-02-13 15:43:23', '2021-02-13 15:43:23'),
(546, 14, '2021-02-13 16:37:04', '2021-02-13 16:37:04'),
(547, 14, '2021-02-13 16:39:26', '2021-02-13 16:39:26'),
(548, 14, '2021-02-13 16:46:03', '2021-02-13 16:46:03'),
(549, 14, '2021-02-14 12:07:19', '2021-02-14 12:07:19'),
(550, 14, '2021-02-14 12:31:42', '2021-02-14 12:31:42'),
(551, 14, '2021-02-14 12:52:40', '2021-02-14 12:52:40'),
(552, 14, '2021-02-14 13:03:05', '2021-02-14 13:03:05'),
(553, 14, '2021-02-14 13:09:09', '2021-02-14 13:09:09'),
(554, 14, '2021-02-14 13:18:33', '2021-02-14 13:18:33'),
(555, 14, '2021-02-14 13:28:40', '2021-02-14 13:28:40'),
(556, 14, '2021-02-14 13:32:33', '2021-02-14 13:32:33'),
(557, 14, '2021-02-14 13:33:53', '2021-02-14 13:33:53'),
(558, 14, '2021-02-14 13:39:08', '2021-02-14 13:39:08'),
(559, 14, '2021-02-14 13:47:06', '2021-02-14 13:47:06'),
(560, 14, '2021-02-14 13:52:26', '2021-02-14 13:52:26'),
(561, 14, '2021-02-14 13:52:47', '2021-02-14 13:52:47'),
(562, 14, '2021-02-14 13:55:46', '2021-02-14 13:55:46'),
(563, 14, '2021-02-14 13:59:28', '2021-02-14 13:59:28'),
(564, 14, '2021-02-14 14:02:17', '2021-02-14 14:02:17'),
(565, 14, '2021-02-14 14:32:54', '2021-02-14 14:32:54'),
(566, 14, '2021-02-14 14:37:41', '2021-02-14 14:37:41'),
(567, 14, '2021-02-14 14:46:19', '2021-02-14 14:46:19'),
(568, 14, '2021-02-14 14:59:39', '2021-02-14 14:59:39'),
(569, 14, '2021-02-14 15:17:29', '2021-02-14 15:17:29'),
(570, 14, '2021-02-14 17:39:45', '2021-02-14 17:39:45'),
(571, 14, '2021-02-14 17:40:50', '2021-02-14 17:40:50'),
(572, 14, '2021-02-14 18:43:43', '2021-02-14 18:43:43'),
(573, 14, '2021-02-14 18:48:39', '2021-02-14 18:48:39'),
(574, 14, '2021-02-15 15:17:38', '2021-02-15 15:17:38'),
(575, 14, '2021-02-22 13:25:11', '2021-02-22 13:25:11'),
(576, 14, '2021-02-22 13:28:15', '2021-02-22 13:28:15'),
(577, 14, '2021-02-22 13:28:39', '2021-02-22 13:28:39'),
(578, 14, '2021-02-22 13:34:27', '2021-02-22 13:34:27'),
(579, 14, '2021-02-22 13:41:36', '2021-02-22 13:41:36'),
(580, 14, '2021-02-22 13:43:10', '2021-02-22 13:43:10'),
(581, 14, '2021-02-22 14:06:24', '2021-02-22 14:06:24'),
(582, 14, '2021-02-22 14:13:11', '2021-02-22 14:13:11'),
(583, 14, '2021-02-22 14:15:35', '2021-02-22 14:15:35'),
(584, 14, '2021-02-22 18:55:33', '2021-02-22 18:55:33'),
(585, 14, '2021-02-23 12:14:27', '2021-02-23 12:14:27'),
(586, 14, '2021-02-23 12:18:28', '2021-02-23 12:18:28'),
(587, 14, '2021-02-23 12:22:29', '2021-02-23 12:22:29'),
(588, 14, '2021-02-23 12:30:33', '2021-02-23 12:30:33'),
(589, 14, '2021-02-23 12:37:48', '2021-02-23 12:37:48'),
(590, 14, '2021-02-23 12:45:09', '2021-02-23 12:45:09'),
(591, 14, '2021-02-23 12:54:14', '2021-02-23 12:54:14'),
(592, 14, '2021-02-23 12:56:48', '2021-02-23 12:56:48'),
(593, 14, '2021-02-23 13:02:32', '2021-02-23 13:02:32'),
(594, 14, '2021-02-23 15:32:47', '2021-02-23 15:32:47'),
(595, 14, '2021-02-23 15:36:05', '2021-02-23 15:36:05'),
(596, 14, '2021-02-23 15:41:57', '2021-02-23 15:41:57'),
(597, 14, '2021-02-23 21:57:42', '2021-02-23 21:57:42'),
(598, 14, '2021-02-23 22:01:59', '2021-02-23 22:01:59'),
(599, 14, '2021-02-23 22:05:34', '2021-02-23 22:05:34'),
(600, 14, '2021-02-23 22:06:19', '2021-02-23 22:06:19'),
(601, 14, '2021-02-23 22:13:03', '2021-02-23 22:13:03'),
(602, 14, '2021-02-23 22:14:47', '2021-02-23 22:14:47'),
(603, 14, '2021-02-23 22:21:03', '2021-02-23 22:21:03'),
(604, 14, '2021-02-23 22:21:51', '2021-02-23 22:21:51'),
(605, 14, '2021-02-23 22:22:22', '2021-02-23 22:22:22'),
(606, 14, '2021-02-23 22:23:04', '2021-02-23 22:23:04'),
(607, 14, '2021-02-23 22:29:47', '2021-02-23 22:29:47'),
(608, 14, '2021-02-23 22:31:41', '2021-02-23 22:31:41'),
(609, 14, '2021-02-24 09:33:52', '2021-02-24 09:33:52'),
(610, 14, '2021-02-24 09:35:47', '2021-02-24 09:35:47'),
(611, 14, '2021-02-24 23:11:53', '2021-02-24 23:11:53'),
(612, 14, '2021-02-24 23:18:16', '2021-02-24 23:18:16'),
(613, 14, '2021-02-24 23:18:51', '2021-02-24 23:18:51'),
(614, 14, '2021-02-24 23:26:23', '2021-02-24 23:26:23'),
(615, 14, '2021-02-24 23:26:43', '2021-02-24 23:26:43'),
(616, 14, '2021-02-25 18:22:33', '2021-02-25 18:22:33'),
(617, 14, '2021-02-25 18:23:45', '2021-02-25 18:23:45'),
(618, 14, '2021-02-25 18:24:02', '2021-02-25 18:24:02'),
(619, 14, '2021-02-25 18:29:42', '2021-02-25 18:29:42'),
(620, 14, '2021-02-25 19:13:57', '2021-02-25 19:13:57'),
(621, 14, '2021-02-25 18:59:48', '2021-02-25 18:59:48'),
(622, 14, '2021-02-25 18:59:56', '2021-02-25 18:59:56'),
(623, 14, '2021-02-25 19:00:13', '2021-02-25 19:00:13'),
(624, 14, '2021-02-26 08:52:14', '2021-02-26 08:52:14'),
(625, 14, '2021-02-26 08:52:40', '2021-02-26 08:52:40'),
(626, 14, '2021-02-26 09:31:59', '2021-02-26 09:31:59'),
(627, 14, '2021-02-26 09:51:14', '2021-02-26 09:51:14'),
(628, 14, '2021-02-26 09:51:43', '2021-02-26 09:51:43'),
(629, 14, '2021-02-26 09:52:27', '2021-02-26 09:52:27'),
(630, 14, '2021-02-26 10:01:28', '2021-02-26 10:01:28'),
(631, 14, '2021-02-26 10:04:19', '2021-02-26 10:04:19'),
(632, 14, '2021-02-26 10:06:30', '2021-02-26 10:06:30'),
(633, 14, '2021-02-26 10:09:27', '2021-02-26 10:09:27'),
(634, 14, '2021-02-26 10:11:33', '2021-02-26 10:11:33'),
(635, 14, '2021-02-26 10:22:02', '2021-02-26 10:22:02'),
(636, 14, '2021-02-26 10:22:47', '2021-02-26 10:22:47'),
(637, 14, '2021-02-26 10:31:14', '2021-02-26 10:31:14'),
(638, 14, '2021-02-26 10:41:07', '2021-02-26 10:41:07'),
(639, 23, '2021-02-26 10:50:37', '2021-02-26 10:50:37'),
(640, 23, '2021-02-26 10:50:56', '2021-02-26 10:50:56'),
(641, 23, '2021-02-26 10:55:22', '2021-02-26 10:55:22'),
(642, 14, '2021-02-26 10:58:59', '2021-02-26 10:58:59'),
(643, 14, '2021-02-26 11:01:32', '2021-02-26 11:01:32'),
(644, 14, '2021-02-26 11:07:18', '2021-02-26 11:07:18'),
(645, 14, '2021-02-26 11:33:32', '2021-02-26 11:33:32'),
(646, 14, '2021-02-26 12:15:56', '2021-02-26 12:15:56'),
(647, 14, '2021-02-26 15:18:05', '2021-02-26 15:18:05'),
(648, 14, '2021-02-26 15:48:29', '2021-02-26 15:48:29'),
(649, 14, '2021-02-26 15:53:49', '2021-02-26 15:53:49'),
(650, 14, '2021-02-26 15:57:46', '2021-02-26 15:57:46'),
(651, 14, '2021-02-26 16:00:32', '2021-02-26 16:00:32'),
(652, 14, '2021-02-26 16:04:51', '2021-02-26 16:04:51'),
(653, 14, '2021-02-26 16:09:53', '2021-02-26 16:09:53'),
(654, 14, '2021-02-26 16:14:52', '2021-02-26 16:14:52'),
(655, 14, '2021-02-26 16:18:50', '2021-02-26 16:18:50'),
(656, 14, '2021-02-26 16:25:31', '2021-02-26 16:25:31'),
(657, 14, '2021-02-26 16:26:23', '2021-02-26 16:26:23'),
(658, 14, '2021-02-26 16:30:59', '2021-02-26 16:30:59'),
(659, 14, '2021-02-26 16:35:49', '2021-02-26 16:35:49'),
(660, 14, '2021-02-26 16:38:19', '2021-02-26 16:38:19'),
(661, 14, '2021-02-26 16:43:04', '2021-02-26 16:43:04'),
(662, 14, '2021-02-26 16:46:59', '2021-02-26 16:46:59'),
(663, 14, '2021-02-26 16:56:00', '2021-02-26 16:56:00'),
(664, 14, '2021-02-26 17:02:08', '2021-02-26 17:02:08'),
(665, 14, '2021-02-26 17:02:16', '2021-02-26 17:02:16'),
(666, 14, '2021-02-26 17:04:40', '2021-02-26 17:04:40'),
(667, 14, '2021-02-26 17:13:28', '2021-02-26 17:13:28'),
(668, 14, '2021-02-26 17:14:20', '2021-02-26 17:14:20'),
(669, 14, '2021-02-26 17:36:17', '2021-02-26 17:36:17'),
(670, 14, '2021-02-26 18:29:19', '2021-02-26 18:29:19'),
(671, 14, '2021-02-26 19:04:54', '2021-02-26 19:04:54'),
(672, 14, '2021-02-26 19:20:59', '2021-02-26 19:20:59'),
(673, 14, '2021-02-26 19:23:23', '2021-02-26 19:23:23'),
(674, 14, '2021-02-27 15:17:23', '2021-02-27 15:17:23'),
(675, 14, '2021-02-27 15:27:51', '2021-02-27 15:27:51'),
(676, 14, '2021-02-27 15:38:22', '2021-02-27 15:38:22'),
(677, 14, '2021-02-27 15:40:38', '2021-02-27 15:40:38'),
(678, 14, '2021-02-27 15:48:01', '2021-02-27 15:48:01'),
(679, 14, '2021-02-27 16:05:00', '2021-02-27 16:05:00'),
(680, 14, '2021-02-27 16:12:00', '2021-02-27 16:12:00'),
(681, 14, '2021-02-27 16:37:50', '2021-02-27 16:37:50'),
(682, 14, '2021-02-27 16:43:17', '2021-02-27 16:43:17'),
(683, 14, '2021-03-01 10:37:48', '2021-03-01 10:37:48'),
(684, 14, '2021-03-01 10:42:08', '2021-03-01 10:42:08'),
(685, 14, '2021-03-02 10:24:11', '2021-03-02 10:24:11'),
(686, 14, '2021-03-02 10:28:08', '2021-03-02 10:28:08'),
(687, 14, '2021-03-02 10:31:21', '2021-03-02 10:31:21'),
(688, 14, '2021-03-02 10:40:29', '2021-03-02 10:40:29'),
(689, 14, '2021-03-02 11:06:14', '2021-03-02 11:06:14'),
(690, 14, '2021-03-02 11:15:57', '2021-03-02 11:15:57'),
(691, 14, '2021-03-02 11:23:59', '2021-03-02 11:23:59'),
(692, 14, '2021-03-02 11:27:59', '2021-03-02 11:27:59'),
(693, 14, '2021-03-02 11:33:41', '2021-03-02 11:33:41'),
(694, 14, '2021-03-02 11:42:53', '2021-03-02 11:42:53'),
(695, 14, '2021-03-02 11:45:39', '2021-03-02 11:45:39'),
(696, 14, '2021-03-02 11:49:23', '2021-03-02 11:49:23'),
(697, 14, '2021-03-02 11:54:56', '2021-03-02 11:54:56'),
(698, 14, '2021-03-02 12:01:41', '2021-03-02 12:01:41'),
(699, 14, '2021-03-02 12:07:35', '2021-03-02 12:07:35'),
(700, 14, '2021-03-02 12:12:32', '2021-03-02 12:12:32'),
(701, 14, '2021-03-02 12:16:22', '2021-03-02 12:16:22'),
(702, 14, '2021-03-02 12:19:33', '2021-03-02 12:19:33'),
(703, 14, '2021-03-02 19:01:56', '2021-03-02 19:01:56'),
(704, 14, '2021-03-02 19:05:09', '2021-03-02 19:05:09'),
(705, 14, '2021-03-02 19:13:45', '2021-03-02 19:13:45'),
(706, 14, '2021-03-02 19:20:06', '2021-03-02 19:20:06'),
(707, 45, '2021-03-03 15:19:56', '2021-03-03 15:19:56'),
(708, 45, '2021-03-03 15:28:00', '2021-03-03 15:28:00'),
(709, 45, '2021-03-03 15:28:52', '2021-03-03 15:28:52'),
(710, 45, '2021-03-03 15:33:32', '2021-03-03 15:33:32'),
(711, 45, '2021-03-03 15:52:19', '2021-03-03 15:52:19'),
(712, 45, '2021-03-03 15:56:06', '2021-03-03 15:56:06'),
(713, 46, '2021-03-03 15:57:48', '2021-03-03 15:57:48'),
(714, 46, '2021-03-03 15:58:48', '2021-03-03 15:58:48'),
(715, 45, '2021-03-03 15:59:21', '2021-03-03 15:59:21'),
(716, 45, '2021-03-03 16:14:22', '2021-03-03 16:14:22'),
(717, 46, '2021-03-03 16:15:30', '2021-03-03 16:15:30'),
(718, 45, '2021-03-03 16:20:22', '2021-03-03 16:20:22'),
(719, 45, '2021-03-03 16:20:48', '2021-03-03 16:20:48'),
(720, 45, '2021-03-03 18:46:44', '2021-03-03 18:46:44'),
(721, 45, '2021-03-03 18:46:56', '2021-03-03 18:46:56'),
(722, 46, '2021-03-03 18:57:34', '2021-03-03 18:57:34'),
(723, 46, '2021-03-03 19:04:59', '2021-03-03 19:04:59'),
(724, 45, '2021-03-03 19:26:56', '2021-03-03 19:26:56'),
(725, 45, '2021-03-03 19:32:00', '2021-03-03 19:32:00'),
(726, 45, '2021-03-03 19:39:40', '2021-03-03 19:39:40'),
(727, 45, '2021-03-03 19:40:34', '2021-03-03 19:40:34'),
(728, 45, '2021-03-03 19:51:15', '2021-03-03 19:51:15'),
(729, 45, '2021-03-03 19:52:00', '2021-03-03 19:52:00'),
(730, 45, '2021-03-03 19:56:11', '2021-03-03 19:56:11'),
(731, 46, '2021-03-03 20:26:58', '2021-03-03 20:26:58'),
(732, 46, '2021-03-03 20:27:28', '2021-03-03 20:27:28'),
(733, 46, '2021-03-03 20:35:01', '2021-03-03 20:35:01'),
(734, 46, '2021-03-03 20:55:43', '2021-03-03 20:55:43'),
(735, 46, '2021-03-04 09:43:45', '2021-03-04 09:43:45'),
(736, 46, '2021-03-04 10:32:15', '2021-03-04 10:32:15'),
(737, 46, '2021-03-04 10:38:28', '2021-03-04 10:38:28'),
(738, 46, '2021-03-04 10:42:23', '2021-03-04 10:42:23'),
(739, 46, '2021-03-04 10:47:24', '2021-03-04 10:47:24'),
(740, 46, '2021-03-04 10:53:22', '2021-03-04 10:53:22'),
(741, 46, '2021-03-04 11:00:16', '2021-03-04 11:00:16'),
(742, 46, '2021-03-04 11:02:50', '2021-03-04 11:02:50'),
(743, 46, '2021-03-04 11:11:49', '2021-03-04 11:11:49'),
(744, 46, '2021-03-04 12:09:19', '2021-03-04 12:09:19'),
(745, 46, '2021-03-04 12:13:37', '2021-03-04 12:13:37'),
(746, 46, '2021-03-04 12:56:12', '2021-03-04 12:56:12'),
(747, 46, '2021-03-04 13:01:15', '2021-03-04 13:01:15'),
(748, 46, '2021-03-04 13:39:57', '2021-03-04 13:39:57'),
(749, 46, '2021-03-04 13:50:26', '2021-03-04 13:50:26'),
(750, 46, '2021-03-04 18:58:14', '2021-03-04 18:58:14'),
(751, 46, '2021-03-04 18:59:16', '2021-03-04 18:59:16'),
(752, 46, '2021-03-04 19:00:13', '2021-03-04 19:00:13'),
(753, 46, '2021-03-04 19:03:11', '2021-03-04 19:03:11'),
(754, 46, '2021-03-04 20:37:56', '2021-03-04 20:37:56'),
(755, 46, '2021-03-04 20:40:00', '2021-03-04 20:40:00'),
(756, 46, '2021-03-05 10:28:04', '2021-03-05 10:28:04'),
(757, 46, '2021-03-05 10:32:13', '2021-03-05 10:32:13'),
(758, 46, '2021-03-05 10:34:09', '2021-03-05 10:34:09'),
(759, 46, '2021-03-05 10:34:37', '2021-03-05 10:34:37'),
(760, 46, '2021-03-05 15:29:08', '2021-03-05 15:29:08'),
(761, 46, '2021-03-05 16:04:14', '2021-03-05 16:04:14'),
(762, 46, '2021-03-05 16:37:37', '2021-03-05 16:37:37'),
(763, 46, '2021-03-05 16:38:29', '2021-03-05 16:38:29'),
(764, 45, '2021-03-05 16:44:47', '2021-03-05 16:44:47'),
(765, 45, '2021-03-05 17:21:34', '2021-03-05 17:21:34'),
(766, 46, '2021-03-05 18:40:53', '2021-03-05 18:40:53'),
(767, 46, '2021-03-05 18:49:41', '2021-03-05 18:49:41'),
(768, 45, '2021-03-05 18:50:27', '2021-03-05 18:50:27'),
(769, 45, '2021-03-05 18:55:12', '2021-03-05 18:55:12'),
(770, 45, '2021-03-05 19:00:13', '2021-03-05 19:00:13'),
(771, 45, '2021-03-05 19:09:00', '2021-03-05 19:09:00'),
(772, 45, '2021-03-05 19:15:09', '2021-03-05 19:15:09'),
(773, 45, '2021-03-05 19:16:11', '2021-03-05 19:16:11'),
(774, 45, '2021-03-05 20:13:17', '2021-03-05 20:13:17'),
(775, 45, '2021-03-06 07:59:12', '2021-03-06 07:59:12'),
(776, 46, '2021-03-06 07:59:46', '2021-03-06 07:59:46'),
(777, 46, '2021-03-06 08:00:47', '2021-03-06 08:00:47'),
(778, 46, '2021-03-06 08:29:18', '2021-03-06 08:29:18'),
(779, 46, '2021-03-06 08:34:50', '2021-03-06 08:34:50'),
(780, 46, '2021-03-06 08:46:59', '2021-03-06 08:46:59'),
(781, 46, '2021-03-06 08:53:00', '2021-03-06 08:53:00'),
(782, 46, '2021-03-06 08:59:00', '2021-03-06 08:59:00'),
(783, 46, '2021-03-06 10:16:32', '2021-03-06 10:16:32'),
(784, 46, '2021-03-06 10:35:54', '2021-03-06 10:35:54'),
(785, 46, '2021-03-06 10:36:39', '2021-03-06 10:36:39'),
(786, 46, '2021-03-06 12:20:57', '2021-03-06 12:20:57'),
(787, 46, '2021-03-06 12:28:21', '2021-03-06 12:28:21'),
(788, 46, '2021-03-06 12:33:12', '2021-03-06 12:33:12'),
(789, 46, '2021-03-06 12:33:35', '2021-03-06 12:33:35'),
(790, 46, '2021-03-06 12:36:23', '2021-03-06 12:36:23'),
(791, 46, '2021-03-06 12:52:16', '2021-03-06 12:52:16'),
(792, 46, '2021-03-06 12:54:04', '2021-03-06 12:54:04'),
(793, 45, '2021-03-06 12:54:28', '2021-03-06 12:54:28'),
(794, 46, '2021-03-06 13:11:03', '2021-03-06 13:11:03'),
(795, 46, '2021-03-06 13:16:02', '2021-03-06 13:16:02'),
(796, 46, '2021-03-06 13:16:21', '2021-03-06 13:16:21'),
(797, 46, '2021-03-06 13:17:33', '2021-03-06 13:17:33'),
(798, 46, '2021-03-06 13:20:58', '2021-03-06 13:20:58'),
(799, 46, '2021-03-06 13:22:14', '2021-03-06 13:22:14'),
(800, 46, '2021-03-06 13:26:05', '2021-03-06 13:26:05'),
(801, 46, '2021-03-06 13:45:38', '2021-03-06 13:45:38'),
(802, 46, '2021-03-06 13:46:21', '2021-03-06 13:46:21'),
(803, 45, '2021-03-06 13:50:33', '2021-03-06 13:50:33'),
(804, 46, '2021-03-06 13:51:00', '2021-03-06 13:51:00'),
(805, 46, '2021-03-06 14:06:18', '2021-03-06 14:06:18'),
(806, 45, '2021-03-06 14:07:38', '2021-03-06 14:07:38'),
(807, 46, '2021-03-06 14:26:20', '2021-03-06 14:26:20'),
(808, 46, '2021-03-06 14:27:34', '2021-03-06 14:27:34'),
(809, 46, '2021-03-06 14:30:43', '2021-03-06 14:30:43'),
(810, 46, '2021-03-06 14:33:55', '2021-03-06 14:33:55'),
(811, 46, '2021-03-06 14:35:26', '2021-03-06 14:35:26'),
(812, 46, '2021-03-06 14:36:27', '2021-03-06 14:36:27'),
(813, 46, '2021-03-06 14:40:41', '2021-03-06 14:40:41'),
(814, 45, '2021-03-06 14:55:54', '2021-03-06 14:55:54'),
(815, 45, '2021-03-06 14:56:58', '2021-03-06 14:56:58'),
(816, 45, '2021-03-06 14:58:15', '2021-03-06 14:58:15'),
(817, 46, '2021-03-06 14:58:39', '2021-03-06 14:58:39'),
(818, 45, '2021-03-06 15:51:39', '2021-03-06 15:51:39'),
(819, 45, '2021-03-06 15:53:33', '2021-03-06 15:53:33'),
(820, 45, '2021-03-06 15:54:04', '2021-03-06 15:54:04'),
(821, 45, '2021-03-06 16:48:10', '2021-03-06 16:48:10'),
(822, 45, '2021-03-06 16:48:43', '2021-03-06 16:48:43'),
(823, 46, '2021-03-06 16:50:15', '2021-03-06 16:50:15'),
(824, 46, '2021-03-06 16:51:46', '2021-03-06 16:51:46'),
(825, 45, '2021-03-06 16:55:05', '2021-03-06 16:55:05'),
(826, 46, '2021-03-06 16:55:59', '2021-03-06 16:55:59'),
(827, 46, '2021-03-06 16:56:37', '2021-03-06 16:56:37'),
(828, 46, '2021-03-06 16:57:27', '2021-03-06 16:57:27'),
(829, 46, '2021-03-06 17:02:38', '2021-03-06 17:02:38'),
(830, 46, '2021-03-07 14:59:17', '2021-03-07 14:59:17'),
(831, 45, '2021-03-07 15:18:43', '2021-03-07 15:18:43'),
(832, 46, '2021-03-07 15:20:14', '2021-03-07 15:20:14'),
(833, 45, '2021-03-07 15:20:32', '2021-03-07 15:20:32'),
(834, 45, '2021-03-07 15:21:02', '2021-03-07 15:21:02'),
(835, 45, '2021-03-07 15:21:41', '2021-03-07 15:21:41'),
(836, 45, '2021-03-07 15:31:48', '2021-03-07 15:31:48'),
(837, 45, '2021-03-07 15:32:52', '2021-03-07 15:32:52'),
(838, 45, '2021-03-07 15:33:25', '2021-03-07 15:33:25'),
(839, 45, '2021-03-07 15:34:08', '2021-03-07 15:34:08'),
(840, 45, '2021-03-07 15:43:37', '2021-03-07 15:43:37'),
(841, 45, '2021-03-07 15:44:01', '2021-03-07 15:44:01'),
(842, 45, '2021-03-07 16:03:11', '2021-03-07 16:03:11'),
(843, 45, '2021-03-07 16:10:52', '2021-03-07 16:10:52'),
(844, 45, '2021-03-07 16:19:45', '2021-03-07 16:19:45'),
(845, 45, '2021-03-07 16:21:01', '2021-03-07 16:21:01'),
(846, 45, '2021-03-07 16:21:16', '2021-03-07 16:21:16'),
(847, 45, '2021-03-07 16:21:49', '2021-03-07 16:21:49'),
(848, 45, '2021-03-07 16:23:08', '2021-03-07 16:23:08'),
(849, 45, '2021-03-07 16:23:36', '2021-03-07 16:23:36'),
(850, 45, '2021-03-07 16:28:21', '2021-03-07 16:28:21'),
(851, 45, '2021-03-07 16:29:55', '2021-03-07 16:29:55'),
(852, 45, '2021-03-07 16:31:00', '2021-03-07 16:31:00'),
(853, 45, '2021-03-07 16:31:21', '2021-03-07 16:31:21'),
(854, 45, '2021-03-07 16:31:40', '2021-03-07 16:31:40'),
(855, 45, '2021-03-07 19:33:09', '2021-03-07 19:33:09'),
(856, 45, '2021-03-08 11:21:17', '2021-03-08 11:21:17'),
(857, 45, '2021-03-08 11:37:11', '2021-03-08 11:37:11'),
(858, 46, '2021-03-08 11:39:28', '2021-03-08 11:39:28'),
(859, 46, '2021-03-08 12:13:17', '2021-03-08 12:13:17'),
(860, 46, '2021-03-08 12:18:25', '2021-03-08 12:18:25'),
(861, 47, '2021-03-08 12:20:22', '2021-03-08 12:20:22'),
(862, 45, '2021-03-08 12:26:10', '2021-03-08 12:26:10'),
(863, 46, '2021-03-08 12:27:51', '2021-03-08 12:27:51'),
(864, 45, '2021-03-08 12:40:19', '2021-03-08 12:40:19'),
(865, 45, '2021-03-08 13:03:54', '2021-03-08 13:03:54'),
(866, 45, '2021-03-08 13:45:34', '2021-03-08 13:45:34'),
(867, 46, '2021-03-08 13:45:52', '2021-03-08 13:45:52'),
(868, 45, '2021-03-08 13:48:24', '2021-03-08 13:48:24'),
(869, 45, '2021-03-08 19:34:54', '2021-03-08 19:34:54'),
(870, 45, '2021-03-08 19:45:48', '2021-03-08 19:45:48'),
(871, 45, '2021-03-09 15:27:28', '2021-03-09 15:27:28'),
(872, 45, '2021-03-09 19:51:55', '2021-03-09 19:51:55'),
(873, 45, '2021-03-09 20:53:15', '2021-03-09 20:53:15'),
(874, 45, '2021-03-10 18:55:06', '2021-03-10 18:55:06'),
(875, 45, '2021-03-11 15:12:02', '2021-03-11 15:12:02'),
(876, 45, '2021-03-11 18:57:51', '2021-03-11 18:57:51'),
(877, 45, '2021-03-11 19:26:39', '2021-03-11 19:26:39'),
(878, 45, '2021-03-14 10:35:39', '2021-03-14 10:35:39'),
(879, 45, '2021-03-16 08:02:18', '2021-03-16 08:02:18'),
(880, 45, '2021-03-16 08:12:01', '2021-03-16 08:12:01'),
(881, 45, '2021-03-17 09:53:01', '2021-03-17 09:53:01'),
(882, 45, '2021-03-17 09:53:29', '2021-03-17 09:53:29'),
(883, 45, '2021-03-17 10:12:33', '2021-03-17 10:12:33');

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
  `ProjectId` int NOT NULL,
  `TeamName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`TeamId`, `ProjectId`, `TeamName`) VALUES
(5, 44, 'test team'),
(6, 46, 'response team'),
(7, 56, 'final team'),
(8, 46, 'response test'),
(9, 56, 'Final Test Team'),
(10, 44, 'test repetiotion');

-- --------------------------------------------------------

--
-- Table structure for table `team_leaders`
--

CREATE TABLE `team_leaders` (
  `TeamLeaderId` int NOT NULL,
  `TeamId` int NOT NULL,
  `AdministratorId` int NOT NULL,
  `IsCheckBoxChecked` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `team_leaders`
--

INSERT INTO `team_leaders` (`TeamLeaderId`, `TeamId`, `AdministratorId`, `IsCheckBoxChecked`) VALUES
(37, 5, 8, 1),
(38, 6, 9, 0),
(39, 5, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `TeamMemberId` int NOT NULL,
  `TeamId` int NOT NULL,
  `UserId` int NOT NULL,
  `IsCheckBoxChecked` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`TeamMemberId`, `TeamId`, `UserId`, `IsCheckBoxChecked`) VALUES
(33, 5, 14, 0),
(35, 5, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `terms_and_conditions`
--

CREATE TABLE `terms_and_conditions` (
  `TermsId` int NOT NULL,
  `UserId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `terms_and_conditions`
--

INSERT INTO `terms_and_conditions` (`TermsId`, `UserId`) VALUES
(3, 38),
(4, 39),
(5, 40),
(6, 41),
(7, 43),
(8, 45),
(9, 46),
(10, 47);

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
(45, 'mary', 'Adhiambo ', 'Konyango ', '0727767652', 'marykonyango74@gmail.com', 2, 315, '0e30ef0beb7f8a8a06f0bbc1b5420059c91118beebd01463e81cc1333a1ee4ca55ae2716b4313cd47c39be76a0d7ddf749eb7e743e6ce02f44cbf42d5dae9b2d', 'eJzrdM4Q7L/tGanDQSiC9TwK3efsw9DTMDPML7bmioMZ93hWkmJYQqXQ+QIrEGBWfyHh7OYnIlKqaHlt4oc1SwqrOoRMRakZ+f4Yk+gLj3j5xgsknlUoIcVZpOHCAvTUkUuRx11uH7ubNB7EhrAyyoafV2FZ+KOuHpCCx05qRY4=', '2021-03-03'),
(46, 'user', 'user', 'user', '1', 'user', 1, 1, 'd55acc16d590e59c8bb2cf212673237b89702089525947df7dbd4fc74e9a9c1e107138c8ae51e5de3a28fac064c6239aa6a3b8ce140045af232154c60e17e5c3', 'nOii8fdm1ay/C0MBZbwGNCZ+ZZy32vl6QwJiwre5WXvY8ZEfSfnLhdonShQfp1ZDQ8XkF2OsOajYXNM2v7XPFuhRzSKTB/5Hm0eR8048jErc6Nq4KpLW524UwoSWBcf0NSaPnVfd+SWavV9//oQHRFgZ37lNQmIw0qZoCK2P/oU=', '2021-03-03'),
(47, 'trezer', 'wanda', 'Kenya ', '1', 'trezerkonyango@gmail.com', 2, 1, '717f17b25ad1b2bd5e45befbd573d133e30ffe786d0353330a6a084015cec4a4fc9bba519f7d7d14f230512e686216eb430170a2304473b39e3977ae3fbfc0f7', 'OL4nce7Q1Y5T1/KVM/plTop5yXk/BaRX0a9dSDXXTF1Z9rfuR+LkT7gxTUhlb1ire63kA4PoP9qfin4/Kc1nxyl9CWttdtCMuvt1wQsLhaoZVkuCwOukMUCgqoq8Zjo/zEoJSxd6+P6Lms74x566vZia841d/7gDOzAWfEBRb1w=', '2021-03-08');

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
(15, 14, 8, 1, 1),
(21, 17, 11, 1, 0),
(22, 18, 12, 1, 0),
(27, 23, 17, 1, 0),
(42, 38, 32, 1, 0),
(43, 39, 33, 1, 0),
(44, 40, 34, 1, 0),
(45, 41, 35, 1, 0),
(46, 42, 36, 1, 0),
(47, 43, 37, 1, 0),
(48, 44, 38, 1, 0),
(49, 45, 39, 1, 0),
(50, 46, 40, 1, 0),
(51, 47, 41, 1, 0);

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
(11, 17, 1, 0),
(12, 18, 1, 0),
(17, 23, 1, 0),
(32, 38, 1, 0),
(33, 39, 1, 0),
(34, 40, 1, 0),
(35, 41, 1, 0),
(36, 42, 1, 0),
(37, 43, 1, 0),
(38, 44, 1, 0),
(39, 45, 1, 0),
(40, 46, 1, 0),
(41, 47, 1, 0);

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
(273, 315, 1, '2021-02-02 18:05:04'),
(274, 316, 1, '2021-02-03 11:01:04'),
(275, 317, 1, '2021-02-03 11:05:47'),
(276, 318, 1, '2021-02-03 11:11:34'),
(277, 319, 1, '2021-02-03 11:14:22'),
(278, 320, 1, '2021-02-03 11:20:07'),
(279, 321, 1, '2021-02-03 11:24:43'),
(280, 322, 1, '2021-02-03 11:28:02'),
(281, 323, 1, '2021-02-03 12:35:22'),
(282, 324, 1, '2021-02-03 12:36:38'),
(283, 325, 1, '2021-02-03 13:29:56'),
(284, 326, 1, '2021-02-03 14:12:15'),
(285, 327, 1, '2021-02-03 14:21:31'),
(286, 328, 1, '2021-02-03 16:23:42'),
(287, 329, 1, '2021-02-03 16:24:59'),
(288, 330, 1, '2021-02-03 16:30:57'),
(289, 331, 1, '2021-02-03 16:35:38'),
(290, 332, 1, '2021-02-03 16:35:53'),
(291, 333, 1, '2021-02-03 16:36:53'),
(292, 334, 1, '2021-02-03 16:38:29'),
(293, 335, 1, '2021-02-03 16:45:03'),
(294, 336, 1, '2021-02-03 16:45:27'),
(295, 337, 1, '2021-02-03 16:51:58'),
(296, 338, 1, '2021-02-03 17:12:56'),
(297, 339, 1, '2021-02-03 17:22:00'),
(298, 340, 1, '2021-02-03 17:41:25'),
(299, 341, 1, '2021-02-03 18:45:31'),
(300, 342, 1, '2021-02-03 18:49:34'),
(301, 343, 1, '2021-02-03 18:56:04'),
(302, 344, 1, '2021-02-03 19:00:47'),
(303, 345, 1, '2021-02-04 09:49:55'),
(304, 346, 1, '2021-02-04 09:50:46'),
(305, 347, 1, '2021-02-04 09:58:38'),
(306, 348, 1, '2021-02-04 10:01:54'),
(307, 349, 1, '2021-02-04 10:10:37'),
(308, 350, 1, '2021-02-04 10:10:56'),
(309, 351, 1, '2021-02-04 10:14:10'),
(310, 352, 1, '2021-02-04 13:39:50'),
(311, 353, 1, '2021-02-04 13:46:28'),
(312, 354, 1, '2021-02-04 13:50:19'),
(313, 355, 1, '2021-02-04 14:11:43'),
(314, 356, 1, '2021-02-04 14:19:15'),
(315, 357, 1, '2021-02-04 14:26:45'),
(316, 358, 1, '2021-02-04 14:31:34'),
(317, 359, 1, '2021-02-04 14:37:22'),
(318, 360, 1, '2021-02-04 14:38:15'),
(319, 361, 1, '2021-02-04 17:40:18'),
(320, 362, 1, '2021-02-04 17:51:45'),
(321, 363, 1, '2021-02-04 18:45:48'),
(322, 364, 1, '2021-02-04 18:55:15'),
(323, 365, 1, '2021-02-04 18:58:52'),
(324, 366, 1, '2021-02-04 19:01:15'),
(325, 367, 1, '2021-02-04 19:05:06'),
(326, 368, 1, '2021-02-04 21:51:23'),
(327, 369, 1, '2021-02-04 21:55:50'),
(328, 370, 1, '2021-02-04 22:01:17'),
(329, 371, 1, '2021-02-04 22:13:16'),
(330, 372, 1, '2021-02-04 22:18:29'),
(331, 373, 1, '2021-02-04 22:28:43'),
(332, 374, 1, '2021-02-04 22:32:57'),
(333, 375, 1, '2021-02-04 22:33:53'),
(334, 376, 1, '2021-02-04 22:34:48'),
(335, 377, 1, '2021-02-05 11:24:04'),
(336, 378, 1, '2021-02-05 11:37:06'),
(337, 379, 1, '2021-02-06 16:03:18'),
(338, 380, 1, '2021-02-06 16:15:17'),
(339, 381, 1, '2021-02-06 16:22:00'),
(340, 382, 1, '2021-02-06 16:29:10'),
(341, 383, 1, '2021-02-06 17:01:47'),
(342, 384, 1, '2021-02-06 17:02:16'),
(343, 385, 1, '2021-02-06 17:13:07'),
(344, 386, 1, '2021-02-06 17:18:35'),
(345, 387, 1, '2021-02-06 17:26:43'),
(346, 388, 1, '2021-02-06 17:33:03'),
(347, 389, 1, '2021-02-06 17:53:19'),
(348, 390, 1, '2021-02-06 17:54:50'),
(349, 391, 1, '2021-02-06 17:57:35'),
(350, 392, 1, '2021-02-06 17:59:51'),
(351, 393, 1, '2021-02-06 18:01:54'),
(352, 394, 1, '2021-02-06 18:47:23'),
(353, 395, 1, '2021-02-06 18:51:00'),
(354, 396, 1, '2021-02-06 18:52:29'),
(355, 397, 1, '2021-02-06 18:58:34'),
(356, 398, 1, '2021-02-06 19:01:39'),
(357, 399, 1, '2021-02-07 12:37:50'),
(358, 400, 1, '2021-02-07 12:42:33'),
(359, 401, 1, '2021-02-07 13:01:38'),
(360, 402, 1, '2021-02-07 13:14:56'),
(361, 403, 1, '2021-02-07 13:28:55'),
(362, 404, 1, '2021-02-07 13:36:54'),
(363, 405, 1, '2021-02-08 10:44:22'),
(364, 406, 1, '2021-02-08 10:54:10'),
(365, 407, 1, '2021-02-09 10:37:28'),
(366, 408, 1, '2021-02-09 10:37:30'),
(367, 409, 1, '2021-02-09 10:38:38'),
(368, 410, 1, '2021-02-09 10:44:29'),
(369, 411, 1, '2021-02-09 10:46:43'),
(370, 412, 1, '2021-02-09 10:53:53'),
(371, 413, 1, '2021-02-09 11:06:39'),
(372, 414, 1, '2021-02-09 11:07:25'),
(373, 415, 1, '2021-02-09 11:45:47'),
(374, 416, 1, '2021-02-09 11:46:44'),
(375, 417, 1, '2021-02-09 12:02:20'),
(376, 418, 1, '2021-02-09 14:01:08'),
(377, 419, 1, '2021-02-09 14:03:16'),
(378, 420, 1, '2021-02-09 14:06:30'),
(379, 421, 1, '2021-02-09 17:40:45'),
(380, 422, 1, '2021-02-09 17:48:58'),
(381, 423, 1, '2021-02-09 17:49:10'),
(382, 424, 1, '2021-02-09 17:49:15'),
(383, 425, 1, '2021-02-09 17:49:18'),
(384, 426, 1, '2021-02-09 17:53:17'),
(385, 427, 1, '2021-02-09 17:53:24'),
(386, 428, 1, '2021-02-09 17:53:47'),
(387, 429, 1, '2021-02-09 17:53:50'),
(388, 430, 1, '2021-02-09 17:54:12'),
(389, 431, 1, '2021-02-09 17:54:35'),
(390, 432, 1, '2021-02-09 17:54:42'),
(391, 433, 1, '2021-02-09 18:18:08'),
(392, 434, 1, '2021-02-09 18:18:20'),
(393, 435, 1, '2021-02-09 18:21:44'),
(394, 436, 1, '2021-02-09 18:22:02'),
(395, 437, 1, '2021-02-09 18:22:07'),
(396, 438, 1, '2021-02-09 18:22:07'),
(397, 439, 1, '2021-02-09 18:27:49'),
(398, 440, 1, '2021-02-09 18:34:36'),
(399, 441, 1, '2021-02-09 18:42:09'),
(400, 442, 1, '2021-02-09 18:44:46'),
(401, 443, 1, '2021-02-09 18:46:20'),
(402, 444, 1, '2021-02-09 18:48:20'),
(403, 445, 1, '2021-02-09 19:02:00'),
(404, 446, 1, '2021-02-09 19:09:11'),
(405, 447, 1, '2021-02-09 19:12:58'),
(406, 448, 1, '2021-02-09 19:17:26'),
(407, 449, 1, '2021-02-09 19:17:45'),
(408, 450, 1, '2021-02-09 19:25:24'),
(409, 451, 1, '2021-02-09 19:35:56'),
(410, 452, 1, '2021-02-09 19:39:08'),
(411, 453, 1, '2021-02-09 19:40:50'),
(412, 454, 1, '2021-02-09 19:42:36'),
(413, 455, 1, '2021-02-09 21:35:58'),
(414, 456, 1, '2021-02-09 21:36:20'),
(415, 457, 1, '2021-02-09 21:37:19'),
(416, 458, 1, '2021-02-09 21:38:37'),
(417, 459, 1, '2021-02-09 21:41:47'),
(418, 460, 1, '2021-02-09 21:42:38'),
(419, 461, 1, '2021-02-09 21:47:45'),
(420, 462, 1, '2021-02-09 21:48:06'),
(421, 463, 1, '2021-02-09 21:57:05'),
(422, 464, 1, '2021-02-09 22:00:53'),
(423, 465, 1, '2021-02-09 22:05:42'),
(424, 466, 1, '2021-02-09 22:09:01'),
(425, 467, 1, '2021-02-09 22:19:55'),
(426, 468, 1, '2021-02-09 22:25:26'),
(427, 469, 1, '2021-02-09 22:29:23'),
(428, 470, 1, '2021-02-09 22:29:38'),
(429, 471, 1, '2021-02-10 12:57:43'),
(430, 472, 1, '2021-02-10 13:05:43'),
(431, 473, 1, '2021-02-10 13:08:29'),
(432, 474, 1, '2021-02-10 13:18:18'),
(433, 475, 1, '2021-02-10 13:28:40'),
(434, 476, 1, '2021-02-10 13:29:42'),
(435, 477, 1, '2021-02-10 13:35:33'),
(436, 478, 1, '2021-02-10 13:36:26'),
(437, 479, 1, '2021-02-10 13:38:55'),
(438, 480, 1, '2021-02-10 13:50:27'),
(439, 481, 1, '2021-02-10 14:03:25'),
(440, 482, 1, '2021-02-10 14:21:49'),
(441, 483, 1, '2021-02-10 14:28:56'),
(442, 484, 1, '2021-02-10 14:28:57'),
(443, 485, 1, '2021-02-10 14:33:36'),
(444, 486, 1, '2021-02-10 14:39:11'),
(445, 487, 1, '2021-02-10 14:46:56'),
(446, 488, 1, '2021-02-10 14:49:19'),
(447, 489, 1, '2021-02-10 15:01:12'),
(448, 490, 1, '2021-02-10 15:05:26'),
(449, 491, 1, '2021-02-10 15:09:15'),
(450, 492, 1, '2021-02-10 18:47:58'),
(451, 493, 1, '2021-02-10 18:55:22'),
(452, 494, 1, '2021-02-10 18:56:09'),
(453, 495, 1, '2021-02-10 19:01:56'),
(454, 496, 1, '2021-02-10 23:53:57'),
(455, 497, 1, '2021-02-10 23:55:21'),
(456, 498, 1, '2021-02-11 00:14:55'),
(457, 499, 1, '2021-02-11 12:18:05'),
(458, 500, 1, '2021-02-11 12:22:03'),
(459, 501, 1, '2021-02-11 12:30:23'),
(460, 502, 1, '2021-02-11 12:31:51'),
(461, 503, 1, '2021-02-11 12:51:48'),
(462, 504, 1, '2021-02-11 12:52:58'),
(463, 505, 1, '2021-02-11 16:53:47'),
(464, 506, 1, '2021-02-11 17:00:04'),
(465, 507, 1, '2021-02-11 17:07:15'),
(466, 508, 1, '2021-02-11 17:11:31'),
(467, 509, 1, '2021-02-11 17:25:29'),
(468, 510, 1, '2021-02-11 17:30:20'),
(469, 511, 1, '2021-02-11 17:41:04'),
(470, 512, 1, '2021-02-11 17:46:34'),
(471, 513, 1, '2021-02-11 18:03:01'),
(472, 514, 1, '2021-02-11 18:03:34'),
(473, 515, 1, '2021-02-11 18:19:26'),
(474, 516, 1, '2021-02-11 23:08:38'),
(475, 517, 1, '2021-02-11 23:13:38'),
(476, 518, 1, '2021-02-11 23:15:32'),
(477, 519, 1, '2021-02-11 23:23:07'),
(478, 520, 1, '2021-02-11 23:23:30'),
(479, 521, 1, '2021-02-11 23:28:41'),
(480, 522, 1, '2021-02-11 23:32:30'),
(481, 523, 1, '2021-02-11 23:50:41'),
(482, 524, 1, '2021-02-12 00:09:04'),
(483, 525, 1, '2021-02-12 00:11:53'),
(484, 526, 1, '2021-02-12 00:15:32'),
(485, 527, 1, '2021-02-13 11:57:27'),
(486, 528, 1, '2021-02-13 12:01:07'),
(487, 529, 1, '2021-02-13 12:05:24'),
(488, 530, 1, '2021-02-13 12:12:58'),
(489, 531, 1, '2021-02-13 12:47:08'),
(490, 532, 1, '2021-02-13 12:59:11'),
(491, 533, 1, '2021-02-13 13:09:56'),
(492, 534, 1, '2021-02-13 13:17:52'),
(493, 535, 1, '2021-02-13 13:34:48'),
(494, 536, 1, '2021-02-13 13:35:42'),
(495, 537, 1, '2021-02-13 13:44:22'),
(496, 538, 1, '2021-02-13 13:44:29'),
(497, 539, 1, '2021-02-13 13:53:14'),
(498, 540, 1, '2021-02-13 13:55:44'),
(499, 541, 1, '2021-02-13 13:59:13'),
(500, 542, 1, '2021-02-13 14:01:56'),
(501, 543, 1, '2021-02-13 14:13:38'),
(502, 544, 1, '2021-02-13 15:38:45'),
(503, 545, 1, '2021-02-13 15:43:23'),
(504, 546, 1, '2021-02-13 16:37:04'),
(505, 547, 1, '2021-02-13 16:39:26'),
(506, 548, 1, '2021-02-13 16:46:03'),
(507, 549, 1, '2021-02-14 12:07:19'),
(508, 550, 1, '2021-02-14 12:31:42'),
(509, 551, 1, '2021-02-14 12:52:40'),
(510, 552, 1, '2021-02-14 13:03:05'),
(511, 553, 1, '2021-02-14 13:09:09'),
(512, 554, 1, '2021-02-14 13:18:33'),
(513, 555, 1, '2021-02-14 13:28:40'),
(514, 556, 1, '2021-02-14 13:32:33'),
(515, 557, 1, '2021-02-14 13:33:53'),
(516, 558, 1, '2021-02-14 13:39:08'),
(517, 559, 1, '2021-02-14 13:47:06'),
(518, 560, 1, '2021-02-14 13:52:26'),
(519, 561, 1, '2021-02-14 13:52:47'),
(520, 562, 1, '2021-02-14 13:55:46'),
(521, 563, 1, '2021-02-14 13:59:28'),
(522, 564, 1, '2021-02-14 14:02:17'),
(523, 565, 1, '2021-02-14 14:32:54'),
(524, 566, 1, '2021-02-14 14:37:41'),
(525, 567, 1, '2021-02-14 14:46:19'),
(526, 568, 1, '2021-02-14 14:59:39'),
(527, 569, 1, '2021-02-14 15:17:29'),
(528, 570, 1, '2021-02-14 17:39:45'),
(529, 571, 1, '2021-02-14 17:40:50'),
(530, 572, 1, '2021-02-14 18:43:43'),
(531, 573, 1, '2021-02-14 18:48:39'),
(532, 574, 1, '2021-02-15 15:17:38'),
(533, 575, 1, '2021-02-22 13:25:11'),
(534, 576, 1, '2021-02-22 13:28:15'),
(535, 577, 1, '2021-02-22 13:28:39'),
(536, 578, 1, '2021-02-22 13:34:27'),
(537, 579, 1, '2021-02-22 13:41:36'),
(538, 580, 1, '2021-02-22 13:43:10'),
(539, 581, 1, '2021-02-22 14:06:24'),
(540, 582, 1, '2021-02-22 14:13:11'),
(541, 583, 1, '2021-02-22 14:15:35'),
(542, 584, 1, '2021-02-22 18:55:33'),
(543, 585, 1, '2021-02-23 12:14:27'),
(544, 586, 1, '2021-02-23 12:18:28'),
(545, 587, 1, '2021-02-23 12:22:29'),
(546, 588, 1, '2021-02-23 12:30:33'),
(547, 589, 1, '2021-02-23 12:37:48'),
(548, 590, 1, '2021-02-23 12:45:09'),
(549, 591, 1, '2021-02-23 12:54:14'),
(550, 592, 1, '2021-02-23 12:56:48'),
(551, 593, 1, '2021-02-23 13:02:32'),
(552, 594, 1, '2021-02-23 15:32:47'),
(553, 595, 1, '2021-02-23 15:36:05'),
(554, 596, 1, '2021-02-23 15:41:57'),
(555, 597, 1, '2021-02-23 21:57:42'),
(556, 598, 1, '2021-02-23 22:01:59'),
(557, 599, 1, '2021-02-23 22:05:34'),
(558, 600, 1, '2021-02-23 22:06:19'),
(559, 601, 1, '2021-02-23 22:13:03'),
(560, 602, 1, '2021-02-23 22:14:47'),
(561, 603, 1, '2021-02-23 22:21:03'),
(562, 604, 1, '2021-02-23 22:21:51'),
(563, 605, 1, '2021-02-23 22:22:22'),
(564, 606, 1, '2021-02-23 22:23:04'),
(565, 607, 1, '2021-02-23 22:29:47'),
(566, 608, 1, '2021-02-23 22:31:41'),
(567, 609, 1, '2021-02-24 09:33:52'),
(568, 610, 1, '2021-02-24 09:35:47'),
(569, 611, 1, '2021-02-24 23:11:53'),
(570, 612, 1, '2021-02-24 23:18:16'),
(571, 613, 1, '2021-02-24 23:18:51'),
(572, 614, 1, '2021-02-24 23:26:23'),
(573, 615, 1, '2021-02-24 23:26:43'),
(574, 616, 1, '2021-02-25 18:22:33'),
(575, 617, 1, '2021-02-25 18:23:45'),
(576, 618, 1, '2021-02-25 18:24:02'),
(577, 619, 1, '2021-02-25 18:29:42'),
(578, 620, 1, '2021-02-25 19:13:57'),
(579, 621, 1, '2021-02-25 18:59:48'),
(580, 622, 1, '2021-02-25 18:59:56'),
(581, 623, 1, '2021-02-25 19:00:13'),
(582, 624, 1, '2021-02-26 08:52:14'),
(583, 625, 1, '2021-02-26 08:52:40'),
(584, 626, 1, '2021-02-26 09:31:59'),
(585, 627, 1, '2021-02-26 09:51:14'),
(586, 628, 1, '2021-02-26 09:51:43'),
(587, 629, 1, '2021-02-26 09:52:27'),
(588, 630, 1, '2021-02-26 10:01:28'),
(589, 631, 1, '2021-02-26 10:04:19'),
(590, 632, 1, '2021-02-26 10:06:30'),
(591, 633, 1, '2021-02-26 10:09:27'),
(592, 634, 1, '2021-02-26 10:11:33'),
(593, 635, 1, '2021-02-26 10:22:02'),
(594, 636, 1, '2021-02-26 10:22:47'),
(595, 637, 1, '2021-02-26 10:31:14'),
(596, 638, 1, '2021-02-26 10:41:07'),
(597, 639, 1, '2021-02-26 10:50:37'),
(598, 640, 1, '2021-02-26 10:50:56'),
(599, 641, 1, '2021-02-26 10:55:22'),
(600, 642, 1, '2021-02-26 10:58:59'),
(601, 643, 1, '2021-02-26 11:01:32'),
(602, 644, 1, '2021-02-26 11:07:18'),
(603, 645, 1, '2021-02-26 11:33:32'),
(604, 646, 1, '2021-02-26 12:15:56'),
(605, 647, 1, '2021-02-26 15:18:05'),
(606, 648, 1, '2021-02-26 15:48:29'),
(607, 649, 1, '2021-02-26 15:53:49'),
(608, 650, 1, '2021-02-26 15:57:46'),
(609, 651, 1, '2021-02-26 16:00:32'),
(610, 652, 1, '2021-02-26 16:04:51'),
(611, 653, 1, '2021-02-26 16:09:53'),
(612, 654, 1, '2021-02-26 16:14:52'),
(613, 655, 1, '2021-02-26 16:18:50'),
(614, 656, 1, '2021-02-26 16:25:31'),
(615, 657, 1, '2021-02-26 16:26:23'),
(616, 658, 1, '2021-02-26 16:30:59'),
(617, 659, 1, '2021-02-26 16:35:49'),
(618, 660, 1, '2021-02-26 16:38:19'),
(619, 661, 1, '2021-02-26 16:43:04'),
(620, 662, 1, '2021-02-26 16:46:59'),
(621, 663, 1, '2021-02-26 16:56:00'),
(622, 664, 1, '2021-02-26 17:02:08'),
(623, 665, 1, '2021-02-26 17:02:16'),
(624, 666, 1, '2021-02-26 17:04:40'),
(625, 667, 1, '2021-02-26 17:13:28'),
(626, 668, 1, '2021-02-26 17:14:20'),
(627, 669, 1, '2021-02-26 17:36:17'),
(628, 670, 1, '2021-02-26 18:29:19'),
(629, 671, 1, '2021-02-26 19:04:54'),
(630, 672, 1, '2021-02-26 19:20:59'),
(631, 673, 1, '2021-02-26 19:23:23'),
(632, 674, 1, '2021-02-27 15:17:23'),
(633, 675, 1, '2021-02-27 15:27:51'),
(634, 676, 1, '2021-02-27 15:38:22'),
(635, 677, 1, '2021-02-27 15:40:38'),
(636, 678, 1, '2021-02-27 15:48:01'),
(637, 679, 1, '2021-02-27 16:05:00'),
(638, 680, 1, '2021-02-27 16:12:00'),
(639, 681, 1, '2021-02-27 16:37:50'),
(640, 682, 1, '2021-02-27 16:43:17'),
(641, 683, 1, '2021-03-01 10:37:48'),
(642, 684, 1, '2021-03-01 10:42:08'),
(643, 685, 1, '2021-03-02 10:24:11'),
(644, 686, 1, '2021-03-02 10:28:08'),
(645, 687, 1, '2021-03-02 10:31:21'),
(646, 688, 1, '2021-03-02 10:40:29'),
(647, 689, 1, '2021-03-02 11:06:14'),
(648, 690, 1, '2021-03-02 11:15:57'),
(649, 691, 1, '2021-03-02 11:23:59'),
(650, 692, 1, '2021-03-02 11:27:59'),
(651, 693, 1, '2021-03-02 11:33:41'),
(652, 694, 1, '2021-03-02 11:42:53'),
(653, 695, 1, '2021-03-02 11:45:39'),
(654, 696, 1, '2021-03-02 11:49:23'),
(655, 697, 1, '2021-03-02 11:54:56'),
(656, 698, 1, '2021-03-02 12:01:41'),
(657, 699, 1, '2021-03-02 12:07:35'),
(658, 700, 1, '2021-03-02 12:12:32'),
(659, 701, 1, '2021-03-02 12:16:22'),
(660, 702, 1, '2021-03-02 12:19:33'),
(661, 703, 1, '2021-03-02 19:01:56'),
(662, 704, 1, '2021-03-02 19:05:09'),
(663, 705, 1, '2021-03-02 19:13:45'),
(664, 706, 1, '2021-03-02 19:20:06'),
(665, 707, 1, '2021-03-03 15:19:56'),
(666, 708, 1, '2021-03-03 15:28:00'),
(667, 709, 1, '2021-03-03 15:28:52'),
(668, 710, 1, '2021-03-03 15:33:32'),
(669, 711, 1, '2021-03-03 15:52:19'),
(670, 712, 1, '2021-03-03 15:56:06'),
(671, 713, 1, '2021-03-03 15:57:48'),
(672, 714, 1, '2021-03-03 15:58:48'),
(673, 715, 1, '2021-03-03 15:59:21'),
(674, 716, 1, '2021-03-03 16:14:22'),
(675, 717, 1, '2021-03-03 16:15:30'),
(676, 718, 1, '2021-03-03 16:20:22'),
(677, 719, 1, '2021-03-03 16:20:48'),
(678, 720, 1, '2021-03-03 18:46:44'),
(679, 721, 1, '2021-03-03 18:46:56'),
(680, 722, 1, '2021-03-03 18:57:34'),
(681, 723, 1, '2021-03-03 19:04:59'),
(682, 724, 1, '2021-03-03 19:26:56'),
(683, 725, 1, '2021-03-03 19:32:00'),
(684, 726, 1, '2021-03-03 19:39:40'),
(685, 727, 1, '2021-03-03 19:40:34'),
(686, 728, 1, '2021-03-03 19:51:15'),
(687, 729, 1, '2021-03-03 19:52:00'),
(688, 730, 1, '2021-03-03 19:56:11'),
(689, 731, 1, '2021-03-03 20:26:58'),
(690, 732, 1, '2021-03-03 20:27:28'),
(691, 733, 1, '2021-03-03 20:35:01'),
(692, 734, 1, '2021-03-03 20:55:43'),
(693, 735, 1, '2021-03-04 09:43:45'),
(694, 736, 1, '2021-03-04 10:32:15'),
(695, 737, 1, '2021-03-04 10:38:28'),
(696, 738, 1, '2021-03-04 10:42:23'),
(697, 739, 1, '2021-03-04 10:47:24'),
(698, 740, 1, '2021-03-04 10:53:22'),
(699, 741, 1, '2021-03-04 11:00:16'),
(700, 742, 1, '2021-03-04 11:02:50'),
(701, 743, 1, '2021-03-04 11:11:49'),
(702, 744, 1, '2021-03-04 12:09:19'),
(703, 745, 1, '2021-03-04 12:13:37'),
(704, 746, 1, '2021-03-04 12:56:12'),
(705, 747, 1, '2021-03-04 13:01:15'),
(706, 748, 1, '2021-03-04 13:39:57'),
(707, 749, 1, '2021-03-04 13:50:26'),
(708, 750, 1, '2021-03-04 18:58:14'),
(709, 751, 1, '2021-03-04 18:59:16'),
(710, 752, 1, '2021-03-04 19:00:13'),
(711, 753, 1, '2021-03-04 19:03:11'),
(712, 754, 1, '2021-03-04 20:37:56'),
(713, 755, 1, '2021-03-04 20:40:00'),
(714, 756, 1, '2021-03-05 10:28:04'),
(715, 757, 1, '2021-03-05 10:32:13'),
(716, 758, 1, '2021-03-05 10:34:09'),
(717, 759, 1, '2021-03-05 10:34:37'),
(718, 760, 1, '2021-03-05 15:29:08'),
(719, 761, 1, '2021-03-05 16:04:14'),
(720, 762, 1, '2021-03-05 16:37:37'),
(721, 763, 1, '2021-03-05 16:38:29'),
(722, 764, 1, '2021-03-05 16:44:47'),
(723, 765, 1, '2021-03-05 17:21:34'),
(724, 766, 1, '2021-03-05 18:40:53'),
(725, 767, 1, '2021-03-05 18:49:41'),
(726, 768, 1, '2021-03-05 18:50:27'),
(727, 769, 1, '2021-03-05 18:55:12'),
(728, 770, 1, '2021-03-05 19:00:13'),
(729, 771, 1, '2021-03-05 19:09:00'),
(730, 772, 1, '2021-03-05 19:15:09'),
(731, 773, 1, '2021-03-05 19:16:11'),
(732, 774, 1, '2021-03-05 20:13:17'),
(733, 775, 1, '2021-03-06 07:59:12'),
(734, 776, 1, '2021-03-06 07:59:46'),
(735, 777, 1, '2021-03-06 08:00:47'),
(736, 778, 1, '2021-03-06 08:29:18'),
(737, 779, 1, '2021-03-06 08:34:50'),
(738, 780, 1, '2021-03-06 08:46:59'),
(739, 781, 1, '2021-03-06 08:53:00'),
(740, 782, 1, '2021-03-06 08:59:00'),
(741, 783, 1, '2021-03-06 10:16:32'),
(742, 784, 1, '2021-03-06 10:35:54'),
(743, 785, 1, '2021-03-06 10:36:39'),
(744, 786, 1, '2021-03-06 12:20:57'),
(745, 787, 1, '2021-03-06 12:28:21'),
(746, 788, 1, '2021-03-06 12:33:12'),
(747, 789, 1, '2021-03-06 12:33:35'),
(748, 790, 1, '2021-03-06 12:36:23'),
(749, 791, 1, '2021-03-06 12:52:16'),
(750, 792, 1, '2021-03-06 12:54:04'),
(751, 793, 1, '2021-03-06 12:54:28'),
(752, 794, 1, '2021-03-06 13:11:03'),
(753, 795, 1, '2021-03-06 13:16:02'),
(754, 796, 1, '2021-03-06 13:16:21'),
(755, 797, 1, '2021-03-06 13:17:33'),
(756, 798, 1, '2021-03-06 13:20:58'),
(757, 799, 1, '2021-03-06 13:22:14'),
(758, 800, 1, '2021-03-06 13:26:05'),
(759, 801, 1, '2021-03-06 13:45:38'),
(760, 802, 1, '2021-03-06 13:46:21'),
(761, 803, 1, '2021-03-06 13:50:33'),
(762, 804, 1, '2021-03-06 13:51:00'),
(763, 805, 1, '2021-03-06 14:06:18'),
(764, 806, 1, '2021-03-06 14:07:38'),
(765, 807, 1, '2021-03-06 14:26:20'),
(766, 808, 1, '2021-03-06 14:27:34'),
(767, 809, 1, '2021-03-06 14:30:43'),
(768, 810, 1, '2021-03-06 14:33:55'),
(769, 811, 1, '2021-03-06 14:35:26'),
(770, 812, 1, '2021-03-06 14:36:27'),
(771, 813, 1, '2021-03-06 14:40:41'),
(772, 814, 1, '2021-03-06 14:55:54'),
(773, 815, 1, '2021-03-06 14:56:58'),
(774, 816, 1, '2021-03-06 14:58:15'),
(775, 817, 1, '2021-03-06 14:58:39'),
(776, 818, 1, '2021-03-06 15:51:39'),
(777, 819, 1, '2021-03-06 15:53:33'),
(778, 820, 1, '2021-03-06 15:54:04'),
(779, 821, 1, '2021-03-06 16:48:10'),
(780, 822, 1, '2021-03-06 16:48:43'),
(781, 823, 1, '2021-03-06 16:50:15'),
(782, 824, 1, '2021-03-06 16:51:46'),
(783, 825, 1, '2021-03-06 16:55:05'),
(784, 826, 1, '2021-03-06 16:55:59'),
(785, 827, 1, '2021-03-06 16:56:37'),
(786, 828, 1, '2021-03-06 16:57:27'),
(787, 829, 1, '2021-03-06 17:02:38'),
(788, 830, 1, '2021-03-07 14:59:17'),
(789, 831, 1, '2021-03-07 15:18:43'),
(790, 832, 1, '2021-03-07 15:20:14'),
(791, 833, 1, '2021-03-07 15:20:32'),
(792, 834, 1, '2021-03-07 15:21:02'),
(793, 835, 1, '2021-03-07 15:21:41'),
(794, 836, 1, '2021-03-07 15:31:48'),
(795, 837, 1, '2021-03-07 15:32:52'),
(796, 838, 1, '2021-03-07 15:33:25'),
(797, 839, 1, '2021-03-07 15:34:08'),
(798, 840, 1, '2021-03-07 15:43:37'),
(799, 841, 1, '2021-03-07 15:44:01'),
(800, 842, 1, '2021-03-07 16:03:11'),
(801, 843, 1, '2021-03-07 16:10:52'),
(802, 844, 1, '2021-03-07 16:19:45'),
(803, 845, 1, '2021-03-07 16:21:01'),
(804, 846, 1, '2021-03-07 16:21:16'),
(805, 847, 1, '2021-03-07 16:21:49'),
(806, 848, 1, '2021-03-07 16:23:08'),
(807, 849, 1, '2021-03-07 16:23:36'),
(808, 850, 1, '2021-03-07 16:28:21'),
(809, 851, 1, '2021-03-07 16:29:55'),
(810, 852, 1, '2021-03-07 16:31:00'),
(811, 853, 1, '2021-03-07 16:31:21'),
(812, 854, 1, '2021-03-07 16:31:40'),
(813, 855, 1, '2021-03-07 19:33:09'),
(814, 856, 1, '2021-03-08 11:21:17'),
(815, 857, 1, '2021-03-08 11:37:11'),
(816, 858, 1, '2021-03-08 11:39:28'),
(817, 859, 1, '2021-03-08 12:13:17'),
(818, 860, 1, '2021-03-08 12:18:25'),
(819, 861, 1, '2021-03-08 12:20:22'),
(820, 862, 1, '2021-03-08 12:26:10'),
(821, 863, 1, '2021-03-08 12:27:51'),
(822, 864, 1, '2021-03-08 12:40:19'),
(823, 865, 1, '2021-03-08 13:03:54'),
(824, 866, 1, '2021-03-08 13:45:34'),
(825, 867, 1, '2021-03-08 13:45:52'),
(826, 868, 1, '2021-03-08 13:48:24'),
(827, 869, 1, '2021-03-08 19:34:54'),
(828, 870, 1, '2021-03-08 19:45:48'),
(829, 871, 1, '2021-03-09 15:27:28'),
(830, 872, 1, '2021-03-09 19:51:55'),
(831, 873, 1, '2021-03-09 20:53:15'),
(832, 874, 1, '2021-03-10 18:55:06'),
(833, 875, 1, '2021-03-11 15:12:02'),
(834, 876, 1, '2021-03-11 18:57:51'),
(835, 877, 1, '2021-03-11 19:26:39'),
(836, 878, 1, '2021-03-14 10:35:39'),
(837, 879, 1, '2021-03-16 08:02:18'),
(838, 880, 1, '2021-03-16 08:12:01'),
(839, 881, 1, '2021-03-17 09:53:01'),
(840, 882, 1, '2021-03-17 09:53:29'),
(841, 883, 1, '2021-03-17 10:12:33');

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
-- Indexes for table `catalogue_items`
--
ALTER TABLE `catalogue_items`
  ADD PRIMARY KEY (`CatalogueItemId`),
  ADD KEY `ProductId` (`ProductId`),
  ADD KEY `LotId` (`LotId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`GenderId`);

--
-- Indexes for table `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`LotId`),
  ADD KEY `ProductId` (`ProductId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `lot_item`
--
ALTER TABLE `lot_item`
  ADD PRIMARY KEY (`LotItemId`),
  ADD KEY `LotId` (`LotId`),
  ADD KEY `CatalogueItemId` (`CatalogueItemId`);

--
-- Indexes for table `mobile_users`
--
ALTER TABLE `mobile_users`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `objectives`
--
ALTER TABLE `objectives`
  ADD PRIMARY KEY (`ObjectiveId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductId`),
  ADD KEY `UserId` (`UserId`);

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
-- Indexes for table `scan`
--
ALTER TABLE `scan`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`TeamId`),
  ADD KEY `ProjectId` (`ProjectId`);

--
-- Indexes for table `team_leaders`
--
ALTER TABLE `team_leaders`
  ADD PRIMARY KEY (`TeamLeaderId`),
  ADD KEY `TeamId` (`TeamId`),
  ADD KEY `AdministratorId` (`AdministratorId`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`TeamMemberId`),
  ADD KEY `TeamId` (`TeamId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  ADD PRIMARY KEY (`TermsId`),
  ADD KEY `UserId` (`UserId`);

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
  MODIFY `AdministratorId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `AdministratorSessionLogId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `administrator_user_access_privileges`
--
ALTER TABLE `administrator_user_access_privileges`
  MODIFY `AdministratorUserAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `administrator_user_roles`
--
ALTER TABLE `administrator_user_roles`
  MODIFY `AdministratorUserRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `administrator_user_session_activities`
--
ALTER TABLE `administrator_user_session_activities`
  MODIFY `AdministratorUserSessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `admin_session_activities`
--
ALTER TABLE `admin_session_activities`
  MODIFY `AdminSessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_session_logs`
--
ALTER TABLE `admin_session_logs`
  MODIFY `AdminSessionLogId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

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
  MODIFY `AdminUserSessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `BranchId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `branch_activation`
--
ALTER TABLE `branch_activation`
  MODIFY `BranchActivationId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `branch_projects`
--
ALTER TABLE `branch_projects`
  MODIFY `BranchProjectId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `catalogue_items`
--
ALTER TABLE `catalogue_items`
  MODIFY `CatalogueItemId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `GenderId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lots`
--
ALTER TABLE `lots`
  MODIFY `LotId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `lot_item`
--
ALTER TABLE `lot_item`
  MODIFY `LotItemId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_users`
--
ALTER TABLE `mobile_users`
  MODIFY `UserId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `objectives`
--
ALTER TABLE `objectives`
  MODIFY `ObjectiveId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
-- AUTO_INCREMENT for table `scan`
--
ALTER TABLE `scan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `session_activities`
--
ALTER TABLE `session_activities`
  MODIFY `SessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `session_logs`
--
ALTER TABLE `session_logs`
  MODIFY `SessionLogId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=884;

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
  MODIFY `TeamId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `team_leaders`
--
ALTER TABLE `team_leaders`
  MODIFY `TeamLeaderId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `TeamMemberId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  MODIFY `TermsId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `users_objectives`
--
ALTER TABLE `users_objectives`
  MODIFY `UsersObectivesId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  MODIFY `UserAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `UserRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `user_session_activities`
--
ALTER TABLE `user_session_activities`
  MODIFY `UserSessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=842;

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
-- Constraints for table `catalogue_items`
--
ALTER TABLE `catalogue_items`
  ADD CONSTRAINT `catalogue_items_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catalogue_items_ibfk_2` FOREIGN KEY (`LotId`) REFERENCES `lots` (`LotId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catalogue_items_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lots`
--
ALTER TABLE `lots`
  ADD CONSTRAINT `lots_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`),
  ADD CONSTRAINT `lots_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`);

--
-- Constraints for table `lot_item`
--
ALTER TABLE `lot_item`
  ADD CONSTRAINT `lot_item_ibfk_1` FOREIGN KEY (`LotId`) REFERENCES `lots` (`LotId`),
  ADD CONSTRAINT `lot_item_ibfk_2` FOREIGN KEY (`CatalogueItemId`) REFERENCES `catalogue_items` (`CatalogueItemId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`);

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
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`ProjectId`) REFERENCES `projects` (`ProjectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_leaders`
--
ALTER TABLE `team_leaders`
  ADD CONSTRAINT `team_leaders_ibfk_1` FOREIGN KEY (`TeamId`) REFERENCES `teams` (`TeamId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_leaders_ibfk_2` FOREIGN KEY (`AdministratorId`) REFERENCES `administrator` (`AdministratorId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_members`
--
ALTER TABLE `team_members`
  ADD CONSTRAINT `team_members_ibfk_1` FOREIGN KEY (`TeamId`) REFERENCES `teams` (`TeamId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_members_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  ADD CONSTRAINT `terms_and_conditions_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`);

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
