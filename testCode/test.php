<?php
require_once "db.php";
session_start();

# this array will be created by the user input
$skills = array(
	'GoldenThread', 'PHP');

# looping through array
foreach ($skills as $value) {
	echo "Skill: <b>$value</b></br>";

# locating skill ID
	$result = mysql_query("SELECT skill_id FROM skills WHERE skill_name = '$value'");
	$id = mysql_fetch_assoc($result);
	$skillid = $id['skill_id'];
	echo "Skill ID: $skillid</br>";

# finding associated course ID
	$result = mysql_query("SELECT course_id FROM courses_skills WHERE skill_id = '$skillid'");
	$courses = array();
	while ($row = mysql_fetch_array($result)) {
		$courseid = $row['course_id'];
		echo "Course ID: $courseid <br>";
		$courses[] = $courseid;
	}
	
# looking up associated course info
	foreach ($courses as $value) {
		$result = mysql_query("SELECT * FROM courses WHERE course_id = '$value'");
		$course = mysql_fetch_assoc($result);
		$coursename = $course['course_title'];
		$coursenum = $course['course_number'];
		$coursedesc = $course['course_description'];
		echo "<br><i>$coursenum: <a href=course.php?id=$courseid>$coursename</a></i><br>
		$coursedesc<br>";
		}
	echo "<br>";
}
?>