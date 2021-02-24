-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 15, 2021 at 02:22 PM
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
(3, 1, 19, 0),
(4, 2, 19, 0),
(5, 1, 20, 0),
(6, 2, 20, 0),
(7, 1, 21, 0),
(8, 2, 21, 0),
(9, 1, 22, 0),
(10, 2, 22, 0);

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
  `Code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Status` int NOT NULL,
  `RegisteredDate` datetime NOT NULL
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
(2, 'female'),
(3, 'None'),
(4, 'less'),
(5, 'gay'),
(6, 'gay'),
(7, 'test'),
(8, 'test'),
(9, 'test_api_post'),
(10, 'test_api_post');

-- --------------------------------------------------------

--
-- Table structure for table `lots`
--

CREATE TABLE `lots` (
  `LotId` int NOT NULL,
  `RegisteredDate` date NOT NULL,
  `ExpiryDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lots`
--

INSERT INTO `lots` (`LotId`, `RegisteredDate`, `ExpiryDate`) VALUES
(11, '2021-02-15', '2022-02-15');

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
  `ProductName` varchar(200) NOT NULL,
  `Price` int NOT NULL,
  `InStock` int NOT NULL,
  `CheckedOut` int NOT NULL,
  `BuyingPrice` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductId`, `ProductName`, `Price`, `InStock`, `CheckedOut`, `BuyingPrice`) VALUES
(2, 'faiba', 8000, 1, 1, 8000),
(3, 'tea', 200, 1, 1, 150);

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
(120, 15, '2020-10-21 20:20:32', '2020-10-21 20:20:32'),
(121, 15, '2020-10-21 20:20:41', '2020-10-21 20:20:41'),
(122, 14, '2020-10-21 20:21:38', '2020-10-21 20:21:38'),
(123, 14, '2020-10-21 20:21:41', '2020-10-21 20:21:41'),
(124, 14, '2020-10-27 11:41:34', '2020-10-27 11:41:34'),
(125, 14, '2020-10-27 11:44:07', '2020-10-27 11:44:07'),
(126, 14, '2020-10-27 12:14:42', '2020-10-27 12:14:42'),
(127, 15, '2020-10-27 12:15:34', '2020-10-27 12:15:34'),
(128, 15, '2020-10-28 12:56:47', '2020-10-28 12:56:47'),
(129, 14, '2020-10-28 12:57:05', '2020-10-28 12:57:05'),
(130, 14, '2020-10-28 12:57:08', '2020-10-28 12:57:08'),
(131, 14, '2020-10-28 12:57:21', '2020-10-28 12:57:21'),
(132, 15, '2020-10-28 12:58:48', '2020-10-28 12:58:48'),
(133, 14, '2020-10-28 12:59:17', '2020-10-28 12:59:17'),
(134, 14, '2020-10-28 13:01:06', '2020-10-28 13:01:06'),
(135, 14, '2020-10-28 13:01:09', '2020-10-28 13:01:09'),
(136, 14, '2020-10-28 13:01:16', '2020-10-28 13:01:16'),
(137, 14, '2020-10-28 13:01:37', '2020-10-28 13:01:37'),
(138, 14, '2020-10-28 14:38:40', '2020-10-28 14:38:40'),
(139, 14, '2020-10-28 14:38:44', '2020-10-28 14:38:44'),
(140, 14, '2020-10-28 14:39:24', '2020-10-28 14:39:24'),
(141, 15, '2020-10-28 14:39:32', '2020-10-28 14:39:32'),
(142, 15, '2020-10-28 14:39:35', '2020-10-28 14:39:35'),
(143, 14, '2020-10-28 14:43:49', '2020-10-28 14:43:49'),
(144, 14, '2020-10-28 14:43:52', '2020-10-28 14:43:52'),
(145, 15, '2020-10-28 14:44:23', '2020-10-28 14:44:23'),
(146, 14, '2020-10-28 15:09:08', '2020-10-28 15:09:08'),
(147, 15, '2020-10-28 15:09:35', '2020-10-28 15:09:35'),
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
(574, 14, '2021-02-15 15:17:38', '2021-02-15 15:17:38');

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
(34, 6, 15, 1),
(35, 5, 14, 1),
(36, 5, 15, 0);

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
(14, 'collins', '1', 'ochieng', '1', 'user', 1, 1, '7f09be43b46b2b0aa77d3c59cd7f2dc781a0dc2b5001135eaaa7b05a883623edeee37838e63ab4681b0ff0c47238c48afec4e23a9e6bff3f8f573ce2f3420ed0', 'f8uLl3KtU0Xlbw1YNakrfnPEQrFD5q0dWY4okf/Uvk0F5WGky2s6TZSJASbUCVvaeEEVuxxGa3gm/y4xSiMow68Wrh4/oJ7ruXUdR8IQQAaLjoji9mNGJBPPOhN7kusPFzFBeWg2XLI0ZXiLyaPaIB49Zi4RnI+DG8q/vieT8XU=', '2020-08-17'),
(15, 'gordon', '1', 'otieno', '1', 'regular_user', 1, 1, '6ae5da6165bc3877eb12d22ea145b5d7370e36c1ce81dbca61584ae344c8e67b9edb9cfc7dbd1eefa75603dfe585e0a8a03b693e7f486f8d5a9905379f52ea87', '0JTTDBX6zudlEqcMsVLMWoGJHbpDJaaTzhbtTz+AHxMnMbJVIbNejHRgIsU6RdaENvTxx6IuYdh0xZo9CFMww5Me9OBpUoVoaKJn4pRip98/cSTuyTiOL4AjzbmcoGeu1xd7zzQcg9mJEJ72LU6AshGOM3ZLz0EAzZjOvOlH5ao=', '2020-08-17'),
(19, 'user5', '1', '1', '1', 'user5', 1, 1, '70c382a4ecbcd412ba830f933d849501223f749fe243ea1effac7cb1a51f2239c94ba6d92c8605c6d9ba2298c0da2489e9f23adb6d6dd2a4f791df56acd5a130', 'wHK3Z3ohaxCviZvTUDu/EPjxoxJqMxvLOTfjis7trUNVJpmhrn9QivlM//kdBJVJqestrqIMx47oEcX9Vo9ZVJvWdedY5HOSbFazc0FOnu3IlczPAb3OM9qP4Tdogp4wzOjernYEu0a/iFpLCPc62x9tvS6zW6jFlHB4MhosxqM=', '2020-12-06'),
(20, '44', '4', '4', '4', '4', 4, 4, 'b22d08f2ac06b51b5b3a33735f95ad50fa7ba249a74ee0fe4f582b8036d5d1792a8ced16b3095f5d37fb833c28aaac8c23fbabae511dd1a75a338dc71cc97f3a', 'C3TqQRDgsZZp4AbgON2saSae1nBDSEw5PIZast8NlloP+Xde+a/apqZ/fMwRht64GXDlpInOOz7TqIX1C6jvyBidPkZ0MiVa/rjBEzC/WV6Ai8byC96IhjkN8GJOLSupT+1q0641DU9tfpjDImaidLogjMKoDVGW6Cj8Hx+IAC8=', '2020-12-16'),
(21, 'e', 't', 'g', 'v', 'v', 1, 2, 'fbfb9f245bc2d7690b048a75f19c3c229147c053bb7daa9c0f775f60625c7447592e39af2c816c280c3e47b29da319e842daa390b75375cd920b80fff6b067ec', 's+3JX15jbgBmlkjSROz68B9W2aGonI23I+/nXIwCsIGcU2O650h5guSKtXVFUiNuGA0/GnnsPhPpewQ+4N4Bstvd9/LPd5pchUKKEklk3X8DXWPUZ49f2a9q/F6lK/7ZaAkxNZQQB8eaVa7f9B+WVQrwLHmnsgpDFkjlZA1qbac=', '2021-01-14'),
(22, 'Mary ', 'Adhiambo ', 'Konyango ', '0727', 'marykonyango74@gmail.com ', 2, 1, 'f9dfc2dee8201de89e26f0fd0d87b056d2c0eeac40be594bd5802762bff9c7a700051dc3afbc610fdd5d99364bab17f8b638087eecc0a0b0a93f732b91ec1109', 'TUIdkS1GYXR0yJeqKG8EVc3woE71FI1XPh6lKUid6ahp63GoLfiCDQByyak5Om2yjlg4ZPpX1Q32cwcpAdCDBSw+nfyr6QPM5fpv92pf4GsYnJcUfp9d/XK9nVuC7gMtXdeDif6sTe8cF/Y02IYGfDzy0r99EXC62o0sT+9mK7g=', '2021-02-05');

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
(17, 15, 9, 1, 1),
(21, 17, 11, 1, 0),
(22, 18, 12, 1, 0),
(23, 19, 13, 1, 0),
(24, 20, 14, 1, 0),
(25, 21, 15, 1, 0),
(26, 22, 16, 1, 0);

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
(11, 17, 1, 0),
(12, 18, 1, 0),
(13, 19, 1, 0),
(14, 20, 1, 0),
(15, 21, 1, 0),
(16, 22, 1, 0);

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
(532, 574, 1, '2021-02-15 15:17:38');

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
  ADD KEY `LotId` (`LotId`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`GenderId`);

--
-- Indexes for table `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`LotId`);

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
  ADD PRIMARY KEY (`ProductId`);

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
  MODIFY `BranchActivationId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `branch_projects`
--
ALTER TABLE `branch_projects`
  MODIFY `BranchProjectId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `catalogue_items`
--
ALTER TABLE `catalogue_items`
  MODIFY `CatalogueItemId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `GenderId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lots`
--
ALTER TABLE `lots`
  MODIFY `LotId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `ProductId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `SessionLogId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=575;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users_objectives`
--
ALTER TABLE `users_objectives`
  MODIFY `UsersObectivesId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  MODIFY `UserAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `UserRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_session_activities`
--
ALTER TABLE `user_session_activities`
  MODIFY `UserSessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

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
  ADD CONSTRAINT `catalogue_items_ibfk_2` FOREIGN KEY (`LotId`) REFERENCES `lots` (`LotId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lot_item`
--
ALTER TABLE `lot_item`
  ADD CONSTRAINT `lot_item_ibfk_1` FOREIGN KEY (`LotId`) REFERENCES `lots` (`LotId`),
  ADD CONSTRAINT `lot_item_ibfk_2` FOREIGN KEY (`CatalogueItemId`) REFERENCES `catalogue_items` (`CatalogueItemId`) ON DELETE CASCADE ON UPDATE CASCADE;

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
