-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2021 at 08:45 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `Bname` varchar(10) NOT NULL,
  `snum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`Bname`, `snum`) VALUES
('DRB1702', 0),
('DRB1801', 0),
('DRB1802', 0),
('DRB1901', 0),
('DRB1902', 0),
('DRB2001', 1),
('DRB2002', 4),
('DRB2101', 0),
('DRB2102', 0);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `cid` varchar(10) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  `chour` int(11) DEFAULT NULL,
  `instructor` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`cid`, `cname`, `chour`, `instructor`) VALUES
('cc112', 'Logic & Crit.', 4, '1764663'),
('cc122', 'History', 4, '4147803'),
('cc130A', 'Math NS', 4, '7903107'),
('cc150A', 'Comm Eng', 4, '5269392'),
('cc273', 'Accounting 2', 4, '7903107'),
('cs211', 'ICT Fundamentals', 5, '8164652'),
('cs221', 'Computer Prog 1', 5, '5162464'),
('cs222', 'Computer Prog 2', 5, '5162464'),
('cs223A', 'Windows Prog', 5, '7754164'),
('cs262', 'UNIX intro', 3, '7754164'),
('cs321', 'DS & ALGO', 5, '1477220'),
('cs342', 'Database Prog.', 5, '1477220'),
('cs343', 'System Anal.', 4, '1477220'),
('cs363', 'OS', 4, '1477220'),
('cs399', 'Enterpreneurship', 4, '1764663'),
('cs415', 'Focusing ict', 5, '9712160'),
('cs432', 'Discrete Math', 5, '9712160'),
('cs446', 'OOSE', 4, '9712160'),
('cs465', 'Network Admin', 5, '9712160'),
('cs468', 'Mobile Apps', 5, '9712160'),
('cs481', 'IT Research', 4, '7754164'),
('cs486', 'Comp. Security', 5, '5162464'),
('cs488', 'AI', 5, '8164652');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `did` varchar(2) NOT NULL,
  `dname` varchar(15) DEFAULT NULL,
  `dhead` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`did`, `dname`, `dhead`) VALUES
('cs', 'Computer Sci', '5162464'),
('se', 'Software Eng', '1477220');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `student` varchar(10) NOT NULL,
  `course` varchar(10) NOT NULL,
  `mid` float(4,2) DEFAULT NULL,
  `final` float(4,2) DEFAULT NULL,
  `cont` float(4,2) DEFAULT NULL,
  `grade` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`student`, `course`, `mid`, `final`, `cont`, `grade`) VALUES
('S10060261', 'cc112', 30.00, 50.00, 20.00, 'A'),
('S10060261', 'cc150A', 25.00, 35.00, 17.00, 'A'),
('S10060261', 'cs221', 25.00, 40.00, 17.00, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sid` varchar(10) NOT NULL,
  `fname` varchar(10) DEFAULT NULL,
  `lname` varchar(10) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `batch` varchar(10) DEFAULT NULL,
  `dept` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `fname`, `lname`, `gender`, `phone`, `email`, `batch`, `dept`) VALUES
