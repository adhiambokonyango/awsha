-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 06, 2020 at 09:26 PM
-- Server version: 8.0.20-0ubuntu0.20.04.1
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
(5, 'administrator', '1', '1', '1', 'administrator', 1, 1, 'cdd058eceb295fe28d7c7e2ea009e55b1e76004a9b9080d39e80aeb6a5538d4e87701b4b25a3d6a179753c9732d05f20a6bd58d7bbf71f0488c7e94e01f0899b', 'XVGfgI+OGiGpwr4tnT6EY9Mbd6saq+PjTSfDosn3NE0nSbg/G44/5XuFPFZw2jCqm4bLaanF0d0PVIisheAdzkA/i5NrgTUCf6h9fWJuDQMLAkHhY5YKH/FkUZwRkONh2jj4U1NQBl+T0FEGizsTmhPVEiVLtvS/Y7bGGN4Dtb0=', '2020-08-09'),
(6, 'administrator_two', '1', '1', '1', 'administrator_two', 1, 1, 'bc12156898ab5514524a6603699c91d075069c0993e286d9cdc8caca01e21d5f5e910c690349452f2295c296d2aa36e66887d93c27b57636e47c7d76711a200c', 'FRQJiXTOK1+G+65SWA+P3bZRu8S22Gguk3HQDsO4rwoWVBBNq3dqAJPEGNJajsWBJ2JRz0wkg0hur9udUvy5IfUxsuV62c6J+R7hsLGQKx9T24M/2AaxvkOD6ClNushyjQtgJhZW088xnMa+IYoQagxcpmgQx3CPgh3QSA6qOSw=', '2020-08-17'),
(7, 'supervisor', '1', '1', '1', 'supervisor', 1, 1, 'c5b7aebc8ac53c0626b09831adb1711ccd400c30e492d98d1a61978ffd2b1248afdba5277d66688d397bbf0c9de67e30861d3160986750d9d87196f1b8622a8b', 'UkkN4gzno3Z7CZeRIfHVm1bizAYA/Ns8H04mDS7OhaGVzZtFsG3977dxcT0gcMX04mNbFS9VwYraP5P5KPdtZVtPiyL7NW5dxwmwzOI9wb9gke4WbnFMJTacakrCVvYVvhlDMxBk2Dy9/t7X5opaqDUSL//2u91oxv5Whyv8Z6o=', '2020-08-17');

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
(1, 'login', 1);

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
(3, 5, 7, 1, 1),
(4, 6, 8, 1, 0),
(5, 7, 9, 1, 0);

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
(7, 5, 1, 0),
(8, 6, 1, 0),
(9, 7, 1, 0);

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

-- --------------------------------------------------------

--
-- Table structure for table `admin_session_activities`
--

