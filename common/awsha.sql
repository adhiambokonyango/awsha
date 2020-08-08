-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 08, 2020 at 04:57 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `administrator_access_privileges`
--

CREATE TABLE `administrator_access_privileges` (
  `AdministratorAccessPrivilegeId` int NOT NULL,
  `AdministratorAccessPrivilegeDescription` varchar(200) NOT NULL,
  `AdministratorAccessPrivilegeCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `administrator_roles`
--

CREATE TABLE `administrator_roles` (
  `AdministratorRoleId` int NOT NULL,
  `AdministratorRoleDescription` varchar(200) NOT NULL,
  `AdministratorRoleCode` int NOT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_access_privileges`
--

CREATE TABLE `admin_user_access_privileges` (
  `AdminUserAccessPrivilegeId` int NOT NULL,
  `AdminId` int NOT NULL,
  `AdminUserRoleId` int NOT NULL,
  `AdminAccessPrivilegeId` int NOT NULL,
  `AdminPermisionStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `RoleId` int NOT NULL,
  `RoleDescription` varchar(200) NOT NULL,
  `RoleCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_admin`
--

CREATE TABLE `system_admin` (
  `AdminId` int NOT NULL,
  `AdminFirstName` varchar(200) NOT NULL,
  `AdminMiddleName` varchar(200) NOT NULL,
  `AdminSurname` varchar(200) NOT NULL,
  `AdminPhoneNumber` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `GenderId` int NOT NULL,
  `NationalId` int NOT NULL,
  `EncryptedPassword` varchar(5000) NOT NULL,
  `Salt` varchar(5000) NOT NULL,
  `RegisteredDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_admin_access_privileges`
--

CREATE TABLE `system_admin_access_privileges` (
  `AdminAccessPrivilegeId` int NOT NULL,
  `AdminAccessPrivilegeDescription` varchar(200) NOT NULL,
  `AdminAccessPrivilegeCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_admin_roles`
--

CREATE TABLE `system_admin_roles` (
  `AdminRoleId` int NOT NULL,
  `AdminRoleDescription` varchar(200) NOT NULL,
  `AdminRoleCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(1, '1', '1', '1', '1', '1', 1, 1, '6375de81b9f10065849e16f717464f7e252c0e650805a0af1f12d02480c50e939619aedaa711a9263205ab650ec0a1124bf2204ad67875a67e4348e2ceee3584', 'NglnXFlbWnxkNSrSBHG2xE/kiuwwjPj3/X1bi2kgzV9QA0Q+2bXJHMpGwHvVfvbwlpA7FEOubAV1wjV/8Z6s+hJTqij8yu/vhRqsJEPSclrbnfwzikazVEkf7NnfX79/jIKpGVG1XDqeuU5h1arAasHYNCo5aHhvpwoSTaTAFAw=', '2020-08-08');

-- --------------------------------------------------------

--
-- Table structure for table `user_access_privileges`
--

CREATE TABLE `user_access_privileges` (
  `UserAccessPrivilegesId` int NOT NULL,
  `UserId` int NOT NULL,
  `UserRoleId` int NOT NULL,
  `AccessPrivilegeId` int NOT NULL,
  `PermisionStatus` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`GenderId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleId`);

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
-- Indexes for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  ADD PRIMARY KEY (`UserAccessPrivilegesId`),
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_privileges`
--
ALTER TABLE `access_privileges`
  MODIFY `AccessPrivilegeId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `AdministratorId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `administrator_access_privileges`
--
ALTER TABLE `administrator_access_privileges`
  MODIFY `AdministratorAccessPrivilegeId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `administrator_roles`
--
ALTER TABLE `administrator_roles`
  MODIFY `AdministratorRoleId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `administrator_user_access_privileges`
--
ALTER TABLE `administrator_user_access_privileges`
  MODIFY `AdministratorUserAccessPrivilegeId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `administrator_user_roles`
--
ALTER TABLE `administrator_user_roles`
  MODIFY `AdministratorUserRoleId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_user_access_privileges`
--
ALTER TABLE `admin_user_access_privileges`
  MODIFY `AdminUserAccessPrivilegeId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_user_roles`
--
ALTER TABLE `admin_user_roles`
  MODIFY `AdminUserRoleId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `GenderId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_admin`
--
ALTER TABLE `system_admin`
  MODIFY `AdminId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_admin_access_privileges`
--
ALTER TABLE `system_admin_access_privileges`
  MODIFY `AdminAccessPrivilegeId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_admin_roles`
--
ALTER TABLE `system_admin_roles`
  MODIFY `AdminRoleId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  MODIFY `UserAccessPrivilegesId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `UserRoleId` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`GenderId`) REFERENCES `gender` (`GenderId`) ON DELETE CASCADE ON UPDATE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