('S10060261', 'Etsub', 'Taye', 'M', '09000000', 'etsub@gmail.com', 'DRB2002', 'CS'),
('S106355100', 'Bereket', 'Alemayehu', 'M', '09000000', 'Berket@gmail.com', 'DRB2002', 'CS'),
('S17103113', 'Edini', 'Arega', 'M', '09000000', 'edini@gmail.com', 'DRB2002', 'SE'),
('S20701069', 'asdf', 'asdf', 'M', '123456', 'test@gagdf', 'DRB1702', 'CS'),
('S269217', 'Test', 'Student', 'F', '09000000', 'test@gmail.com', 'DRB2001', 'CS'),
('S35310335', 'Bere', 'Ale', 'M', '9999999', 'bbsba@gmail.com', 'DRB1902', 'CS'),
('S5197450', 'Etsub', 'Taye', 'M', '09000000', 'etsub@gmail.om', 'DRB2002', 'CS'),
('S6178565', 'Etsub', 'Taye', 'M', '09000000', 'etsub@gmail.com', 'DRB1702', 'CS'),
('S6762056', 'Etsub', 'Taye', 'M', '0900000', 'etsub@gmail.com', 'DRB1702', 'CS'),
('S69104143', 'Test', 'input', 'M', '213423234', 'test@gmail.com', 'DRB1702', 'CS'),
('S7188012', 'Beteab', 'Admassu', 'M', '09000000', 'beteab@gmail.com', 'DRB2002', 'CS'),
('S7384219', 'Ruth', 'Bisrat', 'F', '09000000', 'ruth@gmail.com', 'DRB2002', 'SE'),
('S9773671', 'Dagim', 'Ashenafi', 'M', '09000000', 'dagim@gmail.com', 'DRB2002', 'CS');

-- --------------------------------------------------------

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `Student` varchar(10) NOT NULL,
  `Course` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` (`Student`, `Course`) VALUES
('S10060261', 'cc122'),
('S10060261', 'cc150A'),
('S10060261', 'cs211'),
('S10060261', 'cs221');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `tid` varchar(10) NOT NULL,
  `fname` varchar(10) DEFAULT NULL,
  `lname` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`tid`, `fname`, `lname`, `phone`, `email`, `salary`, `gender`) VALUES
('11078423', 'Beteab', 'admassu', 'vavav@gmail.com', '0910240095', 77777, 'M'),
('1477220', 'Bisrat', 'Garedew', '0900000000', 'bisrat@gmail.com', 20000, 'M'),
('1764663', 'Tiume', 'Lissane.', 'tiume@gmail.com', '09000000', 1764663, 'M'),
('4147803', 'Tesfaye', 'Gabisso', '0900000000', 'tesfaye@gmail.com', 20000, 'M'),
('5162464', 'Atnafu', 'Jembere', '0900000000', 'atnafu@gmail.com', 20000, 'M'),
('5269392', 'Abrham', 'Teshale', '09000000', 'abrham@gmail.com', 20000, 'F'),
('61070853', 'D234', '234', '0900000000', 'dagim@Gmail.com', 122345, 'M'),
('6717813', 'Android', 'Teacher', '90000000', '20000', 0, 'M'),
('7754164', 'Nesredin', 'Ahmed', '0900000000', 'nesredin@gmail.com', 20000, 'M'),
('7903107', 'Sebsibe', 'Unkown', '09000000', 'sebsibe@gmail.com', 20000, 'F'),
('8164652', 'Zelalem', 'Abera', '0900000000', 'zelalem@gmail.com', 20000, 'M'),
('9484397', 'Network', 'Teacher', '90000000', '20000', 0, 'M'),
('9712160', 'Prog', 'Teacher', '20000', '90000000', 2000, 'M');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uname` varchar(10) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `isadmin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uname`, `password`, `isadmin`) VALUES
('user', 'pass', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`Bname`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `instructor` (`instructor`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`did`),
  ADD KEY `dhead` (`dhead`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`student`,`course`),
  ADD KEY `course` (`course`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `batch` (`batch`),
  ADD KEY `dept` (`dept`);

--
-- Indexes for table `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`Student`,`Course`),
  ADD KEY `Course` (`Course`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uname`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`instructor`) REFERENCES `teacher` (`tid`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`dhead`) REFERENCES `teacher` (`tid`);

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`student`) REFERENCES `student` (`sid`),
  ADD CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`course`) REFERENCES `course` (`cid`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`batch`) REFERENCES `batch` (`Bname`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`batch`) REFERENCES `batch` (`Bname`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`dept`) REFERENCES `department` (`did`);

--
-- Constraints for table `takes`
--
ALTER TABLE `takes`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`Student`) REFERENCES `student` (`sid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
