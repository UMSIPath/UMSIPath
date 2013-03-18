
-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2013 at 08:43 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

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
(7, 4, 5);

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
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_title`, `course_number`, `course_description`, `syllabus`) VALUES
(1, 'Database Application and Design', 'SI 664', 'A course about databases, mostly MySQL and PHP.', 'www.php-intro.com'),
(2, 'Digitization for Preservation', 'SI 675', 'How to digitize for preservation.', 'www.ctools.umich.edu'),
(3, 'Contextual Inquiry', 'SI 501', 'inquire, but with context.', 'www.501willburnyoursoul.com'),
(4, 'Preserving Sound and Motion', 'SI 678', 'Preserve sound. and motion.', 'nara.gov'),
(5, 'Python', 'SI 502', 'Learn python. Intro level.', 'drchuck.com');

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

--
-- Dumping data for table `courses_careers`
--

INSERT INTO `courses_careers` (`id`, `career_id`, `course_id`) VALUES
(1, 2, 1),
(2, 1, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `courses_skills`
--

INSERT INTO `courses_skills` (`id`, `skill_id`, `course_id`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 7, 3),
(4, 6, 3),
(5, 5, 5),
(6, 3, 4),
(7, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(10) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `skill_name`) VALUES
(1, 'GoldenThread'),
(2, 'PHP'),
(3, 'Film preservation'),
(4, 'Sound preservation'),
(5, 'Python'),
(6, 'Contextual Inquiry'),
(7, 'Team Building');

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

--
-- Dumping data for table `students_courses`
--

INSERT INTO `students_courses` (`id`, `student_id`, `course_id`) VALUES
(1, 1, 2),
(2, 1, 4),
(3, 2, 3),
(4, 2, 5);

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