CREATE TABLE `admin_session_activities` (
  `AdminSessionActivityId` int NOT NULL,
  `AdminSessionActivityDescription` varchar(200) NOT NULL,
  `AdminSessionActivityCode` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_session_logs`
--

CREATE TABLE `admin_session_logs` (
  `AdminSessionLogId` int NOT NULL,
  `AdminId` int NOT NULL,
  `AdminSessionStartDate` date NOT NULL,
  `AdminSessionEndDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(3, 7, 6, 1, 1);

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
(6, 7, 1, 0);

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
  `ObjectivePercentage` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(6, 'CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT', 'MOH', 10),
(7, 'COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION', 'MOH', 10),
(8, 'SET SQL_MODE = \"NO_AUTO_VALUE_ON_ZERO\"', 'UHC', 10);

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
(34, 14, '2020-09-05 18:42:52', '2020-09-05 18:42:52'),
(35, 14, '2020-09-05 19:17:54', '2020-09-05 19:17:54'),
(36, 14, '2020-09-05 19:18:30', '2020-09-05 19:18:30'),
(37, 14, '2020-09-06 20:18:55', '2020-09-06 20:18:55'),
(38, 14, '2020-09-06 20:22:46', '2020-09-06 20:22:46'),
(39, 14, '2020-09-06 20:40:13', '2020-09-06 20:40:13'),
(40, 14, '2020-09-06 20:41:19', '2020-09-06 20:41:19'),
(41, 14, '2020-09-06 20:51:52', '2020-09-06 20:51:52'),
(42, 14, '2020-09-06 20:59:36', '2020-09-06 20:59:36'),
(43, 14, '2020-09-06 21:00:38', '2020-09-06 21:00:38'),
(44, 14, '2020-09-06 21:09:21', '2020-09-06 21:09:21');

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
(7, 'admin', '1', '1', '1', 'admin', 1, 1, '6d0929befbd073be4bcf031f39db53e8599381721813eaebb1a6dafd95f4dbfd01ed75014a5e307c0008c77c66ba19c82a2eb77029bcf293edc49fa13d7e2d3c', 'zHicNizxR+0gPHXUdHMeXGYwkbjgifwGtSsLjBCKRSK8DWPpQUwtCmSHoMIVgRbIZev+d7S145vSdLlfVMcvyC0pvjHM7lfdpmNznNCAngwrw4+Psy72NFPHrTUo5TiFM0XbLQydS0OTH+k/7wwu7X2+IzA75WfgotNzbH71AMw=', '2020-08-09');

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
(1, 'login', 1);

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
(16, 'user5', '1', '1', '1', 'user5', 1, 1, '295ade885858bbc493d73c826294befef5c4e5510de97f07a0a469b76dfe0c3e5ae32a53e729a5d4f8224cd911c89640c1324c6a76dfea63a6a41450f5f87c19', '8MXiv8WaAMcg/5KbHqD3E5W1VWp5/bCvlrlKOHOcgxal7RWC8dUJD1VzxHfuyL/1+QpB32CLzF32nlX7S2+smnXQrYs+Y2LMk0GgfuWozuNCZ4bNs7jdIXAEV3Cklz9BQsNDfJIp0q/k3g0pjv929ypbHG7z0lyG99c/O9KGxjQ=', '2020-08-28');

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
(19, 16, 10, 1, 0);

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
(10, 16, 1, 0);

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
(2, 44, 1, '2020-09-06 21:09:21');

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
  MODIFY `AccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `AdministratorId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `administrator_access_privileges`
--
ALTER TABLE `administrator_access_privileges`
  MODIFY `AdministratorAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `administrator_roles`
--
ALTER TABLE `administrator_roles`
  MODIFY `AdministratorRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `administrator_session_activities`
--
ALTER TABLE `administrator_session_activities`
  MODIFY `AdministratorSessionActivityId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `administrator_session_logs`
--
ALTER TABLE `administrator_session_logs`
  MODIFY `AdministratorSessionLogId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `administrator_user_access_privileges`
--
ALTER TABLE `administrator_user_access_privileges`
  MODIFY `AdministratorUserAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `administrator_user_roles`
--
ALTER TABLE `administrator_user_roles`
  MODIFY `AdministratorUserRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `administrator_user_session_activities`
--
ALTER TABLE `administrator_user_session_activities`
  MODIFY `AdministratorUserSessionActivityId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_session_activities`
--
ALTER TABLE `admin_session_activities`
  MODIFY `AdminSessionActivityId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_session_logs`
--
ALTER TABLE `admin_session_logs`
  MODIFY `AdminSessionLogId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_user_access_privileges`
--
ALTER TABLE `admin_user_access_privileges`
  MODIFY `AdminUserAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_user_roles`
--
ALTER TABLE `admin_user_roles`
  MODIFY `AdminUserRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_user_session_activities`
--
ALTER TABLE `admin_user_session_activities`
  MODIFY `AdminUserSessionActivityId` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `BranchProjectId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `GenderId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `objectives`
--
ALTER TABLE `objectives`
  MODIFY `ObjectiveId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `ProjectId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `session_activities`
--
ALTER TABLE `session_activities`
  MODIFY `SessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `session_logs`
--
ALTER TABLE `session_logs`
  MODIFY `SessionLogId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `system_admin`
--
ALTER TABLE `system_admin`
  MODIFY `AdminId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_admin_access_privileges`
--
ALTER TABLE `system_admin_access_privileges`
  MODIFY `AdminAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_admin_roles`
--
ALTER TABLE `system_admin_roles`
  MODIFY `AdminRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users_objectives`
--
ALTER TABLE `users_objectives`
  MODIFY `UsersObectivesId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  MODIFY `UserAccessPrivilegeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `UserRoleId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_session_activities`
--
ALTER TABLE `user_session_activities`
  MODIFY `UserSessionActivityId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
