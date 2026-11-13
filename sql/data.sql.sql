-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2026 at 05:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nss_drives`
--

-- --------------------------------------------------------

--
-- Table structure for table `attends`
--

CREATE TABLE `attends` (
  `Volunteer_ID` int(11) NOT NULL,
  `Drive_ID` int(11) NOT NULL,
  `Session_No` int(11) NOT NULL,
  `Check_In_Time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attends`
--

INSERT INTO `attends` (`Volunteer_ID`, `Drive_ID`, `Session_No`, `Check_In_Time`) VALUES
(1, 101, 1, '2026-01-10 09:05:00'),
(1, 104, 1, '2026-07-01 07:10:00'),
(2, 101, 1, '2026-01-10 09:10:00'),
(2, 104, 2, '2026-07-07 15:05:00'),
(3, 102, 1, '2026-02-05 08:02:00'),
(3, 105, 1, '2026-08-15 10:10:00'),
(4, 102, 2, '2026-02-06 11:35:00'),
(4, 103, 2, '2026-03-12 13:05:00'),
(5, 101, 2, '2026-01-10 13:05:00'),
(5, 103, 1, '2026-03-12 09:00:00'),
(5, 105, 2, '2026-08-15 14:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE `award` (
  `Award_ID` int(11) NOT NULL,
  `Award_Name` varchar(120) NOT NULL,
  `Category` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `award`
--

INSERT INTO `award` (`Award_ID`, `Award_Name`, `Category`) VALUES
(501, 'Outstanding Volunteer', 'Excellence'),
(502, 'Green Champion', 'Environment'),
(503, 'Community Hero', 'Social Service'),
(504, 'Perfect Attendance', 'Participation'),
(505, 'Team Leader Award', 'Leadership');

-- --------------------------------------------------------

--
-- Table structure for table `certificate`
--

CREATE TABLE `certificate` (
  `Volunteer_ID` int(11) NOT NULL,
  `Certificate_No` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificate`
--

INSERT INTO `certificate` (`Volunteer_ID`, `Certificate_No`) VALUES
(1, 'NSS-2026-001'),
(2, 'NSS-2026-002'),
(3, 'NSS-2026-003'),
(4, 'NSS-2026-004'),
(5, 'NSS-2026-005');

-- --------------------------------------------------------

--
-- Table structure for table `certifies`
--

CREATE TABLE `certifies` (
  `Volunteer_ID` int(11) NOT NULL,
  `Drive_ID` int(11) NOT NULL,
  `Session_No` int(11) NOT NULL,
  `Coordinator_ID` int(11) NOT NULL,
  `Hours` decimal(5,2) NOT NULL,
  `Certified_On` date NOT NULL
) ;

--
-- Dumping data for table `certifies`
--

INSERT INTO `certifies` (`Volunteer_ID`, `Drive_ID`, `Session_No`, `Coordinator_ID`, `Hours`, `Certified_On`) VALUES
(1, 101, 1, 6, 3.00, '2026-01-11'),
(1, 104, 1, 6, 3.00, '2026-07-08'),
(2, 101, 1, 7, 3.00, '2026-01-11'),
(2, 104, 2, 7, 3.00, '2026-07-08'),
(3, 102, 1, 8, 3.00, '2026-02-07'),
(3, 105, 1, 8, 3.00, '2026-08-16'),
(4, 102, 2, 9, 2.50, '2026-02-07'),
(4, 103, 2, 9, 2.00, '2026-03-13'),
(5, 103, 1, 10, 3.00, '2026-03-13'),
(5, 105, 2, 10, 2.00, '2026-08-16');

-- --------------------------------------------------------

--
-- Table structure for table `collaborates_with`
--

