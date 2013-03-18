<?php
require_once "db.php";
session_start();

$skills = array();

# getting ID from URL
$id = mysql_real_escape_string($_GET['id']);

# getting attributes of course
$result = mysql_query("SELECT * FROM courses WHERE course_id = '$id'");
		$course = mysql_fetch_assoc($result);
		$coursename = $course['course_title'];
		$coursenum = $course['course_number'];
		$coursedesc = $course['course_description'];
		echo "<h1>$coursenum: $coursename</h1><br>
		$coursedesc<br>";
		
# finding associated skills
$result = mysql_query("SELECT * FROM courses_skills WHERE skill_id = '$id'");
	while ($row = mysql_fetch_array($result)) {
		$skillid = $row['skill_id'];
		
# looking up names of associated skills
		echo "<br>Skills taught:";
		$result = mysql_query("SELECT * FROM skills WHERE skill_id = '$skillid'");
		$skills = mysql_fetch_assoc($result);
		$skillname = $skills['skill_name'];
		echo "<br><a href=skill.php?id=$skillid>$skillname</a><br>";
		}		

?>

