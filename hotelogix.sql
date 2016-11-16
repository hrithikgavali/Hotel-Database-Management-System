-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2016 at 08:04 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelogix`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Billno` int(11) NOT NULL,
  `CustID` int(11) NOT NULL,
  `Roomno` int(11) NOT NULL,
  `Tariff` double NOT NULL,
  `Servicecharges` double DEFAULT NULL,
  `Cardno` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Billno`, `CustID`, `Roomno`, `Tariff`, `Servicecharges`, `Cardno`) VALUES
(5, 31, 101, 2000, NULL, 123),
(6, 31, 101, 2000, NULL, 122),
(7, 31, 102, 2500, NULL, 255),
(8, 31, 102, 2500, NULL, 2147483647),
(9, 31, 102, 2500, NULL, 2147483647),
(10, 31, 102, 2500, NULL, 2147483647),
(11, 31, 102, 2500, NULL, 2147483647),
(12, 31, 102, 2500, NULL, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustID` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `City` varchar(500) NOT NULL,
  `Mobno` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustID`, `Email`, `Password`, `FirstName`, `LastName`, `Gender`, `City`, `Mobno`) VALUES
(31, 'abc@gmail.com', 'abc', 'abc', 'xyz', 'Male', 'Mumbai', 9167623595),
(32, 'hritikgavali@gmail.com', 'sasjf', 'sdf', 'df', 'Male', 'sdf', 45646),
(33, 'dfg', 'dfg', 'fgd', 'dfg', '', 'dg', 54645),
(34, 'sdf', 'sdf', 'sdf', 'sdf', 'Female', 'f', 45),
(35, 'asd', 'jkl', 'jkl', 'ad', 'Male', 's', 42),
(36, 'asdewr', 'ererws', 'sdfs', 'sdfsdf', 'Male', 'sdfsf', 456768),
(37, 'absdf', 'wetw', 'retert', 'ertet', 'Male', 'retert', 8797897),
(38, 'fghf@gmail.com', 'fgh', 'hfh', 'fgh', 'Male', 'fgh', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmpID` int(50) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `City` text NOT NULL,
  `Phno` bigint(20) NOT NULL,
  `Dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpID`, `FirstName`, `LastName`, `City`, `Phno`, `Dept`) VALUES
(101, 'Hrithik', 'Gavali', 'Mumbai', 99991, '100'),
(102, 'Devika', 'Jalgaonkar', 'Mumbai', 78888, '55');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `EmpID` int(50) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`EmpID`, `Email`, `Password`) VALUES
(101, 'hritikgavali@gmail.com', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `EmpID` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Shift` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`EmpID`, `Email`, `Password`, `Shift`) VALUES
(102, 'devika@gmail.com', '123', 'Morning');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `BookingID` int(11) NOT NULL,
  `CustID` int(11) NOT NULL,
  `Roomno` int(11) NOT NULL,
  `Checkin` date NOT NULL,
  `Checkout` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`BookingID`, `CustID`, `Roomno`, `Checkin`, `Checkout`) VALUES
(41, 31, 101, '2016-10-11', '2016-10-12'),
(42, 31, 102, '2016-10-11', '2016-10-12'),
(43, 31, 102, '2016-10-18', '2016-10-22'),
(46, 31, 101, '2016-10-19', '2016-10-20'),
(56, 31, 101, '2016-10-18', '2016-10-19'),
(58, 31, 102, '2016-10-27', '2016-10-28'),
(59, 31, 102, '2016-10-26', '2016-10-27'),
(60, 31, 102, '2016-10-24', '2016-10-26'),
(61, 31, 102, '2016-10-24', '2016-10-26'),
(62, 31, 102, '2016-10-24', '2016-10-26'),
(63, 31, 102, '2016-10-24', '2016-10-26');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Roomno` int(11) NOT NULL,
  `Tariff` double NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Choice` varchar(10) NOT NULL,
  `View` varchar(20) NOT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Roomno`, `Tariff`, `Type`, `Choice`, `View`, `Capacity`) VALUES
(101, 2000, 'deluxe', 'ac', 'garden', 2),
(102, 2500, 'deluxe', 'ac', 'garden', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Billno`),
  ADD KEY `CustID` (`CustID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Mobno` (`Mobno`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmpID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD UNIQUE KEY `Unique` (`Email`),
  ADD KEY `EmpID` (`EmpID`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD KEY `EmpID` (`EmpID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `CustID` (`CustID`),
  ADD KEY `Roomno` (`Roomno`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Roomno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `Billno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`CustID`) REFERENCES `customer` (`CustID`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`);

--
-- Constraints for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD CONSTRAINT `receptionist_ibfk_1` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `Foreign Key` FOREIGN KEY (`CustID`) REFERENCES `customer` (`CustID`),
  ADD CONSTRAINT `Foreign Key 2` FOREIGN KEY (`Roomno`) REFERENCES `room` (`Roomno`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
