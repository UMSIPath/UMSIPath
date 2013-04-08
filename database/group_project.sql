-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2013 at 08:52 PM
-- Server version: 5.5.25
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `group_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `alum_id` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(128) DEFAULT NULL,
  `lastname` varchar(128) DEFAULT NULL,
  `job_title` varchar(128) DEFAULT NULL,
  `job_description` text,
  PRIMARY KEY (`alum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_career`
--

CREATE TABLE `alumni_career` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `career_id` int(10) NOT NULL,
  `alum_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `career_id` (`career_id`),
  KEY `alum_id` (`alum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_courses`
--

CREATE TABLE `alumni_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(10) NOT NULL,
  `alum_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `alum_id` (`alum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_skills`
--

CREATE TABLE `alumni_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_id` int(10) NOT NULL,
  `alum_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `skill_id` (`skill_id`),
  KEY `alum_id` (`alum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `career_id` int(10) NOT NULL AUTO_INCREMENT,
  `career_title` varchar(128) DEFAULT NULL,
  `career_description` text,
  PRIMARY KEY (`career_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `careers`
--

INSERT INTO `careers` (`career_id`, `career_title`, `career_description`) VALUES
(1, 'Digital Archivist', 'Working with digital materials archivally.'),
(2, 'User Experience Desginer', 'Designing experience for the users.'),
(3, 'Processing Archivist', 'You process collections.'),
(4, 'Mobile App Developer', 'Make stuff work from your iPhone'),
(5, 'Youth Librarian', 'Teach kids to read'),
(6, 'Academic Librarian', 'Save the professors!');

-- --------------------------------------------------------

--
-- Table structure for table `careers_skills`
--

CREATE TABLE `careers_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `career_id` int(10) NOT NULL,
  `skill_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `career_id` (`career_id`),
  KEY `skill_id` (`skill_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `careers_skills`
--

INSERT INTO `careers_skills` (`id`, `career_id`, `skill_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 4),
(4, 3, 5),
(5, 3, 4),
(6, 4, 2),
(7, 4, 5),
(8, 2, 34),
(9, 2, 35),
(10, 2, 41);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(10) NOT NULL AUTO_INCREMENT,
  `course_title` varchar(128) DEFAULT NULL,
  `course_number` varchar(128) DEFAULT NULL,
  `course_description` text,
  `syllabus` varchar(256) DEFAULT NULL,
  `units` varchar(128) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_title`, `course_number`, `course_description`, `syllabus`, `units`, `type`) VALUES
(6, 'Information in Social Systems: Collecting Flows and Processing', '500', NULL, NULL, '3', 'Lecture'),
(7, 'Contextual Inquiry and Project Management', '501', NULL, NULL, '3', 'Lecture'),
(8, 'Networked Computing: Storage, Communication, and Processing', '502', NULL, NULL, '3', 'Lecture'),
(9, 'Foundations of Information Policy Analysis and Design', '507', NULL, NULL, '3', 'Seminar'),
(10, 'Data Security and Privacy: Legal, Policy, and Enterprise Issues', '510', NULL, NULL, '3', 'Lecture'),
(11, 'Special Topics', '511', NULL, NULL, '3', 'Lecture'),
(12, 'Special Topics', '515', NULL, NULL, '3', 'Lecture'),
(13, 'Special Topics', '517', NULL, NULL, '3', 'Lecture'),
(14, 'Intellectual Propery and Information Law', '519', NULL, NULL, '3', 'Seminar'),
(15, 'Graphic Design', '520', NULL, NULL, '3', 'Lecture'),
(16, 'Special Topics', '521', NULL, NULL, '3', 'Lecture'),
(17, 'Special Topics', '522', NULL, NULL, '1', 'Lecture'),
(18, 'Informantion and Control', '523', NULL, NULL, '3', 'Lecture'),
(19, 'Empirical Methods for Health Informatics', '525', NULL, NULL, '3', 'Lecture'),
(20, 'Records Management: Principles and Practices', '528', NULL, NULL, '3', 'Lecture'),
(21, 'eCommunities', '529', NULL, NULL, '3', 'Lecture'),
(22, 'Principles in Management', '530', NULL, NULL, '3', 'Lecture'),
(23, 'Human Interaction in Information Retrieval', '531', NULL, NULL, '3', 'Lecture'),
(24, 'Digital Government I: Information Technology and Decmocratic Politics', '532', NULL, NULL, '1.5', 'Seminar'),
(25, 'Digital Government II: Information Technology and Democratic Administration', '533', NULL, NULL, '1.5', 'Seminar'),
(26, 'Theories of Social Influence', '534', NULL, NULL, '3', 'Lecture'),
(27, 'Dead Media: Preserving Culture and Context', '535', NULL, NULL, '3', 'Lecture'),
(28, 'Design of Complex Websites', '539', NULL, NULL, '3', 'Lecture'),
(29, 'Knowledge of Information Infrastructures', '541', NULL, NULL, '3', 'Lecture'),
(30, 'Introduction to Health Informatics', '542', NULL, NULL, '3', 'Seminar'),
(31, 'Programming I', '543', NULL, NULL, '3', 'Lecture'),
(32, 'Introduction to Statistics and Data Analysis', '544', NULL, NULL, '3', 'Lecture'),
(33, 'Information Technology and Development', '545', NULL, NULL, '3', 'Lecture'),
(34, 'Personal Privacy: Policy, Practice and Technology Issues', '546', NULL, NULL, '3', 'Lecture'),
(35, 'Principles of Software Design for Learning', '548', NULL, NULL, '3', 'Seminar'),
(36, 'Transformative Learning and Teaching with Technology', '549', NULL, NULL, '3', 'Seminar'),
(37, 'Seminar On Information Policy', '550', NULL, NULL, '3', 'Seminar'),
(38, 'Information Seeking Behavior', '551', NULL, NULL, '3', 'Lecture'),
(39, 'Natural Language Processing', '561', NULL, NULL, '3', 'Lecture'),
(40, 'Microeconomics for Information Professionals', '562', NULL, NULL, '1.5', 'Lecture'),
(41, 'Game Theory', '563', NULL, NULL, '1.5', 'Lecture'),
(42, 'Health Informations Leadership Seminar', '573', NULL, NULL, '1', 'Discussion'),
(43, 'Health Informatics Project Seminar', '574', NULL, NULL, '1', 'Seminar'),
(44, 'Community Informatics Seminar', '575', NULL, NULL, '1.5', 'Lecture'),
(45, 'Government Information: Issues, Resources, and Policy', '579', NULL, NULL, '3', 'Lecture'),
(46, 'Understanding Records and Archives: Principles and Practices', '580', NULL, NULL, '3', 'Lecture'),
(47, 'Preservation Administration', '581', NULL, NULL, '3', 'Lecture'),
(48, 'Introduction to Interaction Design', '582', NULL, NULL, '3', 'Lecture'),
(49, 'Recommender Systems', '583', NULL, NULL, '1.5', 'Lecture'),
(50, 'Mus Bibliogr', '586', NULL, NULL, '3', 'Seminar'),
(51, 'Fundamentals of Human Behavior', '588', NULL, NULL, '3', 'Lecture'),
(52, 'History of Computers and the Internet', '589', NULL, NULL, '3', 'Lecture'),
(53, 'Data Manipulation', '601', NULL, NULL, '1.5', 'Lecture'),
(54, 'Digital Preservation Workshop', '602', NULL, NULL, '1.5', 'Seminar'),
(55, 'Economics of Sustainable Digital Information', '603', NULL, NULL, '1.5', 'Lecture'),
(56, 'Personal Informatics Design', '606', NULL, NULL, '3', 'Lecture'),
(57, 'Networks', '608', NULL, NULL, '3', 'Lecture'),
(58, 'Pervasive Interaction Design', '612', NULL, NULL, '3', 'Lecture'),
(59, 'Choice Architecture', '617', NULL, NULL, '3', 'Lecture'),
(60, 'Exploratory Data Analysis', '618', NULL, NULL, '1.5', 'Lecture'),
(61, 'Collection Development and Management', '620', NULL, NULL, '3', 'Lecture'),
(62, 'Information, Ethics, and Applied Politics', '621', NULL, NULL, '3', 'Lecture'),
(63, 'Needs Assessment and Usability Evaluation', '622', NULL, NULL, '3', 'Lecture'),
(64, 'Research Methods for Information Professionals', '623', NULL, NULL, '3', 'Seminar'),
(65, 'Media for Children and Young Adults', '624', NULL, NULL, '3', 'Lecture'),
(66, 'Digital Preservation', '625', NULL, NULL, '3', 'Lecture'),
(67, 'Management of Nonprofit Libraries and Information Services', '626', NULL, NULL, '3', 'Lecture'),
(68, 'Managing the IT Org', '627', NULL, NULL, '3', 'Lecture'),
(69, 'Access Systems for Archival Materials', '629', NULL, NULL, '3', 'Lecture'),
(70, 'Security in the Digital World', '630', NULL, NULL, '3', 'Seminar'),
(71, 'Content Managemt Systems', '631', NULL, NULL, '1.5', 'Lecture'),
(72, 'Appraisal of Archives', '632', NULL, NULL, '3', 'Lecture'),
(73, 'History of Books and Print', '633', NULL, NULL, '3', 'Lecture'),
(74, 'Application Platform Configuration', '634', NULL, NULL, '1.5', 'Lecture'),
(75, 'Application Platform Customization', '635', NULL, NULL, '1.5', 'Lecture'),
(76, 'Research Seminar on Archives and Institutions of Memory', '637', NULL, NULL, '3', 'Lecture'),
(77, 'School Library Media Management', '638', NULL, NULL, '3', 'Lecture'),
(78, 'Web Archiving', '639', NULL, NULL, '1.5', 'Lecture'),
(79, 'Digital Libraries and Archives', '640', NULL, NULL, '3', 'Lecture'),
(80, 'Information Literacy for Teaching and Learning', '641', NULL, NULL, '3', 'Lecture'),
(81, 'Advanced Topics in Health Informatics', '642', NULL, NULL, '3', 'Lecture'),
(82, 'Professional Practice In Libraries and Information Centers', '643', NULL, NULL, '3', 'Lecture'),
(83, 'Information Use in Communities', '645', NULL, NULL, '3', 'Seminar'),
(84, 'Information Economics', '646', NULL, NULL, '1.5', 'Lecture'),
(85, 'Information Resources and Services', '647', NULL, NULL, '3', 'Lecture'),
(86, 'Info Culture: Theory and Methods in the History and Sociology of Information Technology', '648', NULL, NULL, '3', 'Seminar'),
(87, 'Information Visualization', '649', NULL, NULL, '3', 'Lecture'),
(88, 'Information Retrieval', '650', NULL, NULL, '3', 'Lecture'),
(89, 'Physical Treatment Processes for Preservation Administrators', '651', NULL, NULL, '1.5', 'Lecture'),
(90, 'Electronic Commerce', '652', NULL, NULL, '3', 'Lecture'),
(91, 'Evidence-Informed Decision-Making for the 21st Century Health Care', '653', NULL, NULL, '3', 'Lecture'),
(92, 'Critical Policy Issues in Health IT', '654', NULL, NULL, '3', 'Lecture'),
(93, 'Management of Electronic Records', '655', NULL, NULL, '3', 'Lecture'),
(94, 'Information Technology and International Development', '657', NULL, NULL, '3', 'Lecture'),
(95, 'Information Architecture', '658', NULL, NULL, '3', 'Lecture'),
(96, 'Entrepreurship in the Information Industry', '663', NULL, NULL, '3', 'Lecture'),
(97, 'Database Application Design', '664', NULL, NULL, '3', 'Lecture'),
(98, 'Online Search and Databases', '665', NULL, NULL, '3', 'Lecture'),
(99, 'Organization of Information Resources', '666', NULL, NULL, '3', 'Lecture'),
(100, 'Digitization for Preservation', '675', NULL, NULL, '1.5', 'Lecture'),
(101, 'Preserving Sound and Motion', '678', NULL, NULL, '1.5', 'Lecture'),
(102, 'Aggregation & Prediction Markets', '679', NULL, NULL, '1.5', 'Lecture'),
(103, 'ICD: Contracting', '680', NULL, NULL, '1.5', 'Lecture'),
(104, 'Intern/Field Seminar', '681', NULL, NULL, '6', 'Seminar'),
(105, 'Interface and Interaction', '682', NULL, NULL, '3', 'Lecture'),
(106, 'Reputation Systems', '683', NULL, NULL, '1.5', 'Lecture'),
(107, 'Seminar in Entrepreneurship: Building the Company', '685', NULL, NULL, '3', 'Seminar'),
(108, 'User-Generated Content', '686', NULL, NULL, '1.5', 'Lecture'),
(109, 'Social Interaction Experience', '689', NULL, NULL, '3', 'Lecture'),
(110, 'Intern/Field Exper', '690', NULL, NULL, '6', 'Ind Study'),
(111, 'Advanced Project and Social Computing Design', '694', NULL, NULL, '3', 'Lecture'),
(112, 'Science Tech and Med', '719', NULL, NULL, '3', 'Recitation'),
(113, 'Data Mining: Methods and Applications', '721', NULL, NULL, '3', 'Seminar'),
(114, 'Qualitative Methods', '724', NULL, NULL, '3', 'Seminar'),
(115, 'Index of Leading', '730', NULL, NULL, '1', 'Seminar'),
(117, 'Data Curation', '754', NULL, NULL, '3', 'Lecture'),
(118, 'Language & Information', '760', NULL, NULL, '3', 'Lecture'),
(119, 'Advanced Natural Language Processing and Information Retrieval', '767', NULL, NULL, '3', 'Seminar'),
(120, 'Independent Study', '791', NULL, NULL, '3', 'Ind Study');

-- --------------------------------------------------------

--
-- Table structure for table `courses_careers`
--

CREATE TABLE `courses_careers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `career_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `career_id` (`career_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `courses_skills`
--

CREATE TABLE `courses_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `skill_id` (`skill_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `courses_skills`
--

INSERT INTO `courses_skills` (`id`, `skill_id`, `course_id`) VALUES
(8, 6, 6),
(9, 5, 7),
(10, 8, 6),
(11, 9, 6),
(12, 10, 74),
(13, 11, 74),
(14, 12, 46),
(15, 13, 46),
(16, 14, 46),
(17, 15, 28),
(18, 16, 28),
(19, 17, 28),
(20, 18, 51),
(21, 19, 51),
(22, 19, 26),
(23, 20, 51),
(24, 21, 51),
(25, 22, 21),
(26, 23, 94),
(27, 24, 26),
(28, 25, 6),
(29, 26, 15),
(30, 27, 15),
(31, 28, 48),
(32, 29, 48),
(33, 30, 48),
(34, 31, 48),
(35, 32, 48),
(36, 33, 21),
(37, 34, 63),
(38, 35, 63),
(39, 36, 63),
(40, 37, 63),
(41, 38, 63),
(42, 39, 97),
(43, 40, 97),
(44, 41, 97),
(45, 42, 97),
(46, 43, 95),
(47, 44, 6),
(48, 44, 48),
(71, 2, 97);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(10) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(128) DEFAULT NULL,
  `skill_description` text NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `skill_name`, `skill_description`) VALUES
(1, 'GoldenThread', ''),
(2, 'PHP', 'PHP is a programming language that provides for interactive web design.'),
(3, 'Film preservation', 'Film preservation is a skill that is useful in archival sciences. It teaches how to preserve film for sustainable preservation in the long term.'),
(4, 'Sound preservation', ''),
(5, 'Python', 'Python is an introduction-level computer language. It is very good for working with text-based information.'),
(6, 'Contextual Inquiry', 'Contextual Inquiry is a method of analysis in which communication flow is examined between a group of people.'),
(7, 'Team Building', 'Team Building is building teams.'),
(8, 'Project Management', ''),
(9, 'User Research', ''),
(10, 'Drupal', 'Drupal is a content management system that is very useful in the information sciences.'),
(11, 'Content Management Systems', ''),
(12, 'Archives and Records Administration', ''),
(13, 'Ethics', ''),
(14, 'Archival Technologies', ''),
(15, 'HTML', ''),
(16, 'CSS', ''),
(17, 'Google App Engine', ''),
(18, 'User-Centered Design', ''),
(19, 'Cognitive Psychology', ''),
(20, 'Heuristics', ''),
(21, 'Information Processing', ''),
(22, 'Online Communities', ''),
(23, 'Analysis of Development Projects', ''),
(24, 'Choice Architecture', ''),
(25, 'Information Knowledge', ''),
(26, 'Adobe CS Suite', ''),
(27, 'Color Theory', ''),
(28, 'Wireframing', ''),
(29, 'Prototyping', ''),
(30, 'Sketching', ''),
(31, 'Iterative Design', ''),
(32, 'Axure', ''),
(33, 'Design of Social Computing Sites', ''),
(34, 'User Experience Research', ''),
(35, 'User Experience Evaluation', ''),
(36, 'Performance Analysis', ''),
(37, 'System Assessment', ''),
(38, 'Usability Testing', ''),
(39, 'MySQL', ''),
(40, 'Ajax', ''),
(41, 'Javascript', ''),
(42, 'Json', ''),
(43, 'Data Mapping', ''),
(44, 'Group Teamwork', 'The ability to successfully work in teams is critical for information professionals. This skill helps teach communication, task management, and working with others successfully.');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(128) DEFAULT NULL,
  `lastname` varchar(128) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `status` enum('prospective','current') NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `firstname`, `lastname`, `username`, `password`, `status`) VALUES
(1, 'Jessica', 'Schaengold', 'jschaen', 'password', 'current'),
(2, 'Edgar', 'Nunez', 'enunez', 'password', 'current'),
(3, 'Emily', 'Reynolds', 'ereynolds', 'password', 'current'),
(4, 'Maura', 'Youngman', 'myoung', 'password', 'current'),
(5, 'Ray', 'Alexander', 'ralex', 'password', 'current');

-- --------------------------------------------------------

--
-- Table structure for table `students_careers`
--

CREATE TABLE `students_careers` (
  `studentscareers_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `career_id` int(10) NOT NULL,
  PRIMARY KEY (`studentscareers_id`),
  KEY `student_id` (`student_id`),
  KEY `career_id` (`career_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `students_careers`
--

INSERT INTO `students_careers` (`studentscareers_id`, `student_id`, `career_id`) VALUES
(1, 1, 1),
(2, 1, 5),
(3, 3, 3),
(4, 2, 4),
(5, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `students_courses`
--

CREATE TABLE `students_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `students_history`
--

CREATE TABLE `students_history` (
  `studentshistory_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  PRIMARY KEY (`studentshistory_id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `students_skills`
--

CREATE TABLE `students_skills` (
  `studentsskills_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `skill_id` int(10) NOT NULL,
  PRIMARY KEY (`studentsskills_id`),
  KEY `student_id` (`student_id`),
  KEY `skill_id` (`skill_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `students_skills`
--

INSERT INTO `students_skills` (`studentsskills_id`, `student_id`, `skill_id`) VALUES
(1, 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni_career`
--
ALTER TABLE `alumni_career`
  ADD CONSTRAINT `alumni_career_ibfk_1` FOREIGN KEY (`alum_id`) REFERENCES `alumni` (`alum_id`),
  ADD CONSTRAINT `alumni_career_ibfk_2` FOREIGN KEY (`career_id`) REFERENCES `careers` (`career_id`);

--
-- Constraints for table `alumni_courses`
--
ALTER TABLE `alumni_courses`
  ADD CONSTRAINT `alumni_courses_ibfk_1` FOREIGN KEY (`alum_id`) REFERENCES `alumni` (`alum_id`),
  ADD CONSTRAINT `alumni_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `alumni_skills`
--
ALTER TABLE `alumni_skills`
  ADD CONSTRAINT `alumni_skills_ibfk_1` FOREIGN KEY (`alum_id`) REFERENCES `alumni` (`alum_id`),
  ADD CONSTRAINT `alumni_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`);

--
-- Constraints for table `careers_skills`
--
ALTER TABLE `careers_skills`
  ADD CONSTRAINT `careers_skills_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`),
  ADD CONSTRAINT `careers_skills_ibfk_2` FOREIGN KEY (`career_id`) REFERENCES `careers` (`career_id`);

--
-- Constraints for table `courses_careers`
--
ALTER TABLE `courses_careers`
  ADD CONSTRAINT `courses_careers_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `courses_careers_ibfk_2` FOREIGN KEY (`career_id`) REFERENCES `careers` (`career_id`);

--
-- Constraints for table `courses_skills`
--
ALTER TABLE `courses_skills`
  ADD CONSTRAINT `courses_skills_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `courses_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`);

--
-- Constraints for table `students_careers`
--
ALTER TABLE `students_careers`
  ADD CONSTRAINT `students_careers_ibfk_1` FOREIGN KEY (`career_id`) REFERENCES `careers` (`career_id`),
  ADD CONSTRAINT `students_careers_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `students_courses`
--
ALTER TABLE `students_courses`
  ADD CONSTRAINT `students_courses_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `students_courses_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `students_history`
--
ALTER TABLE `students_history`
  ADD CONSTRAINT `students_history_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  ADD CONSTRAINT `students_history_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `students_skills`
--
ALTER TABLE `students_skills`
  ADD CONSTRAINT `students_skills_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`),
  ADD CONSTRAINT `students_skills_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);
