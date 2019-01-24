-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2017 at 09:38 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `compiler`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `uname` varchar(30) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uname`, `pwd`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `assignment_id` int(11) NOT NULL,
  `tchr_id` varchar(30) DEFAULT NULL,
  `assignment` text,
  `uplaod_date` varchar(30) DEFAULT NULL,
  `assign_to` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`assignment_id`, `tchr_id`, `assignment`, `uplaod_date`, `assign_to`) VALUES
(1, 'admin', 'Write a program to print Hello World.', NULL, 'First Year'),
(2, 'admin', 'Calculate the factorial of 5.', '12/12/1992', 'Second Year'),
(3, 'admin', 'Print first 10 prime numbers.', '13/11/16 15:32:49', 'Second Year'),
(4, 'admin', 'Write a program to add two matrices.', '13/11/16 17:31:11', 'Third Year'),
(5, 'admin', 'Write a program to convert decimal to binary.', '30/11/16 13:59:30', 'Final Year'),
(6, 'admin', 'Print first 10 fibonacci numbers.', '14/12/16 14:56:36', 'Second Year'),
(7, 'admin', 'Write a program to reverse a number.', '15/12/16 10:46:13', 'Third Year'),
(8, 'admin', 'Find the largest number in an array.', '13/01/17 17:29:15', 'Final Year'),
(9, 'admin', 'Write a program to add 2 numbers.', '16/01/17 10:59:17', 'First Year'),
(10, 'admin', 'Write a program to reverse a string.', '16/01/17 15:54:18', 'Final Year');

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `msg_id` int(11) NOT NULL,
  `from_msg` varchar(30) DEFAULT NULL,
  `msg` text,
  `status` varchar(30) DEFAULT NULL,
  `to_msg` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`msg_id`, `from_msg`, `msg`, `status`, `to_msg`) VALUES
(1, NULL, 'Hello', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `solve_assignment`
--

CREATE TABLE `solve_assignment` (
  `stud_as_id` int(11) NOT NULL,
  `ass_id` varchar(30) DEFAULT NULL,
  `upload_by` varchar(30) DEFAULT NULL,
  `solve_date` varchar(30) DEFAULT NULL,
  `stud_id` varchar(30) DEFAULT NULL,
  `assignment` text,
  `program` text,
  `program_name` varchar(100) DEFAULT NULL,
  `output` text,
  `ass_status` text,
  `marks` varchar(30) DEFAULT NULL,
  `program_sts` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `solve_assignment`
--

INSERT INTO `solve_assignment` (`stud_as_id`, `ass_id`, `upload_by`, `solve_date`, `stud_id`, `assignment`, `program`, `program_name`, `output`, `ass_status`, `marks`, `program_sts`) VALUES
(186, '1', 'Pranesh', '06/05/17 00:00:56', '305056', 'Write a program to print Hello World.', 'class Hello\r\n{\r\npublic static void main(String args[])\r\n{\r\nSystem.out.println("Hello World");\r\n}\r\n}', 'Hello.java', 'Hello World  ', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stud_id` int(11) NOT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `mname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `dob` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `year` varchar(30) DEFAULT NULL,
  `mobno` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `student_no` varchar(30) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `reg_date` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stud_id`, `fname`, `mname`, `lname`, `dob`, `gender`, `year`, `mobno`, `email`, `student_no`, `pwd`, `reg_date`, `status`) VALUES
(9, 'Pranesh', 'Subhash', 'Meher', '04/10/1994', 'Male', 'Final Year', '9822511412', 'praneshmeher@gmail.com', '305056', '1234', 'Fri May 05 23:55:47 IST 2017', 'False');

-- --------------------------------------------------------

--
-- Table structure for table `viewprogram`
--

CREATE TABLE `viewprogram` (
  `vp_id` int(11) NOT NULL,
  `program` text,
  `output` text,
  `stud_no` varchar(30) DEFAULT NULL,
  `marks` varchar(30) DEFAULT NULL,
  `viewby` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`assignment_id`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `solve_assignment`
--
ALTER TABLE `solve_assignment`
  ADD PRIMARY KEY (`stud_as_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stud_id`);

--
-- Indexes for table `viewprogram`
--
ALTER TABLE `viewprogram`
  ADD PRIMARY KEY (`vp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `solve_assignment`
--
ALTER TABLE `solve_assignment`
  MODIFY `stud_as_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `viewprogram`
--
ALTER TABLE `viewprogram`
  MODIFY `vp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
