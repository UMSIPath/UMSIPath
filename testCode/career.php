<?php
require_once "db.php";
session_start();

$courses = array();

# getting ID from URL
$careerid = mysql_real_escape_string($_GET['id']);

# finding name
$result = mysql_query("SELECT * FROM careers WHERE career_id = '$careerid'");
		$career = mysql_fetch_assoc($result);
		$careername = $career['career_title'];
		echo "<h1>$careername</h1>";

# finding associated skills
$result2 = mysql_query("SELECT skill_id FROM careers_skills WHERE career_id = '$careerid'");
while ($row = mysql_fetch_array($result2)) {
	$skillid = $row['skill_id'];
	$result3 = mysql_query("SELECT * FROM skills WHERE skill_id = '$skillid'");
	$skill = mysql_fetch_array($result3);
	$skillname = $skill['skill_name'];
	echo "Required skill: <a href=course.php?id=$skillid>$skillname</a><br>";

# finding associated course ID
	$result4 = mysql_query("SELECT course_id FROM courses_skills WHERE skill_id = '$skillid'");
	$courses = array();
	while ($row = mysql_fetch_array($result4)) {
		$courseid = $row['course_id'];
		$courses[] = $courseid;
	}
	
# looking up associated course info
	echo "<b>Relevant courses:</b>";
	foreach ($courses as $value) {
		$result5 = mysql_query("SELECT * FROM courses WHERE course_id = '$value'");
		$course = mysql_fetch_assoc($result5);
		$coursename = $course['course_title'];
		$coursenum = $course['course_number'];
		$coursedesc = $course['course_description'];
		echo "<br><i>$coursenum: <a href=course.php?id=$courseid>$coursename</a></i><br>
		$coursedesc<br>";
		}
	echo "<br>";
	}


?>