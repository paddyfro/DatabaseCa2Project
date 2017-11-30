-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2017 at 12:58 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databaseproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `building_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `room_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`building_id`, `address`, `room_num`) VALUES
(1, 'college road', 56),
(2, 'Dundalk', 39),
(3, 'Muirhevna', 77);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `course_name` varchar(30) NOT NULL,
  `course_desc` varchar(150) NOT NULL,
  `course_size` int(11) NOT NULL,
  `credits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `department_id`, `course_name`, `course_desc`, `course_size`, `credits`) VALUES
(1, 1, 'Java', 'learn java the most wonderful of languages', 45, 10),
(2, 1, 'PHP', 'learn php the most wonderful of languages, much better than Java', 30, 5),
(3, 1, 'Hardware', 'learn all about how your computer ticks', 60, 5),
(4, 1, 'Databases', 'only the most interesting course going', 25, 5),
(5, 1, 'WebProgramming', 'what was all that html stuff about again? learn it here!', 20, 10),
(6, 2, 'Construction Management', 'Learn Things Required To Be A Construction Manager', 40, 10),
(7, 2, 'Construction Technology', 'Learn construction technology', 50, 10),
(8, 3, 'Civil Engineering', 'Learn To Study Civil Engineering', 30, 5),
(9, 3, 'Electrial Engineering', 'Learn To Be A Electrical Enginer', 20, 10),
(10, 3, 'Engineering', 'Learn About The Engineering Business', 20, 10),
(11, 5, 'Intellectual Disability ', 'Theoretical knowledge and practical skills will be developed', 120, 5),
(12, 5, 'General Nursing', 'BSc (Hons) in General Nursing course', 100, 10),
(13, 6, 'Maternity Services', 'Midwives to develop their knowledge in the assessment of pregnant woman', 60, 10),
(14, 6, 'Higher Diploma in Midwifery', 'Learn About C-section', 50, 10),
(15, 7, 'Applied Early Childhood', 'Early year carers in creches, pre-schools, school age childcare services', 100, 5),
(16, 7, 'Ageing, Health & Environment', 'Ageing is a positive life event and that older people benefit', 80, 10);

--
-- Triggers `courses`
--
DELIMITER $$
CREATE TRIGGER `course_delete` AFTER DELETE ON `courses` FOR EACH ROW INSERT INTO course_messages VALUES (Null, OLD.course_id, OLD.department_id, OLD.course_name, OLD.course_desc,OLD.course_size, OLD.credits, 'Course Deleted', CURRENT_TIMESTAMP)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `course_update` AFTER UPDATE ON `courses` FOR EACH ROW INSERT INTO course_messages VALUES (Null, OLD.course_id, OLD.department_id, OLD.course_name, OLD.course_desc,OLD.course_size, OLD.credits, 'Course Details Updated', CURRENT_TIMESTAMP)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `course_messages`
--

CREATE TABLE `course_messages` (
  `MessageId` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `course_name` varchar(30) DEFAULT NULL,
  `course_desc` varchar(150) DEFAULT NULL,
  `course_size` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `messageTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_messages`
--

INSERT INTO `course_messages` (`MessageId`, `course_id`, `department_id`, `course_name`, `course_desc`, `course_size`, `credits`, `message`, `messageTime`) VALUES
(1, 17, 7, 'Ageing, Health & Environment', 'Ageing is a positive life event and that older people benefit', 80, 10, 'Course Deleted', '2017-11-30 10:36:32'),
(2, 2, 1, 'PHP', 'learn php the most wonderful of languages, much better than Java', 30, 5, 'Course Details Updated', '2017-11-30 10:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `department_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `building_id`, `department_name`) VALUES
(1, 1, 'Computing'),
(2, 1, 'Multimedia'),
(3, 2, 'Engineering'),
(4, 2, 'Building & Surveying'),
(5, 3, 'Nursing'),
(6, 3, 'Midwifery'),
(7, 3, 'Health Studies');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `department_id`, `firstName`, `lastName`, `phone`, `email`) VALUES
(1, 1, 'Mick', 'Flannagan', '45612378954', 'mickf@internet.com'),
(2, 1, 'Angus', 'Young', '0990101373', 'angus@internet.com'),
(3, 1, 'Steve', 'Rogers', '8008580085', 'stever@internet.com'),
(4, 1, 'Peter', 'Parker', '1236547854', 'peterp@internet.com'),
(5, 1, 'Logan', 'Howlett', '4587123654', 'loganh@internet.com'),
(6, 1, 'Charles', 'Xavier', '1236985478', 'charlesx@internet.com'),
(7, 1, 'Eric', 'Leshner', '6985478543', 'ericl@internet.com'),
(8, 2, 'Jack', 'OReilly', '4125688543', 'jack@internet.com'),
(9, 2, 'Neil', 'Brown', '1845325458', 'neilbrown@internet.com'),
(10, 2, 'Killian', 'Green', '0413652148', 'green@internet.com'),
(11, 3, 'Jackson', 'White', '3205497559', 'jwhite@internet.com'),
(12, 3, 'Ronan', 'Levins', '0432546927', 'levinsronan@internet.com'),
(13, 5, 'Keanan', 'James', '0412654980', 'keanan@internet.com'),
(14, 5, 'Ann', 'Black', '0412546927', 'ann@internet.com'),
(15, 5, 'Grace', 'Osborne', '0416357492', 'grace@internet.com'),
(16, 6, 'Holly', 'Brick', '0416546927', 'holly@internet.com'),
(17, 6, 'Steven', 'Lennon', '0412741093', 'steven@internet.com'),
(18, 6, 'Lisa', 'Murphy', '0417890123', 'lisa@internet.com'),
(19, 7, 'Teagan', 'Thomas', '0412544567', 'teagan@internet.com'),
(20, 7, 'Perry', 'Matthews', '0419996966', 'perry@internet.com'),
(21, 7, 'Tony', 'Hatch', '0412548521', 'tony@internet.com'),
(23, 7, 'Jim', 'Houndsbeer', '0412548521', 'jimhound@internet.com'),
(24, 7, 'Jim', 'Houndsbeer', '0412548521', 'jimhound@internet.com');

