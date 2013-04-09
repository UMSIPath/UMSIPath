-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2013 at 10:32 PM
-- Server version: 5.5.29
-- PHP Version: 5.4.10

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
(6, 'Information in Social Systems: Collecting Flows and Processing', '500', 'The core properties of information, of people, and of technologies, create constrains and opportunities for analysis, design and management. This course introduces students to those core properties and their implications. In addition, the course introduces a perspective on the central responsibilities of professionals who "bring information, people and technology together in more valuable ways."', 'http://www.si.umich.edu/sites/default/files/SI500_syllabus_W13_basic.pdf', '3', 'Lecture'),
(7, 'Contextual Inquiry and Project Management', '501', 'This course addresses a fundamental need of information professionals: how to examine an organization''s current information use in the context of work practice and discover and recommend improved ways of working. This is a projects based course. All projects are scoped to allow students to examine how information influences actions in some process or service within an organization and to develop and practice relevant skills.', NULL, '3', 'Lecture'),
(8, 'Networked Computing: Storage, Communication, and Processing', '502', 'In order to appreciate the opportunities, and make wise choices about the use of technology, information professionals need to understand the architectures of modern information systems. In alternative system architectures, storage, communication, and processing substitute for the complement each other in different ways. This course introduces students, at several different levels of abstraction, to sets of functional components and alternative ways of combining those components to form systems. It also introduces a set of desirable system properties and a core set of techniques that are useful in building systems that have those properties.', NULL, '3', 'Lecture'),
(9, 'Foundations of Information Policy Analysis and Design', '507', 'This course will introduce students to the conceptual, institutional, and practical foundations of information policy. The first part of the course introduces some of the key regulatory paradigms, principles, and forces (speech rights, freedom of information, regulatory convergence, intellectual property, competition and antitrust, privacy and security, research and innovation policy, etc.) that have both shaped and driven developments in the information field. The second part of the course examines the role of information technologies and practices in democratic governance itself, exploring such themes as digital or e-government, and new forms of democratic practice (real and emergent) associated with new information technologies. The final section of the course places these considerations in transnational perspective, examining such themes as competition and restructuring in the global information industries, the uneven emergence of global information policy regimes, and the strategic adoption of information technology in international development settings. Beyond such topical foci, the course will also emphasize the development of core information policy skills, introducing students to relevant analytic contributions from the fields of economics, legal analysis, and public policy.', NULL, '3', 'Seminar'),
(10, 'Data Security and Privacy: Legal, Policy, and Enterprise Issues', '510', 'As data collection and information networks expand (and stories of security breaches and the misuse of personal information abound), data security and privacy issues are increasingly central parts of the information policy landscape. Legislators, regulators, businesses, and other institutions of all kinds are under increasing pressure to draft and implement effective laws, regulations, and security and privacy programs under rapidly changing technological, business, and legal conditions. A strong need is arising for individuals with the training and skills to work in this unsettled and evolving.', 'http://www.si.umich.edu/sites/default/files/SI510_syllabus_W12.pdf', '3', 'Lecture'),
(11, 'Special Topics', '511', NULL, NULL, '3', 'Lecture'),
(12, 'Special Topics', '515', NULL, NULL, '3', 'Lecture'),
(13, 'Special Topics', '517', NULL, NULL, '3', 'Lecture'),
(14, 'Intellectual Propery and Information Law', '519', 'This course would explore related and sometimes competing legal and policy frameworks for the development and dissemination of ideas and expression in the Information Age. The ways in which principles of free speech and expression compare and contrast with intellectual property rights will be explored as related to the advancement of knowledge and innovation, with particular focus on the impact of the Internet and new technology. The impact of other legal considerations and values on the development and dissemination of ideas and information (such as security, privacy, local control v. national and international considerations, competition, and the protection of minors) will also be examined. The course will draw upon the contexts of education, business, and government, with a special emphasis on the changing nature, roles and responsibilities of educational institutional in light of the so-called "information revolution."', NULL, '3', 'Seminar'),
(15, 'Graphic Design', '520', 'This course supports students'' professional development by exploring the art and science of visual communications. The conceptual part of the course will cover the graphic design theory discourse. Students will reinforce the practical application of critical thinking, analyze and process of making and conceptualizing, learn how to "read" designs and how to apply them into a broader cultural, technological, and social context. Students will improve their aesthetic sensibilities and design skills through mastering visual language vocabularies, understanding principles of effective visual communications, solving creative problems, and developing analytical thinking, promoting thus their ability to respond professionally to rapidly changing needs of the modern world. In the hands-on part of the course, students will gain necessary software skills, learn how to follow or establish identity guidelines, prepare work for print or web production, and select the right tools, media, and budget for their projects. While studying the elements of layout, typography, illustration, color, and we design, students will build their own designer''s portfolio.', NULL, '3', 'Lecture'),
(16, 'Special Topics', '521', NULL, NULL, '3', 'Lecture'),
(17, 'Special Topics', '522', NULL, NULL, '1', 'Lecture'),
(18, 'Informantion and Control', '523', 'There are two purposes for this course: to give participants some background on information and control and the relationship between the two: and to be of practical use to people who work as professionals. Participants in this class will be able to examine situations involving social control issues and provide a quick and accurate, analytic assessments of the informational issues that are likely to factor in those situations. For example, participants should be able to examine the role of the Institutional Review Board at the University of Michigan, describe the ways in which information is', NULL, '3', 'Lecture'),
(19, 'Empirical Methods for Health Informatics', '525', 'This course examines health informatics as an empirical science, which is one of the many faces of this complex field. As such, the course will focus on formal studies of applications of information technology applied to health care, population health, and personal health. These studies can be conducted while an information resouce is under development as well as after a resource is in routine service. Questions addressed by these studies often include: Is the resource functioning as anticipated? How can it be improved? Does it make a difference? Are the differences it makes beneficial?', 'http://www.si.umich.edu/sites/default/files/SI525-HMP648_syllabus_W13.pdf', '3', 'Lecture'),
(20, 'Records Management: Principles and Practices', '528', 'The purpose of this course is to introduce individuals to the essentials of records and recordkeeping systems in organizations. The impact of electronic records will be particular focus. In this course, records management (RM) includes both traditional records management plus the challenges by modern information communication technologies (ICT). Students will also review software tools and technologies for managing records in the modern organization. It is intended that students should understand the relevance of records management methods for working with information systems and the variety of paper and electronic formats.', NULL, '3', 'Lecture'),
(21, 'eCommunities', '529', 'This course is intended to give students a background in theory and practice surrounding online interaction environments. For the purpose of the course, a community is defined as a group of people who sustain interaction over time. The group may be held together by a common identity, a collective purpose, or merely by the individual utility gained from the interactions. An online interaction environment is an electronic forum, accessed through computers or other electronic devices, in which community members can conduct some or all of their interactions. We will use the term eCommunity as shorthand, both for communities that conduct all of their interactions online and for communities that use online interaction to supplement face-to-face interactions. There will be two main treads that weave through the course, based on the two main texts. One tread will be concerned with the practical issues of design and use of online tools to support communities, and how choices that must be made in design can impact the function and style of the resulting community. The second thread will focus on the sociological theory that provides a frame to better understand communities in general. These theoretical pieces will provide a lens for better understanding the implications of choices made on the more practical level.', 'http://www.si.umich.edu/sites/default/files/SI529_syllabus_W13.pdf', '3', 'Lecture'),
(22, 'Principles in Management', '530', 'This course provides a foundation in management for information professionals interested in working in for-profit or non-profit organizations. In this course students will learn about management principles (e.g. planning, organizing, leading, controlling). Having a firm grasp of the principles is the first step. This is a skills based course, so students are expected to apply what they learn in class by reading and analyzing case studies. At all times students will be required to take on various roles (e.g. manager, employee, supplier, customer, competitor) to outline the issues managers face, evaluate managers'' responses, and provide alternative courses of action.', 'http://www.si.umich.edu/sites/default/files/SI530_syllabus_W13.pdf', '3', 'Lecture'),
(23, 'Human Interaction in Information Retrieval', '531', 'This course explores interactive retrieval systems from users'' perspectives. The purpose of this course is to introduce theory, research, and practice related to current information retrieval systems in which humans control search processes and interact with information on various levels from interfaces to functionalities. Students are encouraged to consider the nature of interaction with information in various information retrieval systems, etc. Students also learn about user studies in information retrieval in terms of experimental evaluations and measures and criteria for system performance.', '', '3', 'Lecture'),
(24, 'Digital Government I: Information Technology and Decmocratic Politics', '532', 'This course is the first in a two-part sequence exploring contemporary practices, challenges, and opportunities at the intersection of information technology and democratic governance. Where as the second course focuses on the challenges and innovations in democratic administration, this first course focuses on theories and practices of democratic politics -and the shifting role of information technologies in supporting, transforming, and understanding these. The first half of the course seeks to ground contemporary discussion around IT and politics in various flavors of democratic and political theory. The second half builds on this foundation to explore ways in which information and information technologies have come to support, constrain, and other wise inflect a range of contemporary democratic practices.', 'http://www.si.umich.edu/sites/default/files/SI532_syllabus_W11.pdf', '1.5', 'Seminar'),
(25, 'Digital Government II: Information Technology and Democratic Administration', '533', 'This course is the second of a two-part sequence exploring contemporary practices, challenges, and opportunities at the intersection of information technology and democratic governance. Whereas the first course (SI 532) focuses on tensions and innovations in democratic politics this course takes on emerging directions in democratic administration and the shifting role of information technologies in supporting, transforming, and understanding these. The first part of the course sets contemporary discussions of digital "E-government" against a richer backdrop of administrative, bureaucratic, and organizational theory. The second part of the course explores a range of cases in which emergent informational forms and practices have entered -- and in some cases, begun to alter -- the traditional art and practice of government. Drawing on examples from local, state, federal, and international experience, students are encouraged to adopt a practical and appropriately critical take on the practice, problems, and possibilities for democratic administration in an increasingly IT-saturated age.', 'http://www.si.umich.edu/sites/default/files/SI533_syllabus_W11.pdf', '1.5', 'Seminar'),
(26, 'Theories of Social Influence', '534', 'This course introduces the major theories of social influence in psychology and economics so that you may become a better decision architect and an effective leader. In this course we will learn why and under the conditions in individual''s thoughts and actions can be influenced by those around them. We will touch on related theoretical ground in economics and in psychology but focus heavily on the empirical findings and how they can be applied. The primary goal of this course is to realize a detailed picture of the traditional and contemporary thinking on this topic as it is addressed in economics and in social psychology and to have you applying the tools of influence from day one.', NULL, '3', 'Lecture'),
(27, 'Dead Media: Preserving Culture and Context', '535', 'midst all the excitement of "new media" in 1990s, Bruce Sterling coined the term "dead media?" to describe the whole domain of obsolete platforms and formats, unsuccessful experiments, neglected also-rans, and visionary failures whose history was ignored in favor of dot-com boosterism, Whig history and the next big thing. This course brings to light the diversity of means for transmitting, storing, displaying information - from pneumatic tubes to Elcaset and the Telharmonium, Polyvision and panoramas to heliography and Incan quipu. What makes media obsolete? What is lost, as well as gained, in the transitions in platforms and formats? In researching, documenting and preserving dead media, how we make them technically renderable while retaining their contextual and contemporary meaning? We will explore a large range of media through theory, history, materiality and cultural context, and learn how to preserve their complexity- and how to prepare the media of our time for sustainable use in the future.', 'http://www.si.umich.edu/sites/default/files/SI535_syllabus_W13.pdf', '3', 'Lecture'),
(28, 'Design of Complex Websites', '539', 'This course provides a hands-on approach to building interactive, database-backed websites. Topics covered include HTML, CSS, and Ajax; the Python programming language; the Google Application Engine Web development framework; data modeling and database design.', NULL, '3', 'Lecture'),
(29, 'Knowledge of Information Infrastructures', '541', 'This course offers historical, comparative, and theoretical perspectives on infrastructure from the 19th century to the present. The course examines how infrastructures form, how they change, and how they shape (and are shaped by) social systems. We will focus mainly on knowledge and information infrastructures: libraries, scientific research practices, the Internet, the World Wide Web, and cyberinfrastructures in the physical and social sciences. To set the stage, we will briefly explore transport, cities, and communication infrastructures. The course then turns to the historical roles of standards and social structures in infrastructure development. For example, we will study the emergence of such standards as shipping containers, library catalogs, race classification, TCP/IP, and scientific metadata, and the history of such social structures as scientific disciplines, research laboratories and universities. Finally, we will explore the frontiers of the emerging field of infrastructure studies.', NULL, '3', 'Lecture'),
(30, 'Introduction to Health Informatics', '542', 'This course introduces students to the concepts and practices of health informatics. Topics include: a) an introduction to the health informatics field; b) major applications and commercial vendors; c) decision support methods and technologies; d) analysis, design, implementation, and evaluation of healthcare information systems; and e) new opportunities and emerging trends. A semester-long group project is the cornerstone of the course that provides students with hands-on experience in planning and building healthcare information systems; associated ethnical and legal topics, software engineering and human-computer interaction issues, and user adoption and outcome evaluation methodologies will also be addressed.', NULL, '3', 'Seminar'),
(31, 'Programming I', '543', 'An introduction to programming using Java, with special emphasis on graphical user-interface design and implementation', NULL, '3', 'Lecture'),
(32, 'Introduction to Statistics and Data Analysis', '544', 'The purpose of this class will be to provide students with a basic understanding of statistics, that is the ability to describe various populations and draw inferences about them. It should also sharpen individual intuition about how to read data, interpret data, and judge others'' claims about data. It should be useful to a wide variety of students both as preparation for more advanced courses and as a means to professional advancement. Specifically, skills to be developed are: 1. Abilities to characterize population data intuitively for oneself and others. 2. Ability to draw conclusions and novel inferences from population data. 3. Ability to check assumptions of others'' claims and debug their putative "facts". 4. Ability to look for correlations while controlling for confounding effects. 5. Overall, the chief objective is to demystify the process of inquiry into what isn''t known.', NULL, '3', 'Lecture'),
(33, 'Information Technology and Development', '545', 'This course will discuss contemporary developments in information technology and global development. We focus on four domain areas within ICTs and Development worldwide: Education, healthcare, governance, and governance, examine the role of appropriate design in building technology tools applied towards development issues, and finally we examine critically the idea of ICT4D. Through reading, discussion, and a group project, students will gain design, research, and critical thinking skills in technology and development issues.', 'http://www.si.umich.edu/sites/default/files/SI545_syllabus_W13.pdf', '3', 'Lecture'),
(34, 'Personal Privacy: Policy, Practice and Technology Issues', '546', 'This course explores personal privacy issues in the context of: 1) traditional American concepts related to privacy, as well as government protections that have developed over time; 2) technology and systems that affect the availability of information, the ability of the private sector to gather and publish data and monitor activities, and the ability of individuals to protect their privacy; and 3) business and lifestyle changes, resulting from the Internet and other developments, that have created new behavioral and privacy issues and vulnerabilities, and altered the balance concerning existing ones. These developments range from online storage of traditional documents, such as medical information and property records, to new areas of potential concern, such as social networking and data mining. The course examines theory, history, law, policy, and technology -- as well as approaches taken by other nations -- in its study of contemporary privacy issues, the questions and potential problems that they raise, and the consideration that must be part of addressing them in meaningful ways. While issues related to security will, of necessity, appear periodically, the focus of the course is on privacy matters and considerations related to the individual.', NULL, '3', 'Lecture'),
(35, 'Principles of Software Design for Learning', '548', 'Students are introduced to the process of designing computer-based learning environments. Students work in groups to design and prototype learning environments for real classrooms. Attention is focused on ensuring designs are based upon sound pedagogical theory and that learning environments are embedded into curriculum.', NULL, '3', 'Seminar'),
(36, 'Transformative Learning and Teaching with Technology', '549', 'What role does technology play in high-performance learning and teaching environments? What are the most common mistakes schools, parents, and communities make when integrating technology into learning and teaching? How does policy at the federal, state, local, and institutional level affect what is possible with technology? We will explore the answers to these questions in this class as we examine ways technology has been used successfully (and not so successfully) in a variety of educational contexts. Students are encouraged to develop critical perspectives about the uses of technology for learning and teaching.', NULL, '3', 'Seminar'),
(37, 'Seminar On Information Policy', '550', 'This course will attempt to understand current United States Government Policy in areas involved with information and information technology. Each student will select an area of policy of specific interest to him or her. If the student has no specific interest a topics will be selected in consultation between the student and the instructor. Policies are forming and changing daily. In order to keep up with these changes the class will include guest lecturers who are studying or actually creating policies in the information area. The first part of the course will aid the student in selecting and defining a topic. As an advanced graduate course there is an expectation that the final paper will be, with suitable editing, publishable in a journal.', NULL, '3', 'Seminar'),
(38, 'Information Seeking Behavior', '551', 'Information seeking is a complex information and communication activity requiring access to diverse information systems and resources in order to deal with work-related, personal, and social information problems. This course provides students an introduction to the human aspects of systems and technology in various information contexts including work settings, schools, health care, and everyday life. This course critically examines concepts, models and frameworks relevant to human information behavior across LIS, IR, and HCI. Understanding human information seeking behavior tends to be qualitative and inductive in nature. Therefore, students will have opportunities to learn various ethnographic research techniques including designing ethnographic interviews, conducting non-participant observation, and taking field notes.', 'http://www.si.umich.edu/sites/default/files/SI551_syllabus_W13.pdf', '3', 'Lecture'),
(39, 'Natural Language Processing', '561', 'This course is an introduction to computational and linguistic concepts and techniques for modeling and analyzing natural language. Topics include finite-state machines, part of speech tagging, context-free grammars, syntax and parsing, unification grammars and unification-based parsing, language and complexity, semantics, discourse and dialogue modeling, natural language generation, and machine translation.', 'http://www.si.umich.edu/sites/default/files/SI561_761_syllabus_W13.pdf', '3', 'Lecture'),
(40, 'Microeconomics for Information Professionals', '562', 'This is a standard course in "intermediate microeconomics," designed with School of Information MSI students as the primary audience. Except for relying more heavily on examples drawn from problems involving information goods, services, technologies, and organizations, and discussing a few topics that are especially relevant to information, the content and style of the course is quite similar to advanced undergraduate and first -year master''s classes in economics departments and graduate school of public policy, management, and public health, among others. This is not a specialized course in the economics of information; SI 646 is a follow-on course that serves the purpose. To be well prepared for management, policy and analysis in the information professions you need to first have a solid grounding in standard microeconomic theory and its applications to problem solving. Thus, the primary objective is to teach you a set of useful theories and how to apply them to solve problems. The emphasis is on method and application. You will, consequently, be expected to do a lot of problem-solving homework. It is essential to practice the skills if you want to learn how to use them (and to succeed in the course).', '', '1.5', 'Lecture'),
(41, 'Game Theory', '563', 'This is a standard course in "game theory," designed with School of Information MSI students as the primary audience. This course is the pre-requisite for several ICD courses. To be well-prepared for management, policy and analysis in the information professions you need to first have a solid grounding in game theory and its applications to problem solving. Thus, the primary objective is to teach you a set of useful theories and how to apply them to solve problems. The emphasis is on method and application. You will, consequently, be expected to do a lot of problem-solving homework. It is essential to practice the skills if you want to learn how to use them (and to succeed in the course).', NULL, '1.5', 'Lecture'),
(42, 'Health Informations Leadership Seminar', '573', 'This seminar provides a general orientation to the field of health informatics. It establishes "leadership" as a fundamental theme, and entrepreneurship as an aspect of leadership will be emphasized.', NULL, '1', 'Discussion'),
(43, 'Health Informatics Project Seminar', '574', 'This is the winter installment of the program seminar for the health informatics master''s degree program. It is a requirement for all students currently enrolled in the program; enrollment is restricted to students in the program. This seminar is focused on health informatics projects. In the steady state, sessions will primarily consist of second year students presenting the results of their internship projects, or in special cases, other projects they may have completed during their educational experience at UM. As these students prepare for future employment, the seminar will help them shape their project work into a "deliverable" that they can present to prospective employers. First year students will interact with their more senior colleagues. The seminar will help them plan their internship experiences, and will give them a deeper sense of what constitutes creative work in this field. The primary didactic content of the seminar will focus on what a "project" consists of.', 'http://www.si.umich.edu/sites/default/files/SI574_syllabus_W13.pdf', '1', 'Seminar'),
(44, 'Community Informatics Seminar', '575', NULL, NULL, '1.5', 'Lecture'),
(45, 'Government Information: Issues, Resources, and Policy', '579', 'Federal government publications as products of government activity and sources of information. Access issues and problems; methods of increasing access. Includes print, computer-based, and other formats.', NULL, '3', 'Lecture'),
(46, 'Understanding Records and Archives: Principles and Practices', '580', 'Provides an understanding of why societies, cultures, organizations, and individuals create and keep records. Presents cornerstone terminology, concepts, and practices used in records management and archival administration. Examines the evolution of methods and technologies used to create, store, organize, and preserve records and the ways in which organizations and individuals are archives and records for ongoing operations, accountability, research, litigation, and organizational memory. Participants become familiar with the legal, policy, and ethical issues surrounding records and archives administration and become conversant with the structure, organization, and literature of the archival and records management professions.', NULL, '3', 'Lecture'),
(47, 'Preservation Administration', '581', 'Preservation is commonly defined as the acquisition, organization, and distribution of resources (human, physical, monetary) to ensure adequate protection of information with continuing value for access by present and future generations. Preservation encompasses planning and implementing policies, procedures, and processes that together prevent further deterioration to renew the usability of selected groups of materials. Preservation management is most effective when planning precedes implementation and when prevention activities have priority over renewal activities. This course teaches the basic principles, policies, and procedures for protecting information resources from loss, damage, deterioration, destruction, and obsolescence.', NULL, '3', 'Lecture'),
(48, 'Introduction to Interaction Design', '582', 'Intro to Interaction Design will provide students with a hands-on introduction to interaction design. The course will focus on design methods and design thinking, and will allow students to develop their design sensibilities and practical skills through a series of design exercises. The course will cover individual and group ideation techniques; sketching on paper and using software tools; prototyping approaches, tools, and techniques; and contemporary perspectives on interaction design for common platforms (e.g., web, desktop, tablet, mobile, and beyond). The course will combine readings, lectures, and in-class exercises to convey and reinforce the intellectual content. Individual and group assignments, including a substantial group project at the end of the course, will provide an opportunity to engage more deeply with the material. In-class presentations, along with group critique will allow students to receive feedback from peers and instructors to improve and refine their craft. In-class discussions will rely heavily on concrete examples that are analyzed and critiqued by students and instructors alike, and are used to illustrate and reinforce the course content.', NULL, '3', 'Lecture'),
(49, 'Recommender Systems', '583', 'Recommender systems guide people to interesting materials based on information from other people. There is a large design space of alternative ways to organize such systems. The information that other people provided may come from explicit rating, tags or reviews or implicity from how they spend their time or money. The information can be aggregated and used to select, filter, sort of highlight items. The recommendations may be personalized to the preferences of different users.', 'http://www.si.umich.edu/sites/default/files/SI583-W12Syllabus_0.pdf', '1.5', 'Lecture'),
(50, 'Mus Bibliogr', '586', NULL, NULL, '3', 'Seminar'),
(51, 'Fundamentals of Human Behavior', '588', 'Surveys basic principles of cognitive and social psychology relevant to the design and use of information systems. Focuses on important findings in psychological science and their implications for the design and use of information systems. Topics include the basics of human perception, memory capacity and organization, the development of skill and expertise, and the characteristics of everyday reasoning and decision making. For example, a central problem in information science is how to label information stored for later recall. By examining how human memory operates, we can gain some insight into possible schemes that may be compatible with human users. This survey of what we know about the human mind offers ideas about how to exploit mental capacities in the design and use of information systems.', NULL, '3', 'Lecture'),
(52, 'History of Computers and the Internet', '589', 'This nontechnical course covers the development and use of computers from the ancient world to the present. We discuss automatic calculation from the abacus to the integrated circuit; logic machines from Boole to neural networks; and the evolution of programming languages from assemblers to Ada. Our primary focus is the social, political, and cultural contexts of post-1939 digital computers and computer networks. We explore such topics as: A design for a stem-powered, mechanical computer in Victorian England. How early computers cracked the Nazi Enigma cipher during the World War II. How the Cold War changed computers -- and how computers changed the Cold War. Why digital computing replaced well-developed analog methods in the 1940s and 1950s. Computing in Europe, the Soviet Union, and the developing world. How hackers helped shape minicomputers and the Internet. How amateur hobbyists invented the personal computer. The story behind the World Wide Web. This course makes the argument that new technologies and their social effects evolve together along a variety of dimensions. Some of these are technical: innovation, design, and opportunity. Some are social: funding sources, societal values, and organizational structures. Still others are macro-scale economic, political, and social forces. The major questions that motivate our study of computers will concern "why" issues. Why were computers invented? Who wanted them, and for what purpose? How have computers changed the shape of society and culture -- and how did society and culture shape them? The course is relevant to anyone interested in the history, politics, and culture of technology.', 'http://www.si.umich.edu/sites/default/files/589syll.pdf', '3', 'Lecture'),
(53, 'Data Manipulation', '601', 'This course aims to help students get started with their own data harvesting, processing, and aggregation. Data analysis is crucial to evaluating and designing solutions and applications, as well as understanding user''s information needs and use. In many cases the data we need to access is distributed online among many webpages, stored in a database, or available in a large text file. Often these data (e.g. web server logs) are too large to obtain and/or process manually. Instead, we need an automated way of gathering the data, parsing it, and summarizing it, before we can do more advanced analysis. In this course students will learn to use Perl and its modules to accomplish these tasks in a ''quick and easy'' yet useful and repeatable way. The companion half semester course on Exploratory Data Analysis will then teach the students how to further glean insights from the data through analysis and visualization.', NULL, '1.5', 'Lecture'),
(54, 'Digital Preservation Workshop', '602', NULL, NULL, '1.5', 'Seminar'),
(55, 'Economics of Sustainable Digital Information', '603', 'Digital information is all around us, but responsible curation is necessary in order to ensure persistence for reuse in the future. This half term course examines sustainable digital preservation activities in the United States and internationally. The course covers economic mechanisms and cost models and then focuses on case studies of several approaches to digital preservation programs. The goal of the course is to integrate economic concepts and digital preservation initiatives in order to assess whether or not these activities are leading towards sustainable digital preservation programs. The course will also discuss cost models for analog materials in order to both establish a baseline, contrast, and discussion on how to manage information resources in the analog / hybrid world. The main goal of the course is to round out student''s knowledge of digital preservation by providing an economic perspective in contrast to the technological and user-centered perspectives featured in other PI classes.', 'http://www.si.umich.edu/sites/default/files/Economics%20of%20Sustainability_syllabus_2012_0.pdf', '1.5', 'Lecture'),
(56, 'Personal Informatics Design', '606', 'This course introduces students to the social and technical issues that designers of personal informatics technologies face in helping users understand and improve their lives through the use of data. It will be studio-based, with a focus on a semester-long group project to design a personal informatics application.', 'http://www.si.umich.edu/sites/default/files/SI606_syllabus_W13.pdf', '3', 'Lecture'),
(57, 'Networks', '608', 'This course will cover topics in network analysis, from social networks to applications in information networks such as the internet. We will introduce basic concepts in network theory, discuss metric and models, use software analysis tools to experiment with a wide variety of real-world network data, and study applications to areas such as information retrieval. For their final project, the students will apply the concepts learned in class to networks of interest to them.', '', '3', 'Lecture'),
(58, 'Pervasive Interaction Design', '612', 'This course is advanced interaction design course the focuses on designing interactive applications for emerging mobile and context-aware technologies. It follows a similar format to 682 (Interaction Design) in that course is studio-based, consists largely of a seminar-long group project with multiple milestones, and is supplemented by readings and discussion relevant to the topic. Class meetings consist of brief lectures to introduce and frame course concepts, design methods, and technical tools; discussion of readings; in-class design exercises; and group work/lab time. Some programming will be required in order to complete prototyping activities, though students have flexibility in choosing the platforms and languages used. Programming will not be taught in the course.', 'http://www.si.umich.edu/sites/default/files/SI612_syllabus_W12_basicinfo.pdf', '3', 'Lecture'),
(59, 'Choice Architecture', '617', 'Designing a system or organization for humans requires understanding not just choice and behavior motivations (good in most cases, we hope), but also learning about the reasons we blunder and make mistakes. Thus, even when incentives are "aligned" with overall system goals, there are many instances where we make poor choices because as human beings, we are all susceptible to a wide array of routine biases that can lead to an equally wide array of unwanted and unintended outcomes and decisions. Our errors are what make us human, but up until now, they have been largely ignored by systems designers, whether these designers make complex public policy, manage a team or design an information system. But knowing how people think, we can become choice architects who design environments that both yield better decision making on the part of users, and achieve behavior that is consistent with overall system goals while gaining a competitive design-edge. The first goal of this course is to inform future information system professionals, designers and managers about human decision rules and their associated biases so that these insights can be incorporated into their design, business or management strategies. Knowledge of these issues can be a significant source of competitive advantage because they are unknown to most information systems professionals and they are not taught in most I-schools. The second goal of this course is to clarify how these results can be leveraged to create original and more effective systems and institutions that meet the designer''s goals.', 'http://www.si.umich.edu/sites/default/files/SI617_syllabus_W13.pdf', '3', 'Lecture'),
(60, 'Exploratory Data Analysis', '618', 'This course aims to help students get started with their own data acquisition and analysis. Data analysis is crucial to evaluating and designing solutions and applications, as well as understanding information needs and use. Students in this course, who will have just completed part 1: Data Manipulation, will learn techniques of exploratory data analysis, using scripting, text parsing, structured query language, regular expressions, graphing, and clustering methods to explore data. Students will be able to make sense of and see patterns in otherwise intractable quantities of data.', NULL, '1.5', 'Lecture'),
(61, 'Collection Development and Management', '620', 'Introduces principles and issues of collection development and management. Considers evaluation criteria, resources and procedures for selecting and acquiring information products in all formats (print, audiovisual, electronic, etc.). Includes collection policies; collection description, evaluation, maintenance and preservation; document delivery, vendor plans, fund allocation, intellectual property and resource sharing.', 'http://www.si.umich.edu/sites/default/files/SI%20620%20syllabus%2011jan2013.pdf', '3', 'Lecture'),
(62, 'Information, Ethics, and Applied Politics', '621', NULL, NULL, '3', 'Lecture'),
(63, 'Needs Assessment and Usability Evaluation', '622', 'Covers the key concepts of evaluation and a variety of methods used to determine the goals of a system or service, performs organizational analysis, assesses task/technology or service fit, determines ease of learning of new or existing services or systems, determines ease of use, assesses aspects of performance (including information retrieval), and evaluates the success in accomplishing the user/organizational goals. Methods include observation, survey, interviews, performance analysis, evaluation in the design/iteration cycle, usability tests, and assessment of systems in use.', 'http://www.si.umich.edu/sites/default/files/SI622_syllabus_W13.pdf', '3', 'Lecture'),
(64, 'Research Methods for Information Professionals', '623', 'Research is key in the information professions: we assist other people conducting research, read research studies to improve practice, engage in research to evaluate tools and services, and use research in reports, funding requests, and requests for proposals. Much of our practice rests on a base of evidence and as responsible professionals it is important that we be able to weigh that evidence and apply it appropriately in our information setting. Information professionals also conduct research studies to assist in their work or for promotion within their organizations. We may also become a part or larger research teams conducting research studies. This course is designed to help you conduct and consume research studies.', 'http://www.si.umich.edu/sites/default/files/SI623_syllabus_W13.pdf', '3', 'Seminar'),
(65, 'Media for Children and Young Adults', '624', 'What makes a great book or resource for children and young adults? This course provides an introduction to literature and media for children and young adults and provides strategies and resources for using these resources in library settings. The course content includes a survey of media, including materials for babies and pre-schoolers and picture books, fiction, poetry, magazines, graphic novels, informational and reference materials, films and videos, and digital resources for children and young adults. In addition, the course includes practice in evaluating children''s media and in using bibliographies, journals, book reviews, critical writings, Web sites, blogs, and award lists. A discussion of the reading habits, abilities, and interests of various age groups, gender, reluctant readers, and English language learners will provide a context for the evaluation and selection of materials. While this course focuses primarily on those wishing to work in school or public libraries, the skills and knowledge gained can be applied in additional settings such as classrooms or cultural organizations.', NULL, '3', 'Lecture'),
(66, 'Digital Preservation', '625', 'This course was part of the original plan for building out the Preservation of Information specialization (si.umich.edu/msi/pi.htm). While SI 581 deals agnostically with both analog and digital Information, there is a need for a course that goes into greater depth about the status of digital preservation and highlight new developments and tools. This course fills a gap at SI and complements the other Preservation of Information courses and those in electronic records management.', 'http://www.si.umich.edu/sites/default/files/SI625_syllabus_W13.pdf', '3', 'Lecture'),
(67, 'Management of Nonprofit Libraries and Information Services', '626', 'Information practice demands knowledge of all aspects of management and service delivery. This course introduces selected theories, principles and techniques of contemporary management science and organizational behavior and their application to libraries and information services in the non-profit and public sectors. Organizations and services in these sectors include public, academic and special libraries, as well as other information services provided by health care, human service, governmental and other public benefit-oriented organizations. Students in this course develop skills in basic management functions of planning, organizing, human resources, leading and coordinating as applied to libraries and information services. As part of this, due to the specific non-profit focus of this course, students will gain knowledge and skills in the areas of stakeholder management, marketing, non-profit financial management and approaches to securing resources. Students will also have the opportunity to think critically about, and reflect upon, contemporary management practice in non-profit information organizations. Through classroom instruction, workshops on specific management skills, assignments, readings and discussion and guest lecturers, this course will help prepare students to assume managerial responsibilities in their careers.', NULL, '3', 'Lecture'),
(68, 'Managing the IT Org', '627', 'In this course, students will develop skills and techniques in the areas of strategic planning, budgeting and finance, human resources administration, vendor relationships, and leadership. The course also explores alignment of IT initiatives with business objectives, simultaneous management of operational and development environments, and the impact of virtual and nodal organizations on IT infrastructure and services. This course is designed to be cross-disciplinary, with examples and activities drawn from information services, manufacturing, health care, public administration, higher education and other areas. A variety of instructional methods are used to engage students and help identify similarities and differences between IT applications in various professional fields.', 'http://www.si.umich.edu/sites/default/files/20121211%20SI%20627%20Syllabus%20Winter%202013.pdf', '3', 'Lecture'),
(69, 'Access Systems for Archival Materials', '629', 'This course examines the interactions of people, content, and technological tools and their relation to access to archival programs and archival materials. The course outlines the critiques assumptions about uses and use, the management of descriptive programs and practices surrounding the provision of access to and representation of archival materials, the history and theory behind these practices, the tools and technologies that enable access, and a vision for how these basic elements can work together in access systems to better provide information to users. The course also looks at access tools and representations as part of an entire descriptive program that has economic, political, and cultural ramifications. Students examine and analyze issues of effectiveness, economics, technological implementation, and audiences for different types of surrogates for primary sources including: national and subject guides, calendars, finding aids (in paper from and online), bibliographic records (MARC), hypertext mark-up language (HTML), encoded archival description (SGML/LML/EAD), other automated systems, as well as images of the records themselves. Issues of content and context, appropriate levels of control, selection, and interpretation are studied. Doctoral students also read, critique, and participate in research in this area.', NULL, '3', 'Lecture'),
(70, 'Security in the Digital World', '630', NULL, NULL, '3', 'Seminar'),
(71, 'Content Managemt Systems', '631', 'This course supports the process of collecting and publishing content on the web. CMS''s also provide a platform for many "community" features, such as comments, discussion, and chat. Students will learn a process for identifying content types and establishing a workflow for editing and approving content. Students will then configure a content management system to meet the needs of an outside client.', NULL, '1.5', 'Lecture');
INSERT INTO `courses` (`course_id`, `course_title`, `course_number`, `course_description`, `syllabus`, `units`, `type`) VALUES
(72, 'Appraisal of Archives', '632', 'This course examines the archivist''s "first responsibility," the appraisal of records in all media for long-term preservation. The responsibility is "first" because appraisal comes first in the sequence of archival functions and thus influences all subsequent archival activities, and its "first" in importance because appraisal determines what tiny silver of the total human documentary production will actually become "archives" and thus part of society''s collective memory. The archivist is thereby actively shaping the future''s history of our own times. This course begins with the theoretical foundations of appraisal and the controversial responsibility of assigning cultural value to some documentary artifacts and not others, within a broader context of history and memory. Sessions on the evolution of appraisal thinking, and different appraisal experiences, in Europe, the United States, Canada, and Australia, follow. With this background, the course will focus on examples from the real world of appraisal strategy and methodology, including electronic records. Attention will be paid to personal and private records as well as government and institutional ones. The class will end by trying to apply the theories and methodologies through group projects to various recording media and functional areas of records creation, these reflecting student interests. The goal of the course is to provide students through readings and discussion with a thorough knowledge of the basic theories, strategies, and professional practices concerning appraisal and an orientation to doing this job well as working archivists.', 'http://www.si.umich.edu/sites/default/files/SI632_syllabus_W13.pdf', '3', 'Lecture'),
(73, 'History of Books and Print', '633', 'This course addresses a number of fundamental questions in European cultural history centered on the book as both material as well as cultural and social object. Touching on a variety of different physical formats, the course will explore questions of authorship, production, manufacture, distribution, and reading of books, as well as their restriction and periodic prohibition. Meetings will make frequent use of the University?s large special collections holdings, and students are encouraged to carry out extended individual projects using these holdings. The final unit of the course will be devoted to the fundamental changes in print culture being fostered by the internet and hypertext, with examination in particular of the University of Michigan''s evolving role in the novel enterprise of electronic book circulation. The goals of this course are at once practical and theoretical: among others, to give you the knowledge and experience to work comfortably with Special Collections material, to situate the work of innovative bookmakers in the larger cultural scheme of the reception and dissemination of their products, to provide a forum for assessing and debating the sweeping changes in the nature of print culture that appear to be underway.', 'http://www.si.umich.edu/sites/default/files/SI-633-fall-term-2010-syllabus.pdf', '3', 'Lecture'),
(74, 'Application Platform Configuration', '634', ' This course introduces student to the concepts behind Content Management Platforms. By the end of the course, students will be able to install and configure most Application Platforms. They will also know where and how to seek help online. Finally they will know how to extend application platforms by incorporating freely accessed code that others have written.', NULL, '1.5', 'Lecture'),
(75, 'Application Platform Customization', '635', 'This course introduces students to the concepts behind customizing Content Management platforms through the addition of small amounts of custom code. This course is designed to allow a student with some programming knowledge to extend the functionally of an Application Platform. By the end of the course, students will be able to quickly change the behavior of the Drupal Application Platform, our prime example. They will also know how to approach the task of customization in other application platforms.', NULL, '1.5', 'Lecture'),
(76, 'Research Seminar on Archives and Institutions of Memory', '637', 'Thematic focus of this research seminar is collective memory and the role of archives as "memory institutions"; Students examine the role of archives and archivists in shaping memory through appraisal and selection, creation and collection of oral history, and interpretation and display of documentary evidence. Most of the readings place archives in the context of a broader literature on memory and interpretation of the past, including comparisons between archives and other memory institutions, such as museums.', NULL, '3', 'Lecture'),
(77, 'School Library Media Management', '638', 'School media programs are unique in that they are integrated with curricular, technological, and societal interests as manifested in school/educational environments. These programs serve all members of an educational community. This course focuses on theoretical and practical issues in the organization and administration of school media programs and/or comparable district and state media service programs. Special attention is given to Information Power: Building Partnerships for Learning, the most recent publication of guidelines for school media programs. Reading assignments identify the professional literature that supports and defines media programs as they exist in educational environments. Topics also include the historical development of national and international media programs and their relationship to education in different cultures. Projects focus on policies and procedures for managing the general program as well as specific aspects such as budget/finance, facilities design, personal, technology, public and organization relations, and evaluation.', 'http://www.si.umich.edu/sites/default/files/si638%20w12%20syllabus.pdf', '3', 'Lecture'),
(78, 'Web Archiving', '639', 'The World Wide Web is the primary delivery mechanism for digital content. Preservation administrators need to be familiar with the tools and appropriate techniques for preservation of information delivered through the "surface" Web (static Web pages, blogs, E-mail discussion lists, etc.) and information that is part of the "deep" Web (e.g. databases, streaming media, and authenticated resources). Once Web content is captured and brought into a preservation environment, preservation administrators are responsible for transforming them into persistent formats and data structures.', 'http://www.si.umich.edu/sites/default/files/SI639_syllabus_W13.pdf', '1.5', 'Lecture'),
(79, 'Digital Libraries and Archives', '640', 'This course focuses on the current state of "digital libraries" from a multidisciplinary perspective. Its point of departure is the possibilities and prospects for convergence of professions and cultures around the notion of digital media and content. The course covers the history of the idea of digital library and digital archive, especially its manifestation as projects and programs in academic, non-profit, and research settings, and the suite of policy issues that influence the development and growth of digital libraries and archives. A foundation of core archival principles as applied in digital library and archives settings will serve as an intellectual construct supporting the exploration of the related concepts of scholarly communication, digital preservation, cyberinfrastructure, representation, and standards/best practices. Students will be expected to master a diverse literature, to participate actively in the discussion of issues, and to take steps, collectively and individually, to advance our understanding of future directions of digital libraries and archives.', 'http://www.si.umich.edu/sites/default/files/SI640_syllabus_W13_overview.pdf', '3', 'Lecture'),
(80, 'Information Literacy for Teaching and Learning', '641', 'This course introduces theories and best practices for integrating library-user instruction with faculty partnerships. Instructional roles are presented within the wider context of meeting institutional learning goals. Students acquire explicit knowledge, skills, and competencies needed to design, develop, integrate, and assess curriculum and instruction in a variety of information settings, including educational and public organizations. The integral relationship between technology and information literacy are examined. Students are given opportunities to partner with professional mentors in schools, academic libraries, and museums.', NULL, '3', 'Lecture'),
(81, 'Advanced Topics in Health Informatics', '642', 'This course provides students a formal framework in which to discuss contemporary topics in health informatics. Topics include: architecture, interoperability, usability, public policy, outreach and patient-centric care and technology-enhanced computation.', NULL, '3', 'Lecture'),
(82, 'Professional Practice In Libraries and Information Centers', '643', 'Builds on the conceptual framework of information needs and the use of information provided in SI 501. In that course that focus is on techniques that information professionals use to understand the needs of people who employ a wide variety of information systems. Emphasis is on professional practice. Professional practice occurs both in institutional settings (including public, academic, special, and school libraries and information centers) and directly between information professionals and clients (such as information brokers). Prepares students for need-based, client-centered professional practice in a variety of information environments (including public, academic, special libraries and school media centers) in a period of major change. Professional practice consists of a variety of functions and practices which increase client access to information and knowledge. It is based both on an understanding of user information constructs and on knowledge of information systems and services. Course addresses concepts related to public libraries, academic libraries, special libraries, medical libraries, school libraries, and information centers, strategy and strategies, competency, and competencies.', 'http://www.si.umich.edu/sites/default/files/syllabus%20si643%20w13%2013jan2013.pdf', '3', 'Lecture'),
(83, 'Information Use in Communities', '645', 'This course examines information behavior and use in geographic communities by individuals and groups within specific contexts. The course will focus primarily, but not exclusively, on information use in civic situations-citizenship, civic examine the interactions of individuals and groups with information organizations/institutions (including libraries and community technology centers) associated with civic contexts.', 'http://www.si.umich.edu/sites/default/files/SI645_syllabus_W11.pdf', '3', 'Seminar'),
(84, 'Information Economics', '646', 'Course provides a strong grounding in the economics of information goods and services. Students analyze strategic issues faced by for-profit and not-for-profit organizations: pricing, bundling, versioning, product differentiation and variety, network externalities, and rights management.', 'http://www.si.umich.edu/sites/default/files/SI646_syllabus_W13.pdf', '1.5', 'Lecture'),
(85, 'Information Resources and Services', '647', 'Acquaints students with representative sources of information in all formats as well as with delivery methods for services and systems in a variety of information environments. Emphasizes the dynamic nature of contemporary provision of information service and the importance of understanding users'' information needs and behaviors. Resources considered include all formats and delivery methods: print-based, vended online services, Web-based resources, Internet search engines, CDs/integrated media, large data files, digital libraries, community networks, GIS, knowledge management systems, etc. Students study a representative sample of resources and services and their applications. Covers understanding users'' information-seeking needs and behaviors and meeting those needs through both human-based/face-to-face and technology-based services, through direct or intermediated provision of information, as well as through education and training activities; evaluation of such resources and services; preparation of information resources; management issues; current developments, trends, and future research. Format is lecture and discussion, with students using actual reference questions for searching practice and to demonstrate mastery of the material. Students may work with a single partner to develop Web-based or other information resource or service plans. Learn about the information needs, information resources and delivery mechanisms available in both human and technology-based systems. Study a representative sample of same and apply these sources to real-life situations. Consider the on-going management and evaluation of systems and services designed to meet information needs. Learn about likely developments and future research in this area.', NULL, '3', 'Lecture'),
(86, 'Info Culture: Theory and Methods in the History and Sociology of Information Technology', '648', 'This graduate research seminar explores key theoretical and methodological concerns in the history and sociology of information technology. The tools, methodologies, and analytic strategies are primarily those of history and the interpretive social sciences - sociology, anthropology, communication, and cultural psychology, in the disciplinary terms. The first part of the course explores the history and historiography of information. Topically, it addresses the emergence of information technologies from writing and the book to modern media, computing, and the internet. Theoretically, it explores debates around historical causation, trajectories, periodization, evidence, and the cultural framing and reception of information technologies and practices. The second part of the course draws selectively on the literatures of qualitative sociology, anthropology, cultural psychology, and the information sciences to explore a range of contemporary information phenomena: open source communities, online identities, creativity and play, distributed knowledge enterprises, mobile and ubiquitous computing, the semantic web, etc. The longer term goal of the course is to build a more solid, rigorous, and creative foundation for the social study of information by drawing on promising theoretical and methodological approaches developed in the social sciences at large.', 'http://www.si.umich.edu/sites/default/files/SI648_syllabus_W11.pdf', '3', 'Seminar'),
(87, 'Information Visualization', '649', 'The rise of the Information Age and the ascendancy of computer graphics come together in the area of information visualization, where interactive graphical interfaces reveal structure, extract meaning, and navigate large and complex information worlds. Provides an in-depth introduction to the state-of-the-art in information visualization. Through a series of readings, videotapes, and discussions, students look at various strategies that have been developed, including their static, dynamic, and interactive aspects, and understand when, where, and why they work. In addition, there is an effort to place information Visualization in the more general contexts of visualization as used in statistics and physics) information work.', NULL, '3', 'Lecture'),
(88, 'Information Retrieval', '650', 'Information is everywhere. We encounter it in our everyday lives in the form of E-mail, newspapers, television, the Web, and even in conversations with each other. Information is hidden in a variety of media: text, images, sounds, videos. While casual information consumers can simply enjoy its abundance and appreciate the existence of search engines that can help them find what they want, information professionals are responsible for building the underlying technology that search engines use. Building a search engine involves a lot more than indexing some documents -- information retrieval is the study of the interaction between users and large information environments. It covers concepts such as information need, documents and queries, indexing and searching, retrieval evaluation, multimedia and hypertext search, Web search, as well as bibliographical databases. In this course, students go over some classic concepts of information retrieval and then quickly jump to the current state of the art in the field, where crawlers, spiders, and hard-of-hearing personal butlers roam.', 'http://www.si.umich.edu/sites/default/files/SI650_syllabus_W13.pdf', '3', 'Lecture'),
(89, 'Physical Treatment Processes for Preservation Administrators', '651', 'This course introduces students to the artifactual nature of books and papers, and associated concepts of permanence and deterioration, provides an overview of the principles of the conservation of paper-based materials, and discusses the application of those principles to developing preservation policy and working with professional conservators. Lectures are supplemented by required readings, demonstrations, and hands-on exercises in the examination and condition evaluations of paper documents and books, with special emphasis on assessing and preparing artifacts for digitization. This course is intended to prepare library collection managers, archivists, and administrators to make decisions and initiate action for the preservation and conservation of paper-based materials.', 'http://www.si.umich.edu/sites/default/files/SI651_syllabus_F12.pdf', '1.5', 'Lecture'),
(90, 'Electronic Commerce', '652', 'Introduction to the design and analysis of automated commerce systems, from both a technological and social perspective. Infrastructure supporting search for commerce opportunities, negotiating terms of trade, and executing transactions. Issues of security, privacy, incentives, and strategy.', 'http://www.si.umich.edu/sites/default/files/SI652-W12Syllabus_1.pdf', '3', 'Lecture'),
(91, 'Evidence-Informed Decision-Making for the 21st Century Health Care', '653', 'Health care organizations and industries have a growing need for information professionals who are capable of leading efforts to integrate health sciences research into clinical decision making. Health professional training programs also have an expanded interest in training students and practitioners in evidence based health care practice. In this course, students learn how their professional work can support evidence based health care and knowledge translation initiatives in diverse settings such as academic health science libraries, teaching hospitals, government agencies and health care industries.', 'http://www.si.umich.edu/sites/default/files/SI653_syllabus_W13.pdf', '3', 'Lecture'),
(92, 'Critical Policy Issues in Health IT', '654', 'This course will introduce the critical policy issues related to the use of Health Information Technologies (HIT) with a primary focus on the U.S. The course will explore issues from both a national perspective as well as teh perspective of organizations that use these system.', 'http://www.si.umich.edu/sites/default/files/SI654_syllabus_W13.pdf', '3', 'Lecture'),
(93, 'Management of Electronic Records', '655', 'Records are the corporate and cultural memory that provide proof of actions and decisions, build a knowledge-base for reflection and learning, and form a perspective on today''s society that we will pass on to future generations. As organizations create and maintain more of their records electronically, they are struggling to develop effective policies, systems, and practices to capture, maintain and preserve electronic records.', 'http://www.si.umich.edu/sites/default/files/SI655_syllabus_W13.pdf', '3', 'Lecture'),
(94, 'Information Technology and International Development', '657', 'This course will provide an intensive graduate-level introduction to the field of information technology and international development, in its historical, policy, and design dimensions. Part One offers a comprehensive overview of key historical and contemporary debates, problems, and issues in international development. Part Two explores crucial policy issues in developing country contexts, ranging from technology transfer, innovation networks, and research policy to telecommunications, wireless, and critical infrastructure development. Part Three explores the growing IT4D project literature, with special reference to programs and applications in the health, education, finance, governance, agriculture, and rural development sectors.', NULL, '3', 'Lecture'),
(95, 'Information Architecture', '658', 'In 1998, two graduates from the University of Michigan''s School of Information were awarded best "computer" book of the year by a relatively unknown online bookstore called Amazon.com. Their book was (and still is) called Information Architecture for the World Wide Web, and its authors are widely regarded as the "founding fathers" of IA. Or at least, IA as it came to be understood and practiced by the people who designed and built the first few generations of large scale websites and intranets. With the dawn of the Web 2.0 era and a rising tide of web design practitioners embracing a broadly-shared identity under the umbrella concept of User Experience Design, perspectives on the role and definition of IA continue to evolve. This course is designed to teach students the core principles of information architecture, provide opportunities to apply and push back on those principles in a variety of realistic contexts, and develop - as much as we can in a single term - a broad understanding of the world of IA work and the diverse opportunities to do it (or sound smart talking about it) in the "real world".', NULL, '3', 'Lecture'),
(96, 'Entrepreurship in the Information Industry', '663', 'Prepares students to start businesses in the information industry or to work effectively in new start-up businesses. Discusses aspects of creating a business and expects students to develop an idea into a business plan that could be used to either guide the creation of the business or secure funding for a new business.', NULL, '3', 'Lecture'),
(97, 'Database Application Design', '664', 'This course is an introduction to database management systems (DBMS). It covers both theoretical and practical aspects of DBMS, including database design, use, and implementation using the database language SQL. Some topics in physical database design are also discussed. An essential part of the course is a programming project through which students design and develop a practical database system for library access, electronic commerce, information retrieval, or a similar application. Students use the open-source MySQL database and the PHP scripting language for Web development throughout the course.', NULL, '3', 'Lecture'),
(98, 'Online Search and Databases', '665', 'This course focuses on searching online retrieval systems and databases. We examine database construction, Boolean searching, file selection, search strategy development, and evaluation of search results. We cover basic-and intermediate-levels of systems'' command languages that students put into practice in weekly lab assignments. Students learn how to choose controlled vocabulary for online searches using print and online thesauri, subject headings lists, and other controlled lists and determine when to augment it with non-controlled terms, that is, the terms that authors and other subject specialists writing in a discipline use to discuss its important concepts and ideas. Initially we focus on the database structure and search functionality of Boolean-based retrieval systems. Using this foundation, we transition to how retrieval works in non-Boolean systems such as web search engines and online systems that perform relevance ranking of retrievals. In assignments and projects, students explore the database structure, functionality, and specialized features of the scholarly databases available through library gateways and brief fellow students in an oral presentation or poster session. Search strategies are a focus throughout the semester. If time allows, in-class discussions conclude with the status of and future trends in the online industry.', NULL, '3', 'Lecture'),
(99, 'Organization of Information Resources', '666', 'Provides conceptual understanding and skills in the organization, access, and representation of information in a variety of formats. Students learn basic concepts and principles of cataloging and metadata, organization and classification, and standards that have been developed for the ways in which information is organized and described.', NULL, '3', 'Lecture'),
(100, 'Digitization for Preservation', '675', 'This course focuses on digitization for preservation. As such, this course concentrates on the standards, techniques, metadata, and long-term maintenance of digitally reborn images. The course also touches on why libraries and archives might want to digitize for preservation, building digital collections, and policy setting around digitally reborn objects.', 'http://www.si.umich.edu/sites/default/files/SI675_syllabus_W13.pdf', '1.5', 'Lecture'),
(101, 'Preserving Sound and Motion', '678', 'The course examines and evaluates the archival field''s current preservation standards for storage and duplication. Critical preservation problems such as nitrate deterioration, color fading, the vinegar syndrome and irreplaceable formats are extensively discussed. Throughout the seminar case studies of specific restoration projects focus on the crucial issues embedded within each technical and aesthetic decision facing the preservation specialist. Of special interest to this course is the question of whether it is possible and appropriate to speak of particular schools and/or philosophies of restoration. In addition the seminar addresses a range of key issues such as the identification of the original versus subsequent and multiple versions; the theoretical practical distinctions between different types of restoration; and the implications of new, digital technologies which promise the ability to "improve" the original.', 'http://www.si.umich.edu/sites/default/files/SI678_syllabus_W13.pdf', '1.5', 'Lecture'),
(102, 'Aggregation & Prediction Markets', '679', 'Learn different approaches to aggregating opinions of information from a number of sources in order to come up with a forecast.', 'http://www.si.umich.edu/sites/default/files/SI679-F11-syllabus_0.pdf', '1.5', 'Lecture'),
(103, 'ICD: Contracting', '680', NULL, NULL, '1.5', 'Lecture'),
(104, 'Intern/Field Seminar', '681', NULL, NULL, '6', 'Seminar'),
(105, 'Interface and Interaction', '682', NULL, NULL, '3', 'Lecture'),
(106, 'Reputation Systems', '683', 'Learn about the incentive-centered design of reputation systems: design choices, benefits, threats, and limitations. At the end of this course, a student should be able to critically analyze a reputation system design to identify strengths and potential weaknesses, and to design a reputation system for a particular domain with a clear idea of the tradeoffs involved.', 'http://www.si.umich.edu/sites/default/files/SI683-W12Syllabus.pdf', '1.5', 'Lecture'),
(107, 'Seminar in Entrepreneurship: Building the Company', '685', 'This course is a seminar on the actual problems and opportunities that come with the attempt to create a viable business. Students will work individually or as a team, by their choice. They will spend the semester developing a plan into an actual business or continue developing an ongoing business. Admission to the class will be by interview with the instructor. The student or team must have an idea or a plan for a business and must be making progress in developing an entrepreneurial business.', 'http://www.si.umich.edu/sites/default/files/SI685_intro%20objectives%20and%20description_W12.pdf', '3', 'Seminar'),
(108, 'User-Generated Content', '686', 'This half-semester course analyzes the motivation and incentives for user-generated content. We use social science theories as guidance to study the current incentive structures of online Q&A, microfinance, P2P file sharing, open source, social bookmarking and health information exchange sites, as well as potential new design features that could improve the quantity and quality of the contents. After completing this course you will be able to: (1) have a broad understanding of situations where it may be valuable to explicitly consider individual incentives when engineering systems; (2) recognize the class of mechanism that would be appropriate to particular real-world settings involving user-generated content; and (3) identify the key design considerations in adapting such mechanisms to particular online communities.', 'http://www.si.umich.edu/sites/default/files/SI686_786_syllabus_W13.pdf', '1.5', 'Lecture'),
(109, 'Social Interaction Experience', '689', 'This is an advanced course about evaluating (and designing) systems that have a significant social interaction experience for their users. These systems include online communities, e-business sites, medical systems, and mobile collaborative apps. The first half of the course will include readings and small assignments. In the last half, students will gain first-hand experience with social interaction research through a half-semester-long group project that evaluates an existing system.', NULL, '3', 'Lecture'),
(110, 'Intern/Field Exper', '690', NULL, NULL, '6', 'Ind Study'),
(111, 'Advanced Project and Social Computing Design', '694', 'The course is intended to provide grounding in system design, providing real-world experience with a number of commonly used tools. This is intended for students who want to go beyond prototypes to understand the full "startup" experience around creating and launching a new product or system.', NULL, '3', 'Lecture'),
(112, 'Science Tech and Med', '719', NULL, NULL, '3', 'Recitation'),
(113, 'Data Mining: Methods and Applications', '721', 'With the explosive growth of information generated from different sources, in a variety of formats, and with various qualities, information analysis has become challenging for researchers in many disciplines. Automatic, robust, and intelligent data mining techniques have become essential tools to handle heterogeneous, noisy, nontraditional, and large-scale data sets. This is a doctoral seminar course of advanced topics in data mining. The course provides an overview of recent research topics in the field of data mining, the state-of-the-art methods to analyze different genres of information, and the applications to many real world problems. The course will highlight the practical applications of data mining instead of the theoretical foundations of machine learning and statistical computing. The course materials will focus on how the information in different real world problems can be represented as particular genres, or formats of data, and how the basic mining tasks of each genre of data can be accomplished using the state-of-the-art techniques. To this end, the course is not only suitable for doctoral students who are doing research in data mining related fields, but also for those who are consumers of data mining techniques in their own disciplines, such as natural language processing, network science, human computer interaction, economics, social computing, sociology, business intelligence, and biomedical informatics, etc.', NULL, '3', 'Seminar'),
(114, 'Qualitative Methods', '724', 'The purpose of this seminar is to examine, critique current research employing, and begin to utilize a variety of qualitative methods. The course will focus on the design of qualitative studies, selection of data collection methods, and data analysis strategies for qualitative data. The class will also discuss the use of qualitative methods, inductive and deductive approaches, research design, operationalization, measurement issues, data collection and analysis techniques, validity and reliability of data, and writing up qualitative studies. While the course will not cover every potential qualitative data collection method, it will discuss broad categories of data (verbal, observational, textural, visual). In addition to methodological readings, readings utilizing qualitative research techniques in the area of information (broadly defined) will be used to help students appreciate the broad range of research possibilities in this field (these fields). Readings from outside our area will be used to introduce students to other research methodologies and issues of importance in carrying out a research study.', 'http://www.si.umich.edu/sites/default/files/SI724_syllabus_W12.pdf', '3', 'Seminar'),
(115, 'Index of Leading', '730', NULL, NULL, '1', 'Seminar'),
(117, 'Data Curation', '754', 'This course will introduce students to the foundational principles, requirements, and techniques for data curation (metadata and annotation, schemas and ontologies, quality, provenance, data and workflow, archiving and preservation, security, privacy, intellectual property, research responsibilities, and ethics). IGERT-funded students will be required to pass this course during their first year they''re funded by the IGERT program.', NULL, '3', 'Lecture'),
(118, 'Language & Information', '760', 'Surveys techniques used in language studies and information processing. Students learn how to explore and analyze textual data in the context of Web-based information retrieval systems. At the conclusion of the course, students are able to work as information designers and analysts.', NULL, '3', 'Lecture'),
(119, 'Advanced Natural Language Processing and Information Retrieval', '767', 'This course covers recent research in the areas of Computational Linguistics. Natural Language Processing and Information Retrieval. Given that a relevant textbook doesn''t exist, the course reading list will include a large number of recent papers.', NULL, '3', 'Seminar'),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
