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
		echo "<h1>$coursenum: $coursename</h1>
		$coursedesc<br>";
			
# finding associated skill ID
$result = mysql_query("SELECT skill_id FROM courses_skills WHERE course_id = '$id'");
$skills = array();
while ($row = mysql_fetch_array($result)) {
	$skillid = $row['skill_id'];
	$skills[] = $skillid;
	}
	
# looking up associated skill info
echo "<b><br>Skills this course teaches:</b>";

foreach ($skills as $value) {
	$result = mysql_query("SELECT * FROM skills WHERE skill_id = '$value'");
	$skill = mysql_fetch_assoc($result);
	$skillname = $skill['skill_name'];
	echo "<br><a href=skill.php?id=$skillid>$skillname</a>";
	
	}
echo "<br>";




?>