--
-- Triggers `staff`
--
DELIMITER $$
CREATE TRIGGER `staff_delete` AFTER DELETE ON `staff` FOR EACH ROW INSERT INTO staff_messages VALUES (Null, OLD.staff_id, OLD.department_id, OLD.firstName, OLD.lastName, OLD.phone, OLD.email, 'Staff Member Deleted', CURRENT_TIMESTAMP)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `staff_update` AFTER UPDATE ON `staff` FOR EACH ROW INSERT INTO staff_messages VALUES (Null, OLD.staff_id, OLD.department_id, OLD.firstName, OLD.lastName, OLD.phone, OLD.email, 'Staff Record Updated', CURRENT_TIMESTAMP)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staffcourses`
--

CREATE TABLE `staffcourses` (
  `staff_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `num_registered` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staffcourses`
--

INSERT INTO `staffcourses` (`staff_id`, `course_id`, `num_registered`) VALUES
(1, 1, 15),
(2, 3, 40),
(3, 5, 19),
(4, 4, 20),
(5, 2, 30),
(6, 3, 20),
(7, 1, 19),
(8, 2, 15),
(9, 6, 20),
(9, 9, 30),
(10, 10, 15),
(12, 7, 65),
(13, 14, 45),
(16, 12, 85),
(17, 11, 118),
(18, 15, 91),
(19, 13, 58);

-- --------------------------------------------------------

--
-- Table structure for table `staff_messages`
--

CREATE TABLE `staff_messages` (
  `MessageId` int(11) NOT NULL,
  `staffId` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `messageTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_messages`
--

INSERT INTO `staff_messages` (`MessageId`, `staffId`, `department_id`, `firstName`, `lastName`, `phone`, `email`, `message`, `messageTime`) VALUES
(2, 25, 7, 'Jim', 'Houndsbeer', '0412548521', 'jimhound@internet.com', 'Staff Member Deleted', '2017-11-30 10:17:32'),
(3, 2, 1, 'Angus', 'Young', '0990101373', 'angus@internet.com', 'Staff Record Updated', '2017-11-30 10:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `studentcourses`
--

CREATE TABLE `studentcourses` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `Registration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentcourses`
--

INSERT INTO `studentcourses` (`student_id`, `course_id`, `grade`, `Registration_date`) VALUES
(1, 1, 78, '2017-09-01'),
(5, 1, 56, '2016-09-01'),
(6, 1, 56, '2017-09-01'),
(9, 1, 69, '2017-09-01'),
(15, 1, 46, '2016-09-01'),
(1, 2, 98, '2017-09-01'),
(2, 2, 78, '2016-09-01'),
(5, 2, 48, '2016-09-01'),
(12, 2, 70, '2016-09-01'),
(13, 2, 98, '2017-09-01'),
(7, 3, 73, '2017-09-01'),
(9, 3, 45, '2016-09-01'),
(11, 3, 69, '2017-09-01'),
(1, 4, 92, '2017-09-01'),
(8, 4, 78, '2015-09-01'),
(10, 4, 12, '2017-09-01'),
(15, 4, 82, '2017-09-01'),
(19, 4, 56, '2017-09-01'),
(3, 5, 25, '2015-09-01'),
(4, 5, 85, '2017-09-01'),
(14, 5, 45, '2016-09-01'),
(19, 5, 22, '2017-09-01'),
(15, 6, 34, '2016-09-01'),
(16, 6, 62, '2017-09-01'),
(18, 7, 91, '2017-09-01'),
(21, 8, 66, '2016-09-01'),
(20, 9, 82, '2017-09-01'),
(24, 9, 33, '2016-09-01'),
(22, 10, 54, '2016-09-01'),
(23, 10, 36, '2016-09-01'),
(29, 11, 45, '2016-09-01'),
(30, 11, 64, '2015-09-01'),
(25, 12, 70, '2015-09-01'),
(28, 12, 88, '2017-09-01'),
(31, 13, 92, '2016-09-01'),
(26, 14, 85, '2017-09-01'),
(32, 15, 56, '2016-09-01'),
(27, 16, 80, '2017-09-01'),
(28, 16, 78, '2016-09-01'),
(35, 16, 38, '2016-09-01');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `birthDate` date NOT NULL,
  `address` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `firstName`, `lastName`, `birthDate`, `address`, `phone`, `email`) VALUES
(1, 'Seamus', 'McDonnell', '1986-05-23', 'dundalk', '0125478541', 'patrick@internet.com'),
(2, 'David', 'Halpenny', '1985-01-04', 'Ardee, dundalk', '0145871241', 'david@internet.com'),
(3, 'Stephen', 'Fagan', '1985-08-03', 'El Paso', '4587135421', 'stephen@internet.com'),
(4, 'Mandy', 'Smith', '1988-11-19', 'Dundalk', '0785454572', 'mandy@internet.com'),
(5, 'Brendan', 'McLaughlin', '1985-12-28', 'Belllurgan, Dundalk', '0125478541', 'brendan@internet.com'),
(6, 'Emma', 'Quiley', '1990-10-27', 'BallyBay', '08712563214', 'emmak@internet.com'),
(7, 'Linda', 'Curtis', '1986-03-23', 'Dublin', '8745126547', 'linda@internet.com'),
(8, 'Aidan', 'Hamill', '1984-05-04', 'Backrock', '7854123652', 'aidan@internet.com'),
(9, 'Lisa', 'Lawless', '1987-07-12', 'London', '4521365235', 'lisa@internet.com'),
(10, 'Tracy', 'Tarant', '1986-05-03', 'Chicago', '0145874587', 'tracy@internet.com'),
(11, 'Lauren', 'Torger', '1984-08-02', 'Chicago', '0145364787', 'lauren@internet.com'),
(12, 'Jennifer', 'Fagan', '1985-05-03', 'Dundalk', '0145236521', 'jennifer@internet.com'),
(13, 'Sharon', 'Whitford', '1989-11-11', 'Carlow', '7854125412', 'sharon@internet.com'),
(14, 'Yvonne', 'Coyle', '1991-05-03', 'Dublin', '0214587465', 'yvonne@internet.com'),
(15, 'Brad', 'Jones', '1995-07-07', 'Drogheda', '0831245814', 'bradjones@internet.com'),
(16, 'Kiersten', ' Mumma', '1986-02-05', 'Bray', '457365425', 'kierstenmumma@internet.com'),
(17, 'Cecille', 'Sealey', '1998-07-09', 'Dublin', '45269569', 'cecillesealey@internet.com'),
(18, 'Ray', 'Benesh', '1997-03-12', 'Dundalk', '0417894528', 'raybenest@internet.com'),
(19, 'Sherron', 'Prost', '1997-03-12', 'Drogheda', '085319457', 'sherronprost@internet.com'),
(20, 'Nathalie', 'Mei', '1990-04-22', 'Cork', '0128459654', 'nathaliemei@internet.com'),
(21, 'Merlin', 'Herrman', '1989-04-22', 'Kerry', '4563289451', 'merlinherrman@internet.com'),
(22, 'Scottie', 'Herold', '1987-11-03', 'Drogheda', '0862098914', 'scottieherold@internet.com'),
(23, 'Jordan', 'Johnson', '1984-06-10', 'Belfast', '0312564573', 'jordanjohnson@internet.com'),
(24, 'Hannah', 'Coldiron', '1999-01-10', 'Dundalk', '0457864573', 'hannahcoldiron@internet.com'),
(25, 'Sean', 'Terry', '1989-01-10', 'Dundalk', '0852464595', 'seant@internet.com'),
(26, 'Jayden', 'Simmonds', '1984-08-30', 'Monaghan', '0896851295', 'jaydensimms@internet.com'),
(27, 'Natasha', 'Hastings', '1989-01-10', 'Ardee', '0852464595', 'seant@internet.com'),
(28, 'Abigail', 'Crowne', '1993-12-10', 'Dundalk', '0852464595', 'seant@internet.com'),
(29, 'Benson', 'Henderson', '1981-03-10', 'Blackrock', '0852464595', 'seant@internet.com'),
(30, 'George', 'Lucas', '1989-01-15', 'Castleblaney', '0823121595', 'seant@internet.com'),
(31, 'Luke', 'Shannon', '1985-08-20', 'Drogheda', '0872464003', 'seant@internet.com'),
(32, 'Sandy', 'Brody', '1986-10-25', 'Dundalk', '0852464595', 'seant@internet.com'),
(35, 'Brooklyn', 'Tomlinson', '1987-04-18', 'Drumcar', '0832433655', 'seant@internet.com');

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `student_delete` AFTER DELETE ON `students` FOR EACH ROW INSERT INTO student_messages VALUES (Null, OLD.student_id, OLD.firstName, OLD.lastName, OLD.birthDate,OLD.address, OLD.phone, OLD.email, 'Student Deleted', CURRENT_TIMESTAMP)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `student_update` AFTER UPDATE ON `students` FOR EACH ROW INSERT INTO student_messages VALUES (Null, OLD.student_id, OLD.firstName, OLD.lastName, OLD.birthDate,OLD.address, OLD.phone, OLD.email, 'Student Details Updated', CURRENT_TIMESTAMP)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student_messages`
--