CREATE TABLE `collaborates_with` (
  `Org_ID` int(11) NOT NULL,
  `Drive_ID` int(11) NOT NULL,
  `Partner_Role` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collaborates_with`
--

INSERT INTO `collaborates_with` (`Org_ID`, `Drive_ID`, `Partner_Role`) VALUES
(401, 101, 'Blood donation coordination'),
(402, 102, 'Plant distribution'),
(402, 104, 'Plantation guidance'),
(403, 103, 'Waste collection support'),
(405, 105, 'Donation collection');

-- --------------------------------------------------------

--
-- Table structure for table `coordinator`
--

CREATE TABLE `coordinator` (
  `Volunteer_ID` int(11) NOT NULL,
  `Department` varchar(80) NOT NULL,
  `Office_No` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coordinator`
--

INSERT INTO `coordinator` (`Volunteer_ID`, `Department`, `Office_No`) VALUES
(6, 'Computer Science', 'A-201'),
(7, 'Mechanical Engineering', 'B-105'),
(8, 'Electrical Engineering', 'C-110'),
(9, 'Civil Engineering', 'D-204'),
(10, 'Management Studies', 'E-301');

-- --------------------------------------------------------

--
-- Table structure for table `drive`
--

CREATE TABLE `drive` (
  `Drive_ID` int(11) NOT NULL,
  `Drive_Name` varchar(120) NOT NULL,
  `Cause` varchar(100) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL
) ;

--
-- Dumping data for table `drive`
--

INSERT INTO `drive` (`Drive_ID`, `Drive_Name`, `Cause`, `Start_Date`, `End_Date`) VALUES
(101, 'Campus Blood Donation', 'Healthcare', '2026-01-10', '2026-01-10'),
(102, 'Green Campus', 'Environment', '2026-02-05', '2026-02-06'),
(103, 'Clean City Campaign', 'Cleanliness', '2026-03-12', '2026-03-12'),
(104, 'Tree Plantation Week', 'Environment', '2026-07-01', '2026-07-07'),
(105, 'Cloth Donation Drive', 'Community Welfare', '2026-08-15', '2026-08-15');

-- --------------------------------------------------------

--
-- Table structure for table `earns`
--

CREATE TABLE `earns` (
  `Volunteer_ID` int(11) NOT NULL,
  `Drive_ID` int(11) NOT NULL,
  `Session_No` int(11) NOT NULL,
  `Award_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `earns`
--

INSERT INTO `earns` (`Volunteer_ID`, `Drive_ID`, `Session_No`, `Award_ID`) VALUES
(1, 101, 1, 501),
(3, 102, 1, 502),
(4, 102, 2, 503),
(2, 101, 1, 504),
(5, 103, 1, 505);

-- --------------------------------------------------------

--
-- Table structure for table `funded_by`
--

CREATE TABLE `funded_by` (
  `Sponsor_ID` int(11) NOT NULL,
  `Drive_ID` int(11) NOT NULL,
  `Amount` decimal(12,2) NOT NULL CHECK (`Amount` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `funded_by`
--

INSERT INTO `funded_by` (`Sponsor_ID`, `Drive_ID`, `Amount`) VALUES
(301, 101, 25000.00),
(302, 102, 40000.00),
(303, 103, 15000.00),
(304, 104, 30000.00),
(305, 105, 10000.00);

-- --------------------------------------------------------

--
-- Table structure for table `partner_org`
--

CREATE TABLE `partner_org` (
  `Org_ID` int(11) NOT NULL,
  `Org_Name` varchar(120) NOT NULL,
  `Org_Type` varchar(60) NOT NULL,
  `Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partner_org`
--

INSERT INTO `partner_org` (`Org_ID`, `Org_Name`, `Org_Type`, `Address`) VALUES
(401, 'Rotary Community Club', 'NGO', 'Rohtak, Haryana'),
(402, 'Youth for Nature', 'Non-profit', 'Rohtak, Haryana'),
(403, 'City Municipal Council', 'Government', 'Rohtak, Haryana'),
(404, 'Red Cross Society', 'NGO', 'Haryana'),
(405, 'Helping Neighbours', 'Community Group', 'Rohtak, Haryana');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `Drive_ID` int(11) NOT NULL,
  `Session_No` int(11) NOT NULL,
  `Venue_ID` int(11) NOT NULL,
  `Start_Time` datetime NOT NULL,
  `End_Time` datetime NOT NULL
) ;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`Drive_ID`, `Session_No`, `Venue_ID`, `Start_Time`, `End_Time`) VALUES
(101, 1, 201, '2026-01-10 09:00:00', '2026-01-10 12:00:00'),
(101, 2, 201, '2026-01-10 13:00:00', '2026-01-10 16:00:00'),
(102, 1, 202, '2026-02-05 08:00:00', '2026-02-05 11:00:00'),
(102, 2, 202, '2026-02-06 11:30:00', '2026-02-06 14:00:00'),
(103, 1, 203, '2026-03-12 09:00:00', '2026-03-12 12:00:00'),
(103, 2, 203, '2026-03-12 13:00:00', '2026-03-12 15:00:00'),
(104, 1, 204, '2026-07-01 07:00:00', '2026-07-01 10:00:00'),
(104, 2, 204, '2026-07-07 15:00:00', '2026-07-07 18:00:00'),
(105, 1, 205, '2026-08-15 10:00:00', '2026-08-15 13:00:00'),
(105, 2, 205, '2026-08-15 14:00:00', '2026-08-15 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `Sponsor_ID` int(11) NOT NULL,
  `Sponsor_Name` varchar(120) NOT NULL,
  `Sponsor_Type` varchar(60) NOT NULL,
  `Contact` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`Sponsor_ID`, `Sponsor_Name`, `Sponsor_Type`, `Contact`) VALUES
(301, 'HealthFirst Foundation', 'NGO', 'healthfirst@example.com'),
(302, 'GreenEarth Pvt Ltd', 'Corporate', 'greenearth@example.com'),
(303, 'City Care Group', 'Community', 'citycare@example.com'),
(304, 'NaturePlus', 'Corporate', 'natureplus@example.com'),
(305, 'Helping Hands Trust', 'NGO', 'helpinghands@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `student_volunteer`
--

CREATE TABLE `student_volunteer` (
  `Volunteer_ID` int(11) NOT NULL,
  `Roll_No` varchar(20) NOT NULL,
  `Branch` varchar(50) NOT NULL,
  `Year` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_volunteer`
--

INSERT INTO `student_volunteer` (`Volunteer_ID`, `Roll_No`, `Branch`, `Year`) VALUES
(1, '2025UCA1901', 'CSAI', 2),
(2, '2025UCA1902', 'CSAI', 2),
(3, '2025UCA1903', 'CSE', 2),
(4, '2025UCA1904', 'IT', 2),
(5, '2025UCA1905', 'ECE', 2);

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `Venue_ID` int(11) NOT NULL,
  `Venue_Name` varchar(120) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Capacity` int(11) NOT NULL CHECK (`Capacity` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`Venue_ID`, `Venue_Name`, `Address`, `Capacity`) VALUES
(201, 'Main Auditorium', 'Academic Block, Campus', 300),
(202, 'Central Lawn', 'Main Campus', 500),
(203, 'Community Hall', 'Rohtak, Haryana', 150),
(204, 'Sports Ground', 'University Campus', 700),
(205, 'Seminar Hall', 'Library Building', 120);

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `Volunteer_ID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Email` varchar(120) NOT NULL,
  `Gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`Volunteer_ID`, `First_Name`, `Last_Name`, `Email`, `Gender`) VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@example.com', 'Male'),
(2, 'Ananya', 'Verma', 'ananya.verma@example.com', 'Female'),
(3, 'Rohan', 'Gupta', 'rohan.gupta@example.com', 'Male'),
(4, 'Isha', 'Mehta', 'isha.mehta@example.com', 'Female'),
(5, 'Kabir', 'Singh', 'kabir.singh@example.com', 'Male'),
(6, 'Meera', 'Kapoor', 'meera.kapoor@example.com', 'Female'),
(7, 'Aditya', 'Rao', 'aditya.rao@example.com', 'Male'),
(8, 'Sanya', 'Malik', 'sanya.malik@example.com', 'Female'),
(9, 'Vivaan', 'Joshi', 'vivaan.joshi@example.com', 'Male'),
(10, 'Ishita', 'Rao', 'ishita.rao@example.com', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_phone`
--

CREATE TABLE `volunteer_phone` (
  `Volunteer_ID` int(11) NOT NULL,
  `Phone_No` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteer_phone`
--

INSERT INTO `volunteer_phone` (`Volunteer_ID`, `Phone_No`) VALUES
(1, '9876500001'),
(2, '9876500002'),
(3, '9876500003'),
(4, '9876500004'),
(5, '9876500005'),
(6, '9876500006'),
(7, '9876500007'),
(8, '9876500008'),
(9, '9876500009'),
(10, '9876500010');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attends`
--
ALTER TABLE `attends`
  ADD PRIMARY KEY (`Volunteer_ID`,`Drive_ID`,`Session_No`),
  ADD KEY `fk_attends_session` (`Drive_ID`,`Session_No`);

--
-- Indexes for table `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`Award_ID`);

--
-- Indexes for table `certificate`
--
ALTER TABLE `certificate`
  ADD PRIMARY KEY (`Volunteer_ID`,`Certificate_No`);

--
-- Indexes for table `certifies`
--
ALTER TABLE `certifies`
  ADD PRIMARY KEY (`Volunteer_ID`,`Drive_ID`,`Session_No`),
  ADD KEY `fk_certifies_coordinator` (`Coordinator_ID`);

--
-- Indexes for table `collaborates_with`
--
ALTER TABLE `collaborates_with`
  ADD PRIMARY KEY (`Org_ID`,`Drive_ID`),
  ADD KEY `fk_collab_drive` (`Drive_ID`);

--
-- Indexes for table `coordinator`
--
ALTER TABLE `coordinator`
  ADD PRIMARY KEY (`Volunteer_ID`);

--
-- Indexes for table `drive`
--
ALTER TABLE `drive`
  ADD PRIMARY KEY (`Drive_ID`);

--
-- Indexes for table `earns`
--
ALTER TABLE `earns`
  ADD PRIMARY KEY (`Volunteer_ID`,`Drive_ID`,`Session_No`),
  ADD KEY `fk_earns_award` (`Award_ID`);

--
-- Indexes for table `funded_by`
--
ALTER TABLE `funded_by`
  ADD PRIMARY KEY (`Sponsor_ID`,`Drive_ID`),
  ADD KEY `fk_funded_drive` (`Drive_ID`);

--
-- Indexes for table `partner_org`
--
ALTER TABLE `partner_org`
  ADD PRIMARY KEY (`Org_ID`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`Drive_ID`,`Session_No`),
  ADD KEY `fk_session_venue` (`Venue_ID`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`Sponsor_ID`);

--
-- Indexes for table `student_volunteer`
--
ALTER TABLE `student_volunteer`
  ADD PRIMARY KEY (`Volunteer_ID`),
  ADD UNIQUE KEY `Roll_No` (`Roll_No`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`Venue_ID`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`Volunteer_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `volunteer_phone`
--
ALTER TABLE `volunteer_phone`
  ADD PRIMARY KEY (`Volunteer_ID`,`Phone_No`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attends`
--
ALTER TABLE `attends`
  ADD CONSTRAINT `fk_attends_session` FOREIGN KEY (`Drive_ID`,`Session_No`) REFERENCES `session` (`Drive_ID`, `Session_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_attends_student` FOREIGN KEY (`Volunteer_ID`) REFERENCES `student_volunteer` (`Volunteer_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `certificate`
--
ALTER TABLE `certificate`
  ADD CONSTRAINT `fk_certificate_student` FOREIGN KEY (`Volunteer_ID`) REFERENCES `student_volunteer` (`Volunteer_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `certifies`
--
ALTER TABLE `certifies`
  ADD CONSTRAINT `fk_certifies_attendance` FOREIGN KEY (`Volunteer_ID`,`Drive_ID`,`Session_No`) REFERENCES `attends` (`Volunteer_ID`, `Drive_ID`, `Session_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_certifies_coordinator` FOREIGN KEY (`Coordinator_ID`) REFERENCES `coordinator` (`Volunteer_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `collaborates_with`
--
ALTER TABLE `collaborates_with`
  ADD CONSTRAINT `fk_collab_drive` FOREIGN KEY (`Drive_ID`) REFERENCES `drive` (`Drive_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_collab_org` FOREIGN KEY (`Org_ID`) REFERENCES `partner_org` (`Org_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coordinator`
--
ALTER TABLE `coordinator`
  ADD CONSTRAINT `fk_coordinator_volunteer` FOREIGN KEY (`Volunteer_ID`) REFERENCES `volunteer` (`Volunteer_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `earns`
--
ALTER TABLE `earns`
  ADD CONSTRAINT `fk_earns_attendance` FOREIGN KEY (`Volunteer_ID`,`Drive_ID`,`Session_No`) REFERENCES `attends` (`Volunteer_ID`, `Drive_ID`, `Session_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_earns_award` FOREIGN KEY (`Award_ID`) REFERENCES `award` (`Award_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `funded_by`
--
ALTER TABLE `funded_by`
  ADD CONSTRAINT `fk_funded_drive` FOREIGN KEY (`Drive_ID`) REFERENCES `drive` (`Drive_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_funded_sponsor` FOREIGN KEY (`Sponsor_ID`) REFERENCES `sponsor` (`Sponsor_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `fk_session_drive` FOREIGN KEY (`Drive_ID`) REFERENCES `drive` (`Drive_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_session_venue` FOREIGN KEY (`Venue_ID`) REFERENCES `venue` (`Venue_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `student_volunteer`
--
ALTER TABLE `student_volunteer`
  ADD CONSTRAINT `fk_student_volunteer` FOREIGN KEY (`Volunteer_ID`) REFERENCES `volunteer` (`Volunteer_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `volunteer_phone`
--
ALTER TABLE `volunteer_phone`
  ADD CONSTRAINT `fk_phone_volunteer` FOREIGN KEY (`Volunteer_ID`) REFERENCES `volunteer` (`Volunteer_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