CREATE TABLE `student_messages` (
  `MessageId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `messageTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_messages`
--

INSERT INTO `student_messages` (`MessageId`, `studentId`, `firstName`, `lastName`, `birthDate`, `address`, `phone`, `email`, `message`, `messageTime`) VALUES
(1, 38, 'Simon', 'McDonnell', '1983-06-24', 'Dundalk', '0862467532', 'seant@internet.com', 'Student Deleted', '2017-11-30 10:30:42'),
(2, 1, 'Seamus', 'McDonnell', '1986-05-23', 'dundalk', '0125478541', 'patrick@internet.com', 'Student Details Updated', '2017-11-30 10:46:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`building_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `course_messages`
--
ALTER TABLE `course_messages`
  ADD PRIMARY KEY (`MessageId`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `building_id` (`building_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `staffcourses`
--
ALTER TABLE `staffcourses`
  ADD PRIMARY KEY (`staff_id`,`course_id`),
  ADD UNIQUE KEY `course_id` (`course_id`,`staff_id`);

--
-- Indexes for table `staff_messages`
--
ALTER TABLE `staff_messages`
  ADD PRIMARY KEY (`MessageId`);

--
-- Indexes for table `studentcourses`
--
ALTER TABLE `studentcourses`
  ADD PRIMARY KEY (`course_id`,`student_id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`course_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `student_messages`
--
ALTER TABLE `student_messages`
  ADD PRIMARY KEY (`MessageId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `building_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `course_messages`
--
ALTER TABLE `course_messages`
  MODIFY `MessageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `staff_messages`
--
ALTER TABLE `staff_messages`
  MODIFY `MessageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `student_messages`
--
ALTER TABLE `student_messages`
  MODIFY `MessageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

--
-- Constraints for table `staffcourses`
--
ALTER TABLE `staffcourses`
  ADD CONSTRAINT `staffcourses_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `staffcourses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `studentcourses`
--
ALTER TABLE `studentcourses`
  ADD CONSTRAINT `studentcourses_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `studentcourses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
